# Database Normalization to Third Normal Form (3NF)

## Objective
Apply normalization principles to ensure the relational schema is in **Third Normal Form (3NF)**, eliminating redundancy and ensuring data integrity.

---

## 💡 Normalization Overview

**First Normal Form (1NF)**:  
- Ensure atomic values (no repeating groups or arrays).
- Each row must be unique with a primary key.

**Second Normal Form (2NF)**:  
- Must be in 1NF.
- All non-key attributes must be fully functionally dependent on the **entire** primary key.

**Third Normal Form (3NF)**:  
- Must be in 2NF.
- No transitive dependency: non-key attributes must **only** depend on the primary key.

---

## 🔍 Step-by-Step Normalization Review

### User Table

| Attribute         | Key Type | Notes |
|------------------|----------|-------|
| user_id          | PK       | OK    |
| first_name       | -        | Atomic, fully dependent on PK |
| last_name        | -        | Atomic, fully dependent on PK |
| email            | UNIQUE   | No derived or redundant data |
| password_hash    | -        | OK    |
| phone_number     | -        | Nullable, but no violation |
| role             | ENUM     | Fully dependent on PK |
| created_at       | -        | Timestamp metadata |

**Status**: ✔ 3NF — No changes needed

---

### Property Table

| Attribute         | Key Type     | Notes |
|------------------|--------------|-------|
| property_id      | PK           | OK    |
| host_id          | FK → User    | OK    |
| name             | -            | OK    |
| description      | -            | OK    |
| location         | -            | Assumed atomic (city/address/etc.) |
| pricepernight    | -            | Fully dependent on PK |
| created_at       | -            | OK    |
| updated_at       | -            | OK    |

**Status**: ✔ 3NF — No changes needed

---

### Booking Table

| Attribute         | Key Type     | Notes |
|------------------|--------------|-------|
| booking_id       | PK           | OK    |
| property_id      | FK → Property| OK    |
| user_id          | FK → User    | OK    |
| start_date       | -            | OK    |
| end_date         | -            | OK    |
| total_price      | -            | Calculated, but assumed stored as business requirement |
| status           | ENUM         | OK    |
| created_at       | -            | OK    |

**Status**: ✔ 3NF — No transitive dependencies

---

### Payment Table

| Attribute         | Key Type     | Notes |
|------------------|--------------|-------|
| payment_id       | PK           | OK    |
| booking_id       | FK → Booking | OK    |
| amount           | -            | OK    |
| payment_date     | -            | OK    |
| payment_method   | ENUM         | OK    |

**Status**: ✔ 3NF — No violations

---

### Review Table

| Attribute         | Key Type     | Notes |
|------------------|--------------|-------|
| review_id        | PK           | OK    |
| property_id      | FK → Property| OK    |
| user_id          | FK → User    | OK    |
| rating           | INT (1–5)    | OK    |
| comment          | -            | OK    |
| created_at       | -            | OK    |

**Status**: ✔ 3NF — No redundant or transitive attributes

---

### Message Table

| Attribute         | Key Type     | Notes |
|------------------|--------------|-------|
| message_id       | PK           | OK    |
| sender_id        | FK → User    | OK    |
| recipient_id     | FK → User    | OK    |
| message_body     | -            | OK    |
| sent_at          | -            | OK    |

**Status**: ✔ 3NF — No violations

---

## Summary

All tables conform to:
- **1NF**: Atomic values
- **2NF**: No partial dependencies (all tables have single-column PKs)
- **3NF**: No transitive dependencies

There is no need for restructuring to meet 3NF. The schema is clean, normalized, and ready for implementation.

---

## Recommendations

- Optionally separate ENUMs (like `role`, `status`, `payment_method`) into reference tables for extensibility.
- Consider adding indexing for foreign keys and frequent query fields (e.g., `email`, `property_id`).


