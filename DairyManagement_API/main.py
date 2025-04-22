from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from DairyManagement_API.db import get_db_connection 

app = FastAPI()


# Pydantic model for Buyer
class Buyer(BaseModel):
    name: str
    phone: str
    email: str

# Home route
@app.get("/")
def read_root():
    return {"message": "Welcome to Dairy Management API"}

# Get all buyers
@app.get("/buyers/")
def get_buyers():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM buyers")
        buyers = cursor.fetchall()
        conn.close()
        return {"buyers": buyers}
    except Exception as e:
        print(f"Error fetching buyers: {e}")
        raise HTTPException(status_code=500, detail="Error fetching buyers")

# Add a new buyer
@app.post("/buyers/")
def add_buyer(buyer: Buyer):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO buyers (name, phone, email) VALUES (%s, %s, %s)",
            (buyer.name, buyer.phone, buyer.email)
        )
        conn.commit()
        conn.close()
        return {"message": "Buyer added successfully!"}
    except Exception as e:
        print(f"Error inserting buyer: {e}")
        raise HTTPException(status_code=500, detail="Error inserting buyer into database")

# Delete a buyer by ID
@app.delete("/buyers/{buyer_id}")
def delete_buyer(buyer_id: int):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM buyers WHERE buyer_id = %s", (buyer_id,))
        conn.commit()
        conn.close()
        return {"message": f"Buyer with ID {buyer_id} deleted successfully!"}
    except Exception as e:
        print(f"Error deleting buyer: {e}")
        raise HTTPException(status_code=500, detail="Error deleting buyer")
# Update a buyer by ID
@app.put("/buyers/{buyer_id}")
def update_buyer(buyer_id: int, updated_buyer: Buyer):
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Check if the buyer exists
        cursor.execute("SELECT * FROM buyers WHERE buyer_id = %s", (buyer_id,))
        existing_buyer = cursor.fetchone()

        if not existing_buyer:
            conn.close()
            raise HTTPException(status_code=404, detail="Buyer not found")

        # Update the buyer details
        cursor.execute(
            "UPDATE buyers SET name = %s, phone = %s, email = %s WHERE buyer_id = %s",
            (updated_buyer.name, updated_buyer.phone, updated_buyer.email, buyer_id)
        )
        conn.commit()
        conn.close()

        return {"message": f"Buyer with ID {buyer_id} updated successfully!"}
    except Exception as e:
        print(f"Error updating buyer: {e}")
        raise HTTPException(status_code=500, detail="Error updating buyer in database")

