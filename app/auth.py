import bcrypt #to hash and verify passwords
from jwt import ExpiredSignatureError
from jwt import InvalidTokenError
import jwt #after user authentication is using JWT
import secrets
from fastapi import HTTPException
from datetime import datetime, timedelta, timezone
from app.core.config import (
    SECRET_KEY,
    ALGORITHM,
    ACCESS_TOKEN_EXPIRE_MINUTES,
)

def hash_password(password):
    password_bytes = password.encode('utf-8') #converting string to bytes
    salt = bcrypt.gensalt() #add a secure random salt
    return bcrypt.hashpw(password_bytes,salt).decode('utf-8') #hash the password

def verify_password(password, hashed_password):
    password_bytes = password.encode('utf-8') #converting string to bytes
    return bcrypt.checkpw(password_bytes,hashed_password.encode('utf-8')) #compare and return T or F

def create_access_token(data):
    to_encode = data.copy()
    expire = datetime.now(timezone.utc) + timedelta(minutes=30) #this token expire after 30 mins
    to_encode.update({"exp": expire})
    token = jwt.encode(
        to_encode,
        SECRET_KEY,
        algorithm='HS256'
     )
    return token

def verify_token(token):
    try:
        payload = jwt.decode(
            token,
            SECRET_KEY,
            algorithms=[ALGORITHM]
        )
        return payload
    except ExpiredSignatureError:
        raise HTTPException(
            status_code=401,
            detail="Token has expired."
        )
    except InvalidTokenError:
        raise HTTPException(
            status_code=401,
            detail="Invalid token."
        )

