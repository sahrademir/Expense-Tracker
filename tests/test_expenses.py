def register_and_login(client):
    client.post(
        "/users/register",
        json={
            "username": "sahra",
            "email": "sahra@test.com",
            "password": "12345678"
        }
    )

    response = client.post(
        "/users/login",
        data={
            "username": "sahra",
            "password": "12345678"
        }
    )

    token = response.json()["access_token"]

    return {
        "Authorization": f"Bearer {token}"
    }


def test_create_expense(client):

    headers = register_and_login(client)

    response = client.post(
        "/expenses/",
        headers=headers,
        json={
            "title": "Coffee",
            "amount": 90,
            "category": "Food",
            "description": "Starbucks"
        }
    )

    assert response.status_code == 201
    assert response.json()["title"] == "Coffee"


def test_get_expenses(client):

    headers = register_and_login(client)

    client.post(
        "/expenses/",
        headers=headers,
        json={
            "title": "Coffee",
            "amount": 90,
            "category": "Food",
            "description": "Starbucks"
        }
    )

    response = client.get(
        "/expenses/",
        headers=headers
    )

    assert response.status_code == 200
    assert len(response.json()) == 1


def test_update_expense(client):

    headers = register_and_login(client)

    create = client.post(
        "/expenses/",
        headers=headers,
        json={
            "title": "Coffee",
            "amount": 90,
            "category": "Food",
            "description": "Starbucks"
        }
    )

    expense_id = create.json()["id"]

    response = client.put(
        f"/expenses/{expense_id}",
        headers=headers,
        json={
            "title": "Burger",
            "amount": 250,
            "category": "Food",
            "description": "Burger King"
        }
    )

    assert response.status_code == 200
    assert response.json()["title"] == "Burger"


def test_delete_expense(client):

    headers = register_and_login(client)

    create = client.post(
        "/expenses/",
        headers=headers,
        json={
            "title": "Coffee",
            "amount": 90,
            "category": "Food",
            "description": "Starbucks"
        }
    )

    expense_id = create.json()["id"]

    response = client.delete(
        f"/expenses/{expense_id}",
        headers=headers
    )

    assert response.status_code == 200

def test_create_expense_without_token(client):

    response = client.post(
        "/expenses/",
        json={
            "title": "Coffee",
            "amount": 90,
            "category": "Food",
            "description": "Starbucks"
        }
    )

    assert response.status_code == 401