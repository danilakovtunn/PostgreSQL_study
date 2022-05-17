import random
import names
import string
import SentenceGenerator

def generate_date(year):
    return str(year) + '-' + str(random.randint(1,12)) + '-' + str(random.randint(1, 28))

def generate_phone():
    first = str(random.randint(100,999))
    second = str(random.randint(1,888)).zfill(3)
    first = '+7' + first
    last = (str(random.randint(1,9998)).zfill(4))
    while last in ['1111','2222','3333','4444','5555','6666','7777','8888']:
        last = (str(random.randint(1,9998)).zfill(4))
    return '{}{}{}'.format(first,second, last)

def generate_email():
       return ''.join(random.choice(string.ascii_letters) for _ in range(random.randint(5,15))) + '@myscript.com'

with open('..\my_script.sql', 'w') as f:
    op_s = ['windows XP', 'windows 7', 'windows 8', 'windows 9', 'windows 10', 'ubuntu 20.04']
    cities = ['Moscow', 'Saint-Petersburg', 'Novosibirsc', 'Ekaterinburg', 'Kazan', 'Nizhniy Novgorod', 'Chelyabinsk', 'samara', 'Omsk']
    hours = [11, 12, 13, 14, 15, 16, 17, 18]
    tables = ['Stores', 'Employees', 'Purchases', 'Orders', 'Customers', 'Products', 'Pull_classes', 'Classes', 'Sizes', 'Prices', 'tasks']
    streets = ['Berezovskaya', 'Moscovskaya', 'Revoluzii', 'Krasnih Zor', 'Lyadova', 'Lenina', 'Geroev', 'Nikonova', 'zirkovaya',
               'krasivaya', 'strashnaya', 'velikolepnaya', 'druzheskaya', 'klaviatornya', 'milaya', 'malenkaya', 'druzhnaya']
    positions = ['Sales Associate', 'Cashier', 'Customer Service Representative', 'Visual Merchandiser', 'Buyer', 'Store Manager', 
                 'Assistant Store Manager', 'Inventory Control Specialist', 'Store director']
    resolutions = ['1280*800', '1440*900', '1680*1050', '1920*1200', '2560*1600', '1024*576', '1152*648', 
                   '1280*720', '1366*768', '1600*900', '1920*1080', '2560*1440']
    keywords = ['bill', 'analyses', 'price', 'update', 'new purchase', 'sale', 'clothing class', 'size', 'promotion', 'clothing', 
                'opening', 'price increase', 'add', 'store', 'customer', 'employee', 'delivery']
    type_of_interaction = ['delete', 'insert ', 'update', 'analysis']
    surnames = []
    for i in range(100):
        surnames.append(names.get_last_name())
    first_names = []
    for i in range(100):
        first_names.append(names.get_first_name())

    f.write('DROP DATABASE test;\n')
    f.write('CREATE DATABASE test;\n\n')

    f.write('\\connect test\n')
    
    f.write('DROP TABLE users CASCADE;\n')
    f.write('DROP TABLE sessions CASCADE;\n')
    f.write('DROP TABLE interactions CASCADE;\n\n')
    
    f.write('CREATE TABLE users (\n')
    f.write('    user_id int,\n')
    f.write('    surname varchar(30),\n')
    f.write('    name varchar(30),\n')
    f.write('    birth_day date,\n')
    f.write('    phone_number char(12),\n')
    f.write('    email varchar(50),\n')
    f.write('    city varchar(20),\n')
    f.write('    address varchar(50),\n')
    f.write('    date_of_hiring date,\n')
    f.write('    poition varchar(35)\n')
    f.write(');\n\n')
    
    f.write('CREATE TABLE sessions (\n')
    f.write('    session_id int,\n')
    f.write('    user_id int,\n')
    f.write('    user_info json,\n')
    f.write('    time_start timestamp,\n')
    f.write('    duration interval,\n')
    f.write('    session_os varchar(30),\n')
    f.write('    display_resolution varchar(11)\n')
    f.write(');\n\n')
    
    f.write('CREATE TABLE interactions (\n')
    f.write('    interaction_id int,\n')
    f.write('    user_id int,\n')
    f.write('    user_info json,\n')
    f.write('    session_id int,\n')
    f.write('    interaction_time timestamp,\n')
    f.write('    user_comment text,\n')
    f.write('    type_of_interaction varchar(30),\n')
    f.write('    search_keyword varchar(20)[],\n')
    f.write('    table_used varchar(20)[]\n')
    f.write(');\n\n')

    f.write('COPY users FROM stdin;\n')
    for id in range(1, 200):
        f.write(str(id) + '\t')
        f.write(random.choice(surnames) + '\t')
        f.write(random.choice(first_names) + '\t')
        f.write(generate_date(random.randint(1974, 1996)) + '\t')
        f.write(generate_phone() + '\t')
        f.write(generate_email() + '\t')
        f.write(random.choice(cities) + '\t')
        f.write(random.choice(streets) + ' street, house ' + random.choice(['1','3','5','7','9','11']) + '\t')
        f.write(generate_date(random.randint(2015, 2020)) + '\t')
        f.write(random.choice(positions) + '\n')
    f.write('\\.\n\n')

    f.write('COPY sessions FROM stdin;\n')
    for id in range(1, 200):
        if id % 1000000 == 0:
            print(id)
        date = generate_date(random.randint(2015, 2020))
        hour = (random.choice(hours))
        minutes = random.randint(10, 53)
        f.write(str(id) + '\t')
        f.write(str(random.randint(1, 200)) + '\t')
        f.write('{\"full_name\": \"' + random.choice(surnames) + ' ' + random.choice(first_names) + '\", ' +
                '\"position\": \"' + random.choice(positions) + '\", ' + 
                '\"address\": \"' + random.choice(cities) + ', ' + 
                random.choice(streets) + ' street, house ' + random.choice(['1','3','5','7','9','11']) + '\"}\t')
        f.write('\'' + str(date) + ' ' + str(hour) + ':' + str(minutes) + ':' + str(random.randint(10, 59)) + '\'\t')
        f.write('\'' + str(random.randint(0,3)) + ' ' + str(random.randint(0, 23)) + ':' + 
                str(random.randint(0, 59)) + ':' + str(random.randint(0, 59)) + '\'\t')
        f.write(random.choice(op_s) + '\t')
        f.write(random.choice(resolutions) + '\n')
    f.write('\\.\n\n')

    f.write('COPY interactions FROM stdin;\n')
    for id in range(1, 200):
        if id % 1000000 == 0:
            print(id)
        date = generate_date(random.randint(2015, 2020))
        hour = (random.choice(hours))
        minutes = random.randint(10, 53)
        cur_table = []
        for i in range(1, random.randint(1, 5)):
            cur_table.append(random.choice(tables))
        cur_keywords = []
        for i in range(1, random.randint(1, 5)):
            cur_keywords.append(random.choice(keywords))
        f.write(str(id) + '\t')
        f.write(str(random.randint(1, 200)) + '\t')
        f.write('{\"full_name\": \"' + random.choice(surnames) + ' ' + random.choice(first_names) + '\", ' +
                '\"position\": \"' + random.choice(positions) + '\", ' + 
                '\"address\": \"' + random.choice(cities) + ', ' + 
                random.choice(streets) + ' street, house ' + random.choice(['1','3','5','7','9','11']) + '\"}\t')
        f.write(str(random.randint(1,200)) + '\t')
        f.write('\'' + str(date) + ' ' + str(hour) + ':' + str(minutes) + ':' + str(random.randint(10, 59)) + '\'\t')
#########################################################################################################################################3
        f.write(SentenceGenerator.MakeSentence() + '\t') 
        f.write(random.choice(type_of_interaction) + '\t')

        f.write('{')
        for i in set(cur_keywords):
            f.write(i + ', ')
        f.write(random.choice(keywords) + '}\t')

        f.write('{')
        for i in set(cur_table):
            f.write(i + ', ')
        f.write(random.choice(tables) + '}\n')
    f.write('\\.\n\n')


    f.write('ALTER TABLE ONLY users\n')
    f.write('    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);\n\n')

    f.write('ALTER TABLE ONLY sessions\n')
    f.write('    ADD CONSTRAINT session_pkey PRIMARY KEY (session_id);\n')
    f.write('ALTER TABLE ONLY sessions\n')
    f.write('    ADD FOREIGN KEY (user_id) REFERENCES users;\n\n')

    f.write('ALTER TABLE ONLY interactions\n')
    f.write('    ADD CONSTRAINT interaction_pkey PRIMARY KEY (interaction_id);\n')
    f.write('ALTER TABLE ONLY interactions\n')
    f.write('    ADD FOREIGN KEY (user_id) REFERENCES users;\n')
    f.write('ALTER TABLE ONLY interactions\n')
    f.write('    ADD FOREIGN KEY (session_id) REFERENCES sessions;\n')