from fastapi import APIRouter, Depends, HTTPException
from fastapi.security import OAuth2PasswordRequestForm
from sqlalchemy.orm import Session
from app.database import get_db
from app.schemas import UserCreate, UserResponse, UserUpdate, ChangePassword
from app.models import User
from app.auth import hash_password, verify_password, create_access_token
from app.dependencies import get_current_user

router = APIRouter(
    prefix="/users",
    tags=["Users"]
)


@router.post("/register", response_model=UserResponse,status_code=201)
def register(
    user: UserCreate,
    db: Session = Depends(get_db)
):
    existing_user = (
        db.query(User)
        .filter(User.email == user.email)
        .first()
    )

    if existing_user:
        raise HTTPException(
            status_code=409,
            detail="Email already exists."
        )

    hashed_pw = hash_password(user.password)

    new_user = User(
        username=user.username,
        email=user.email,
        hashed_password=hashed_pw
    )

    db.add(new_user)
    db.commit()
    db.refresh(new_user)

    return new_user


@router.post("/login")
def login(
    form_data: OAuth2PasswordRequestForm = Depends(),
    db: Session = Depends(get_db)
):
    existing_user = db.query(User).filter(
        User.username == form_data.username
    ).first()

    if existing_user is None:
        raise HTTPException(
            status_code=401,
            detail="Invalid username or password."
        )

    if not verify_password(
        form_data.password,
        existing_user.hashed_password
    ):
        raise HTTPException(
            status_code=401,
            detail="Invalid username or password."
        )

    token = create_access_token(
        {
            "sub": str(existing_user.id)
        }
    )

    return {
        "access_token": token,
        "token_type": "bearer"
    }

@router.get("/me", response_model=UserResponse)
def get_profile(
    current_user: User = Depends(get_current_user),
):
    return current_user

@router.put("/me", response_model=UserResponse)
def update_profile(
    user: UserUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    # Email başka bir kullanıcı tarafından kullanılıyor mu?
    existing_email = (
        db.query(User)
        .filter(
            User.email == user.email,
            User.id != current_user.id,
        )
        .first()
    )

    if existing_email:
        raise HTTPException(
            status_code=409,
            detail="Email already exists.",
        )

    current_user.username = user.username
    current_user.email = user.email

    db.commit()
    db.refresh(current_user)

    return current_user

@router.put("/change-password")
def change_password(
    password_data: ChangePassword,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    if not verify_password(
        password_data.current_password,
        current_user.hashed_password,
    ):
        raise HTTPException(
            status_code=400,
            detail="Current password is incorrect.",
        )

    current_user.hashed_password = hash_password(
        password_data.new_password
    )

    db.commit()

    return {
        "message": "Password updated successfully."
    }