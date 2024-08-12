# pip install pandas
# pip install openpyxl

import pandas as pd

excel_file = input("Enter file name -> ")

df = pd.read_excel(excel_file)


json_data = df.to_json(orient='records', indent=4)

with open('output.json', 'w') as json_file:
    json_file.write(json_data)

print("Excel data has been converted to JSON and saved as 'output.json'")
