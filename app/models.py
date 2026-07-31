from datetime import datetime, timezone
from decimal import Decimal
from enum import StrEnum

from sqlalchemy import (
    Column,
    Integer,
    String,
    DateTime,
    ForeignKey,
    Numeric,
    Enum,
)
from sqlalchemy.orm import relationship

from .database import Base


class ExpenseCategory(StrEnum):
    FOOD = "Food"
    TRANSPORT = "Transport"
    HEALTH = "Health"
    SHOPPING = "Shopping"
    BILLS = "Bills"
    FUN = "Fun"
    OTHER = "Other"

class TransactionType(StrEnum):
    INCOME = "Income"
    EXPENSE = "Expense"


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, index=True, nullable=False)
    email = Column(String(100), unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    created_at = Column(DateTime, default=lambda: datetime.now(timezone.utc), nullable=False)

    # One User -> Many Expenses
    expenses = relationship(
        "Expense",
        back_populates="owner",
        cascade="all, delete-orphan",
    )


class Expense(Base):
    __tablename__ = "expenses"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(100), nullable=False)
    amount = Column(Numeric(10, 2), nullable=False)
    category = Column(Enum(ExpenseCategory), nullable=False)
    type = Column(
        Enum(TransactionType),
        nullable=False,
    )
    description = Column(String(255), nullable=True)

    owner_id = Column(
        Integer,
        ForeignKey("users.id"),
        nullable=False,
    )

    owner = relationship(
        "User",
        back_populates="expenses",
    )