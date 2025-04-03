import pandas as pd
import random
from datetime import datetime, timedelta

# Definir os valores possíveis
id_students = [str(i) for i in range(1, 41)]  # IDs de estudante de 1 a 40
id_courses = [str(i) for i in range(1, 11)]  # IDs de curso de 1 a 10
quarter_start_dates = ["2024-01-01", "2024-04-01",
                       "2024-07-01", "2024-10-01"]  # Início dos trimestres

# Gerar os dados
records = []
for quarter_start in quarter_start_dates:
    quarter_start_date = datetime.strptime(quarter_start, "%Y-%m-%d")
    for id_student in id_students:
        # Escolhe um dia aleatório dentro do trimestre
        random_days = random.randint(0, 89)
        record = {
            "id_student": id_student,
            "id_course": random.choice(id_courses),
            "date": (quarter_start_date + timedelta(days=random_days)).strftime("%Y-%m-%d"),
            # 90% de chance de ser 2, 10% de ser 3
            "abscence": random.choices([2, 3], weights=[0.9, 0.1])[0]
        }
        records.append(record)

# Criar DataFrame
df = pd.DataFrame(records)

# Salvar como CSV
df.to_csv("fact_attendence.csv", index=False, encoding="utf-8")
