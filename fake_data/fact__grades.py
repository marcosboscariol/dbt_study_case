import pandas as pd
import random
from datetime import datetime

# Definir os valores possíveis
id_students = [str(i) for i in range(1, 41)]  # IDs de estudante de 1 a 40
id_courses = [str(i) for i in range(1, 11)]  # IDs de curso de 1 a 10
bimester_start_dates = ["2024-01-01", "2024-03-01", "2024-05-01",
                        "2024-07-01", "2024-09-01", "2024-11-01"]  # Início dos bimestres
# Gera notas de 0 a 10 com passos de 0.5
possible_grades = [i * 0.5 for i in range(21)]

# Gerar os dados
records = []
for bimester_start in bimester_start_dates:
    for id_student in id_students:
        record = {
            "id_student": id_student,
            "id_course": random.choice(id_courses),
            "date": bimester_start,  # Data fixa para o início do bimestre
            # Escolhe uma nota entre 0 e 10 com incrementos de 0.5
            "grade": random.choice(possible_grades)
        }
        records.append(record)

# Criar DataFrame
df = pd.DataFrame(records)

# Salvar como CSV
df.to_csv("fact_grades.csv", index=False, encoding="utf-8")
