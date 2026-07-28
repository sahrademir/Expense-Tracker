from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database import get_db
from app.schemas import ExpenseCreate, ExpenseResponse
from app.models import User, Expense
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
            description=expense.description,
            owner_id = current_user.id
        )
    
    db.add(new_expense)
    db.commit()
    db.refresh(new_expense)
    
    return new_expense

@router.get("/", response_model=list[ExpenseResponse])
def get_expense(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    expenses = db.query(Expense).filter(
        Expense.owner_id == current_user.id
    ).all()
    return expenses

@router.put("/{expense_id}")
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
        raise HTTPExcption(
            status_code = 404,
            detail = "Expense not found"
        )

    existing_expense.title = expense.title
    existing_expense.amount = expense.amount
    existing_expense.category = expense.category
    existing_expense.description = expense.description

    db.commit()
    db.refresh(existing_expense)
    return existing_expense

@router.delete("/{expense_id}")
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

    