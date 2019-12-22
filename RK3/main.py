import pyodbc


conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-IH4NTDI;'
                      'Database=data;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()


# =============== ЗАДАНИЕ 1 ==================

cursor.execute("use RK3")
cursor.execute('SELECT * FROM filials')

streets = {}

for row in cursor:
    building = row[2]
    street = building[:building.find(',')]
    if street not in streets:
        streets[street] = 1
    else:
        streets[street] += 1

print('Задание 1. Количество филлиалов на каждой из улиц')
print(streets)
print()

# =============== ЗАДАНИЕ 3 ==================

cursor.execute("use RK3")
# Только джоин таблиц
query3 = """
select *
        from filials f
        join employee e
        on e.filial_code = f.id_fil
"""
cursor.execute(query3)

print('Задание 3. Все сотрудники, в номере телефона которых нет цифры 7')
for row in cursor:
    if '7' not in row[3]:
        print([row[5], row[1], row[3]])

print()

# ================ ЗАДАНИЕ 2 =================

cursor.execute("use RK3")
# Только джоин таблиц
query2 = """
select *
        from filials f
        join employee e
        on e.filial_code = f.id_fil
"""
cursor.execute(query2)

fils = {}

print('Задание 2. Найти филиалы, в которых работает от 6 до 15 сотрудников в возрасте 26 лет')
for row in cursor:
    fil = row[1]
    if fil not in fils:
        fils[fil] = 0
    else:
        if 2019 - int(row[6][:4]) == 26:
            fils[fil] += 1

print(fils)
for k in fils:
    if fils[k] >= 6 and fils[k] <= 15:
        print("Филиал", k, "удовлетворяет условию")
