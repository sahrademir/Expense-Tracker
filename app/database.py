from fastapi import FastAPI, Depends
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

SQLALCHEMY_DATABASE_URL ="sqlite:///./test.db"
engine = create_engine(SQLALCHEMY_DATABASE_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False,bind=engine)
Base = declarative_base()

def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()

# engine is the main object that enables SQLAlchemy to communicate with database.
# sessions are created via this engine
# we will create a new database session for every incoming request
# structure that forms the base class for class models
# for class User(Base):
# dependency injection def get_db()
# yield not return bcs. return finishes completely
# with yield, the session is being lent to the endpoint

