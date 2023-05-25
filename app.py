from flask import Flask, jsonify, render_template
import mysql.connector
import matplotlib.pyplot as plt
import numpy as np
from flask import request, url_for, session, redirect
import bcrypt
import secrets

import matplotlib.pyplot as plt
import plotly.express as px
import seaborn as sns
from flask import Flask, render_template
from flask_bootstrap import Bootstrap
import pandas as pd

app = Flask(__name__)
app.secret_key = secrets.token_hex(16)
cnx = mysql.connector.connect(
    user="root", password="", host="localhost", database="lecture"
)
cursor = cnx.cursor()


@app.route("/")
def home():
    return render_template("login.html")


@app.route("/users")
def users():
    return render_template("users.html", users=users)


@app.route("/data")
def get_housing_data():
    # Fetch the housing data from the database
    housing_query = "SELECT * FROM users4"
    cursor.execute(housing_query)
    housing_data = cursor.fetchall()

    # Convert the housing data to a list of dictionaries
    columns = ["id", "title", "address", "city", "price", "bedrooms", "bathrooms"]
    housing_data = [dict(zip(columns, row)) for row in housing_data]

    return jsonify(housing_data)


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        query = "SELECT * FROM users3 WHERE username = %s"
        cursor.execute(query, (username,))
        user = cursor.fetchone()

        if user is not None and bcrypt.checkpw(
            password.encode("utf-8"), user[3].encode("utf-8")
        ):
            session["user_id"] = user[0]
            return redirect("/dashboard")
        else:
            error = "Invalid username or password"
            return render_template("login.html", error=error)
    else:
        return render_template("login.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = request.form["password"].encode("utf-8")

        hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())

        query = "INSERT INTO users3 (username, email, password) VALUES (%s, %s, %s)"
        cursor.execute(query, (username, email, hashed_password))
        cnx.commit()

        return redirect("/login")
    else:
        return render_template("register.html")


@app.route("/dashboard")
def dashboard():
    user_id = session.get("user_id")
    if not user_id:
        return redirect("/login")

    query = "SELECT * FROM users3 WHERE id = %s"
    cursor.execute(query, (user_id,))
    user = cursor.fetchone()

    # Fetch the housing data from the database
    housing_query = "SELECT * FROM users4"
    cursor.execute(housing_query)
    housing_data = cursor.fetchall()

    # Render the template
    return render_template("dashboard.html", user=user)


if __name__ == "__main__":
    app.run(debug=True)
