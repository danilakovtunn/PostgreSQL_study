/*drop table Stores CASCADE;
drop table Employees CASCADE;
drop table Purchases CASCADE;
drop table Orders CASCADE;
drop table Customers CASCADE;
drop table Products CASCADE;
drop table Pull_classes CASCADE;
drop table Classes CASCADE;
drop table Sizes CASCADE;
drop table Prices CASCADE;

CREATE TABLE Stores (
	store_id serial,
	address text
);

CREATE TABLE Employees (
	employee_id serial,
	full_name varchar(30),
	chief_id int,
	store_id int,
	position varchar(20),
	CONSTRAINT position_check CHECK (position IN ('Директор', 'Продавец-консультант', 'Старший консультант'))
);

CREATE TABLE Purchases (
	purchase_id serial,
	employee_id int,
	customer_id int,
	order_time timestamp
	CONSTRAINT order_time_check CHECK (order_time < now())
);

CREATE TABLE Orders (
	product_id int,
	purchase_id int,
	amount int,
	CONSTRAINT amount_check CHECK (amount > 0)
);

CREATE TABLE Customers (
	customer_id serial,
	full_name varchar(30),
	sex varchar(6),
	date_of_birth date,
	email varchar(256),
	phone char(11),
	CONSTRAINT sex_check CHECK (sex in ('Муж', 'Жен')),
	CONSTRAINT date_of_birth_check CHECK (date_of_birth < now())
);

CREATE TABLE Products (
	product_id serial,
	description text,
	size_id int
);

CREATE TABLE Pull_classes (
	product_id int,
	class_id int
);

CREATE TABLE Classes (
	class_id serial,
	title varchar(15)
);

CREATE TABLE Sizes (
	size_id serial,
	age_from interval YEAR TO MONTH,
	age_to interval YEAR TO MONTH,
	heigh_from int,
	heigh_to int,
	CONSTRAINT age_check CHECK (age_from <= age_to),
	CONSTRAINT age_limit CHECK (age_from < '18-0'::interval AND age_to < '18-0'::interval),
	CONSTRAINT heigh_check CHECK (heigh_to > heigh_from),
	CONSTRAINT heigh_limit CHECK (heigh_from > 0 AND heigh_to > 0 AND heigh_from < 160 AND heigh_to < 160)	
);

CREATE TABLE Prices (
	price_id serial,
	product_id int,
	price money,
	data_from date,
	data_to date,
	CONSTRAINT price_check CHECK (price > 0::money),
	CONSTRAINT data_check CHECK (data_from < data_to)
);

ALTER TABLE Stores ADD CONSTRAINT stores_pkey PRIMARY KEY (store_id);
ALTER TABLE Employees ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);
ALTER TABLE Purchases ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchase_id);
ALTER TABLE Orders ADD CONSTRAINT order_pkey PRIMARY KEY (product_id, purchase_id);
ALTER TABLE Customers ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
ALTER TABLE Products ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
ALTER TABLE Classes ADD CONSTRAINT class_pkey PRIMARY KEY (class_id);
ALTER TABLE Pull_classes ADD CONSTRAINT pull_pkey PRIMARY KEY (product_id, class_id);
ALTER TABLE Sizes ADD CONSTRAINT size_pkey PRIMARY KEY (size_id);
ALTER TABLE Prices ADD CONSTRAINT costs_pkey PRIMARY KEY (price_id);

ALTER TABLE Employees ADD FOREIGN KEY (chief_id) REFERENCES Employees (employee_id) ON DELETE CASCADE;
ALTER TABLE Employees ADD FOREIGN KEY (store_id) REFERENCES Stores (store_id) ON DELETE CASCADE;
ALTER TABLE Purchases ADD FOREIGN KEY (employee_id) REFERENCES Employees (employee_id) ON DELETE CASCADE;
ALTER TABLE Purchases ADD FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY (purchase_id) REFERENCES Purchases (purchase_id) ON DELETE CASCADE;
ALTER TABLE Orders ADD FOREIGN KEY (product_id) REFERENCES Products (product_id) ON DELETE CASCADE;
ALTER TABLE Products ADD FOREIGN KEY (size_id) REFERENCES Sizes (size_id) ON DELETE CASCADE;
ALTER TABLE Pull_classes ADD FOREIGN KEY (product_id) REFERENCES Products (product_id) ON DELETE CASCADE;
ALTER TABLE Pull_classes ADD FOREIGN KEY (class_id) REFERENCES Classes (class_id) ON DELETE CASCADE;
ALTER TABLE Prices ADD FOREIGN KEY (product_id) REFERENCES Products (product_id) ON DELETE CASCADE;

INSERT INTO Stores (
	address
	)
VALUES 
	('г. Москва, ул. Кузнецкий мост, 9'),
	('г. Москва, ул. Манежная площадь, 1, стр. 2'),
	('г. Москва, ул. Земляной Вал, 33'),
	('г. Москва, площадь Киевского Вокзала, 2'),
	('г. Москва, проспект Вернадского, 6'),
	('г. Москва, Кутузовский проспект, 57'),
	('г. Санкт-Петербург, Лиговский проспект, 30'),
	('г. Санкт-Петербург, Невский проспект, 21'),
	('г. Санкт-Петербург, полюстровский проспект, 84'),
	('г. Нижний Новгород, ул. Родионова, 187В'),
	('г. Нижний Новгород, ул. Бетанкура, 1');
	
INSERT INTO Employees (
	full_name,
	chief_id,
	store_id,
	position
	)
VALUES 
	('Николай Герасимов', NULL, 1, 'Директор'),
	('Марат Абрамов', NULL, 2, 'Директор'),
	('Андрей Николаев', 1, 1, 'Старший консультант'),
	('Галина Флиппова', 1, 1, 'Старший консультант'),
	('Валерия Фролова', 2, 2, 'Старший консультант'),
	('Светлана Никитина', 2, 2, 'Старший консультант'),
	('Евгений Федоров', 3, 1, 'Продавец-консультант'),
	('Анна Воробьева', 4, 1, 'Продавец-консультант'),
	('Татьяна Петрова',5, 2, 'Продавец-консультант'),
	('Максим Новиков', 6, 2, 'Продавец-консультант'),
	('Ирина Гаврилова', 6, 2, 'Продавец-консультант');
	
INSERT INTO Customers (
	full_name,
	sex,
	date_of_birth,
	email,
	phone
	)
VALUES
	(NULL, NULL, NULL, NULL, NULL),
	('Никита Григорьев', 'Муж', '23.05.1984', 'n_grigorev_041972@hehe.ru', '89103201233'),
	('Роман Романов', 'Муж', '23.08.1995', 'romom@hehe.ru', '89993215423'),
	('Кирилл Коромыслов', 'Муж', '01.01.2000', 'misl@hehe.tu', '89523453321'),
	('Олеся Якутова', 'Жен', '15.03.1992', 'yakut@hehe.ru', '89302425543'),
	('Анастасия Крапивина', 'Жен', '13.02.2000', NULL, '89416753241'),
	('Анна Прожжегина', 'Жен', '19.01.1989', 'prozheg@hehe.ru', '89522342233'),
	('Кристина Камушкина', 'Жен', '19.02.1995', 'kamen@hehe.ru', '83332221112'),
	('Дарья Молодцова', 'Жен', '21.08.2001', 'molodec@hehe.ru', '89101999933'),
	('Фома Аквинский', 'Муж', '01.03.1999', 'Neveryuv@hehe.ru', '89200335423'),
	('Павел Голов', 'Муж', '12.02.1998', NULL, '89423337643'),
	('Петр Яшимов', 'Муж', '28.02.1999', 'Yashimov@hehe.ru', '89993345277'),
	('Евгения Барашкина', 'Жен', '10.10.1993', 'Barashek@hehe.ru', '89321234642');

INSERT INTO Sizes (
	age_from,
	age_to,
	heigh_from,
	heigh_to
	)
VALUES 
	('0-0', '0-3', 56, 62),
	('0-3', '0-6', 62, 68),
	('0-6', '0-9', 58, 74),
	('0-9', '1-0', 74, 80),
	('1-0', '1-6', 80, 86), --5
	('1-6', '2-0', 86, 92),
	('3-0', '4-0', 98, 104),
	('5-0', '6-0', 110, 116),
	('7-0', '8-0', 122, 128),
	('9-0', '10-0', 134, 140),
	('11-0', '12-0', 152, 158); --11
	
INSERT INTO Classes (
	title
	)
VALUES
	('Демисезонная'),
	('Летняя'),
	('Зимняя'),
	('Всесезонная'),
	('Бытовая'),
	('Спортивная'),
	('Форменная'),
	('Верхняя'),
	('Легкая'),
	('Белье'),
	('Головные уборы ');
	
INSERT INTO Products (
	description,
	size_id
	)
VALUES 
	('Рубашка голубая MODIS', 11),
	('Рубашка голубая MODIS', 10),
	('Рубашка голубая MODIS', 9),
	('Блузка белая ORIGINAL MARINES', 11),
	('Блузка белая ORIGINAL MARINES', 10),
	('Блузка белая ORIGINAL MARINES', 9),
	('Пиджак черный CHILD ENJOYING', 11),
	('юбка черная KIDAXI', 11),
	('Брюки черные CHILD ENJOYING', 10),
	('брюки ORIGINAL MARINES', 7),
	('майка ORIGINAL MARINES', 7),
	('Комбинезон MODIS', 5),
	('Комбинезон MODIS', 4),
	('Комбинезон MODIS', 3),
	('Комбинезон ALEX JUNIS', 5),
	('Комбинезон ALEX JUNIS', 4),
	('Комбинезон ALEX JUNIS', 3),
	('Ползунки Milimbi', 4),
	('Ползунки Milimbi', 3),
	('Ползунки Milimbi', 2),
	('Боди Original Marines', 4),
	('Боди Original Marines', 3),
	('Боди Original Marines', 2);

INSERT INTO Pull_classes (
	product_id,
	class_id
	)
VALUES 
	(1, 6),
	(1, 3),
	(2, 6),
	(2, 3),
	(3, 6),
	(3, 3),
	(4, 3),
	(4, 6),
	(5, 3),
	(5, 6),
	(6, 3),
	(6, 6),
	(7, 4),
	(7, 8),
	(8, 3),
	(8, 7),
	(9, 3),
	(9, 7),
	(10, 9),
	(10, 4),
	(11, 9),
	(11, 4);

INSERT INTO Purchases (
	employee_id,
	customer_id,
	order_time
	)
VALUES 
	(7, 1, '13.08.2021 15:55'),
	(7, 2, '15.08.2021 12:40'),
	(8, 3, '16.08.2021 13:34'),
	(8, 4, '17.08.2021 19:09'),
	(9, 5, '18.08.2021 16:32'),
	(10, 6, '19.08.2021 12:00'),
	(11, 7, '20.08.2021 15:49'),
	(11, 8, '21.08.2021 16:32'),
	(3, 9, '23.08.2021 12:32'),
	(4, 10, '25.08.2021 20:00'),
	(5, 11, '30.08.2021 15:45'),
	(11, 1, '18.08.2021 15:43'),
	(8, 2, '20.08.2021 12:12'),
	(7, 3, '3.08.2021 18:34'),
	(9, 4, '12.08.2021 13:09'),
	(8, 5, '27.08.2021 17:32'),
	(7, 6, '29.08.2021 18:00'),
	(7, 7, '30.08.2021 13:49'),
	(7, 8, '6.08.2021 12:34'),
	(6, 9, '4.08.2021 12:32');
	
INSERT INTO Orders (
	product_id,
	purchase_id,
	amount
	)
VALUES
	(1, 1, 1),
	(3, 2, 1),
	(5, 3, 1),
	(10, 4, 1),
	(13, 5, 1),
	(15, 6, 1),
	(23, 7, 1),
	(5, 8, 1),
	(10, 9, 1),
	(11, 10, 1),
	(2, 11, 1),
	(6, 12, 1),
	(16, 13, 1),
	(20, 14, 1),
	(22, 15, 1),
	(5, 16, 1),
	(4, 17, 1),
	(10, 18, 1),
	(11, 19, 1),
	(22, 20, 1),
	(19, 20, 1);
	
INSERT INTO Prices (
	product_id,
	price,
	data_from,
	data_to
	)
VALUES 
	(1, 600, '23.06.2021', NULL),
	(2, 580, '28.07.2021', NULL),
	(3, 260, '14.09.2021', NULL),
	(4, 500, '01.10.2021', NULL),
	(5, 480, '03.04.2021', NULL),
	(6, 460, '03.04.2021', NULL),
	(7, 700, '04.05.2021', NULL),
	(8, 500, '23.06.2021', NULL),
	(9, 800, '22.06.2021', NULL),
	(10, 754.99, '25.06.2021', NULL),
	(11, 400, '29.06.2021', NULL),
	(12, 700, '24.06.2021', NULL),
	(13, 650, '26.06.2021', NULL),
	(14, 600, '27.06.2021', NULL),
	(15, 649.99, '20.06.2021', NULL),
	(16, 599.99, '23.10.2021', NULL),
	(17, 549.99, '23.10.2021', NULL),
	(18, 450, '23.10.2021', NULL),
	(19, 400, '23.10.2021', NULL),
	(20, 360, '23.09.2021', NULL),
	(21, 430, '23.04.2021', NULL),
	(22, 399.99, '23.05.2021', NULL),
	(23, 420.99, '23.01.2021', '20.08.2021'),
	(23, 600, '20.08.2021', NULL);*/
	
-- Иерархия сотрудников в определнном магазине
/*WITH RECURSIVE r AS (
	SELECT em.employee_id, em.chief_id, em.full_name, em.position
	FROM Employees em
	WHERE em.store_id = 1 AND chief_id IS NULL
	UNION 
	SELECT em.employee_id, em.chief_id, em.full_name, em.position
	FROM Employees em
	JOIN r ON em.chief_id = r.employee_id
)
SELECT * FROM r*/

--найти класс наиболее покупаемых товаров
/*SELECT cl.title, COUNT(*)
FROM Classes cl
INNER JOIN Pull_classes pc ON pc.class_id = cl.class_id
INNER JOIN Products pr ON pr.product_id = pc.product_id
INNER JOIN Orders ord ON ord.product_id = pr.product_id
GROUP BY cl.title
ORDER BY count DESC*/

--Найти самых "лучших" покупателей (которые оставили в магазине больше всего денег) за все время
/*SELECT SUM(pr.price) AS total, cst.full_name
FROM Purchases prch, Customers cst, Orders ord, Products prd, Prices pr
WHERE prch.customer_id = cst.customer_id AND
	  prch.purchase_id = ord.purchase_id AND
	  ord.product_id = prd.product_id AND
	  prd.product_id = pr.product_id AND
	  cst.full_name IS NOT NULL AND
	  ((prch.order_time between pr.data_from AND pr.data_to) OR (prch.order_time >= pr.data_from AND pr.data_to IS NULL))  
GROUP BY cst.customer_id, cst.full_name
HAVING SUM(pr.price) > 1000::money
ORDER BY total DESC */  