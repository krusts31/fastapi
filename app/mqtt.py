import paho.mqtt.client as mqtt
import orjson
import struct

class MQTT():
    def __init__(
        self,
        client_id="dev_backend",
        protocol=mqtt.MQTTv311,
        keep_alive=60,
        host="vernemq",
        port=1883,
        qos=0,
        username="default-username",
        password="default-password"
    ):
        self.client_id = client_id
        self.protocol = protocol
        self.keepalive = keep_alive
        self.host = host
        self.port = port
        self.qos = qos
        self.username = username
        self.password = password
        self.mqtt_client = self.setup_mqtt_client()

    @property
    def qos(self):
        return self._qos

    @qos.setter
    def qos(self, value):
        assert (
            value in [0, 1, 2],
            f"Quality of service must be in [0,1,2] got {value} instead.",
        )
        self._qos = value

    def setup_mqtt_client(self):
        mqtt_client = mqtt.Client(client_id=self.client_id, protocol=self.protocol)
        mqtt_client.username_pw_set(self.username, self.password)
        mqtt_client.on_connect = self.on_connect
        mqtt_client.on_message = self.on_message
        mqtt_client.connect(host=self.host, port=self.port, keepalive=self.keepalive)
        return mqtt_client

    def on_connect(self, client, userdata, flags, rc):
        print(
            f"Connected with client {client}, result code {rc}, flags, {flags}, userdata {userdata}.", flush=True
        )

    def on_message(self, client, userdata, message):
        print(f"Message payload: {message.payload}", flush=True)

    def start_mqtt_client(self):
        self.mqtt_client.loop_forever()

    def send_message_to_mqtt(self, topic: str, payload: dict):
        payload_json = orjson.dumps(payload)
        self.client.publish(topic, payload, qos=self.qos)

    def subscribe(self, topic):
        print(f"Subscribing to topic: {topic}", flush=True)
        self.mqtt_client.subscribe(topic)
