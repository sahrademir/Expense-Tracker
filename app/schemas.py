from decimal import Decimal
from datetime import datetime
from enum import StrEnum
from pydantic import BaseModel, EmailStr

class ExpenseCategory(StrEnum):
    FOOD = "Food"
    TRANSPORT = "Transport"
    HEALTH = "Health"
    SHOPPING = "Shopping"
    BILLS = "Bills"
    FUN = "Fun"
    OTHER = "Other"


class UserCreate(BaseModel):
    username: str
    email: EmailStr
    password: str

class UserResponse(BaseModel):
    id: int
    username: str
    email: EmailStr
    created_at: datetime

    class Config:
        from_attributes = True


class ExpenseCreate(BaseModel):
    title: str
    amount: Decimal
    category: ExpenseCategory
    description: str

class ExpenseResponse(BaseModel):
    id: int
    title: str
    amount: Decimal
    category: ExpenseCategory
    description: str
    owner_id: int

    class Config:
        from_attributes = True
    