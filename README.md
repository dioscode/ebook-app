# Saturni E-Books

A full-stack e-book management web application built with Java Servlets, JSP, and MySQL. Users can browse, buy, and sell books across multiple genres with a modern dynamic UI.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Java 17 |
| Web Tier | Jakarta Servlet 4.0 + JSP |
| Server | Apache Tomcat 9.0.85 |
| Database | MySQL 8.0 |
| DB Driver | mysql-connector-java 8.0.23 |
| Tag Library | JSTL 1.2 |
| Build Tool | Maven 3.9+ |
| Frontend | Bootstrap 4, Custom CSS, Vanilla JS |
| Icons | Font Awesome 6.5 |
| Fonts | Google Fonts — Poppins |

---

## Architecture

The project follows the **MVC pattern** using Servlets as Controllers, JSP as Views, and DAO classes as the Model layer.

```
Browser
   │
   ▼
Apache Tomcat 9
   ├── View  (JSP pages)         — server-side rendered HTML
   ├── Controller (Servlets)     — handle HTTP requests & redirect
   └── Model (DAO + Entities)    — SQL queries via JDBC
         │
         ▼
      MySQL 8.0 (ebook-app database)
```

### Project Structure

```
Ebook-App/
├── pom.xml
└── src/main/
    ├── java/com/
    │   ├── DB/DBConnect.java              # JDBC singleton connection
    │   ├── entity/                        # Plain Java model classes
    │   │   ├── BookDtls.java
    │   │   ├── User.java
    │   │   ├── Cart.java
    │   │   └── Book_Order.java
    │   ├── DAO/                           # Data access layer
    │   │   ├── BookDAO.java + BookDAOImpl.java
    │   │   ├── UserDAO.java + UserDAOImpl.java
    │   │   ├── CartDAO.java + CartDAOImpl.java
    │   │   └── BookOrderDAO.java + BookOrderImpl.java
    │   ├── user/servlet/                  # User-facing controllers
    │   │   ├── LoginServlet.java          # POST /login
    │   │   ├── RegisterServlet.java       # POST /register
    │   │   ├── CartServlet.java           # GET  /cart
    │   │   ├── OrderServlet.java          # POST /order
    │   │   ├── AddOldBook.java            # POST /add_old_book
    │   │   ├── RemoveBookCart.java        # GET  /remove_book
    │   │   ├── DeleteOldBook.java         # GET  /delete_old_book
    │   │   ├── UpdateProfileServlet.java  # POST /update_profile
    │   │   └── LogoutServlet.java         # GET  /logout
    │   └── admin/servlet/                 # Admin controllers
    │       ├── BooksAdd.java
    │       ├── BookDeleteServlet.java
    │       └── EditBooksServlet.java
    └── webapp/
        ├── WEB-INF/web.xml
        ├── all_component/                 # Shared partials
        │   ├── navbar.jsp                 # Top header + sticky nav + live search
        │   ├── footer.jsp
        │   ├── allCss.jsp                 # CDN imports + scroll-reveal JS
        │   ├── style.css                  # Full design system
        │   └── book_card_helpers.jsp      # coverClass() / genreBadgeClass() helpers
        ├── admin/                         # Admin panel pages
        ├── book/                          # Book cover images
        ├── search_api.jsp                 # JSON endpoint for live search
        └── *.jsp                          # User-facing pages
```

---

## Features

- Browse books by category: New, Old, Recent
- Filter by genre with one-click pills (instant, no reload)
- Live search dropdown — results appear as you type
- Add books to cart and place orders (Cash on Delivery)
- Sell old books with genre selection
- User registration and login
- Profile management
- Admin panel for book management
- CSS-generated book covers — no broken images

---

## Getting Started

### Prerequisites

- Java 17+
- Apache Maven 3.6+
- MySQL 8.0+
- Apache Tomcat 9.x

### 1. Clone the repository

```bash
git clone https://github.com/dioscode/ebook-app.git
cd ebook-app
```

### 2. Set up the database

Log in to MySQL and run the following:

```sql
CREATE DATABASE `ebook-app`;
USE `ebook-app`;

CREATE TABLE user (
    id       INT          AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(255),
    email    VARCHAR(255) UNIQUE,
    phno     VARCHAR(20),
    password VARCHAR(255),
    address  VARCHAR(500),
    city     VARCHAR(255),
    state    VARCHAR(255)
);

CREATE TABLE book_dtls (
    bookid       INT          AUTO_INCREMENT PRIMARY KEY,
    bookname     VARCHAR(255),
    author       VARCHAR(255),
    price        VARCHAR(50),
    bookCategory VARCHAR(50),
    status       VARCHAR(50),
    photo        VARCHAR(255),
    email        VARCHAR(255),
    genre        VARCHAR(100) DEFAULT 'General'
);

CREATE TABLE cart (
    cid         INT    AUTO_INCREMENT PRIMARY KEY,
    bid         INT,
    uid         INT,
    bookName    VARCHAR(255),
    author      VARCHAR(255),
    price       DOUBLE,
    total_price DOUBLE
);

CREATE TABLE book_order (
    id        INT          AUTO_INCREMENT PRIMARY KEY,
    order_id  VARCHAR(100),
    user_name VARCHAR(255),
    email     VARCHAR(255),
    address   VARCHAR(500),
    phno      VARCHAR(20),
    book_name VARCHAR(255),
    author    VARCHAR(255),
    price     VARCHAR(50),
    payment   VARCHAR(50)
);
```

Optionally insert sample books:

```sql
INSERT INTO book_dtls (bookname,author,price,bookCategory,status,photo,email,genre) VALUES
('Clean Code',               'Robert C. Martin',  '1200', 'New', 'Active', 'book1.jpg', 'admin@gmail.com', 'Programming'),
('The Pragmatic Programmer', 'Andrew Hunt',        '1100', 'New', 'Active', 'book2.jpg', 'admin@gmail.com', 'Programming'),
('Java: The Complete Reference', 'Herbert Schildt','950',  'New', 'Active', 'book3.jpg', 'admin@gmail.com', 'Programming'),
('One of Us Is Back',        'Karen M. McManus',  '500',  'Old', 'Active', 'book4.jpg', 'seller@gmail.com','Fiction'),
('Design Patterns',          'Gang of Four',       '700',  'Old', 'Active', 'book5.jpg', 'seller@gmail.com','Programming');
```

### 3. Configure the database connection

Edit `src/main/java/com/DB/DBConnect.java` and update the credentials if needed:

```java
conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/ebook-app?useSSL=false&serverTimezone=UTC",
    "root",        // your MySQL username
    "yourpassword" // your MySQL password
);
```

### 4. Build the WAR

```bash
mvn clean package
```

The WAR file is generated at `target/Ebook-App.war`.

### 5. Deploy to Tomcat

Copy the WAR to Tomcat's webapps directory:

```bash
# Linux / Mac
cp target/Ebook-App.war /path/to/tomcat/webapps/

# Windows
copy target\Ebook-App.war C:\path\to\tomcat\webapps\
```

Then start Tomcat:

```bash
# Linux / Mac
/path/to/tomcat/bin/startup.sh

# Windows
C:\path\to\tomcat\bin\startup.bat
```

### 6. Open the app

```
http://localhost:8080/Ebook-App/
```

---

## Default Accounts

| Role | Email | Password |
|---|---|---|
| Admin | admin@gmail.com | admin |
| User (demo) | test@gmail.com | test123 |

---

## Available Genres

| Genre | Cover Color |
|---|---|
| Programming | Purple |
| Fiction | Pink |
| Science | Green |
| History | Amber |
| Self-Help | Blue |
| Mathematics | Teal |
| General | Gray |

---

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "feat: add your feature"`
4. Push the branch: `git push origin feature/your-feature`
5. Open a Pull Request
