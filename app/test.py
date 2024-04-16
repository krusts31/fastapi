from weaviateHandler import WeaviateClient
import weaviate
import json
import os

class_name = "Over_jezelf"

class_obj_contextionary = {
    "class": class_name,
    "description": f"Example answers {class_name}",
    "moduleConfig": {
        "text2vec-contextionary": {
        "vectorizeClassName": "false"
        }
    },
    "properties": [
        {
            "dataType": ["text"],
            "description": "The question",
            "moduleConfig": {
                "text2vec-contextionary": {
                    "skip": False,
                    "vectorizePropertyName": False
                }
            },
            "name": "question",
        },
        {
            "dataType": ["text"],
            "description": "The answer",
            "moduleConfig": {
                "text2vec-contextionary": {
                    "skip": False,
                    "vectorizePropertyName": False
                }
            },
            "name": "answer",
        },
        {
            "dataType": ["text"],
            "description": "GPT example to send to zapp as template",
            "moduleConfig": {
                "text2vec-contextionary": {
                    "skip": False,
                    "vectorizePropertyName": False
                }
            },
            "name": "gpt_example",
        },
    ],
    "vectorizer": "text2vec-contextionary",
}
class_obj_openai = {
    "class": class_name,
    "description": f"Example answers {class_name}",
    "moduleConfig": {
        "text2vec-openai": {
        "model": "ada",
        "modelVersion": "002",
        "type": "text"
        }
    },
    "properties": [
        {
            "dataType": ["text"],
            "description": "The question",
            "name": "question",
        },
        {
            "dataType": ["text"],
            "description": "The answer",
            "name": "answer",
        },
        {
            "dataType": ["text"],
            "description": "GPT example to send to zapp as template",
            "name": "gpt_example",
        },
    ],
    "vectorizer": "text2vec-openai",
}
class_obj_trans = {
    "class": class_name,
    "description": f"Example answers {class_name}",
    "properties": [
        {
            "dataType": ["text"],
            "description": "The question",
            "name": "question",
        },
        {
            "dataType": ["text"],
            "description": "The answer",
            "name": "answer",
        },
        {
            "dataType": ["text"],
            "description": "GPT example to send to zapp as template",
            "name": "gpt_example",
        },
    ],
    "vectorizer": "text2vec-transformers",
}
class_obj_huggingface = {
    "class": class_name,
    "description": f"Example answers {class_name}",
    "moduleConfig": {
        "text2vec-huggingface": {
            "model": "sentence-transformers/all-MiniLM-L6-v2", # Change huggingface model in testing
            # "model": "sentence-transformers/all-mpnet-base-v2",
            "options": {
                "waitForModel": True,
                "useGPU": True,
                "useCache": True
            }
        }
    },
    "properties": [
        {
            "dataType": ["text"],
            "description": "The question",
            "name": "question",
            "moduleConfig": {
                "text2vec-huggingface": {
                "skip": False,
                "vectorizePropertyName": False
                }
            },
        },
        {
            "dataType": ["text"],
            "description": "The answer",
            "name": "answer",
            "moduleConfig": {
                "text2vec-huggingface": {
                "skip": False,
                "vectorizePropertyName": False
                }
            },
        },
        {
            "dataType": ["text"],
            "description": "GPT example to send to zapp as template",
            "name": "gpt_example",
            "moduleConfig": {
                "text2vec-huggingface": {
                "skip": False,
                "vectorizePropertyName": False
                }
            },
        },
    ],
    "vectorizer": "text2vec-huggingface",
}

c = WeaviateClient()
try:
    c.create_class(class_obj_trans)
    c.insert(class_name)
except Exception as e:
    print(f"Error creating class: {e}, trying to continue.")
    pass

query = "Ik heer Jochem, en ik ben een man van 33 die flink wat kennis heeft in verschillende sectoren als IT en computers. Sinds ik klein ben wilde ik al een eigen bedrijf opstarten, iets wat ik de afgelopen jaren ook heb gedaan. Hiermee heb ik al flink wat kennis op gedaan in de AI richting. Na lang zoeken heb ik een uitstekende plek gevonden voor mijn droom onderneming. Ik wil een een AI onderneming starten die de beste AI oplossingen aan biedt aan diverse klanten. Ik wil dit idee verder door werken om zo het bedrijf tot een enorm succes te brengen."
c.search(query, class_name)
