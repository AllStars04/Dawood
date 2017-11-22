cd "C:\Users\SLR 10\PycharmProjects\M2MAutomation"
for %%x in (%*) do "C:\Users\SLR 10\AppData\Local\Programs\Python\Python36\Scripts\behave" --logging-level ERROR -k --tags %%x