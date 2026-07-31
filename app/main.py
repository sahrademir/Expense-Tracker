from fastapi import FastAPI
from app.database import Base, engine
from app.routers import users, expenses

Base.metadata.create_all(bind=engine)

app = FastAPI(title="Expense Tracker API")

app.include_router(users.router)
app.include_router(expenses.router)


@app.get("/")
def root():
    return {"message": "Expense Tracker API is running!"}