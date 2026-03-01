from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)

DB_USER = os.getenv("MYSQL_USER")
DB_PASSWORD = os.getenv("MYSQL_PASSWORD")
DB_HOST = os.getenv("MYSQL_HOST")
DB_NAME = os.getenv("MYSQL_DATABASE")

app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}"
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Customer(db.Model):
    __tablename__ = 'customers'
    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(100))
    email = db.Column(db.String(120))
    phone = db.Column(db.String(20))
    birth_date = db.Column(db.Date)
    is_active = db.Column(db.Boolean)
    created_at = db.Column(db.DateTime)

class Order(db.Model):
    __tablename__ = 'orders'
    id = db.Column(db.Integer, primary_key=True)
    customer_id = db.Column(db.Integer, db.ForeignKey('customers.id'))
    order_date = db.Column(db.Date)
    total_amount = db.Column(db.Numeric(10,2))
    payment_method = db.Column(db.String(50))
    status = db.Column(db.String(50))
    shipped = db.Column(db.Boolean)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/add", methods=["POST"])
def add():
    customer = Customer(
        full_name=request.form["full_name"],
        email=request.form["email"],
        phone=request.form["phone"],
        birth_date=request.form["birth_date"],
        is_active=True
    )
    db.session.add(customer)
    db.session.commit()

    order = Order(
        customer_id=customer.id,
        order_date=request.form["order_date"],
        total_amount=request.form["total_amount"],
        payment_method=request.form["payment_method"],
        status="Pending",
        shipped=False
    )
    db.session.add(order)
    db.session.commit()

    return redirect("/list")

@app.route("/list")
def list_data():
    customers = Customer.query.all()
    orders = Order.query.all()
    return render_template("list.html", customers=customers, orders=orders)



if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

