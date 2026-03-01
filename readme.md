# Sistema de Gestión de Pedidos
## Aplicación Contenerizada con Docker y Flask

### Autor Andrés Arbeláez
Actividad Sumativa – Unidad 2  
Módulo: Contenerización de Aplicaciones de Software  

---

## 📌 Descripción del Proyecto

Este proyecto consiste en el desarrollo y despliegue de una aplicación web contenerizada utilizando Docker y Docker Compose. La aplicación implementa una arquitectura cliente-servidor basada en microservicios, compuesta por:

- 🐍 Servidor Web Flask (Python 3.11)
- 🗄 Base de datos relacional MySQL 8
- 🐳 Orquestación mediante Docker Compose
- 💾 Persistencia mediante volumen Docker

El sistema permite registrar clientes y sus pedidos, almacenando la información en una base de datos relacional con integridad referencial.

---

## 🧱 Arquitectura del Sistema

Browser (Cliente)
        │
        ▼
Flask Container (Puerto 5000)
        │
        ▼
MySQL Container (Puerto 3306)
        │
        ▼
Docker Volume (Persistencia)

Características técnicas:

- Aislamiento de servicios
- Red bridge automática
- Persistencia mediante volumen
- Script de inicialización SQL
- Uso de ORM (SQLAlchemy)

---

## 🗄 Modelo de Base de Datos

### Tabla: customers

- id (INT, PK, AUTO_INCREMENT)
- full_name (VARCHAR)
- email (VARCHAR)
- phone (VARCHAR)
- birth_date (DATE)
- is_active (BOOLEAN)
- created_at (DATETIME)

### Tabla: orders

- id (INT, PK, AUTO_INCREMENT)
- customer_id (INT, FK)
- order_date (DATE)
- total_amount (DECIMAL)
- payment_method (VARCHAR)
- status (VARCHAR)
- shipped (BOOLEAN)

Relación: 1 cliente → N pedidos

Tipos de datos utilizados:

- INT
- VARCHAR
- DATE
- DATETIME
- BOOLEAN
- DECIMAL

---

## 🐳 Tecnologías Utilizadas

- Docker
- Docker Compose
- Python 3.11
- Flask
- SQLAlchemy
- MySQL 8
- Bootstrap 5

---

## 🚀 Instrucciones de Ejecución

### 1️⃣ Construir imágenes

docker compose build

### 2️⃣ Levantar servicios

docker compose up -d

### 3️⃣ Acceder a la aplicación

http://localhost:5000

---

## 🔍 Comandos Docker Relevantes

- docker images
- docker ps
- docker inspect
- docker logs
- docker network inspect
- docker volume inspect
- docker compose up
- docker compose down
- docker exec

---

## 💾 Persistencia

La base de datos utiliza un volumen Docker llamado:

mysql_data

Esto garantiza que los datos no se pierdan aunque los contenedores sean eliminados.

---

## 🎯 Objetivos Académicos Cumplidos

✔ Creación de imagen personalizada  
✔ Despliegue de base de datos relacional  
✔ Uso de relaciones entre tablas  
✔ Persistencia de datos  
✔ Uso de más de 15 tipos de datos  
✔ Más de 30 comandos Docker demostrados  
✔ Arquitectura contenerizada funcional  

---

## 📚 Conclusión

El uso de Docker y Docker Compose permite encapsular aplicaciones junto con sus dependencias, garantizando portabilidad, escalabilidad y consistencia entre entornos. Este proyecto demuestra cómo la contenerización facilita el despliegue de aplicaciones modernas en arquitecturas distribuidas.