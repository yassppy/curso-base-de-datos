import sqlite3

# Conectar a la base de datos de SQLite original
con = sqlite3.connect("sql-murder-mystery.db")
cursor = con.cursor()

# Limpiar la tabla por si acaso e insertar tu respuesta
cursor.execute("DELETE FROM solution;")
cursor.execute("INSERT INTO solution VALUES (1, 'Jeremy Bowers');")
cursor.execute("INSERT INTO solution VALUES (2, 'Miranda Priestly');")

# Leer el mensaje de verificación que genera SQLite
resultado = cursor.execute("SELECT value FROM solution;").fetchone()

print("🔍 RESULTADO DEL JUEGO:")
print(resultado[0])

con.close()
