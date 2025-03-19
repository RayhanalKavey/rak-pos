# Point of Sale (POS) System

## Project Overview

This is a Point of Sale (POS) system built with Laravel 12, Vue 3, and Inertia.js. The system provides a seamless sales management solution with category and product management, customer and invoice handling, sales reporting, and analytics. It also includes JWT authentication and OTP-based password reset functionalities.

## Features

### 1. Environment Setup

-   Laravel 12 Installation
-   Vue 3 + Inertia.js Setup
-   Database Configuration & Migration Setup
-   Model Relationships Management

### 2. JWT Authentication System

-   JWT Authentication Setup
-   User Login & JWT Token Issuance

### 3. OTP-Based Authentication & Password Reset

-   Send OTP via Email
-   Verify OTP & Issue JWT Password Reset Token
-   Implement Token Verification Middleware
-   Completing Password Reset

### 4. Category & Product Management

-   Category CRUD (Create, Read, Update, Delete)
-   Product CRUD with Image Upload

### 5. Customer & Invoice Management

-   Customer CRUD
-   Invoice Generation (PDF / Print)

### 6. Sales Reporting & Analytics

-   Sales Report Generation
-   Export Reports (PDF)

## Tools & Environment Setup

-   **Backend:** Laravel 12, JWT, MySQL
-   **Frontend:** Vue 3, Inertia.js, Bootstrap
-   **Version Control:** Git & GitHub
-   **Server Setup:** Localhost (XAMPP) or Laravel Sail

## Installation Instructions

1. Clone the repository:
    ```bash
    git clone https://github.com/RayhanalKavey/rak-pos.git
    cd your-project-folder
    ```
2. Install dependencies:
    ```bash
    composer install
    npm install
    ```
3. Configure environment variables:
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```
4. Set up the database:
    ```bash
    php artisan migrate --seed
    ```
5. Start the application:
    ```bash
    php artisan serve
    npm run dev
    ```

## GitHub Repository

[Project Repository](https://github.com/RayhanalKavey/rak-pos)

<!-- ## Demo Video

[View Project Presentation Video](#) -->

---

Developed by **[Rayhan Al Kavey]**
