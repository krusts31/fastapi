from .conf import conf
import asyncpg
import json
import os
import time

class PgPool():
   
    def __init__(self, conf):
        self.conf = conf

    async def connect(self):
        self.pool = await asyncpg.create_pool(
                user=self.conf['user'], 
                password=self.conf['password'], 
                database=self.conf['database'], 
                host=self.conf['host'], 
                port=self.conf['port'])

    async def disconnect(self):
        await self.pool.close()

    async def test_query(self):
        """Test the database connection."""
        try:
            async with self.pool.acquire() as connection:
                await connection.fetch('SELECT 1')
            return { "status": "success" }
        except Exception as e:
            return { "status": "failure", "reason": str(e) }

    async def get_all_forms(self, owner_id):
        secret_code = self.conf["secretcode"]
        forms = []

        credits_left = await self.get_credits_left(owner_id)
        print("credits_left:", credits_left)

        async with self.pool.acquire() as connection:
            results = await connection.fetch('''
                SELECT data, status, id, creation_time, secret_code FROM forms WHERE owner_id = $1;
            ''', owner_id)
            for result in results:
                if 'data' in result and 'status' in result:
                    data_dict = json.loads(result['data'])
                    status = result['status']
                    id = result['id']
                    creation_time = result['creation_time']
                    if secret_code == result['secret_code'] and status != 'generated':
                        status = "paid"
                    if credits_left["credits_left"] > 0 and status != 'generated':
                        status = "paid"
                    print("BIG TEST", id, status, flush=True)
                    forms.append({"creation_time": creation_time, "data": data_dict, "status": status, "id": id})
            return forms

    async def insert_transaction(self, user_id, action):
        async with self.pool.acquire() as connection:
            result = await connection.execute('''
                INSERT INTO transactions (user_id, timestamp, action) VALUES ($1, $2, $3);
            ''', user_id, int(time.time()), action)
        return result

    async def get_transactions(self, user_id, action, days=0):
        since = 0
        if days != 0:
            since = int(time.time()) - (days*24*60*60)
        transactions = []
        async with self.pool.acquire() as connection:
            results = await connection.fetch('''
                SELECT timestamp, action FROM transactions WHERE user_id = $1 AND action = $2 AND timestamp > $3;
            ''', user_id, action, since)
            for result in results:
                transactions.append(
                        { "timestamp": result["timestamp"], "action": result["action"] }
                    )
            return transactions

    async def get_credits_left(self, user_id):
        transactions = await self.get_transactions(user_id, "used_credits", days=61)
        user = await self.get_user(user_id)
        total = user["credits_per_month"]
        left = total*2 - len(transactions)
        print("have", total, "total,", left, "left")
        return {"credits_per_month": total, "credits_used_x2": len(transactions), "credits_left": left}

    async def get_user(self, user_id):
        async with self.pool.acquire() as connection:
            results = await connection.fetch('''
                SELECT user_id, credits_per_month FROM users WHERE user_id = $1;
            ''', user_id)
            for result in results:
                return { "credits_per_month": result["credits_per_month"] }

        return { "credits_per_month": 0 }
        


    async def change_form_status_to_paid(self, owner_id, form_id):
        async with self.pool.acquire() as connection:
            result = await connection.execute('''
                UPDATE forms SET status = $1 WHERE owner_id = $2 AND id = $3;                 
            ''', 'paid', owner_id, form_id)
        return result

    async def change_form_status_to_generated(self, owner_id, form_id):
        async with self.pool.acquire() as connection:
            result = await connection.execute('''
                UPDATE forms SET status = $1 WHERE owner_id = $2 AND id = $3;                 
            ''', 'generated', owner_id, form_id)
        return result

    async def check_if_owns_form_and_is_paid(self, owner_id, form_id):
        try:
            async with self.pool.acquire() as connection:
                result = await connection.fetch('''
                    SELECT * FROM forms WHERE owner_id = $1 AND id = $2 AND status = $3;
                ''', owner_id, form_id, 'paid')
            if result:
                return result
        except Exception as e:
            print(f"Error: {e}")
        return None

    async def get_paid_form(self, owner_id, form_id):
        secret_code = self.conf["secretcode"]
        async with self.pool.acquire() as connection:
            #SELECT data, status, id, secret_code FROM forms WHERE owner_id = $1 AND ((id = $2 AND status = $3) OR secret_code = $4);
            result = await connection.fetch('''
                SELECT data, status, id, secret_code FROM forms WHERE owner_id = $1 AND id = $2 AND (status = $3 OR secret_code = $4 OR secret_code = $5);
            ''', owner_id, form_id, 'paid', secret_code, secret_code+" ")
            if result:
                data_dict = json.loads(result[0]['data'])
                status = result[0]['status']
                id = result[0]['id']
                secret_code = result[0]['secret_code']
                return ({"data": data_dict, "status": status, "id": id, "secret_code": secret_code})
            else:
                return None

    async def get_form(self, owner_id, form_id):
        async with self.pool.acquire() as connection:
            #SELECT data, status, id, secret_code FROM forms WHERE owner_id = $1 AND ((id = $2 AND status = $3) OR secret_code = $4);
            result = await connection.fetch('''
                SELECT data, status, id, secret_code FROM forms WHERE owner_id = $1 AND id = $2;
            ''', owner_id, form_id)
            if result:
                data_dict = json.loads(result[0]['data'])
                status = result[0]['status']
                id = result[0]['id']
                secret_code = result[0]['secret_code']
                return ({"data": data_dict, "status": status, "id": id, "secret_code": secret_code})
            else:
                return None


    async def create_new_form(self, owner_id, data, status, secret_code):
        data_dict = [item.dict() for item in data]
        json_data = json.dumps(data_dict) 
        print(secret_code, status)
        async with self.pool.acquire() as connection:
            result = await connection.execute('''
                INSERT INTO forms (owner_id, data, status, secret_code) VALUES ($1, $2, $3, $4);
            ''', owner_id, json_data, status, secret_code)
        return result

    async def update_form_data(self, owner_id, data):
        async with self.pool.acquire() as connection:
            result = await connection.execute('''
                UPDATE forms SET data = $1 WHERE owner_id = $2;
            ''', data, owner_id)
        return result
