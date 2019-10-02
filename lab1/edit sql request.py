import pandas as pd

data = pd.read_csv('MOCK_DATA.csv')
del data['id']
data_len = data.shape[0]


with open('insert_data.sql', "w", encoding="utf-8") as f:        
    msg = 'use users\n\ngo\n\ninsert into employee\n\tvalues\n'
    f.write(msg)

    for i in range(data_len):
        values = []
        s = "\t\t("
        for col in data.columns:
            values.append(str(data[col][i]).replace('\'', ""))
        for v in values[0:14]:
            s += "\'{}\', ".format(v)
        s += str(values[14]) + ", " # For integer field
        if i < data_len - 1:
            s += "\'{}\'),\n".format(values[15])
        else:
            s += "\'{}\')\n".format(values[15])

        f.write(s)
