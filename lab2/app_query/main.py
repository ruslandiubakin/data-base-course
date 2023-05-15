import csv
import psycopg2
from psycopg2 import sql


def exec_query_7():
    # Запит варіанту 7. Порівняти  найкращий  бал  з  Математики  у  кожному  регіоні  у  2021  та  2019  роках  серед тих кому було зараховано тест.

    query_7 = sql.SQL('''
        SELECT "St"."RegName" as "Region Name", 
            MAX(CASE WHEN "Res"."Year" = 2021 THEN "Res"."Ball100" END) as "Max MathBall 2021",
            MAX(CASE WHEN "Res"."Year" = 2019 THEN "Res"."Ball100" END) as "Max MathBall 2019"
        FROM "Students" as "St",
            "Results_Of_Students" as "Res"
        WHERE "Res"."SubjectID" = 'Math' AND
            "Res"."TestStatus" = 'Зараховано' AND
            "Res"."StudentID" = "St"."ID"
        GROUP BY "St"."RegName";
    ''')

    conn = psycopg2.connect(database='kpi_course_db',
                            user='postgres', 
                            password='postgres',
                            host = 'db',
                            port = '5432')

    # Виконання запиту №7
    with conn.cursor() as cursor:
        cursor.execute(query_7)

        # Створення або відкриття файлу results.csv та записування до нього результату запиту №7.
        with open('result.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([i[0] for i in cursor.description]) # запис заголовку таблиці
            writer.writerows(cursor.fetchall()) # запис даних таблиці


def main():
    exec_query_7()


if __name__ == "__main__":
    main()