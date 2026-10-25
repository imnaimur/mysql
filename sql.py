import sqlite3
conn = sqlite3.connect('sql_practice/test.db',timeout=0.01)
cursor = conn.cursor()

def create_user_table() -> None:
    sql_cmd = """
            CREATE TABLE IF NOT EXISTS users (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT NOT NULL,
                    email TEXT NOT NULL UNIQUE
            )
    """
    cursor.execute(sql_cmd)
    conn.commit()
    conn.close()
    print("users table created successfully")


# create_user_table()

def insert_user(name,email):
    sqlcmd = """
        INSERT INTO users(name,email) VALUES(?,?)
        """
    values = (name,email)
    cursor.execute(sqlcmd,values)
    conn.commit()
    conn.close()
    print(f"user {name} added successfully")


# insert_user("Naimur","naimur@gmail.com")
# insert_user("Naimur2","naimur2@gmail.com")
# insert_user("Naimur3","naimur3@gmail.com")
# insert_user("Naimur4","naimur4@gmail.com")
# insert_user("Naimur5","naimur5@gmail.com")
# insert_user("Naimur6","naimur6@gmail.com")

def get_users_table():
    sqlcmd = "SELECT * FROM users"
    rows = cursor.execute(sqlcmd).fetchall()

    for i in rows:
        print(i)
    conn.commit()
    conn.close()

get_users_table()