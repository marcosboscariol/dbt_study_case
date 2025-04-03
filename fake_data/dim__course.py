from faker import Faker
import pandas as pd
import random

# Inicializa o Faker
fake = Faker()

# Lista de nomes de cursos fictícios
course_names = [
    "Data Science", "Machine Learning", "Cybersecurity", "Cloud Computing",
    "Software Engineering", "Artificial Intelligence", "Business Analytics",
    "Web Development", "Mobile App Development", "Game Design",
    "Digital Marketing", "Blockchain Technology", "Computer Vision",
    "Internet of Things (IoT)", "Big Data Analytics", "Network Security"
]

# Gera os dados
courses = []
id_course = 0

for _ in range(10):  # Gerando 10 cursos
    id_course += 1
    course = {
        "id_course": id_course,
        # Escolhe um curso aleatório
        "course_name": random.choice(course_names)
    }
    courses.append(course)

# Converte para DataFrame
df = pd.DataFrame(courses)

# Salva em um arquivo CSV
df.to_csv("dim_course.csv", index=False, encoding="utf-8")
