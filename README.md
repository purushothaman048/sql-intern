#  Movie Management System (MySQL Project)

##  Overview
This project is a MySQL-based relational database system designed to manage movies, directors, actors, and the roles actors play in movies. It demonstrates the use of key SQL concepts including DDL, DML, JOINs, and many-to-many relationships.

---

##  Database Schema

### 1. Movie
Stores movie details.

- `movie_id` (PK)
- `title`
- `genre`
- `release_date`
- `duration` (in minutes)
- `director_id` (FK to Director)

### 2. Director
Stores director information.

- `director_id` (PK)
- `name`
- `dob`

### 3. Actor
Stores actor information.

- `actor_id` (PK)
- `name`
- `dob`

### 4. Movie_Actor
Handles the many-to-many relationship between Movies and Actors.

- `id` (PK)
- `movie_id` (FK to Movie)
- `actor_id` (FK to Actor)
- `role` (role played by actor)

---

##  Relationships

- One **Director** can direct many **Movies** (One-to-Many).
- One **Movie** can have many **Actors**, and each **Actor** can be in many **Movies** (Many-to-Many via `Movie_Actor`).

---

##  Features Demonstrated

- ✅ Table creation using `CREATE`
- ✅ Data insertion using `INSERT`
- ✅ Data updates using `UPDATE`
- ✅ Deletion using `DELETE`
- ✅ Dropping and truncating tables
- ✅ Renaming tables and columns
- ✅ Using foreign key constraints


---

