# Database Schema (DDL)

- `schema.sql` creates all tables, constraints (PK/FK/UNIQUE/CHECK), and performance indexes.
- Dialect: PostgreSQL (MySQL 8 compatible with small datatype and constraint tweaks).
- Order of creation ensures foreign keys resolve correctly.
