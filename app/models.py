from __future__ import annotations
from typing import List, Optional
from pydantic import BaseModel

class Question(BaseModel):
    index: int
    key: str
    title: str
    description: str
    answer: str
    optional: bool

class QuestionPage(BaseModel):
    header: str
    description: str
    questions: List[Question]

class QuestionPages(BaseModel):
    pages: List[QuestionPage]
    secret_code: str

class pageId(BaseModel):
    id: int

class ProductList(BaseModel):
    product_list_ids: List[int]
