
# **Dairy Management System API**

## **Project Description**

This project is a Dairy Management System that allows you to manage buyers in a dairy business using a RESTful API. The API provides routes for adding, updating, deleting, and fetching buyers from the database. The system also handles basic validation and error handling for smooth operation.

### Project Features:

- **Get Buyers:** Fetch all buyers in the system.
- **Add Buyer:** Add new buyers to the system.
- **Update Buyer:** Update buyer details such as name, phone, and email.
- **Delete Buyer:** Delete a buyer by their ID.

---

## How to Run/Setup the Project
Clone the repository to your local machine:git clone https://github.com/Joelngari/dairy-management-api.git
cd dairy-management-api


Activate the virtual environment:

   For Windows:   .\venv\Scripts\activate
   For macOS/Linux:  source venv/bin/activate


### Step 1: Install Dependencies
After activating the virtual environment, install the required Python packages by running: pip install -r requirements.txt
## Install mysql-connector-python inside your venv:
Run this command while the (venv) is active:pip install mysql-connector-python


### Step 2: Set Up the Database

1. Import the provided `main.sql` file into your MySQL database to create the necessary tables.


mysql -u your_username -p your_password < database_setup.sql
The SQL script will create a buyers table and insert necessary columns for the API to work.

Step 3: Run the Application
After installing the dependencies and setting up the database, run the FastAPI application:

      uvicorn main:app --reload


Access the API via http://127.0.0.1:8000/.

Step 4: Testing with Swagger
Open http://127.0.0.1:8000/docs to interact with the API using Swagger UI.

Test each endpoint (GET, POST, PUT, DELETE) to ensure the system works as expected.
## Environment Variables
#This project uses a .env file to store sensitive information such as the database connection credentials. Example:
DB_HOST=localhost  
DB_USER=root  
DB_PASSWORD=yourpassword  
DB_NAME=dairymanagement
To run the project locally, create a .env file in the root of the API folder and add your own credentials. This file is not included in the repo for security reasons.

.gitignore
The .gitignore file is used to prevent sensitive or unnecessary files from being pushed to GitHub.
It includes:  .env

Question 1 - Database Setup
A well-commented .sql file is provided in the repository. This file is used to set up the database and create the buyers table.
ERD (Entity Relationship Diagram)

![ERD diagram  of dairy management system](https://github.com/user-attachments/assets/9de6dcaf-70a6-47dd-83fd-1426078dcbe1)

Question 2 - Source Code Files
All source code files, including the FastAPI code and SQL scripts, are included in this repository under the appropriate folders.

Additional Notes
The project is designed to be simple and scalable, allowing easy additions such as front-end integration or additional buyer management features.

All routes are fully functional and have been tested using the Swagger UI.





