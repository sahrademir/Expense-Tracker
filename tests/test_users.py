def test_register_success(client):
    response = client.post(
        "/users/register",
        json={
            "username": "sahra",
            "email": "sahra@test.com",
            "password": "12345678"
        }
    )

    assert response.status_code ==201
    assert response.json()["email"]=="sahra@test.com"

def test_register_duplicate_email(client):
    client.post(
        "/users/register",
        json={
            "username": "sahra",
            "email": "duplicate@test.com",
            "password": "12345678"
        }
    )

    response = client.post(
        "/users/register",
        json={
            "username":"another",
            "email": "duplicate@test.com",
            "password": "12345678"
        }
    )

    assert response.status_code == 409

def test_login_success(client):

    client.post(
        "/users/register",
        json={
            "username": "login",
            "email": "login@test.com",
            "password": "12345678"
        }
    )

    response = client.post(
        "/users/login",
        data={
            "username": "login",
            "password": "12345678"
        }
    )

    assert response.status_code == 200
    assert "access_token" in response.json()

def test_login_wrong_password(client):

    client.post(
        "/users/register",
        json={
            "username": "wrong",
            "email": "wrong@test.com",
            "password": "12345678"
        }
    )

    response = client.post(
        "/users/login",
        data={
            "username": "wrong",
            "password": "00000000"
        }
    )

    assert response.status_code == 401

