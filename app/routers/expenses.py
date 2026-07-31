from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from sqlalchemy import func
from app.database import get_db
from app.schemas import ExpenseCreate, ExpenseResponse, StatisticsResponse, CategoryStatistic
from app.models import User, Expense, TransactionType
from app.dependencies import get_current_user

router = APIRouter(
    prefix="/expenses",
    tags=["Expenses"]
)

@router.post("/", response_model=ExpenseResponse,status_code=201)
def create_expense(
    expense: ExpenseCreate,
    db: Session = Depends(get_db),
    current_user: User= Depends(get_current_user)
):
    new_expense = Expense(
            title=expense.title,
            amount=expense.amount,
            category=expense.category,
            type=expense.type,
            description=expense.description,
            owner_id = current_user.id
        )
    
    db.add(new_expense)
    db.commit()
    db.refresh(new_expense)
    
    return new_expense

@router.get("/", response_model=list[ExpenseResponse])
def get_expenses(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    expenses = db.query(Expense).filter(
        Expense.owner_id == current_user.id
    ).all()
    return expenses

@router.put("/{expense_id}", response_model=ExpenseResponse)
def put_expense(
    expense_id: int,
    expense: ExpenseCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    existing_expense = db.query(Expense).filter(
        Expense.id == expense_id,
        Expense.owner_id == current_user.id
    ).first()

    if existing_expense is None:
        raise HTTPException(
            status_code = 404,
            detail = "Expense not found"
        )

    existing_expense.title = expense.title
    existing_expense.amount = expense.amount
    existing_expense.category = expense.category
    existing_expense.type = expense.type
    existing_expense.description = expense.description

    db.commit()
    db.refresh(existing_expense)
    return existing_expense

@router.delete("/{expense_id}", status_code=200)
def delete_expense(
    expense_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    expense = db.query(Expense).filter(
        Expense.id == expense_id,
        Expense.owner_id == current_user.id
    ).first()

    if expense is None:
        raise HTTPException(
            status_code=404,
            detail="Expense not found"
        )

    db.delete(expense)
    db.commit()
    return {"message": "Expense deleted successfully."}

@router.get(
    "/statistics",
    response_model=StatisticsResponse,
)
def get_statistics(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):

    income_total = (
        db.query(func.sum(Expense.amount))
        .filter(
            Expense.owner_id == current_user.id,
            Expense.type == TransactionType.INCOME,
        )
        .scalar()
        or 0
    )

    expense_total = (
        db.query(func.sum(Expense.amount))
        .filter(
            Expense.owner_id == current_user.id,
            Expense.type == TransactionType.EXPENSE,
        )
        .scalar()
        or 0
    )

    balance = income_total - expense_total

    expense_categories = (
        db.query(
            Expense.category,
            func.sum(Expense.amount),
        )
        .filter(
            Expense.owner_id == current_user.id,
            Expense.type == TransactionType.EXPENSE,
        )
        .group_by(Expense.category)
        .all()
    )

    income_categories = (
        db.query(
            Expense.category,
            func.sum(Expense.amount),
        )
        .filter(
            Expense.owner_id == current_user.id,
            Expense.type == TransactionType.INCOME,
        )
        .group_by(Expense.category)
        .all()
    )

    return StatisticsResponse(
        total_income=income_total,
        total_expense=expense_total,
        balance=balance,

        expenses=[
            CategoryStatistic(
                category=category.value,
                amount=amount,
            )
            for category, amount in expense_categories
        ],

        income=[
            CategoryStatistic(
                category=category.value,
                amount=amount,
            )
            for category, amount in income_categories
        ],
    )

    