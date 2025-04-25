# peer-group-459-ecommerce-db

# 🛍️ E-commerce Database Design

## 🎯 Objective

This project helps our team learn how to design and implement a full relational database for an e-commerce system. It involves creating an ERD and a normalized database schema.

---

## 🛠️ Project Requirements

### ✅ 1. Created an ERD

- Tool used: [draw.io](https://draw.io) / [dbdiagram.io](https://dbdiagram.io)
- Entities and attributes are defined.
- Relationships, primary keys, foreign keys, and constraints are implemented.

### ✅ 2. Plan the Data Flow

mapped how data flows between the following major components:
- Products → Variations → Items
- Brands and Categories
- Sizes and Colors
- Product Attributes and Types

### ✅ 3. Group Collaboration

We collaborated using:
- WhatsApp / Zoom for meetings

### ✅ 4. Final Submission

Public GitHub repo includes:
- `ecommerce.sql` – Full SQL schema with sample data
- `ERD.png` – Entity Relationship Diagram
- This `README.md`

---

## 🗃️ Tables Overview

| Table               | Description |
|--------------------|-------------|
| `brand`            | Stores brand names |
| `product_category` | Product categories like Clothing, Electronics |
| `product`          | Main product details |
| `product_image`    | Product image URLs |
| `color`            | Color options |
| `size_category`    | Groups for sizes (e.g., Shoe Sizes) |
| `size_option`      | Specific sizes (e.g., M, L, 42) |
| `product_variation`| Combines product, color, size |
| `product_item`     | Items with SKU, price, stock |
| `attribute_category` | Grouping for product attributes |
| `attribute_type`   | Attribute types (text, number, boolean) |
| `product_attribute`| Additional product details |

---

## 🔗 ERD Overview

- **1-to-many**: `brand` → `product`, `product` → `product_image`
- **Many-to-1**: `product_variation` → `product`, `color`, `size_option`
- **Attribute tables**: Linked to products for flexible features

---

## ✅ Deliverables

- [x] ERD diagram.png
- [x] SQL schema
- [x] Sample data inserted
- [x] GitHub repository with documentation

---

## 👩‍💻 Tech Stack

- MySQL
- dbdiagram.io
- GitHub


