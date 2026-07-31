from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.database import Base, engine
from app.routers import users, expenses


app = FastAPI(title="Expense Tracker API")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

Base.metadata.create_all(bind=engine)

app.include_router(users.router)
app.include_router(expenses.router)


@app.get("/")
def root():
    return {"message": "Expense Tracker API is running!"}