from faker import Faker
import pandas as pd

# Inicializa o Faker
fake = Faker()

id_teacher = 0

# Gera os dados
teachers = []
for _ in range(10):  # Usa _ já que a variável do loop não é necessária
    id_teacher += 1  # Incrementa corretamente
    teacher = {
        "name": fake.name(),
        "id_teacher": id_teacher
    }
    teachers.append(teacher)  # Adiciona o dicionário correto à lista

# Converte para DataFrame
df = pd.DataFrame(teachers)

# Salva em um arquivo CSV
df.to_csv("dim_teacher.csv", index=False, encoding="utf-8")
