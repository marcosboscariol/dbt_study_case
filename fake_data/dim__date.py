import pandas as pd
from datetime import datetime, timedelta

# Definir intervalo de datas
data_inicial = datetime(2020, 1, 1)  # Altere conforme necessário
data_final = datetime(2030, 12, 31)  # Altere conforme necessário

# Criar lista de datas
dates = []
current_date = data_inicial

while current_date <= data_final:
    dates.append({
        "date": current_date.strftime("%Y-%m-%d"),  # Formato de data padrão
        "year": current_date.year,
        "month_number": current_date.month,
        "day": current_date.day,
        "month_name": current_date.strftime("%B"),  # Nome do mês completo
        # Define o trimestre
        "quarter": f"Q{((current_date.month - 1) // 3) + 1}"
    })
    current_date += timedelta(days=1)

# Criar DataFrame
df = pd.DataFrame(dates)

# Salvar como CSV
df.to_csv("dim_date.csv", index=False, encoding="utf-8")
