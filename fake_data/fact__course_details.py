import pandas as pd
import random
from datetime import datetime

# Definir os valores possíveis
id_courses = [str(i) for i in range(1, 11)]  # IDs de curso de 1 a 10
id_teachers = [str(i) for i in range(1, 11)]  # IDs de professor de 1 a 10
quarter_dates = ["2024-01-01", "2024-04-01", "2024-07-01",
                 "2024-10-01"]  # Primeiros dias dos trimestres de 2024
minimum_grades = [5, 6, 7]  # Valores possíveis para minimum_grade

# Gerar os dados
records = []
for quarter_date in quarter_dates:
    # Embaralha os cursos para garantir distribuição aleatória
    random.shuffle(id_courses)
    for id_course in id_courses:
        record = {
            "id_course": id_course,
            "id_teacher": random.choice(id_teachers),
            "date": quarter_date,
            # Escolhe entre 5, 6 ou 7
            "minimum_grade": random.choice(minimum_grades)
        }
        records.append(record)

# Criar DataFrame
df = pd.DataFrame(records)

# Salvar como CSV
df.to_csv("fact_course_details.csv", index=False, encoding="utf-8")
