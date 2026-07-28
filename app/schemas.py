from decimal import Decimal
from typing import Annotated
from datetime import datetime
from enum import StrEnum
from pydantic import BaseModel, EmailStr, Field

class ExpenseCategory(StrEnum):
    FOOD = "Food"
    TRANSPORT = "Transport"
    HEALTH = "Health"
    SHOPPING = "Shopping"
    BILLS = "Bills"
    FUN = "Fun"
    OTHER = "Other"


class UserCreate(BaseModel):
    username: Annotated[
        str,
        Field(min_length=3, max_length=30)
    ]

    email: EmailStr

    password: Annotated[
        str,
        Field(min_length=8, max_length=64)
    ]

class UserResponse(BaseModel):
    id: int
    username: str
    email: EmailStr
    created_at: datetime

    class Config:
        from_attributes = True


class ExpenseCreate(BaseModel):
    title: Annotated[
    str,
    Field(min_length=1, max_length=100)
    ]

    amount: Annotated[
    Decimal,
    Field(gt=0)
    ]

    category: ExpenseCategory
    
    description: Annotated[
    str,
    Field(max_length=500)
    ]
    

class ExpenseResponse(BaseModel):
    id: int
    title: str
    amount: Decimal
    category: ExpenseCategory
    description: str
    owner_id: int

    class Config:
        from_attributes = True
    