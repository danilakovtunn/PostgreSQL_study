DROP DATABASE test;
CREATE DATABASE test;

\connect test
DROP TABLE users CASCADE;
DROP TABLE sessions CASCADE;
DROP TABLE interactions CASCADE;

CREATE TABLE users (
    user_id int,
    surname varchar(30),
    name varchar(30),
    birth_day date,
    phone_number char(12),
    email varchar(50),
    city varchar(20),
    address varchar(50),
    date_of_hiring date,
    poition varchar(35)
);

CREATE TABLE sessions (
    session_id int,
    user_id int,
    user_info json,
    time_start timestamp,
    duration interval,
    session_os varchar(30),
    display_resolution varchar(11)
);

CREATE TABLE interactions (
    interaction_id int,
    user_id int,
    user_info json,
    session_id int,
    interaction_time timestamp,
    user_comment text,
    type_of_interaction varchar(30),
    search_keyword varchar(20)[],
    table_used varchar(20)[]
);

COPY users FROM stdin;
1	Mcdonough	Raymond	1989-4-5	+78618103235	IQymPqfAAefG@myscript.com	Chelyabinsk	druzhnaya street, house 9	2017-6-5	Visual Merchandiser
2	Davis	Classie	1977-7-24	+73962972618	jmtSSdtLeMNka@myscript.com	Moscow	strashnaya street, house 9	2019-12-11	Cashier
3	Reza	Mary	1979-4-9	+72103633578	XwOZgjzWkC@myscript.com	Moscow	velikolepnaya street, house 5	2018-5-25	Store director
4	Wagner	Joy	1979-5-11	+77050424608	kvsdsdnjymej@myscript.com	Kazan	Lenina street, house 9	2019-5-2	Cashier
5	Torelli	Michael	1978-10-2	+75211416184	FCsVt@myscript.com	Novosibirsc	Berezovskaya street, house 9	2017-11-26	Customer Service Representative
6	Moyer	Justin	1981-4-14	+72337004433	wGjFJtt@myscript.com	Nizhniy Novgorod	malenkaya street, house 7	2019-9-10	Assistant Store Manager
7	Smith	Sheila	1981-3-2	+71254421807	wDwvZzjqOgyOxsg@myscript.com	Nizhniy Novgorod	Lenina street, house 11	2018-8-3	Store director
8	Lieber	Dora	1993-7-24	+75811063168	TKIRQvXyhJg@myscript.com	Nizhniy Novgorod	Berezovskaya street, house 7	2019-4-9	Sales Associate
9	Chandler	Justin	1976-3-25	+76444595336	OSRVyeadmVynhi@myscript.com	Nizhniy Novgorod	Revoluzii street, house 7	2015-3-23	Sales Associate
10	Jetton	Salvador	1991-11-8	+76580573631	TDcyXEyZ@myscript.com	Moscow	Berezovskaya street, house 7	2019-5-14	Assistant Store Manager
11	Howard	Adrian	1976-12-17	+79446537593	CCYNeEmf@myscript.com	samara	milaya street, house 11	2019-6-19	Customer Service Representative
12	Wilhoite	Norman	1992-12-22	+72426456016	UAFsvYshpzmO@myscript.com	Omsk	Berezovskaya street, house 1	2018-8-18	Customer Service Representative
13	Merrill	Rene	1988-4-23	+71780661545	cWKlGSBeAHwMHct@myscript.com	Chelyabinsk	zirkovaya street, house 3	2016-5-6	Assistant Store Manager
14	Chasin	Curtis	1993-10-21	+78476150022	evdOPXPIZeKo@myscript.com	Kazan	milaya street, house 11	2020-7-13	Buyer
15	Mohamed	Elizabeth	1992-3-21	+79160429810	mlRLBnlIApxbe@myscript.com	Chelyabinsk	klaviatornya street, house 1	2015-9-15	Inventory Control Specialist
16	Embree	Gerald	1989-6-3	+78217462525	LjWusHOtsmMsoo@myscript.com	Kazan	Lenina street, house 3	2019-1-3	Sales Associate
17	Eady	Melody	1981-8-17	+72512821495	rPzYbRYT@myscript.com	Chelyabinsk	krasivaya street, house 5	2016-4-23	Assistant Store Manager
18	Bass	Anna	1995-12-15	+73803364726	WYBMrJIsxbNuxDL@myscript.com	Novosibirsc	druzhnaya street, house 11	2016-11-25	Assistant Store Manager
19	Wilhoite	Allen	1985-5-9	+79163035862	TDuCMh@myscript.com	Kazan	zirkovaya street, house 3	2019-8-11	Store director
20	Davidson	Donna	1987-4-25	+72206922824	EnBaU@myscript.com	Chelyabinsk	velikolepnaya street, house 3	2017-5-2	Store director
21	Cline	Jarvis	1988-1-28	+78402567004	GfYTs@myscript.com	Nizhniy Novgorod	Nikonova street, house 1	2015-1-15	Sales Associate
22	Baldwin	Mary	1994-7-27	+71561366956	PasvDSh@myscript.com	Saint-Petersburg	Krasnih Zor street, house 3	2017-11-10	Customer Service Representative
23	Romain	Joy	1980-6-21	+73545620760	eecwyv@myscript.com	Nizhniy Novgorod	Nikonova street, house 7	2015-4-14	Store Manager
24	Mcdonough	Carol	1990-10-3	+76407968687	OaWWXhWFH@myscript.com	Omsk	krasivaya street, house 5	2017-7-12	Cashier
25	Mask	Jesus	1976-3-21	+71725620110	hxNhWfwe@myscript.com	Ekaterinburg	velikolepnaya street, house 1	2017-7-18	Store Manager
26	Park	Classie	1981-3-7	+77994191313	wyzZjUlioPpiQ@myscript.com	Moscow	Lyadova street, house 7	2019-4-5	Cashier
27	Vargas	Tracey	1975-4-11	+77042690944	UiEfXCbL@myscript.com	Moscow	Lenina street, house 7	2019-1-10	Store director
28	Merrill	Matthew	1988-4-1	+73042826689	oRZJNrz@myscript.com	Saint-Petersburg	milaya street, house 5	2019-12-27	Customer Service Representative
29	Mask	Arnold	1989-7-7	+71875253787	QmCVaIjlKk@myscript.com	Omsk	Berezovskaya street, house 5	2020-4-26	Store Manager
30	Stewart	Amanda	1975-11-4	+75982477399	wIVgrw@myscript.com	Ekaterinburg	klaviatornya street, house 11	2015-6-19	Store director
31	Escudero	Mary	1993-11-27	+71395095501	VlpmkUbvkN@myscript.com	Novosibirsc	strashnaya street, house 11	2017-3-14	Sales Associate
32	Gibbs	Teresa	1984-12-5	+79570761001	OsybFJQYyiQIrFu@myscript.com	samara	Geroev street, house 5	2015-8-4	Inventory Control Specialist
33	Gonzales	Dede	1993-10-26	+75622696104	DZTlUruhPGuhsyh@myscript.com	Ekaterinburg	zirkovaya street, house 3	2017-12-8	Store Manager
34	Bass	Ron	1991-2-17	+74087535247	LNGDlwKJjiUA@myscript.com	Nizhniy Novgorod	Nikonova street, house 11	2019-5-7	Visual Merchandiser
35	Shimizu	Scott	1975-8-21	+72238848541	fUUlOsjnSms@myscript.com	samara	Revoluzii street, house 3	2018-4-20	Sales Associate
36	Colten	Anna	1980-2-23	+77147238910	epoQQPQwyj@myscript.com	samara	Lenina street, house 3	2018-12-21	Buyer
37	Zanchez	Dylan	1981-9-15	+71137251171	tbVXGnL@myscript.com	Ekaterinburg	druzhnaya street, house 9	2020-10-12	Inventory Control Specialist
38	Merrill	Yolanda	1976-11-21	+74235812962	xILqhAPspBnI@myscript.com	Nizhniy Novgorod	Revoluzii street, house 11	2018-2-15	Store Manager
39	Bailey	Camille	1995-1-18	+79957908086	QwzDvW@myscript.com	Chelyabinsk	malenkaya street, house 11	2020-1-8	Buyer
40	Colten	Gerald	1984-1-26	+73220655599	lhBazB@myscript.com	Kazan	malenkaya street, house 3	2015-9-8	Store Manager
41	Verduzco	Donna	1991-9-24	+79727454413	Pbnuegy@myscript.com	Ekaterinburg	zirkovaya street, house 3	2015-9-21	Store director
42	Harrison	Anna	1990-10-24	+71288552786	kWdGWWiKqjLTNrb@myscript.com	Omsk	Moscovskaya street, house 9	2018-2-7	Inventory Control Specialist
43	Wilhoite	Pat	1996-12-9	+71686872123	jiWqFUIS@myscript.com	Moscow	krasivaya street, house 11	2016-8-6	Store director
44	Cabrales	Mildred	1989-7-19	+79158041687	CwhHWVMrcNi@myscript.com	Omsk	druzhnaya street, house 11	2017-10-28	Store director
45	Mitchell	Billy	1993-10-27	+72023116684	mDfwyE@myscript.com	Chelyabinsk	zirkovaya street, house 5	2020-6-24	Store Manager
46	Hughes	Melody	1982-8-22	+72834505595	vSgRzxhhIeK@myscript.com	Moscow	zirkovaya street, house 5	2015-12-7	Buyer
47	Bebout	Rosella	1994-8-12	+74032161740	iimyQlvjgBCaROR@myscript.com	Novosibirsc	milaya street, house 11	2020-2-25	Store director
48	Davis	Norman	1980-3-19	+77487831795	HGdjgOe@myscript.com	Chelyabinsk	klaviatornya street, house 3	2019-5-20	Store Manager
49	Mask	Minnie	1984-12-26	+74504898292	oewah@myscript.com	Kazan	Lyadova street, house 5	2020-4-12	Cashier
50	Lieber	Victoria	1975-3-12	+76387478398	kSkLY@myscript.com	Nizhniy Novgorod	Geroev street, house 1	2018-6-13	Inventory Control Specialist
51	White	Gerald	1975-2-18	+76515707441	bLLUZ@myscript.com	samara	zirkovaya street, house 9	2015-7-7	Visual Merchandiser
52	Bacon	Lynn	1993-8-19	+74148742335	SRLgtuDfEADh@myscript.com	Chelyabinsk	malenkaya street, house 7	2015-12-9	Inventory Control Specialist
53	Blodgett	Jesus	1986-4-20	+74796920676	FcqAOWPxEKQwTKg@myscript.com	samara	Lenina street, house 3	2017-5-3	Customer Service Representative
54	Cabrales	Janeen	1981-6-2	+76180696907	SiGqzBhKKHZ@myscript.com	Chelyabinsk	malenkaya street, house 1	2019-11-16	Store Manager
55	Gonzales	Maryanne	1979-12-28	+72040694842	bcetWSX@myscript.com	Kazan	Revoluzii street, house 1	2015-12-9	Inventory Control Specialist
56	Fleck	Monica	1979-9-13	+73243474741	qKCDt@myscript.com	Chelyabinsk	krasivaya street, house 5	2018-2-22	Customer Service Representative
57	Wyant	Jesus	1983-8-6	+71075814722	bgvzgHpk@myscript.com	Moscow	strashnaya street, house 7	2015-3-11	Customer Service Representative
58	Griffin	Chang	1975-10-13	+76031482266	OFfuncWuTcnAFu@myscript.com	Moscow	velikolepnaya street, house 1	2017-4-23	Cashier
59	Johnson	Jerome	1994-1-2	+72668785672	tyXUjqFfE@myscript.com	Moscow	velikolepnaya street, house 11	2020-12-18	Inventory Control Specialist
60	Rivera	Pat	1988-4-7	+71908531614	ZOmMREDzz@myscript.com	Moscow	Moscovskaya street, house 1	2018-11-2	Customer Service Representative
61	Park	Janice	1985-7-28	+76321634575	zCmwpbBXZtqtH@myscript.com	Ekaterinburg	klaviatornya street, house 1	2019-10-21	Store director
62	Verduzco	Allen	1986-5-4	+78178623538	hBuCvIhoXtUPDnv@myscript.com	Kazan	Nikonova street, house 7	2016-9-7	Sales Associate
63	Rivera	Norman	1993-2-7	+72730549250	CpuPNrAKf@myscript.com	Saint-Petersburg	Nikonova street, house 3	2020-5-22	Inventory Control Specialist
64	Washington	Lynn	1978-6-7	+77368323958	tJrIF@myscript.com	Nizhniy Novgorod	malenkaya street, house 7	2018-5-20	Assistant Store Manager
65	Gabrielson	Lynn	1986-11-22	+79561779503	ZFstwWKDKElo@myscript.com	Novosibirsc	Krasnih Zor street, house 11	2018-5-8	Assistant Store Manager
66	Mcfarlane	Paul	1989-6-2	+79585243842	vPzEQs@myscript.com	Chelyabinsk	Lenina street, house 11	2020-6-15	Store Manager
67	Cabrales	Mary	1977-4-8	+74877084967	fsvJaglUPiX@myscript.com	Saint-Petersburg	malenkaya street, house 7	2018-9-18	Visual Merchandiser
68	Rosati	Janeen	1983-10-12	+75707019699	QPuSQm@myscript.com	Nizhniy Novgorod	Krasnih Zor street, house 1	2019-8-15	Store director
69	Smith	Sherri	1985-9-25	+73115627055	qiljNxmUfOkwZ@myscript.com	Nizhniy Novgorod	Revoluzii street, house 1	2020-7-8	Sales Associate
70	Fischer	Clara	1994-10-23	+78988156278	mpkPcKUqalPSC@myscript.com	Omsk	zirkovaya street, house 3	2019-1-22	Buyer
71	Mitchell	Dylan	1975-5-11	+73254650825	xripOXt@myscript.com	Chelyabinsk	zirkovaya street, house 3	2017-8-21	Customer Service Representative
72	Washington	Lisa	1982-10-23	+71854617673	skehoZBc@myscript.com	Saint-Petersburg	krasivaya street, house 11	2017-12-24	Assistant Store Manager
73	Milner	Jesus	1979-5-19	+74790623439	mTAIVH@myscript.com	Novosibirsc	Berezovskaya street, house 5	2017-2-3	Buyer
74	Riggle	Joy	1989-10-9	+74727848564	AMXEqMPdTEocTaj@myscript.com	Kazan	Krasnih Zor street, house 9	2015-4-14	Store director
75	Lin	Chang	1977-4-4	+73725592115	rRdTgb@myscript.com	Chelyabinsk	velikolepnaya street, house 9	2020-6-15	Assistant Store Manager
76	Mitchell	Yolanda	1982-11-14	+73271377608	vvwXwtMKCf@myscript.com	Saint-Petersburg	Moscovskaya street, house 11	2020-6-17	Store director
77	Mcnaughton	Lynn	1983-8-20	+74583799463	thjQceYIvakInQ@myscript.com	Novosibirsc	druzhnaya street, house 7	2019-11-1	Store Manager
78	Embree	Anthony	1988-11-19	+77362245049	nfxWhyyCbRFEv@myscript.com	Saint-Petersburg	klaviatornya street, house 7	2020-8-28	Inventory Control Specialist
79	Wyant	Teresa	1980-11-19	+77663981913	UUtgPXzsQQ@myscript.com	Nizhniy Novgorod	malenkaya street, house 11	2017-10-26	Assistant Store Manager
80	Harris	Michael	1975-4-26	+71013477886	yfApGMANTjar@myscript.com	Nizhniy Novgorod	Nikonova street, house 5	2018-9-18	Inventory Control Specialist
81	Baldwin	Yolanda	1974-2-27	+77116534776	JEfZkcmuZHMN@myscript.com	Saint-Petersburg	Revoluzii street, house 1	2020-12-12	Buyer
82	Mask	Curtis	1995-8-12	+72930447022	ctzYjeQ@myscript.com	Chelyabinsk	zirkovaya street, house 11	2018-12-14	Inventory Control Specialist
83	Tarpley	Joseph	1989-6-27	+78817591780	BRWCAdWFc@myscript.com	Ekaterinburg	Lyadova street, house 9	2020-8-23	Buyer
84	Stewart	Ron	1975-8-2	+73881727259	YVhHOJ@myscript.com	samara	strashnaya street, house 3	2018-5-3	Customer Service Representative
85	Smith	Carol	1991-3-27	+73307713739	iYBAdyWbBhc@myscript.com	samara	Berezovskaya street, house 3	2018-12-8	Visual Merchandiser
86	Blodgett	Jennifer	1976-3-17	+75728701770	ItBwTdPcx@myscript.com	Chelyabinsk	druzhnaya street, house 9	2015-8-8	Customer Service Representative
87	Torelli	Earl	1977-2-25	+77386824795	DaDcotIOSR@myscript.com	Chelyabinsk	strashnaya street, house 5	2015-7-20	Store Manager
88	Livings	Dede	1982-12-28	+77746240637	QbWCU@myscript.com	Ekaterinburg	druzhnaya street, house 1	2016-8-8	Buyer
89	Lieber	Elizabeth	1975-8-3	+77783083784	jTfqFf@myscript.com	Saint-Petersburg	klaviatornya street, house 5	2016-6-17	Sales Associate
90	Shimizu	Janice	1987-7-17	+71185330740	YDsKu@myscript.com	Kazan	Berezovskaya street, house 1	2017-6-14	Sales Associate
91	Merrill	Allen	1981-6-5	+78540578482	ekLDQXd@myscript.com	Novosibirsc	milaya street, house 11	2019-6-18	Visual Merchandiser
92	Harrison	Janeen	1995-8-4	+79571759787	KazdsWLaV@myscript.com	Chelyabinsk	krasivaya street, house 5	2015-2-11	Store Manager
93	Mitchell	Lynn	1974-4-15	+79912195804	fjsuuiZouFcGU@myscript.com	Moscow	druzheskaya street, house 7	2020-9-7	Cashier
94	Black	Mildred	1986-7-8	+71064838355	IrksbZoVwSEdwTt@myscript.com	Saint-Petersburg	Moscovskaya street, house 7	2016-12-23	Store Manager
95	Wyant	Carol	1976-10-20	+79218271032	rvkANdOxDfBz@myscript.com	Kazan	Berezovskaya street, house 9	2019-5-2	Store director
96	Fleck	Joseph	1984-2-4	+75827482603	wmTJZvKmykXwHPl@myscript.com	Ekaterinburg	strashnaya street, house 7	2020-1-2	Visual Merchandiser
97	Fry	Mary	1981-4-8	+76326235370	WYeuqsCcd@myscript.com	Novosibirsc	Lenina street, house 5	2017-5-14	Store director
98	Roberson	Trina	1975-5-9	+79991578810	fxmDkioHUEWGST@myscript.com	samara	Lenina street, house 7	2018-2-8	Sales Associate
99	Davis	Lynn	1990-6-24	+79077153618	EgnLWzbLloRp@myscript.com	Nizhniy Novgorod	Berezovskaya street, house 1	2016-7-28	Visual Merchandiser
100	Shimizu	Corey	1986-11-10	+71044698300	puave@myscript.com	Ekaterinburg	Geroev street, house 11	2015-3-26	Customer Service Representative
101	Aleman	Janeen	1989-6-22	+73902085851	jJFhtaxWhfVmsed@myscript.com	Kazan	Revoluzii street, house 1	2017-9-8	Cashier
102	Riggle	Salvador	1976-1-20	+72043987589	NybwRmgOHbCHL@myscript.com	Omsk	Berezovskaya street, house 7	2015-5-22	Store director
103	Bailey	Michael	1979-10-3	+76232735936	wMwfwblp@myscript.com	Kazan	druzhnaya street, house 3	2017-6-10	Sales Associate
104	Coleman	Clinton	1983-9-7	+79747858076	AQNnCWyNBNUs@myscript.com	Chelyabinsk	velikolepnaya street, house 9	2015-12-26	Sales Associate
105	Moyer	Jarvis	1985-8-18	+75941949162	YCWqIDZpQXvNbM@myscript.com	Novosibirsc	krasivaya street, house 3	2015-11-16	Visual Merchandiser
106	Colten	Janice	1995-1-12	+74521017628	APdtYlMzkp@myscript.com	Omsk	Berezovskaya street, house 1	2018-6-7	Buyer
107	Harris	David	1984-8-6	+73908715155	MvitAxvcxBd@myscript.com	Chelyabinsk	Geroev street, house 11	2018-8-17	Sales Associate
108	Chasin	Bethany	1991-8-6	+75075039849	zPBVK@myscript.com	Kazan	velikolepnaya street, house 3	2017-7-15	Sales Associate
109	Bishop	Lynn	1979-11-21	+75967111378	xSMvDN@myscript.com	Omsk	milaya street, house 11	2019-1-15	Assistant Store Manager
110	Mohamed	Carol	1995-12-20	+76428686970	rvFjfFik@myscript.com	samara	Geroev street, house 5	2015-6-19	Store director
111	Gibbs	Adrian	1995-6-17	+76204747829	BQrPyEW@myscript.com	Novosibirsc	Nikonova street, house 5	2017-4-6	Cashier
112	Washington	James	1979-11-11	+74403696309	aQCKBlB@myscript.com	Saint-Petersburg	Moscovskaya street, house 9	2018-8-7	Store Manager
113	Vargas	Victoria	1978-5-12	+79646746418	bmTXHGssowFrS@myscript.com	Moscow	Nikonova street, house 5	2018-6-4	Store Manager
114	Wagner	Patrick	1993-12-6	+78453637700	wLtqR@myscript.com	Moscow	velikolepnaya street, house 5	2018-1-26	Store Manager
115	Bailey	Jeremy	1977-6-23	+72194887875	JKqACLaDoRae@myscript.com	Kazan	Nikonova street, house 5	2020-7-5	Buyer
116	Baldwin	Maria	1993-10-20	+74071763983	CWiSRVzrw@myscript.com	Nizhniy Novgorod	Lyadova street, house 9	2019-12-8	Store Manager
117	Chandler	Joy	1978-5-28	+76843499503	Prdtp@myscript.com	Moscow	Krasnih Zor street, house 7	2015-4-3	Visual Merchandiser
118	Baldwin	Mary	1990-1-21	+75988858061	sCbXalIotSg@myscript.com	Omsk	milaya street, house 3	2018-10-5	Inventory Control Specialist
119	Torelli	John	1994-9-28	+76873983659	FgKgCoY@myscript.com	Chelyabinsk	Geroev street, house 5	2019-1-11	Inventory Control Specialist
120	Landry	Charles	1987-9-17	+78693883479	TVhzIEQvlOEuNHu@myscript.com	Ekaterinburg	malenkaya street, house 11	2018-10-24	Cashier
121	Coleman	Jarvis	1985-9-10	+73563940353	nAOnrjKlTMAqxK@myscript.com	Novosibirsc	malenkaya street, house 7	2018-7-9	Cashier
122	Fischer	Yolanda	1987-8-12	+75811979693	SuhdGPSwhCT@myscript.com	Omsk	druzhnaya street, house 1	2018-2-11	Store Manager
123	Lin	Lynn	1974-2-23	+71506165097	GfJVlLFkm@myscript.com	Ekaterinburg	Moscovskaya street, house 7	2016-5-3	Inventory Control Specialist
124	Mohamed	Matthew	1982-8-5	+73358253367	ZjmSxOMtKSgVv@myscript.com	Saint-Petersburg	druzhnaya street, house 5	2015-11-21	Assistant Store Manager
125	Bebout	Matthew	1996-1-22	+73378831986	ascMwaUSaxF@myscript.com	Nizhniy Novgorod	Nikonova street, house 3	2017-5-13	Buyer
126	Mitchell	Joseph	1995-10-7	+79033885024	hVrLwvZbRbOWiDO@myscript.com	Saint-Petersburg	druzhnaya street, house 9	2015-8-19	Visual Merchandiser
127	Bishop	Irene	1983-11-18	+72853034047	uayAEZ@myscript.com	Saint-Petersburg	Berezovskaya street, house 3	2016-12-22	Customer Service Representative
128	Reza	Bethany	1994-12-5	+76265999623	sETKeDbFRtvQDUg@myscript.com	Moscow	Lenina street, house 3	2017-12-26	Store Manager
129	Livings	Cheryl	1977-7-23	+75680494030	LTwavxjxexgBA@myscript.com	Moscow	krasivaya street, house 9	2016-4-22	Buyer
130	Eady	Clara	1989-4-17	+72610256946	kNIfsJDFbraRMN@myscript.com	Omsk	zirkovaya street, house 9	2017-11-1	Visual Merchandiser
131	Bishop	Walter	1978-11-18	+78324518620	yjtJgDnjsxyI@myscript.com	Kazan	Krasnih Zor street, house 3	2017-2-14	Visual Merchandiser
132	To	Ruth	1989-5-14	+75918392351	nvaSUelCDqGO@myscript.com	Omsk	klaviatornya street, house 9	2019-6-23	Assistant Store Manager
133	Park	Joann	1979-2-18	+75771791765	qFloQ@myscript.com	Nizhniy Novgorod	Nikonova street, house 5	2018-7-3	Cashier
134	Byrd	Mary	1985-5-27	+74117375129	EBAaGbfh@myscript.com	Ekaterinburg	milaya street, house 7	2016-9-9	Cashier
135	Colten	Mary	1988-3-18	+78267203559	dlkBtDlqGFe@myscript.com	Kazan	druzheskaya street, house 7	2016-5-13	Customer Service Representative
136	Bishop	Daniel	1995-10-13	+75894672120	JUHuUGlLfqAh@myscript.com	Saint-Petersburg	milaya street, house 1	2017-1-5	Visual Merchandiser
137	Ellerbe	Monica	1994-8-2	+79781951156	NfAre@myscript.com	Saint-Petersburg	Geroev street, house 3	2020-9-9	Assistant Store Manager
138	Lieber	James	1975-10-4	+75561007545	JCuZGkul@myscript.com	Kazan	velikolepnaya street, house 9	2019-7-26	Visual Merchandiser
139	Berenguer	Donna	1987-4-5	+77497876309	XwDqyFX@myscript.com	Novosibirsc	Berezovskaya street, house 1	2018-8-5	Customer Service Representative
140	Black	Barbara	1996-11-6	+79822411899	PvVitPXOBca@myscript.com	Chelyabinsk	malenkaya street, house 7	2019-8-2	Store Manager
141	Gibbs	Mary	1975-11-22	+74658090019	afeBt@myscript.com	Ekaterinburg	Lenina street, house 1	2016-7-1	Assistant Store Manager
142	Hoggard	Dede	1974-3-15	+78176983954	GbbVLLpoCP@myscript.com	Ekaterinburg	Lenina street, house 5	2019-4-1	Buyer
143	Merrill	Ruth	1988-11-19	+72263216431	EEAfSZryzMLuN@myscript.com	Novosibirsc	Revoluzii street, house 5	2019-10-6	Customer Service Representative
144	Wyant	Jerome	1984-7-26	+73298655986	fCYcxrf@myscript.com	Omsk	velikolepnaya street, house 5	2015-5-4	Cashier
145	Miller	Salvador	1983-3-28	+74428548618	PeeDpif@myscript.com	Chelyabinsk	malenkaya street, house 3	2015-2-9	Buyer
146	Wilhoite	Melissa	1988-8-8	+77425490573	mEupCQ@myscript.com	Saint-Petersburg	klaviatornya street, house 11	2016-3-2	Store director
147	Adams	Patrick	1977-11-13	+71433243258	pIVRMsbgnWYlN@myscript.com	samara	strashnaya street, house 11	2015-1-2	Cashier
148	Fry	Bethany	1986-10-7	+79041722687	CXMMgWedFbSi@myscript.com	Chelyabinsk	Berezovskaya street, house 11	2015-3-18	Sales Associate
149	Pickrell	Donna	1984-4-13	+77463793468	eWOzXkCNO@myscript.com	Nizhniy Novgorod	strashnaya street, house 7	2018-11-16	Sales Associate
150	Guidry	Yolanda	1979-8-22	+78737190668	sQnaBhjuKLyXyRX@myscript.com	Nizhniy Novgorod	strashnaya street, house 7	2017-9-27	Store Manager
151	Cline	Steven	1974-3-7	+78957404964	JijaufXp@myscript.com	Moscow	krasivaya street, house 1	2015-12-19	Assistant Store Manager
152	Harrison	Andrew	1992-11-17	+73168829351	IKPgLSU@myscript.com	samara	Nikonova street, house 1	2015-5-14	Sales Associate
153	Dearborn	Irene	1994-6-10	+75958727846	qDcFwf@myscript.com	Kazan	Lyadova street, house 11	2015-5-18	Inventory Control Specialist
154	Johnson	Justin	1983-6-2	+78627369353	IiuAFhEOLsVf@myscript.com	Ekaterinburg	Berezovskaya street, house 3	2018-1-4	Store director
155	Cabrales	Bethany	1982-6-18	+71614267636	JEAvNlxXpTDPKng@myscript.com	Nizhniy Novgorod	druzhnaya street, house 1	2016-8-23	Sales Associate
156	Chasin	Mary	1974-12-11	+76000706489	XBayRbQXKMTxT@myscript.com	Novosibirsc	Berezovskaya street, house 7	2020-4-18	Buyer
157	Marinese	Jeremy	1986-1-6	+74644639597	hTzCLHwsjob@myscript.com	Novosibirsc	druzhnaya street, house 7	2015-11-1	Visual Merchandiser
158	Davis	Curtis	1978-12-6	+77793980675	hdNDAvNQCWKXL@myscript.com	samara	Krasnih Zor street, house 9	2020-9-25	Inventory Control Specialist
159	Davis	Monica	1984-5-12	+71771254963	nvSnkHazp@myscript.com	Chelyabinsk	Lyadova street, house 1	2015-8-9	Inventory Control Specialist
160	Rosati	Victoria	1975-3-4	+75214203310	xZPwfCm@myscript.com	Nizhniy Novgorod	Nikonova street, house 3	2020-8-6	Customer Service Representative
161	Gibbs	Raymond	1982-6-13	+75425344961	LWxRRIWLarTWNd@myscript.com	Nizhniy Novgorod	strashnaya street, house 9	2019-8-14	Store Manager
162	Lin	Janeen	1985-11-7	+72685760931	cSxPJaFzKum@myscript.com	Chelyabinsk	velikolepnaya street, house 7	2019-6-23	Store Manager
163	Lawson	Paul	1975-9-5	+73232242557	kzrwUeyFAnNs@myscript.com	samara	malenkaya street, house 3	2017-12-16	Store director
164	Cabrales	Amanda	1988-1-27	+72582350705	KjFgvUjsErk@myscript.com	Kazan	Krasnih Zor street, house 11	2017-4-16	Buyer
165	Mask	Jarvis	1979-1-5	+79223230285	cjzXRgHIJp@myscript.com	Novosibirsc	Lyadova street, house 11	2019-11-13	Cashier
166	Milner	Charles	1988-8-4	+72633443801	GDlcEpJPrNDOYS@myscript.com	samara	Nikonova street, house 5	2015-7-3	Inventory Control Specialist
167	Johnson	Justin	1984-4-10	+74302467959	PAukMeS@myscript.com	Saint-Petersburg	malenkaya street, house 1	2018-4-1	Customer Service Representative
168	Morgan	Mary	1992-2-12	+73682415078	qXLDMZYts@myscript.com	Omsk	zirkovaya street, house 5	2018-5-27	Store director
169	Escudero	Trina	1994-12-2	+72924217158	aOvjzfM@myscript.com	Omsk	Nikonova street, house 5	2016-7-9	Store Manager
170	Lin	Michael	1988-2-24	+75531337861	aMcRSFErmsLfF@myscript.com	Moscow	Geroev street, house 7	2015-2-12	Cashier
171	Blodgett	Sherri	1992-6-14	+74630502952	OcPWvfLeIQ@myscript.com	Moscow	Lyadova street, house 5	2018-12-24	Visual Merchandiser
172	Decaire	Camille	1985-11-26	+77260603621	pPxAq@myscript.com	Saint-Petersburg	Revoluzii street, house 5	2015-12-23	Sales Associate
173	Hughes	Donna	1976-12-3	+76518810761	WmQWeQppgGMVfP@myscript.com	Ekaterinburg	zirkovaya street, house 9	2016-11-23	Buyer
174	Park	Bethany	1974-7-14	+73360998359	KIslwjlHEqxVuWa@myscript.com	Ekaterinburg	zirkovaya street, house 1	2020-4-23	Store director
175	Harris	Mary	1985-3-22	+74854557321	NcYroBPbUunwaap@myscript.com	Saint-Petersburg	zirkovaya street, house 9	2015-12-2	Visual Merchandiser
176	Zanchez	Joseph	1974-7-7	+73478613159	ugrUYsdbFByInK@myscript.com	Nizhniy Novgorod	druzheskaya street, house 3	2016-12-2	Visual Merchandiser
177	Moyer	Monica	1995-3-1	+79170858944	Mccbx@myscript.com	Ekaterinburg	Nikonova street, house 11	2017-10-1	Store director
178	Landry	Minnie	1974-6-10	+76388615509	KRdXXeiFBQ@myscript.com	Chelyabinsk	malenkaya street, house 5	2018-11-17	Visual Merchandiser
179	Johnson	Jesus	1976-10-6	+79994304034	ZxjBIJPnqBrJotU@myscript.com	Omsk	Lyadova street, house 5	2020-10-18	Cashier
180	Coleman	Janice	1985-5-21	+75878155109	cyDxWajdYdaN@myscript.com	Moscow	zirkovaya street, house 7	2019-9-6	Store director
181	Guidry	Charles	1988-9-10	+74185117165	PTQPoFZ@myscript.com	Chelyabinsk	zirkovaya street, house 3	2018-11-16	Customer Service Representative
182	Hughes	Anna	1981-8-11	+72894386800	ymqPFOJPLKoEI@myscript.com	Novosibirsc	druzheskaya street, house 7	2019-11-21	Customer Service Representative
183	Mcnaughton	Minnie	1985-3-12	+76812378496	fPKGLBLd@myscript.com	samara	Geroev street, house 3	2019-1-9	Customer Service Representative
184	Davis	Joseph	1994-3-10	+76126595560	rmDKNpl@myscript.com	Novosibirsc	krasivaya street, house 5	2020-7-15	Inventory Control Specialist
185	Bishop	Molly	1980-9-3	+78322687671	OjTMckgOXBdr@myscript.com	Saint-Petersburg	Nikonova street, house 1	2020-12-18	Store director
186	Bebout	Steven	1991-11-28	+79001391606	gWVsMo@myscript.com	Novosibirsc	druzhnaya street, house 1	2018-7-15	Store Manager
187	Wagner	Paul	1982-11-20	+71863177363	FxCljDuzvj@myscript.com	Kazan	druzhnaya street, house 3	2017-3-14	Inventory Control Specialist
188	Davis	Yolanda	1992-2-6	+78136418305	pGQcljEAKoGRsK@myscript.com	Chelyabinsk	milaya street, house 7	2017-5-1	Inventory Control Specialist
189	Cline	Mary	1993-4-9	+73614983321	GvNkvBOjbOw@myscript.com	Chelyabinsk	malenkaya street, house 9	2019-2-11	Sales Associate
190	Bice	Hector	1986-12-6	+76763526541	hWfdypAtW@myscript.com	samara	velikolepnaya street, house 5	2017-11-27	Inventory Control Specialist
191	Rock	Jack	1988-6-11	+73270346828	NkKUMKJQF@myscript.com	Nizhniy Novgorod	krasivaya street, house 3	2015-1-10	Cashier
192	Rivera	Jesus	1980-11-22	+73414170746	cOBVwteiJQdphB@myscript.com	Kazan	druzheskaya street, house 7	2017-11-10	Assistant Store Manager
193	Gibbs	Jesus	1979-2-16	+72904624911	MCwrJWrIoz@myscript.com	Moscow	Krasnih Zor street, house 5	2019-9-28	Inventory Control Specialist
194	Romney	Earl	1979-9-18	+75763984856	QbsMySkgo@myscript.com	Kazan	druzhnaya street, house 11	2016-11-18	Customer Service Representative
195	White	Michael	1996-5-21	+72665769874	uOvihEQuimjAm@myscript.com	Kazan	Moscovskaya street, house 9	2017-11-14	Store Manager
196	Stewart	Sheila	1994-12-3	+71380504869	KrpdAQjx@myscript.com	Ekaterinburg	Krasnih Zor street, house 3	2019-5-22	Store Manager
197	Rosati	Janice	1976-11-12	+77326036736	lstmuLFqgYQZOz@myscript.com	Ekaterinburg	Nikonova street, house 9	2015-2-11	Store Manager
198	Rosati	Tracey	1985-11-25	+71975179802	aWFPxr@myscript.com	Novosibirsc	milaya street, house 1	2020-9-27	Store Manager
199	Escudero	Charles	1983-7-22	+71014182584	ZmuMBv@myscript.com	Ekaterinburg	Moscovskaya street, house 11	2017-8-4	Store Manager
\.

COPY sessions FROM stdin;
1	14	{"full_name": "Mcfarlane Anna", "position": "Visual Merchandiser", "address": "Chelyabinsk, Lenina street, house 1"}	'2015-10-11 12:37:28'	'2 14:26:46'	windows 8	1280*720
2	98	{"full_name": "Moyer Dora", "position": "Customer Service Representative", "address": "Saint-Petersburg, Lyadova street, house 5"}	'2015-11-12 16:28:28'	'3 21:30:42'	ubuntu 20.04	2560*1440
3	9	{"full_name": "Embree Janeen", "position": "Cashier", "address": "Chelyabinsk, velikolepnaya street, house 9"}	'2020-2-18 18:30:34'	'3 3:54:37'	windows XP	1280*800
4	94	{"full_name": "Bebout Hector", "position": "Cashier", "address": "Moscow, Geroev street, house 9"}	'2019-6-26 16:32:19'	'3 5:7:47'	windows XP	1920*1080
5	37	{"full_name": "Bacon John", "position": "Assistant Store Manager", "address": "Ekaterinburg, Moscovskaya street, house 5"}	'2018-7-15 15:23:35'	'2 5:25:26'	windows 9	1680*1050
6	128	{"full_name": "Livings Janice", "position": "Cashier", "address": "samara, klaviatornya street, house 11"}	'2015-9-2 12:33:45'	'0 6:8:3'	windows XP	1920*1080
7	2	{"full_name": "Washington Jarvis", "position": "Store Manager", "address": "Chelyabinsk, Lyadova street, house 11"}	'2019-7-26 16:20:16'	'0 10:19:39'	ubuntu 20.04	1920*1200
8	103	{"full_name": "Landry Walter", "position": "Visual Merchandiser", "address": "Chelyabinsk, klaviatornya street, house 1"}	'2018-8-1 18:35:10'	'0 2:50:38'	windows 7	1024*576
9	52	{"full_name": "Landry Jesus", "position": "Store director", "address": "Nizhniy Novgorod, Berezovskaya street, house 5"}	'2015-2-3 13:12:19'	'2 13:22:8'	windows 7	1600*900
10	97	{"full_name": "Bacon Sherri", "position": "Buyer", "address": "Ekaterinburg, Revoluzii street, house 9"}	'2017-9-21 14:18:56'	'0 6:55:40'	windows 9	2560*1440
11	142	{"full_name": "Adams Teresa", "position": "Cashier", "address": "Chelyabinsk, Krasnih Zor street, house 5"}	'2016-11-17 15:16:32'	'2 7:30:51'	windows 8	1600*900
12	40	{"full_name": "Decaire Scott", "position": "Store Manager", "address": "Ekaterinburg, malenkaya street, house 3"}	'2020-5-5 11:16:11'	'3 15:51:46'	windows 10	1440*900
13	149	{"full_name": "Livings Maria", "position": "Store Manager", "address": "Nizhniy Novgorod, klaviatornya street, house 9"}	'2015-12-1 16:48:53'	'1 13:42:22'	windows 7	1152*648
14	159	{"full_name": "Adams Elizabeth", "position": "Buyer", "address": "Ekaterinburg, strashnaya street, house 5"}	'2016-10-2 17:16:40'	'0 4:30:46'	windows 7	1680*1050
15	52	{"full_name": "Davidson Chang", "position": "Assistant Store Manager", "address": "Saint-Petersburg, Revoluzii street, house 9"}	'2020-11-23 12:26:48'	'3 21:13:26'	windows 7	1152*648
16	37	{"full_name": "Zanchez Arnold", "position": "Inventory Control Specialist", "address": "Chelyabinsk, klaviatornya street, house 3"}	'2018-3-18 17:12:45'	'0 15:36:0'	ubuntu 20.04	1920*1080
17	29	{"full_name": "Lieber Walter", "position": "Inventory Control Specialist", "address": "samara, Berezovskaya street, house 1"}	'2015-9-26 13:36:43'	'3 21:12:34'	windows 8	1440*900
18	129	{"full_name": "Lin Norman", "position": "Visual Merchandiser", "address": "Omsk, Krasnih Zor street, house 9"}	'2019-11-20 15:27:23'	'0 20:30:23'	ubuntu 20.04	2560*1440
19	80	{"full_name": "Reza Donna", "position": "Customer Service Representative", "address": "Chelyabinsk, Revoluzii street, house 11"}	'2016-12-25 12:11:45'	'1 14:0:18'	ubuntu 20.04	1440*900
20	169	{"full_name": "Aleman Daniel", "position": "Buyer", "address": "Omsk, Moscovskaya street, house 1"}	'2020-6-1 16:50:28'	'2 2:45:11'	ubuntu 20.04	1280*720
21	79	{"full_name": "Oritz Carol", "position": "Assistant Store Manager", "address": "Moscow, Revoluzii street, house 9"}	'2016-7-2 11:12:37'	'3 0:3:22'	windows XP	1440*900
22	49	{"full_name": "Bacon Charles", "position": "Store director", "address": "samara, Revoluzii street, house 9"}	'2016-3-17 17:24:33'	'0 10:50:2'	windows 8	1600*900
23	171	{"full_name": "Oritz Raymond", "position": "Sales Associate", "address": "Kazan, Krasnih Zor street, house 1"}	'2019-6-21 16:12:39'	'0 18:54:50'	windows XP	1920*1080
24	115	{"full_name": "Aleman Andrew", "position": "Store Manager", "address": "Saint-Petersburg, milaya street, house 9"}	'2017-4-25 18:17:28'	'0 20:46:2'	ubuntu 20.04	1920*1200
25	3	{"full_name": "Livings Molly", "position": "Buyer", "address": "Nizhniy Novgorod, druzheskaya street, house 5"}	'2018-9-15 12:20:57'	'3 9:44:44'	windows 9	1280*800
26	119	{"full_name": "Harris Michael", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, malenkaya street, house 9"}	'2017-7-26 16:30:19'	'2 5:43:0'	ubuntu 20.04	1366*768
27	144	{"full_name": "Mcfarlane Gerald", "position": "Cashier", "address": "Chelyabinsk, zirkovaya street, house 1"}	'2019-6-4 17:52:43'	'3 10:22:22'	windows 10	1680*1050
28	11	{"full_name": "Landry Kathleen", "position": "Visual Merchandiser", "address": "Novosibirsc, velikolepnaya street, house 3"}	'2015-5-22 18:12:24'	'3 17:22:54'	windows 7	1680*1050
29	159	{"full_name": "Merrill Jesus", "position": "Customer Service Representative", "address": "Ekaterinburg, Revoluzii street, house 5"}	'2017-1-2 16:27:11'	'2 17:43:4'	windows 7	1024*576
30	149	{"full_name": "Romney Marlon", "position": "Store director", "address": "Omsk, klaviatornya street, house 5"}	'2017-4-10 12:32:36'	'3 9:6:56'	windows XP	1152*648
31	198	{"full_name": "Park Robert", "position": "Sales Associate", "address": "Kazan, Moscovskaya street, house 11"}	'2020-1-5 16:37:20'	'2 15:3:2'	windows 8	1280*720
32	184	{"full_name": "Fischer Salvador", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, druzhnaya street, house 11"}	'2019-10-5 18:11:39'	'0 17:5:21'	windows 7	1440*900
33	172	{"full_name": "Gabrielson Corey", "position": "Store Manager", "address": "Omsk, Krasnih Zor street, house 1"}	'2015-12-20 18:53:12'	'1 17:7:38'	windows 9	1440*900
34	177	{"full_name": "Milner Gerald", "position": "Visual Merchandiser", "address": "Moscow, Nikonova street, house 1"}	'2015-12-6 11:34:39'	'1 6:41:5'	windows 8	1024*576
35	69	{"full_name": "Lin Andrew", "position": "Assistant Store Manager", "address": "Moscow, Lenina street, house 11"}	'2018-5-26 16:34:58'	'3 12:15:18'	windows 7	1024*576
36	151	{"full_name": "Harrison Mildred", "position": "Customer Service Representative", "address": "Chelyabinsk, milaya street, house 5"}	'2015-1-24 11:12:52'	'2 16:36:10'	windows 7	1024*576
37	143	{"full_name": "Aleman Dora", "position": "Sales Associate", "address": "Kazan, druzhnaya street, house 3"}	'2016-4-21 14:36:58'	'0 9:49:40'	windows 8	1152*648
38	199	{"full_name": "Washington Melissa", "position": "Store director", "address": "Saint-Petersburg, druzheskaya street, house 9"}	'2019-5-17 15:49:40'	'1 0:6:45'	windows 8	2560*1600
39	46	{"full_name": "Wagner Ron", "position": "Customer Service Representative", "address": "Kazan, klaviatornya street, house 9"}	'2017-7-9 14:21:28'	'0 8:18:2'	windows 7	1920*1200
40	23	{"full_name": "Blodgett Amanda", "position": "Assistant Store Manager", "address": "Ekaterinburg, velikolepnaya street, house 1"}	'2015-2-9 16:51:20'	'0 2:1:1'	windows 9	1920*1080
41	172	{"full_name": "Landry Teresa", "position": "Customer Service Representative", "address": "Chelyabinsk, Revoluzii street, house 7"}	'2019-3-1 15:15:25'	'0 2:30:56'	windows 10	1920*1200
42	144	{"full_name": "Bass Elizabeth", "position": "Assistant Store Manager", "address": "samara, malenkaya street, house 3"}	'2020-10-15 18:19:18'	'0 17:44:51'	windows 10	1366*768
43	196	{"full_name": "Miller Raymond", "position": "Cashier", "address": "Novosibirsc, Krasnih Zor street, house 11"}	'2018-4-20 11:41:30'	'0 12:19:49'	windows 10	1920*1080
44	126	{"full_name": "Mohamed Evelyn", "position": "Cashier", "address": "Saint-Petersburg, druzheskaya street, house 1"}	'2016-10-17 12:26:30'	'2 14:4:6'	ubuntu 20.04	1680*1050
45	118	{"full_name": "Fischer Trina", "position": "Inventory Control Specialist", "address": "Novosibirsc, Revoluzii street, house 11"}	'2020-1-27 14:47:18'	'2 1:55:52'	ubuntu 20.04	1280*800
46	27	{"full_name": "Bice Daniel", "position": "Store Manager", "address": "Saint-Petersburg, druzheskaya street, house 3"}	'2015-8-10 17:11:16'	'1 3:33:11'	windows 9	1280*800
47	165	{"full_name": "Decaire Classie", "position": "Visual Merchandiser", "address": "Novosibirsc, malenkaya street, house 5"}	'2020-11-2 14:38:59'	'3 13:12:2'	windows 9	1366*768
48	76	{"full_name": "Jetton Marlon", "position": "Sales Associate", "address": "Nizhniy Novgorod, Geroev street, house 11"}	'2020-3-24 14:24:39'	'0 9:25:41'	windows XP	1280*800
49	45	{"full_name": "Hughes Melissa", "position": "Store director", "address": "Novosibirsc, klaviatornya street, house 3"}	'2018-11-14 11:31:53'	'1 16:48:41'	ubuntu 20.04	2560*1600
50	127	{"full_name": "Mcnaughton Marlon", "position": "Store director", "address": "Moscow, milaya street, house 7"}	'2017-12-28 13:50:57'	'0 3:6:54'	windows XP	1600*900
51	117	{"full_name": "Gabrielson Steven", "position": "Buyer", "address": "Ekaterinburg, Revoluzii street, house 3"}	'2015-6-13 12:16:59'	'2 15:29:10'	ubuntu 20.04	1600*900
52	21	{"full_name": "Chasin Chang", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, druzheskaya street, house 5"}	'2019-10-20 13:27:33'	'3 8:26:47'	windows 7	2560*1440
53	198	{"full_name": "Rock Jennifer", "position": "Visual Merchandiser", "address": "Novosibirsc, Krasnih Zor street, house 5"}	'2019-12-6 13:19:50'	'2 16:46:55'	windows 10	1680*1050
54	200	{"full_name": "Adams Trina", "position": "Assistant Store Manager", "address": "Saint-Petersburg, Berezovskaya street, house 3"}	'2018-3-5 13:31:56'	'3 5:4:42'	windows 8	1680*1050
55	4	{"full_name": "Cline Minnie", "position": "Cashier", "address": "Nizhniy Novgorod, Lyadova street, house 1"}	'2019-9-28 12:51:19'	'0 17:51:32'	windows 7	1920*1080
56	184	{"full_name": "Gibbs Kenneth", "position": "Visual Merchandiser", "address": "Moscow, klaviatornya street, house 3"}	'2015-7-14 18:26:24'	'2 3:1:8'	windows 9	1280*800
57	29	{"full_name": "White Arnold", "position": "Buyer", "address": "samara, milaya street, house 9"}	'2017-10-2 14:37:46'	'2 12:9:37'	windows 10	2560*1600
58	157	{"full_name": "Oritz Matthew", "position": "Buyer", "address": "Omsk, strashnaya street, house 3"}	'2019-8-15 13:12:55'	'0 2:47:26'	windows 9	1600*900
59	160	{"full_name": "Bailey Earl", "position": "Visual Merchandiser", "address": "Omsk, krasivaya street, house 7"}	'2017-1-18 16:31:58'	'3 19:11:19'	windows 9	1152*648
60	1	{"full_name": "Tarpley Anthony", "position": "Sales Associate", "address": "Omsk, druzhnaya street, house 9"}	'2020-5-10 13:20:48'	'3 11:39:34'	windows XP	1024*576
61	168	{"full_name": "Marinese Joseph", "position": "Visual Merchandiser", "address": "Kazan, Berezovskaya street, house 9"}	'2019-11-26 16:40:38'	'1 9:11:50'	windows 9	1680*1050
62	3	{"full_name": "Marinese Minnie", "position": "Store Manager", "address": "Ekaterinburg, Nikonova street, house 7"}	'2019-10-8 16:37:39'	'3 9:2:47'	windows 10	1920*1200
63	198	{"full_name": "Blodgett Paul", "position": "Assistant Store Manager", "address": "samara, Lyadova street, house 9"}	'2020-7-27 15:14:49'	'0 13:32:32'	windows 10	1920*1080
64	99	{"full_name": "Bacon Justin", "position": "Store director", "address": "Moscow, Nikonova street, house 3"}	'2019-8-16 14:24:54'	'2 11:5:32'	windows XP	1366*768
65	15	{"full_name": "Guidry Minnie", "position": "Customer Service Representative", "address": "samara, Revoluzii street, house 1"}	'2017-5-15 17:47:55'	'1 2:3:2'	windows XP	1152*648
66	97	{"full_name": "Hoggard Carol", "position": "Store director", "address": "Chelyabinsk, strashnaya street, house 1"}	'2020-7-16 16:23:39'	'2 8:57:12'	windows 8	1280*720
67	109	{"full_name": "Moore Hector", "position": "Sales Associate", "address": "Nizhniy Novgorod, Moscovskaya street, house 5"}	'2015-3-18 17:14:47'	'3 22:3:53'	windows XP	1920*1080
68	178	{"full_name": "Dearborn Mildred", "position": "Store Manager", "address": "Novosibirsc, strashnaya street, house 3"}	'2019-10-13 18:42:49'	'0 17:42:10'	windows 7	1152*648
69	147	{"full_name": "Lin Jesus", "position": "Buyer", "address": "Omsk, velikolepnaya street, house 9"}	'2016-11-20 18:44:29'	'2 8:57:6'	windows 9	1024*576
70	181	{"full_name": "Tovar Raymond", "position": "Visual Merchandiser", "address": "Chelyabinsk, Krasnih Zor street, house 5"}	'2019-3-4 12:29:34'	'1 17:55:9'	windows XP	1920*1200
71	182	{"full_name": "Duran Joseph", "position": "Inventory Control Specialist", "address": "Omsk, klaviatornya street, house 11"}	'2019-9-22 18:33:48'	'0 7:12:37'	ubuntu 20.04	1024*576
72	177	{"full_name": "Lopez James", "position": "Visual Merchandiser", "address": "Novosibirsc, velikolepnaya street, house 11"}	'2020-9-27 11:10:37'	'0 0:37:39'	windows 9	1440*900
73	58	{"full_name": "Moyer James", "position": "Buyer", "address": "Nizhniy Novgorod, Revoluzii street, house 7"}	'2016-1-1 13:52:59'	'0 23:45:12'	windows 9	1680*1050
74	166	{"full_name": "Miller Matthew", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, milaya street, house 3"}	'2020-4-2 12:34:47'	'1 13:41:45'	windows XP	1440*900
75	23	{"full_name": "Pitts Michael", "position": "Inventory Control Specialist", "address": "Kazan, malenkaya street, house 7"}	'2017-9-26 18:38:20'	'0 3:53:16'	windows 7	1920*1200
76	39	{"full_name": "Marinese Kathleen", "position": "Store director", "address": "samara, Lyadova street, house 7"}	'2015-11-17 16:19:53'	'3 6:17:7'	windows 10	1600*900
77	82	{"full_name": "Verduzco Jaime", "position": "Store director", "address": "Kazan, strashnaya street, house 9"}	'2020-1-1 16:31:46'	'1 17:6:16'	windows 10	1152*648
78	187	{"full_name": "Escudero Joann", "position": "Sales Associate", "address": "Moscow, klaviatornya street, house 3"}	'2018-4-16 16:50:34'	'2 21:36:14'	ubuntu 20.04	1440*900
79	182	{"full_name": "Oritz Molly", "position": "Sales Associate", "address": "Chelyabinsk, velikolepnaya street, house 5"}	'2015-7-1 11:34:10'	'1 11:25:47'	windows 10	1152*648
80	127	{"full_name": "Wagner John", "position": "Cashier", "address": "Ekaterinburg, Moscovskaya street, house 3"}	'2019-6-14 13:18:57'	'1 11:1:2'	windows 9	1366*768
81	127	{"full_name": "Wyant Dylan", "position": "Sales Associate", "address": "Novosibirsc, Krasnih Zor street, house 9"}	'2015-2-15 17:23:25'	'2 20:28:3'	windows 7	1280*720
82	167	{"full_name": "Hughes Bethany", "position": "Cashier", "address": "Omsk, druzheskaya street, house 3"}	'2016-6-9 16:42:10'	'3 5:35:40'	windows 8	1024*576
83	3	{"full_name": "Washington Evelyn", "position": "Sales Associate", "address": "Ekaterinburg, Revoluzii street, house 5"}	'2020-5-5 18:30:55'	'2 2:27:32'	windows 7	2560*1600
84	24	{"full_name": "Smith Corey", "position": "Buyer", "address": "Moscow, Nikonova street, house 5"}	'2020-4-17 17:50:19'	'3 9:51:35'	windows 8	2560*1440
85	121	{"full_name": "Bebout Robert", "position": "Store Manager", "address": "Chelyabinsk, Berezovskaya street, house 7"}	'2018-3-10 13:51:52'	'1 0:56:0'	windows 7	1280*800
86	114	{"full_name": "Coleman Dede", "position": "Store director", "address": "Moscow, Geroev street, house 1"}	'2019-4-4 16:19:54'	'3 9:9:24'	windows XP	2560*1600
87	110	{"full_name": "Eady Mary", "position": "Sales Associate", "address": "samara, Geroev street, house 1"}	'2017-6-19 16:46:51'	'3 11:12:26'	windows 7	1024*576
88	141	{"full_name": "Bass Victoria", "position": "Cashier", "address": "Nizhniy Novgorod, malenkaya street, house 5"}	'2017-7-12 12:52:40'	'0 8:54:11'	windows 9	1366*768
89	85	{"full_name": "Gibbs Joseph", "position": "Inventory Control Specialist", "address": "Moscow, Lenina street, house 3"}	'2017-2-3 15:11:42'	'1 6:2:17'	ubuntu 20.04	1920*1200
90	13	{"full_name": "Cabrales Timothy", "position": "Customer Service Representative", "address": "Saint-Petersburg, Moscovskaya street, house 11"}	'2017-5-12 15:32:21'	'3 8:45:16'	windows XP	1440*900
91	97	{"full_name": "Merrill Yolanda", "position": "Buyer", "address": "samara, velikolepnaya street, house 5"}	'2015-5-17 17:36:32'	'0 19:38:23'	windows 7	1920*1200
92	80	{"full_name": "Bailey Andrew", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, Krasnih Zor street, house 1"}	'2016-2-22 18:30:21'	'2 6:45:7'	ubuntu 20.04	1680*1050
93	109	{"full_name": "Bishop Timothy", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, druzheskaya street, house 3"}	'2020-7-28 15:35:28'	'0 12:58:38'	windows 10	1366*768
94	193	{"full_name": "Delgado Lynn", "position": "Cashier", "address": "Ekaterinburg, druzheskaya street, house 5"}	'2015-3-2 11:26:34'	'0 22:9:58'	windows 7	2560*1440
95	186	{"full_name": "Romney Maria", "position": "Cashier", "address": "Ekaterinburg, Moscovskaya street, house 9"}	'2020-10-26 13:40:30'	'0 2:11:14'	ubuntu 20.04	1440*900
96	93	{"full_name": "Davidson Elizabeth", "position": "Inventory Control Specialist", "address": "Omsk, velikolepnaya street, house 3"}	'2020-1-24 17:38:12'	'3 8:59:38'	windows 10	1920*1080
97	41	{"full_name": "Harrison Chang", "position": "Visual Merchandiser", "address": "Novosibirsc, druzhnaya street, house 3"}	'2019-2-9 14:28:48'	'1 10:39:39'	windows 9	1600*900
98	45	{"full_name": "Dearborn Chang", "position": "Inventory Control Specialist", "address": "Novosibirsc, zirkovaya street, house 1"}	'2018-4-25 17:35:56'	'1 6:27:23'	windows XP	1366*768
99	100	{"full_name": "Davidson Matthew", "position": "Store director", "address": "Novosibirsc, milaya street, house 11"}	'2018-10-9 12:42:43'	'2 19:17:31'	windows 8	1280*720
100	16	{"full_name": "Mohamed Carol", "position": "Store Manager", "address": "Saint-Petersburg, druzheskaya street, house 3"}	'2017-2-19 14:42:25'	'2 3:36:33'	windows 8	2560*1440
101	7	{"full_name": "Harrison James", "position": "Buyer", "address": "samara, Moscovskaya street, house 1"}	'2017-1-27 13:14:19'	'3 22:57:38'	windows 9	1920*1200
102	50	{"full_name": "Gabrielson Steven", "position": "Sales Associate", "address": "Novosibirsc, Krasnih Zor street, house 11"}	'2015-8-8 14:32:50'	'2 18:2:22'	windows 8	2560*1440
103	200	{"full_name": "Hoggard Earl", "position": "Store Manager", "address": "Saint-Petersburg, malenkaya street, house 7"}	'2019-2-26 13:41:22'	'2 19:56:23'	windows 9	1920*1080
104	62	{"full_name": "Torelli Rene", "position": "Cashier", "address": "Ekaterinburg, Moscovskaya street, house 5"}	'2016-11-14 13:27:19'	'1 6:28:38'	windows XP	1920*1200
105	36	{"full_name": "Wagner Allen", "position": "Buyer", "address": "Ekaterinburg, malenkaya street, house 7"}	'2019-3-15 13:49:59'	'3 23:36:37'	windows XP	2560*1600
106	133	{"full_name": "Berenguer Jerome", "position": "Visual Merchandiser", "address": "Novosibirsc, klaviatornya street, house 3"}	'2015-1-3 12:27:22'	'0 12:43:48'	windows 9	1600*900
107	13	{"full_name": "Griffin Raymond", "position": "Store Manager", "address": "samara, Moscovskaya street, house 5"}	'2016-11-22 12:14:38'	'0 2:6:10'	windows XP	1600*900
108	34	{"full_name": "Fischer Amanda", "position": "Inventory Control Specialist", "address": "Nizhniy Novgorod, Krasnih Zor street, house 11"}	'2015-6-2 16:40:44'	'3 21:15:50'	windows 9	1280*800
109	11	{"full_name": "Escudero Timothy", "position": "Sales Associate", "address": "Nizhniy Novgorod, Geroev street, house 11"}	'2018-2-22 14:51:25'	'0 9:29:25'	windows 7	1366*768
110	95	{"full_name": "Chasin David", "position": "Customer Service Representative", "address": "Saint-Petersburg, velikolepnaya street, house 5"}	'2020-11-17 14:45:39'	'0 13:57:35'	windows XP	1600*900
111	56	{"full_name": "Benton Elizabeth", "position": "Sales Associate", "address": "Ekaterinburg, druzheskaya street, house 5"}	'2015-3-6 14:30:23'	'0 11:52:21'	ubuntu 20.04	2560*1600
112	97	{"full_name": "Fry Rosella", "position": "Inventory Control Specialist", "address": "Ekaterinburg, Revoluzii street, house 5"}	'2015-7-22 17:24:40'	'1 3:16:29'	windows 7	1920*1080
113	119	{"full_name": "Davidson Jeremy", "position": "Store director", "address": "Ekaterinburg, krasivaya street, house 9"}	'2016-5-4 13:48:21'	'0 9:45:32'	windows XP	1920*1080
114	145	{"full_name": "Oritz Jerome", "position": "Customer Service Representative", "address": "Chelyabinsk, malenkaya street, house 11"}	'2020-10-20 13:18:23'	'1 9:2:56'	windows 9	1680*1050
115	34	{"full_name": "Escudero Anna", "position": "Customer Service Representative", "address": "Chelyabinsk, velikolepnaya street, house 1"}	'2015-10-18 15:45:44'	'2 17:10:57'	windows 7	1920*1080
116	172	{"full_name": "Lin James", "position": "Store Manager", "address": "Nizhniy Novgorod, Lyadova street, house 5"}	'2015-7-5 11:20:38'	'0 1:33:4'	windows 10	1366*768
117	125	{"full_name": "Aleman Lisa", "position": "Store Manager", "address": "Moscow, strashnaya street, house 5"}	'2016-1-7 15:20:41'	'0 2:48:10'	windows 10	1024*576
118	49	{"full_name": "Eady Yolanda", "position": "Sales Associate", "address": "Ekaterinburg, Geroev street, house 3"}	'2018-7-28 13:24:51'	'3 11:16:18'	windows 7	1366*768
119	26	{"full_name": "Verduzco Marlon", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, velikolepnaya street, house 7"}	'2016-4-19 15:33:44'	'3 19:42:42'	windows XP	2560*1440
120	183	{"full_name": "Miller Cheryl", "position": "Store director", "address": "Omsk, Moscovskaya street, house 11"}	'2017-8-16 14:27:42'	'2 5:39:7'	windows 7	1600*900
121	1	{"full_name": "Bacon Michael", "position": "Buyer", "address": "Omsk, milaya street, house 11"}	'2015-11-16 11:31:21'	'3 11:6:1'	windows XP	2560*1600
122	187	{"full_name": "Moyer Camille", "position": "Customer Service Representative", "address": "Kazan, Revoluzii street, house 7"}	'2016-12-17 17:41:39'	'0 4:34:6'	windows 8	1440*900
123	64	{"full_name": "Livings Maryanne", "position": "Sales Associate", "address": "Saint-Petersburg, Berezovskaya street, house 3"}	'2015-12-19 13:41:43'	'2 0:46:42'	windows XP	1366*768
124	21	{"full_name": "Tarpley Jesus", "position": "Visual Merchandiser", "address": "Chelyabinsk, Lyadova street, house 11"}	'2018-1-28 12:34:29'	'3 19:28:53'	windows XP	1024*576
125	162	{"full_name": "Bacon Evelyn", "position": "Customer Service Representative", "address": "Moscow, strashnaya street, house 11"}	'2019-8-24 15:23:32'	'0 6:20:32'	windows 7	1024*576
126	60	{"full_name": "Johnson Sheila", "position": "Store Manager", "address": "Kazan, strashnaya street, house 7"}	'2015-11-26 17:23:53'	'0 15:7:27'	windows 10	1152*648
127	59	{"full_name": "Miller Clara", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, malenkaya street, house 1"}	'2017-12-7 11:17:44'	'1 0:56:38'	windows 8	2560*1600
128	80	{"full_name": "Mahone Lisa", "position": "Store director", "address": "samara, zirkovaya street, house 1"}	'2018-6-22 15:25:30'	'3 12:33:17'	windows 10	1920*1080
129	145	{"full_name": "Harrison Anna", "position": "Cashier", "address": "Kazan, druzhnaya street, house 11"}	'2016-5-16 12:25:52'	'2 15:30:5'	ubuntu 20.04	1440*900
130	68	{"full_name": "Pickrell Clara", "position": "Sales Associate", "address": "Ekaterinburg, Revoluzii street, house 3"}	'2020-6-10 17:53:49'	'2 12:3:28'	windows 9	2560*1600
131	11	{"full_name": "Smith Melissa", "position": "Inventory Control Specialist", "address": "Saint-Petersburg, Krasnih Zor street, house 1"}	'2020-11-7 14:40:14'	'3 4:7:4'	windows 8	1920*1200
132	57	{"full_name": "Pickrell Dora", "position": "Buyer", "address": "Moscow, Revoluzii street, house 3"}	'2018-8-26 15:21:17'	'0 6:59:10'	windows XP	1920*1080
133	142	{"full_name": "Roberson Charles", "position": "Cashier", "address": "Ekaterinburg, klaviatornya street, house 11"}	'2017-9-9 11:11:28'	'3 4:22:53'	windows XP	1366*768
134	185	{"full_name": "Fischer Kenneth", "position": "Cashier", "address": "Novosibirsc, Lyadova street, house 9"}	'2015-4-3 14:39:41'	'1 12:5:55'	windows 10	1920*1200
135	178	{"full_name": "To Walter", "position": "Visual Merchandiser", "address": "Kazan, druzheskaya street, house 9"}	'2018-10-17 13:26:32'	'0 21:33:35'	windows XP	1440*900
136	136	{"full_name": "Fischer Raymond", "position": "Customer Service Representative", "address": "Kazan, zirkovaya street, house 9"}	'2016-9-10 18:25:25'	'0 15:30:29'	windows XP	1024*576
137	176	{"full_name": "Torelli Rene", "position": "Customer Service Representative", "address": "Chelyabinsk, Lenina street, house 1"}	'2020-10-8 16:36:57'	'3 23:5:4'	windows XP	1366*768
138	165	{"full_name": "Delgado Marlon", "position": "Visual Merchandiser", "address": "Novosibirsc, krasivaya street, house 5"}	'2015-10-3 14:40:24'	'0 23:32:15'	ubuntu 20.04	2560*1600
139	155	{"full_name": "Colten Mary", "position": "Cashier", "address": "Omsk, Geroev street, house 11"}	'2020-1-9 11:26:20'	'0 7:28:8'	windows 7	1366*768
140	73	{"full_name": "Cabrales Classie", "position": "Assistant Store Manager", "address": "Moscow, Revoluzii street, house 5"}	'2018-12-7 16:52:38'	'1 13:25:22'	windows 9	1680*1050
141	68	{"full_name": "Delgado Walter", "position": "Store director", "address": "Kazan, Krasnih Zor street, house 3"}	'2019-5-14 18:25:41'	'3 17:21:58'	windows 10	2560*1440
142	110	{"full_name": "Harris Amanda", "position": "Sales Associate", "address": "Chelyabinsk, Lenina street, house 3"}	'2018-8-21 12:20:48'	'3 9:27:41'	windows 7	1366*768
143	100	{"full_name": "Gibbs Lynn", "position": "Visual Merchandiser", "address": "Ekaterinburg, krasivaya street, house 9"}	'2018-5-28 17:37:50'	'0 2:34:47'	ubuntu 20.04	1600*900
144	66	{"full_name": "Wyant Tracey", "position": "Customer Service Representative", "address": "Chelyabinsk, Lenina street, house 1"}	'2015-10-16 18:30:28'	'2 14:55:53'	windows XP	1440*900
145	34	{"full_name": "Wilhoite Gerald", "position": "Inventory Control Specialist", "address": "Kazan, strashnaya street, house 3"}	'2020-3-20 11:15:24'	'1 18:54:9'	windows 8	1280*800
146	123	{"full_name": "Smith Janice", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, Berezovskaya street, house 5"}	'2018-11-18 17:34:21'	'1 17:38:41'	windows 7	2560*1600
147	72	{"full_name": "Bishop Charles", "position": "Visual Merchandiser", "address": "Ekaterinburg, Lyadova street, house 3"}	'2017-2-24 18:36:51'	'2 10:17:21'	windows 8	1920*1080
148	97	{"full_name": "Mcdonough Donna", "position": "Assistant Store Manager", "address": "Ekaterinburg, Lenina street, house 11"}	'2019-8-14 13:13:23'	'0 22:20:31'	windows 8	1440*900
149	32	{"full_name": "Gonzales Jaime", "position": "Store director", "address": "samara, klaviatornya street, house 1"}	'2015-9-26 13:53:19'	'1 8:3:42'	windows 8	1366*768
150	176	{"full_name": "Davis Mary", "position": "Inventory Control Specialist", "address": "Novosibirsc, Geroev street, house 5"}	'2018-10-20 14:24:51'	'0 8:34:31'	windows 8	2560*1600
151	113	{"full_name": "Bacon Melissa", "position": "Cashier", "address": "Omsk, Nikonova street, house 11"}	'2020-4-2 12:20:52'	'3 20:40:31'	windows 8	2560*1600
152	154	{"full_name": "Chasin Jennifer", "position": "Store Manager", "address": "Kazan, Berezovskaya street, house 3"}	'2020-3-10 18:53:21'	'3 4:51:13'	windows 10	1024*576
153	32	{"full_name": "Gibbs Janice", "position": "Store director", "address": "samara, Moscovskaya street, house 9"}	'2019-3-26 16:46:28'	'1 18:31:30'	windows 10	2560*1440
154	144	{"full_name": "Harrison Jeremy", "position": "Assistant Store Manager", "address": "samara, velikolepnaya street, house 9"}	'2019-1-13 17:21:58'	'0 11:6:43'	windows 9	1920*1200
155	142	{"full_name": "Bebout Rene", "position": "Buyer", "address": "Ekaterinburg, klaviatornya street, house 5"}	'2020-1-15 12:38:43'	'3 19:10:6'	windows XP	1920*1200
156	133	{"full_name": "Aleman Clara", "position": "Inventory Control Specialist", "address": "Omsk, malenkaya street, house 1"}	'2017-7-10 16:40:19'	'2 3:3:52'	windows 7	1280*720
157	131	{"full_name": "Fischer Paul", "position": "Store Manager", "address": "Ekaterinburg, klaviatornya street, house 9"}	'2016-9-22 14:39:24'	'2 4:15:5'	windows 9	1920*1080
158	146	{"full_name": "Mcnaughton Kenneth", "position": "Cashier", "address": "Omsk, Geroev street, house 7"}	'2015-4-24 16:11:35'	'0 13:58:12'	windows 9	1680*1050
159	194	{"full_name": "Bailey Yolanda", "position": "Visual Merchandiser", "address": "Saint-Petersburg, Revoluzii street, house 5"}	'2017-5-12 13:44:28'	'1 15:27:36'	ubuntu 20.04	1440*900
160	43	{"full_name": "Reza Janeen", "position": "Store director", "address": "Kazan, Geroev street, house 1"}	'2016-8-7 17:14:15'	'2 22:35:47'	windows 9	1600*900
161	65	{"full_name": "Miller Charles", "position": "Inventory Control Specialist", "address": "samara, strashnaya street, house 11"}	'2017-2-9 18:48:54'	'1 17:31:23'	windows 8	1152*648
162	118	{"full_name": "Wilhoite Allen", "position": "Buyer", "address": "Kazan, Berezovskaya street, house 5"}	'2017-8-13 16:43:21'	'2 12:53:16'	windows 9	1280*800
163	116	{"full_name": "Moyer Monica", "position": "Customer Service Representative", "address": "Saint-Petersburg, druzhnaya street, house 11"}	'2016-5-18 16:20:45'	'0 8:18:56'	windows 7	1680*1050
164	56	{"full_name": "Hoggard Curtis", "position": "Inventory Control Specialist", "address": "Ekaterinburg, zirkovaya street, house 11"}	'2015-4-1 11:48:16'	'0 4:57:35'	windows 9	1280*720
165	83	{"full_name": "Washington Matthew", "position": "Visual Merchandiser", "address": "samara, Geroev street, house 7"}	'2015-7-19 15:23:24'	'3 6:34:43'	windows 8	1152*648
166	179	{"full_name": "Stewart Tracey", "position": "Sales Associate", "address": "Kazan, Moscovskaya street, house 7"}	'2016-12-19 16:40:25'	'1 10:20:38'	windows 7	1920*1200
167	144	{"full_name": "Mohamed Jaime", "position": "Store director", "address": "Novosibirsc, strashnaya street, house 5"}	'2018-3-4 16:21:42'	'1 21:29:43'	windows 7	1280*720
168	97	{"full_name": "Moyer Carol", "position": "Inventory Control Specialist", "address": "samara, zirkovaya street, house 1"}	'2017-7-10 11:52:32'	'3 2:37:25'	ubuntu 20.04	2560*1440
169	75	{"full_name": "Landry Salvador", "position": "Cashier", "address": "Omsk, Lenina street, house 5"}	'2017-9-21 12:28:57'	'2 4:43:47'	ubuntu 20.04	2560*1600
170	58	{"full_name": "Bacon Raymond", "position": "Buyer", "address": "Ekaterinburg, milaya street, house 11"}	'2020-12-11 12:49:18'	'3 5:26:59'	windows 10	1024*576
171	75	{"full_name": "Mitchell Gerald", "position": "Assistant Store Manager", "address": "Kazan, zirkovaya street, house 9"}	'2016-11-5 11:25:28'	'2 16:40:5'	windows 7	1920*1080
172	34	{"full_name": "Black Earl", "position": "Buyer", "address": "Omsk, Geroev street, house 3"}	'2019-2-12 16:50:53'	'2 21:55:39'	ubuntu 20.04	1600*900
173	50	{"full_name": "Coleman Timothy", "position": "Store Manager", "address": "samara, Revoluzii street, house 3"}	'2017-5-2 15:31:55'	'2 18:40:40'	windows 10	1440*900
174	184	{"full_name": "Hughes Monica", "position": "Sales Associate", "address": "samara, druzheskaya street, house 9"}	'2020-5-3 13:48:47'	'2 18:8:29'	windows 10	1600*900
175	164	{"full_name": "Bailey Bethany", "position": "Store director", "address": "Kazan, Nikonova street, house 7"}	'2016-2-16 13:38:54'	'0 8:22:1'	windows 10	1366*768
176	96	{"full_name": "Vargas Michael", "position": "Store director", "address": "Saint-Petersburg, Berezovskaya street, house 3"}	'2016-3-12 17:31:13'	'1 9:57:15'	ubuntu 20.04	1280*800
177	116	{"full_name": "Gonzales Jeremy", "position": "Inventory Control Specialist", "address": "Kazan, milaya street, house 1"}	'2020-7-11 15:51:27'	'2 8:35:9'	windows 10	2560*1440
178	170	{"full_name": "Zanchez Minnie", "position": "Inventory Control Specialist", "address": "Ekaterinburg, Revoluzii street, house 5"}	'2017-8-15 11:14:43'	'1 21:26:9'	windows 7	1440*900
179	9	{"full_name": "Ellerbe Sandra", "position": "Visual Merchandiser", "address": "Moscow, Berezovskaya street, house 1"}	'2015-7-3 16:20:43'	'0 16:50:56'	ubuntu 20.04	1920*1080
180	193	{"full_name": "Park Teresa", "position": "Store director", "address": "samara, malenkaya street, house 1"}	'2015-1-8 14:25:37'	'3 10:31:30'	ubuntu 20.04	2560*1440
181	33	{"full_name": "Harris Trina", "position": "Sales Associate", "address": "Ekaterinburg, Lenina street, house 3"}	'2020-11-1 18:43:22'	'3 16:53:38'	ubuntu 20.04	1680*1050
182	179	{"full_name": "Fischer Trina", "position": "Customer Service Representative", "address": "Omsk, druzhnaya street, house 7"}	'2020-10-26 15:39:41'	'2 5:57:36'	windows 7	1600*900
183	169	{"full_name": "Cabrales Joy", "position": "Inventory Control Specialist", "address": "Saint-Petersburg, Berezovskaya street, house 7"}	'2019-1-26 16:44:52'	'1 9:22:9'	windows 8	1440*900
184	109	{"full_name": "Delgado Evelyn", "position": "Sales Associate", "address": "Omsk, milaya street, house 3"}	'2017-6-27 14:21:59'	'3 10:58:24'	windows XP	1024*576
185	170	{"full_name": "Reza Anna", "position": "Buyer", "address": "Kazan, zirkovaya street, house 7"}	'2020-5-22 17:15:52'	'2 22:49:28'	windows 8	1280*720
186	109	{"full_name": "Fleck Ruth", "position": "Buyer", "address": "Saint-Petersburg, velikolepnaya street, house 9"}	'2015-8-15 12:11:22'	'1 1:54:14'	windows 10	1280*720
187	91	{"full_name": "Landry Bethany", "position": "Buyer", "address": "Ekaterinburg, Revoluzii street, house 9"}	'2020-11-26 16:23:10'	'3 15:12:17'	windows XP	1680*1050
188	27	{"full_name": "Heikes Scott", "position": "Assistant Store Manager", "address": "Novosibirsc, velikolepnaya street, house 9"}	'2018-5-21 18:35:14'	'2 4:38:27'	windows 8	1440*900
189	107	{"full_name": "Davis Barbara", "position": "Customer Service Representative", "address": "Saint-Petersburg, druzheskaya street, house 1"}	'2016-6-2 18:46:37'	'3 15:52:11'	windows 8	1152*648
190	153	{"full_name": "Davis Joseph", "position": "Buyer", "address": "samara, krasivaya street, house 11"}	'2020-3-17 14:47:41'	'1 23:29:54'	windows 7	1680*1050
191	84	{"full_name": "Moyer Corey", "position": "Inventory Control Specialist", "address": "samara, Lyadova street, house 11"}	'2017-7-24 17:10:29'	'2 1:2:11'	ubuntu 20.04	1680*1050
192	147	{"full_name": "Griffin Rosella", "position": "Cashier", "address": "Moscow, druzhnaya street, house 1"}	'2020-4-17 11:25:23'	'3 0:38:21'	windows XP	1280*800
193	51	{"full_name": "Mcfarlane Billy", "position": "Visual Merchandiser", "address": "Saint-Petersburg, Geroev street, house 7"}	'2015-7-10 15:43:34'	'2 23:22:7'	windows 7	1920*1080
194	50	{"full_name": "Wagner Arnold", "position": "Cashier", "address": "Chelyabinsk, velikolepnaya street, house 11"}	'2020-2-28 15:45:55'	'3 18:5:41'	windows 9	1280*720
195	56	{"full_name": "Black Norman", "position": "Buyer", "address": "Novosibirsc, malenkaya street, house 1"}	'2019-5-17 15:52:55'	'2 0:10:59'	windows 9	2560*1600
196	68	{"full_name": "Milner Salvador", "position": "Cashier", "address": "samara, velikolepnaya street, house 9"}	'2017-12-2 16:23:54'	'0 16:12:28'	windows 9	1280*800
197	16	{"full_name": "Gabrielson Gerald", "position": "Cashier", "address": "samara, krasivaya street, house 1"}	'2019-6-22 12:26:44'	'1 22:12:48'	ubuntu 20.04	1280*720
198	175	{"full_name": "Moore Timothy", "position": "Visual Merchandiser", "address": "Kazan, strashnaya street, house 9"}	'2020-3-12 17:47:47'	'3 2:49:55'	windows 8	2560*1600
199	5	{"full_name": "Johnson Jerome", "position": "Inventory Control Specialist", "address": "Moscow, druzheskaya street, house 7"}	'2016-5-27 11:11:38'	'2 17:59:37'	ubuntu 20.04	1152*648
\.

COPY interactions FROM stdin;
1	41	{"full_name": "Mcnaughton Corey", "position": "Sales Associate", "address": "Ekaterinburg, Lyadova street, house 11"}	38	'2020-11-27 16:32:16'	The program walks at the stupid politician.	update	{delivery, bill, add, sale}	{Purchases, Pull_classes, Employees, Customers, Employees}
2	130	{"full_name": "Gibbs Arnold", "position": "Inventory Control Specialist", "address": "Chelyabinsk, krasivaya street, house 11"}	103	'2020-2-7 14:37:30'	The homework runs.	update	{price, delivery, bill, add, delivery}	{Products, Purchases}
3	184	{"full_name": "Adams Justin", "position": "Cashier", "address": "Moscow, Lyadova street, house 11"}	9	'2019-6-22 13:35:15'	Sara plays around Notre Dame.	delete	{bill, opening}	{Sizes}
4	102	{"full_name": "Smith Justin", "position": "Customer Service Representative", "address": "Kazan, Lyadova street, house 3"}	26	'2016-4-11 17:25:47'	Nick jumps above the friend.	insert 	{add}	{Pull_classes}
5	48	{"full_name": "Roberson Trina", "position": "Sales Associate", "address": "Chelyabinsk, Lyadova street, house 7"}	61	'2019-9-18 15:39:47'	Nick jumps near Sara.	insert 	{delivery, promotion, new purchase, analyses}	{Orders, Employees, Stores}
6	186	{"full_name": "Vargas Anna", "position": "Buyer", "address": "Novosibirsc, Geroev street, house 5"}	112	'2017-1-11 15:34:41'	Jaylon Smith walks.	update	{analyses, promotion, clothing, store, price}	{tasks, Orders, Sizes}
7	180	{"full_name": "Landry Maria", "position": "Buyer", "address": "samara, Moscovskaya street, house 5"}	117	'2020-4-7 16:21:56'	Alumni Hall jumps.	insert 	{delivery}	{Pull_classes, Stores}
8	179	{"full_name": "Jetton Mary", "position": "Cashier", "address": "Kazan, Geroev street, house 1"}	185	'2018-11-11 18:33:16'	The stupid politician is with Sara.	insert 	{employee, price, store, employee}	{Purchases, tasks, Purchases}
9	86	{"full_name": "Chandler Barbara", "position": "Store Manager", "address": "Chelyabinsk, zirkovaya street, house 3"}	99	'2017-9-27 14:49:33'	The stupid campus is to the beautiful dog!	insert 	{bill, sale, promotion}	{Prices, Pull_classes}
10	142	{"full_name": "Torelli James", "position": "Buyer", "address": "Chelyabinsk, milaya street, house 1"}	32	'2019-3-28 13:21:44'	Notre Dame performs.	update	{analyses, opening}	{Purchases, Prices, tasks, Customers, Orders}
11	70	{"full_name": "Wagner Irene", "position": "Inventory Control Specialist", "address": "Saint-Petersburg, druzheskaya street, house 3"}	149	'2017-2-28 18:36:32'	Sara performs with the puppy.	delete	{add}	{Purchases, Employees, Pull_classes}
12	1	{"full_name": "Berenguer Earl", "position": "Sales Associate", "address": "samara, klaviatornya street, house 1"}	28	'2018-2-10 11:23:29'	Pablo performs around the politician.	update	{update, opening, add, delivery}	{Classes}
13	191	{"full_name": "Shimizu David", "position": "Buyer", "address": "samara, klaviatornya street, house 3"}	199	'2015-6-1 12:48:33'	The beautiful campus walks above the weird politician.	analysis	{promotion, clothing}	{Pull_classes, Classes, Prices, Classes}
14	190	{"full_name": "Mcfarlane David", "position": "Assistant Store Manager", "address": "Saint-Petersburg, Revoluzii street, house 5"}	128	'2015-10-11 13:33:35'	The weird politician plays to the professor.	update	{sale, customer, clothing}	{Sizes, Orders}
15	77	{"full_name": "Howard Ruth", "position": "Store Manager", "address": "Moscow, Lenina street, house 3"}	196	'2016-1-28 11:44:58'	Pat walks.	update	{promotion, promotion}	{Pull_classes, Classes, Employees, Customers, Prices}
16	153	{"full_name": "Tovar Sherri", "position": "Cashier", "address": "Novosibirsc, Nikonova street, house 1"}	69	'2016-5-10 18:44:15'	The television is.	update	{analyses, bill, size, new purchase, store}	{Orders}
17	156	{"full_name": "Harrison Janeen", "position": "Store director", "address": "Omsk, krasivaya street, house 11"}	193	'2015-7-18 16:30:32'	The homework performs around Nick!	update	{delivery, analyses, analyses}	{Customers, Classes}
18	94	{"full_name": "Lin Anna", "position": "Visual Merchandiser", "address": "samara, Moscovskaya street, house 1"}	116	'2016-9-17 17:23:11'	The politician walks to the politician!	insert 	{sale}	{Orders, Customers}
19	198	{"full_name": "Park Tracey", "position": "Visual Merchandiser", "address": "Ekaterinburg, druzheskaya street, house 5"}	98	'2019-3-13 14:37:40'	Sara performs around the dog.	delete	{price increase, size, price}	{tasks, Products, Classes}
20	120	{"full_name": "Eady Chang", "position": "Assistant Store Manager", "address": "Kazan, Krasnih Zor street, house 11"}	91	'2015-12-19 13:50:41'	The stupid computer yells near the beautiful dog.	analysis	{employee, bill, delivery}	{Prices}
21	39	{"full_name": "Riggle Rene", "position": "Cashier", "address": "Kazan, Lenina street, house 5"}	185	'2018-5-4 16:16:47'	The weird television plays above Pablo!	delete	{price increase}	{tasks, Stores, Orders, Classes}
22	188	{"full_name": "Wagner Jesus", "position": "Store Manager", "address": "Omsk, krasivaya street, house 5"}	59	'2018-9-1 15:23:21'	The computer is with Notre Dame.	delete	{price, opening, clothing, delivery}	{Employees, Customers, tasks}
23	92	{"full_name": "Heikes Trina", "position": "Sales Associate", "address": "Chelyabinsk, milaya street, house 11"}	80	'2019-6-5 16:23:32'	The campus yells above the puppy.	delete	{price increase, sale, store, new purchase, price increase}	{Products, Classes}
24	103	{"full_name": "Mcdonough Melissa", "position": "Sales Associate", "address": "Kazan, krasivaya street, house 9"}	51	'2017-10-28 15:26:28'	Bernie Sanders performs!	analysis	{clothing, store, new purchase, price increase}	{Purchases, Prices, Employees, Products, Sizes}
25	150	{"full_name": "Coleman Lynn", "position": "Visual Merchandiser", "address": "Omsk, malenkaya street, house 7"}	27	'2018-9-23 18:10:43'	The campus plays at Kanye.	delete	{opening, customer, sale}	{Sizes}
26	102	{"full_name": "Milner Adrian", "position": "Buyer", "address": "Moscow, strashnaya street, house 11"}	194	'2016-3-7 15:35:20'	The puppy sings.	insert 	{update, clothing, store}	{Pull_classes, Sizes, Customers}
27	36	{"full_name": "Pickrell Anna", "position": "Sales Associate", "address": "Ekaterinburg, velikolepnaya street, house 7"}	5	'2019-7-27 13:46:54'	The player walks!	insert 	{promotion, delivery}	{Employees, Sizes, Products, Purchases}
28	167	{"full_name": "Wyant Melody", "position": "Cashier", "address": "samara, malenkaya street, house 1"}	63	'2016-1-22 18:27:24'	The computer plays near the beautiful campus.	update	{clothing class, opening, price, add, delivery}	{Prices, Sizes, Products}
29	70	{"full_name": "Rivera Bethany", "position": "Store Manager", "address": "Ekaterinburg, milaya street, house 5"}	65	'2015-11-17 13:53:53'	Nick plays above Jaylon Smith.	insert 	{analyses}	{Customers}
30	125	{"full_name": "Hoggard Melody", "position": "Sales Associate", "address": "Omsk, Berezovskaya street, house 5"}	37	'2016-7-15 13:43:48'	The professor screams at Alumni Hall.	delete	{price, add}	{Purchases}
31	45	{"full_name": "Powell Joseph", "position": "Store director", "address": "Novosibirsc, milaya street, house 5"}	72	'2018-2-5 14:18:57'	The puppy screams near the player.	analysis	{clothing class, price increase}	{Stores, Purchases}
32	119	{"full_name": "Delgado Donna", "position": "Visual Merchandiser", "address": "Kazan, krasivaya street, house 9"}	12	'2015-6-8 11:24:33'	Pablo is at the dog.	insert 	{bill}	{Pull_classes, Classes, Products, Purchases}
33	146	{"full_name": "Mask Evelyn", "position": "Visual Merchandiser", "address": "Kazan, Moscovskaya street, house 11"}	125	'2015-3-13 13:11:27'	Sara performs above Donald Trump.	analysis	{price, sale, promotion}	{Classes, Prices, Sizes, tasks}
34	36	{"full_name": "Fischer Teresa", "position": "Customer Service Representative", "address": "Chelyabinsk, milaya street, house 3"}	107	'2020-10-19 13:50:16'	Alumni Hall plays.	delete	{add}	{Purchases, Pull_classes, Sizes, Pull_classes}
35	168	{"full_name": "Mcdonough Teresa", "position": "Sales Associate", "address": "Omsk, druzheskaya street, house 5"}	118	'2020-3-2 12:49:13'	Notre Dame plays above the weird dog.	update	{bill, add}	{Products, Stores, Customers, Prices}
36	118	{"full_name": "Davidson Jennifer", "position": "Visual Merchandiser", "address": "samara, Lenina street, house 3"}	166	'2017-11-23 13:19:19'	Bernie Sanders sings near Alumni Hall.	insert 	{price increase}	{Prices, Stores, Orders}
37	198	{"full_name": "Blodgett Andrew", "position": "Cashier", "address": "Saint-Petersburg, strashnaya street, house 1"}	134	'2020-9-18 14:25:19'	Bernie Sanders sings at Nick.	insert 	{update, promotion, employee, store, price increase}	{Pull_classes, tasks, Orders, Orders}
38	112	{"full_name": "Adams Salvador", "position": "Sales Associate", "address": "Novosibirsc, Lenina street, house 11"}	99	'2018-2-16 17:52:18'	Bernie Sanders plays to Kanye.	update	{new purchase, new purchase}	{Products}
39	188	{"full_name": "Colten Marlon", "position": "Sales Associate", "address": "Moscow, milaya street, house 9"}	86	'2019-6-18 15:16:19'	Notre Dame screams.	analysis	{size, bill}	{Purchases, Classes}
40	14	{"full_name": "Zanchez Charles", "position": "Inventory Control Specialist", "address": "Moscow, malenkaya street, house 11"}	143	'2016-2-8 12:49:32'	Pablo kicks around Alumni Hall.	update	{price, customer, new purchase}	{Stores, Employees, Products, Prices}
41	168	{"full_name": "Fleck Classie", "position": "Store director", "address": "samara, strashnaya street, house 9"}	124	'2018-2-21 11:21:39'	The weird professor runs.	delete	{customer, bill, new purchase, clothing class}	{Purchases}
42	162	{"full_name": "Decaire Molly", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, Lyadova street, house 5"}	14	'2019-2-20 16:50:52'	The weird homework is.	analysis	{sale, price increase, update}	{Employees, Orders}
43	158	{"full_name": "Chandler Rosella", "position": "Cashier", "address": "Nizhniy Novgorod, strashnaya street, house 1"}	1	'2015-4-19 17:50:30'	The weird computer yells around the musician.	insert 	{analyses, clothing class}	{Purchases, Classes, Sizes, Sizes}
44	115	{"full_name": "Harrison Marlon", "position": "Cashier", "address": "Ekaterinburg, malenkaya street, house 7"}	63	'2020-1-19 17:52:48'	The campus plays.	update	{update}	{Stores, Products, Stores}
45	24	{"full_name": "Bishop Pat", "position": "Sales Associate", "address": "Novosibirsc, druzhnaya street, house 11"}	45	'2016-4-25 11:46:35'	The stupid puppy runs near the television.	insert 	{clothing class}	{tasks, Classes}
46	148	{"full_name": "Zanchez Patrick", "position": "Inventory Control Specialist", "address": "Kazan, velikolepnaya street, house 7"}	124	'2020-9-5 17:12:14'	Bernie Sanders runs.	analysis	{price increase}	{Sizes, Pull_classes}
47	101	{"full_name": "Gibbs Andrew", "position": "Store Manager", "address": "Moscow, Moscovskaya street, house 7"}	15	'2017-3-23 16:42:51'	The beautiful dog is.	insert 	{sale, opening}	{tasks, Customers, Orders}
48	169	{"full_name": "Marinese Matthew", "position": "Cashier", "address": "Omsk, druzhnaya street, house 11"}	55	'2017-11-8 13:40:27'	The television sings with Jaylon Smith!	insert 	{promotion, store}	{Classes, Products, Prices}
49	164	{"full_name": "Griffin Sheila", "position": "Inventory Control Specialist", "address": "samara, velikolepnaya street, house 1"}	41	'2016-7-12 16:26:16'	The beautiful computer is!	analysis	{delivery, employee}	{tasks, Classes}
50	62	{"full_name": "Byrd Monica", "position": "Sales Associate", "address": "Omsk, Lyadova street, house 5"}	103	'2016-4-25 11:34:17'	Donald Trump runs above the funny campus.	analysis	{store}	{Prices}
51	50	{"full_name": "Byrd Carol", "position": "Store Manager", "address": "Moscow, klaviatornya street, house 9"}	23	'2018-6-18 12:49:44'	Pablo is.	update	{clothing class}	{Purchases, Classes, Sizes, Orders}
52	84	{"full_name": "Johnson Lisa", "position": "Store director", "address": "Moscow, Lyadova street, house 7"}	183	'2015-1-15 18:48:52'	Donald Trump yells near the campus.	insert 	{employee, new purchase, customer}	{Pull_classes}
53	91	{"full_name": "Mcnaughton Corey", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, malenkaya street, house 7"}	198	'2016-9-2 15:49:50'	The campus is around the funny friend.	insert 	{employee, store, bill}	{Employees, Customers}
54	41	{"full_name": "Landry Mary", "position": "Cashier", "address": "Novosibirsc, malenkaya street, house 1"}	45	'2016-5-25 16:31:27'	The stupid television kicks above Bernie Sanders.	insert 	{clothing, sale, size, opening}	{Stores, Employees, Sizes, Customers}
55	86	{"full_name": "Vargas Paul", "position": "Store Manager", "address": "Ekaterinburg, Berezovskaya street, house 9"}	51	'2017-1-9 11:19:44'	The stupid television sings.	analysis	{opening}	{tasks, Stores}
56	136	{"full_name": "Riggle Mary", "position": "Store director", "address": "Novosibirsc, Moscovskaya street, house 9"}	25	'2015-9-11 15:13:43'	The computer is around the weird homework!	delete	{new purchase}	{Purchases, Pull_classes, Employees, Stores}
57	70	{"full_name": "Hughes Walter", "position": "Visual Merchandiser", "address": "Omsk, krasivaya street, house 11"}	146	'2016-7-2 13:28:46'	The politician performs near Kanye.	insert 	{update, price, price increase, analyses}	{Customers}
58	113	{"full_name": "Duran Sandra", "position": "Customer Service Representative", "address": "Kazan, strashnaya street, house 5"}	154	'2018-2-12 14:31:58'	The program walks with the funny musician.	insert 	{price, clothing, size, bill, new purchase}	{Customers, Purchases}
59	186	{"full_name": "Embree Dede", "position": "Store director", "address": "Omsk, Moscovskaya street, house 7"}	18	'2015-6-8 15:53:25'	The politician kicks.	update	{opening, price increase, price increase}	{Purchases, Pull_classes, Stores, Employees, Prices}
60	65	{"full_name": "Byrd Anna", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, druzheskaya street, house 7"}	123	'2020-2-20 15:38:16'	The player yells around the stupid musician.	update	{price, clothing, update, new purchase}	{Purchases, tasks, Classes, Classes}
61	124	{"full_name": "Oconnell Anna", "position": "Assistant Store Manager", "address": "Kazan, druzheskaya street, house 9"}	32	'2015-1-10 12:38:33'	The computer jumps!	analysis	{size}	{Classes, Employees, Sizes}
62	79	{"full_name": "Vargas Rosella", "position": "Customer Service Representative", "address": "Novosibirsc, Revoluzii street, house 9"}	38	'2016-8-1 17:28:59'	The weird homework runs.	analysis	{clothing class, bill, add, clothing}	{Purchases, Prices, Purchases}
63	105	{"full_name": "Mohamed Molly", "position": "Store Manager", "address": "Nizhniy Novgorod, druzhnaya street, house 3"}	184	'2016-4-18 15:24:27'	The friend plays to the weird puppy.	update	{clothing}	{Orders, Stores, Employees, Prices}
64	149	{"full_name": "Davidson Sherri", "position": "Store director", "address": "Novosibirsc, Revoluzii street, house 9"}	191	'2016-3-1 14:33:22'	Nick jumps.	insert 	{customer}	{tasks, Employees, Customers}
65	3	{"full_name": "Gibbs Timothy", "position": "Inventory Control Specialist", "address": "Kazan, Lyadova street, house 11"}	112	'2015-4-17 18:34:10'	The homework performs.	analysis	{delivery, sale, opening, add}	{Customers, Prices}
66	187	{"full_name": "Stewart Carol", "position": "Store director", "address": "Omsk, krasivaya street, house 1"}	95	'2019-10-10 13:15:35'	Pablo plays.	analysis	{size}	{Purchases, Orders, Sizes, Customers, tasks}
67	70	{"full_name": "To Mary", "position": "Visual Merchandiser", "address": "Ekaterinburg, zirkovaya street, house 9"}	196	'2018-1-17 12:31:49'	The friend plays.	analysis	{price}	{tasks, Classes, Stores, Sizes, Orders}
68	85	{"full_name": "Cabrales Ron", "position": "Sales Associate", "address": "Chelyabinsk, milaya street, house 3"}	40	'2019-6-18 15:43:41'	The musician performs.	delete	{employee}	{Products, Purchases}
69	58	{"full_name": "Mahone Walter", "position": "Assistant Store Manager", "address": "samara, Geroev street, house 7"}	69	'2015-3-19 16:15:32'	Pat yells.	analysis	{employee, delivery, clothing}	{tasks, Prices, Employees, Sizes, Classes}
70	180	{"full_name": "Pitts Janeen", "position": "Store director", "address": "samara, druzheskaya street, house 7"}	42	'2016-7-23 16:21:33'	The funny friend plays.	analysis	{add, update}	{Pull_classes, Customers}
71	87	{"full_name": "Jetton Michael", "position": "Customer Service Representative", "address": "Omsk, Geroev street, house 11"}	62	'2016-12-16 13:47:55'	The television is with the professor.	update	{clothing class, opening, analyses}	{Pull_classes, Pull_classes}
72	120	{"full_name": "Bice James", "position": "Assistant Store Manager", "address": "Saint-Petersburg, klaviatornya street, house 5"}	155	'2018-2-4 12:11:33'	The homework sings around Alumni Hall.	insert 	{clothing, store, size, store}	{Pull_classes, tasks, Stores, Purchases}
73	35	{"full_name": "Johnson Billy", "position": "Store Manager", "address": "Omsk, velikolepnaya street, house 5"}	183	'2019-4-27 14:53:27'	Bernie Sanders runs.	analysis	{delivery, analyses, clothing, customer, employee}	{Orders, tasks, Prices, Products, Sizes}
74	106	{"full_name": "Smith Barbara", "position": "Store director", "address": "Nizhniy Novgorod, velikolepnaya street, house 9"}	131	'2016-10-26 14:39:47'	Pablo screams.	insert 	{opening, sale, add}	{Purchases, Sizes}
75	85	{"full_name": "Gabrielson Anna", "position": "Visual Merchandiser", "address": "Omsk, milaya street, house 9"}	25	'2020-5-1 12:50:30'	Pat is to Kanye.	insert 	{clothing class, size, clothing}	{Stores, Sizes, Employees}
76	130	{"full_name": "Black Arnold", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, druzhnaya street, house 7"}	166	'2020-11-9 16:51:15'	Jaylon Smith is.	insert 	{analyses}	{tasks}
77	13	{"full_name": "Bacon Victoria", "position": "Sales Associate", "address": "Moscow, Berezovskaya street, house 11"}	95	'2016-2-26 18:27:58'	Donald Trump performs.	delete	{clothing, price increase, delivery}	{Stores, Products, Purchases}
78	116	{"full_name": "Livings Charles", "position": "Buyer", "address": "samara, Nikonova street, house 5"}	59	'2019-5-22 18:22:40'	Bernie Sanders jumps.	delete	{size, sale}	{Sizes, Products}
79	119	{"full_name": "Davis Kathleen", "position": "Visual Merchandiser", "address": "Kazan, Lenina street, house 7"}	174	'2019-3-4 15:22:52'	The weird program runs above Notre Dame.	update	{delivery, promotion, add, price}	{Employees}
80	30	{"full_name": "Mcdonough Elizabeth", "position": "Buyer", "address": "Moscow, Geroev street, house 3"}	139	'2016-12-17 18:30:46'	The stupid puppy screams with Donald Trump.	analysis	{employee, sale, clothing}	{Customers, Products, Classes}
81	61	{"full_name": "To Matthew", "position": "Store Manager", "address": "Moscow, klaviatornya street, house 11"}	10	'2018-8-28 18:21:43'	The funny professor walks.	update	{customer}	{Customers, Stores}
82	62	{"full_name": "Mahone Arnold", "position": "Store director", "address": "Kazan, Revoluzii street, house 11"}	10	'2016-12-9 16:29:20'	Jaylon Smith jumps to the stupid player!	update	{employee, new purchase, price increase, size, add}	{Orders, Stores, Orders}
83	136	{"full_name": "Coleman Sheila", "position": "Customer Service Representative", "address": "Omsk, Nikonova street, house 5"}	186	'2017-11-23 14:26:49'	Notre Dame runs.	analysis	{opening, analyses}	{Classes}
84	60	{"full_name": "Berenguer Irene", "position": "Visual Merchandiser", "address": "Chelyabinsk, Krasnih Zor street, house 11"}	21	'2020-10-9 17:10:35'	Sara is around the musician.	analysis	{update, price increase, employee}	{Classes, Stores, Classes}
85	186	{"full_name": "Bishop Lisa", "position": "Cashier", "address": "Kazan, zirkovaya street, house 11"}	63	'2018-5-10 17:41:20'	The beautiful computer performs.	insert 	{employee, size, update}	{Products, Prices, Sizes, Customers}
86	187	{"full_name": "Powell Hector", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, malenkaya street, house 11"}	188	'2017-12-8 12:45:33'	Kanye performs above Pablo.	delete	{price, opening, clothing, customer}	{Orders, Classes}
87	40	{"full_name": "Davis Hector", "position": "Assistant Store Manager", "address": "samara, Lyadova street, house 11"}	17	'2015-4-22 13:35:27'	Sara jumps.	analysis	{price, promotion, store}	{Sizes, Customers, Sizes}
88	151	{"full_name": "Lin Clinton", "position": "Cashier", "address": "Ekaterinburg, Lenina street, house 7"}	30	'2017-4-9 18:47:21'	The program sings.	delete	{bill}	{Classes, Customers, Classes}
89	164	{"full_name": "Ellerbe James", "position": "Store Manager", "address": "Omsk, strashnaya street, house 5"}	87	'2016-8-28 13:47:10'	The friend walks.	analysis	{sale, size}	{Purchases, Orders, Employees}
90	171	{"full_name": "Rock Scott", "position": "Buyer", "address": "Nizhniy Novgorod, Nikonova street, house 1"}	32	'2019-4-21 15:42:44'	The politician is near Alumni Hall.	analysis	{update, add}	{Pull_classes, Stores, Pull_classes}
91	85	{"full_name": "Vargas Kathleen", "position": "Buyer", "address": "Ekaterinburg, Krasnih Zor street, house 7"}	82	'2015-12-19 12:25:52'	The weird homework is.	delete	{clothing class, delivery, sale, add, employee}	{Classes, Orders, Employees, Products, Employees}
92	132	{"full_name": "Oconnell Brian", "position": "Buyer", "address": "Saint-Petersburg, velikolepnaya street, house 7"}	99	'2020-9-28 14:12:30'	Sara runs near the television.	delete	{delivery, sale, bill, size}	{Orders, tasks, Sizes, Classes}
93	96	{"full_name": "Fleck Tracey", "position": "Customer Service Representative", "address": "Chelyabinsk, Nikonova street, house 7"}	194	'2020-7-16 16:48:23'	The homework yells.	update	{analyses, clothing, store, analyses}	{Stores}
94	183	{"full_name": "Miller Bethany", "position": "Cashier", "address": "Ekaterinburg, druzheskaya street, house 5"}	90	'2015-12-1 18:46:47'	Alumni Hall kicks above Jaylon Smith.	delete	{price increase, add}	{Prices, Stores, Products, Employees}
95	72	{"full_name": "Roberson Robert", "position": "Inventory Control Specialist", "address": "Nizhniy Novgorod, Lyadova street, house 9"}	95	'2018-12-10 11:16:48'	The homework performs.	analysis	{price, promotion, bill, sale, size}	{Stores, Sizes}
96	37	{"full_name": "Heikes Donna", "position": "Store Manager", "address": "Moscow, krasivaya street, house 1"}	122	'2018-3-14 16:27:12'	The homework plays near Kanye.	update	{price, promotion, clothing, clothing class}	{Employees}
97	62	{"full_name": "Romain Lynn", "position": "Customer Service Representative", "address": "Ekaterinburg, Berezovskaya street, house 3"}	138	'2020-11-4 16:53:35'	Donald Trump plays to Alumni Hall.	analysis	{price increase, opening}	{tasks}
98	110	{"full_name": "Coleman Maryanne", "position": "Customer Service Representative", "address": "Ekaterinburg, Lyadova street, house 7"}	79	'2018-10-2 11:40:24'	The dog walks above the campus.	insert 	{bill, store, customer, add}	{Purchases, Stores, Employees, Products, Sizes}
99	76	{"full_name": "Livings Ron", "position": "Assistant Store Manager", "address": "Omsk, Krasnih Zor street, house 1"}	93	'2018-8-12 11:20:38'	Pat kicks to Jaylon Smith.	delete	{store, promotion}	{Customers, Stores, Products, Products}
100	157	{"full_name": "Morgan Jesus", "position": "Sales Associate", "address": "Moscow, Nikonova street, house 3"}	180	'2016-2-8 14:47:19'	Kanye screams with Jaylon Smith.	insert 	{employee, analyses, promotion, price increase, promotion}	{Classes, Employees}
101	176	{"full_name": "Rosati Lynn", "position": "Assistant Store Manager", "address": "Kazan, strashnaya street, house 11"}	27	'2016-2-10 17:46:52'	The stupid homework plays.	update	{employee, promotion}	{Orders, Classes, Employees, Stores, Classes}
102	72	{"full_name": "Eady Maryanne", "position": "Sales Associate", "address": "Novosibirsc, milaya street, house 11"}	64	'2018-4-22 13:27:13'	Donald Trump jumps near Donald Trump.	analysis	{price}	{Purchases, Classes, Sizes, Prices}
103	148	{"full_name": "Bebout Jaime", "position": "Customer Service Representative", "address": "Novosibirsc, strashnaya street, house 1"}	118	'2018-1-6 16:50:49'	Notre Dame performs.	delete	{update}	{Pull_classes, Customers, Orders, Customers}
104	94	{"full_name": "Mitchell Anna", "position": "Cashier", "address": "Novosibirsc, druzhnaya street, house 7"}	188	'2017-11-3 13:16:21'	Jaylon Smith plays.	update	{size}	{Orders, Stores, Employees}
105	122	{"full_name": "Johnson Brian", "position": "Cashier", "address": "Novosibirsc, druzheskaya street, house 7"}	7	'2015-10-6 16:14:28'	The homework screams to Sara.	delete	{clothing, employee}	{Pull_classes, Purchases, Classes, Sizes, tasks}
106	181	{"full_name": "Embree Dede", "position": "Sales Associate", "address": "Saint-Petersburg, velikolepnaya street, house 11"}	139	'2016-8-12 18:35:51'	Notre Dame kicks.	delete	{update}	{Classes, Customers, Classes}
107	189	{"full_name": "Zanchez John", "position": "Store Manager", "address": "Kazan, milaya street, house 5"}	155	'2015-2-18 14:29:54'	Pablo sings.	delete	{analyses, sale, add}	{Pull_classes}
108	136	{"full_name": "Wyant Amanda", "position": "Assistant Store Manager", "address": "Omsk, malenkaya street, house 9"}	192	'2019-9-18 18:41:11'	The computer yells around the stupid campus.	analysis	{employee, store, size, new purchase}	{Prices, Employees, Classes}
109	185	{"full_name": "Bebout David", "position": "Store director", "address": "Chelyabinsk, druzhnaya street, house 11"}	162	'2020-11-24 17:39:37'	The funny television jumps above the puppy.	update	{employee, store, customer, opening}	{Classes}
110	105	{"full_name": "Cline Brian", "position": "Assistant Store Manager", "address": "Novosibirsc, zirkovaya street, house 7"}	134	'2017-3-2 13:43:10'	Pat walks with Sara.	delete	{promotion, bill, analyses}	{Orders, Prices, Products, Purchases}
111	8	{"full_name": "Rosati Anna", "position": "Buyer", "address": "Ekaterinburg, Nikonova street, house 3"}	130	'2018-2-9 11:10:48'	The friend plays above the musician.	insert 	{price increase, customer, clothing}	{Pull_classes, tasks, tasks}
112	10	{"full_name": "Ellerbe Gerald", "position": "Visual Merchandiser", "address": "Omsk, strashnaya street, house 3"}	197	'2015-4-21 11:43:45'	Kanye walks.	update	{opening, clothing}	{Pull_classes, Orders, Stores, Prices}
113	37	{"full_name": "Cline Victoria", "position": "Cashier", "address": "Omsk, zirkovaya street, house 11"}	21	'2019-7-4 15:11:13'	The puppy kicks.	delete	{sale}	{Employees, Sizes}
114	199	{"full_name": "Johnson Elizabeth", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, Krasnih Zor street, house 5"}	120	'2015-5-6 14:29:58'	The dog runs.	delete	{employee, store, add}	{Purchases, Classes, Sizes, tasks}
115	129	{"full_name": "Baldwin Dylan", "position": "Sales Associate", "address": "Omsk, Moscovskaya street, house 7"}	78	'2020-7-19 17:52:38'	The weird professor performs at the homework.	update	{delivery, bill, promotion}	{tasks}
116	184	{"full_name": "To Cheryl", "position": "Customer Service Representative", "address": "Ekaterinburg, druzheskaya street, house 3"}	117	'2015-1-12 12:12:57'	The musician jumps.	analysis	{opening, opening}	{Pull_classes, Employees, Prices}
117	176	{"full_name": "Moore Jesus", "position": "Visual Merchandiser", "address": "Nizhniy Novgorod, milaya street, house 5"}	10	'2020-10-16 17:50:45'	The computer performs.	update	{opening, analyses, promotion, update}	{tasks, Pull_classes}
118	103	{"full_name": "Wagner Dede", "position": "Inventory Control Specialist", "address": "Nizhniy Novgorod, Lyadova street, house 1"}	39	'2017-2-11 16:36:16'	Kanye kicks.	update	{promotion}	{Pull_classes, Products, Employees}
119	16	{"full_name": "Riggle Elizabeth", "position": "Inventory Control Specialist", "address": "Chelyabinsk, druzhnaya street, house 9"}	43	'2019-6-8 15:13:43'	The campus is.	delete	{bill, store, customer, price increase}	{Stores}
120	119	{"full_name": "Davis Anna", "position": "Sales Associate", "address": "Novosibirsc, klaviatornya street, house 1"}	45	'2018-3-1 14:24:21'	The program walks above Alumni Hall.	insert 	{clothing}	{Purchases, Classes, Customers, Products, Prices}
121	78	{"full_name": "Byrd Walter", "position": "Store Manager", "address": "Kazan, Nikonova street, house 5"}	77	'2018-6-1 16:48:45'	The musician performs with Bernie Sanders.	insert 	{store}	{Stores}
122	187	{"full_name": "Oconnell Jarvis", "position": "Cashier", "address": "Ekaterinburg, druzhnaya street, house 3"}	111	'2018-7-13 15:45:53'	Pablo screams.	update	{store, add, bill}	{Purchases, tasks, Prices}
123	66	{"full_name": "Tarpley Kenneth", "position": "Inventory Control Specialist", "address": "Kazan, milaya street, house 5"}	176	'2015-8-15 13:45:12'	The weird professor performs.	delete	{sale, size, clothing class}	{Classes, Sizes, Orders}
124	28	{"full_name": "Gonzales Scott", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, krasivaya street, house 3"}	48	'2016-12-27 12:34:33'	Kanye yells!	insert 	{opening, price}	{Classes, Stores, Prices, tasks}
125	114	{"full_name": "Mcfarlane Mary", "position": "Inventory Control Specialist", "address": "Omsk, klaviatornya street, house 7"}	27	'2017-2-25 16:40:31'	The beautiful program is.	delete	{promotion, add, update}	{Prices}
126	72	{"full_name": "Smith Adrian", "position": "Buyer", "address": "Omsk, Nikonova street, house 7"}	31	'2020-2-27 15:10:40'	Notre Dame jumps above the weird politician.	update	{employee, analyses, bill, size, size}	{tasks, Employees, Prices, tasks}
127	61	{"full_name": "Stewart Dylan", "position": "Store Manager", "address": "samara, druzheskaya street, house 7"}	141	'2019-10-14 15:28:20'	The beautiful campus plays.	insert 	{price, analyses, promotion, store, new purchase}	{Purchases}
128	118	{"full_name": "Coleman Sandra", "position": "Visual Merchandiser", "address": "Saint-Petersburg, Moscovskaya street, house 1"}	18	'2015-4-28 16:22:47'	Sara kicks around the professor.	insert 	{store, clothing class}	{Orders, Stores, Employees, Classes}
129	31	{"full_name": "Morgan Chang", "position": "Assistant Store Manager", "address": "Nizhniy Novgorod, zirkovaya street, house 11"}	146	'2018-5-26 13:26:56'	Sara jumps!	update	{employee, bill, price increase, new purchase, promotion}	{Stores, Pull_classes}
130	186	{"full_name": "Embree Arnold", "position": "Buyer", "address": "Moscow, Lyadova street, house 3"}	89	'2019-8-9 12:52:54'	The weird musician jumps!	insert 	{bill, analyses}	{Classes, Products, tasks}
131	175	{"full_name": "Moore Mary", "position": "Assistant Store Manager", "address": "Novosibirsc, strashnaya street, house 7"}	170	'2016-8-9 17:48:43'	The funny friend yells near Pat.	delete	{clothing class}	{Purchases, Prices, tasks, Stores}
132	181	{"full_name": "Mcnaughton Allen", "position": "Store director", "address": "Moscow, krasivaya street, house 5"}	101	'2020-3-24 15:28:11'	The friend is.	insert 	{bill, sale, size, clothing}	{Classes, Stores, Sizes, tasks}
133	186	{"full_name": "Reza Gerald", "position": "Assistant Store Manager", "address": "Novosibirsc, klaviatornya street, house 7"}	109	'2018-5-4 17:33:54'	The computer sings with Sara.	delete	{clothing class, add, opening}	{Prices, Stores, Sizes, tasks}
134	113	{"full_name": "Hughes Pat", "position": "Cashier", "address": "Saint-Petersburg, malenkaya street, house 1"}	77	'2016-10-3 16:53:41'	Nick jumps!	delete	{employee, opening, clothing, size, opening}	{Prices}
135	69	{"full_name": "Coleman Monica", "position": "Cashier", "address": "Ekaterinburg, Berezovskaya street, house 1"}	167	'2017-2-21 18:44:52'	Donald Trump runs with the homework.	analysis	{employee, price, price increase, add, new purchase}	{Products, Prices, Customers, Classes}
136	7	{"full_name": "Tarpley Marlon", "position": "Visual Merchandiser", "address": "Kazan, milaya street, house 11"}	173	'2018-10-16 16:45:39'	Alumni Hall jumps.	delete	{clothing class, customer, delivery}	{Prices, Classes, Stores, Customers, Orders}
137	86	{"full_name": "Pitts Mary", "position": "Assistant Store Manager", "address": "Saint-Petersburg, malenkaya street, house 11"}	141	'2018-7-23 11:14:38'	Jaylon Smith kicks around Sara!	analysis	{delivery, size}	{Sizes, Customers}
138	17	{"full_name": "Embree Walter", "position": "Customer Service Representative", "address": "Nizhniy Novgorod, zirkovaya street, house 9"}	54	'2017-1-3 13:42:33'	Pat walks.	analysis	{size, new purchase, bill}	{Purchases, Employees}
139	183	{"full_name": "Black Dede", "position": "Cashier", "address": "Kazan, krasivaya street, house 3"}	27	'2020-6-23 18:13:40'	Notre Dame screams.	delete	{opening}	{Classes, Employees, Orders, Purchases}
140	82	{"full_name": "Hughes Irene", "position": "Visual Merchandiser", "address": "Saint-Petersburg, strashnaya street, house 3"}	167	'2016-7-10 16:29:32'	The dog kicks.	delete	{update, opening, promotion, new purchase, promotion}	{Stores, Orders}
141	90	{"full_name": "Mcnaughton Matthew", "position": "Visual Merchandiser", "address": "Saint-Petersburg, Lyadova street, house 3"}	142	'2019-10-21 18:30:45'	The dog walks.	insert 	{clothing class}	{Purchases, Employees, Sizes}
142	140	{"full_name": "Gabrielson Adrian", "position": "Store director", "address": "Chelyabinsk, druzhnaya street, house 3"}	20	'2019-1-22 13:13:36'	Bernie Sanders performs with the stupid dog.	insert 	{promotion, sale, add, new purchase}	{Sizes}
143	192	{"full_name": "Wagner Trina", "position": "Store director", "address": "samara, Nikonova street, house 3"}	64	'2016-9-18 18:12:48'	The weird musician runs.	analysis	{employee, opening, update, size, analyses}	{Pull_classes, tasks, Prices, Employees, Products}
144	30	{"full_name": "Bailey James", "position": "Store director", "address": "samara, Geroev street, house 5"}	37	'2015-8-13 18:17:33'	The funny politician plays near Donald Trump.	delete	{store}	{Purchases, Sizes}
145	29	{"full_name": "Stewart Joy", "position": "Sales Associate", "address": "Ekaterinburg, Nikonova street, house 1"}	18	'2015-11-12 11:26:24'	The stupid professor kicks around Jaylon Smith.	analysis	{size, price}	{Pull_classes, Stores}
146	98	{"full_name": "Cline Kenneth", "position": "Visual Merchandiser", "address": "Saint-Petersburg, druzheskaya street, house 7"}	111	'2018-12-27 18:28:38'	Donald Trump plays above the stupid program.	analysis	{price, promotion, update}	{Orders, Prices, Classes}
147	119	{"full_name": "Bishop Corey", "position": "Buyer", "address": "Ekaterinburg, Revoluzii street, house 5"}	98	'2019-1-12 14:13:36'	Alumni Hall runs.	insert 	{size, update}	{tasks, Purchases}
148	55	{"full_name": "Griffin Donna", "position": "Customer Service Representative", "address": "Kazan, Geroev street, house 5"}	108	'2019-1-11 15:49:19'	Notre Dame walks around Alumni Hall.	analysis	{update}	{Customers, Products}
149	184	{"full_name": "Mohamed Walter", "position": "Inventory Control Specialist", "address": "Moscow, Geroev street, house 5"}	106	'2019-3-3 16:41:45'	Kanye sings.	analysis	{price, add, clothing class}	{Purchases, Prices, Employees, Orders}
150	12	{"full_name": "Miller Evelyn", "position": "Buyer", "address": "Kazan, velikolepnaya street, house 7"}	130	'2019-3-11 16:50:59'	The musician sings.	insert 	{clothing class, update, bill}	{Purchases, tasks}
151	86	{"full_name": "Jetton Sheila", "position": "Assistant Store Manager", "address": "Chelyabinsk, Lenina street, house 3"}	180	'2018-5-18 11:17:51'	The program runs.	delete	{price}	{Prices}
152	116	{"full_name": "Lin Jerome", "position": "Store Manager", "address": "Moscow, zirkovaya street, house 3"}	106	'2015-5-3 16:11:41'	Pablo runs at Jaylon Smith.	insert 	{clothing class, analyses, promotion, size}	{Purchases, Employees, Sizes, Classes}
153	10	{"full_name": "Gonzales Ron", "position": "Cashier", "address": "Ekaterinburg, Moscovskaya street, house 7"}	85	'2015-5-21 15:40:13'	The professor kicks with Notre Dame!	update	{price, employee, clothing}	{Classes}
154	84	{"full_name": "Mitchell Ron", "position": "Cashier", "address": "Saint-Petersburg, Lyadova street, house 11"}	115	'2017-4-25 13:50:36'	The player walks above Alumni Hall.	insert 	{sale, clothing}	{Prices, tasks, Products}
155	55	{"full_name": "Mask Michael", "position": "Buyer", "address": "Chelyabinsk, krasivaya street, house 11"}	64	'2017-4-23 17:29:46'	The stupid computer performs.	delete	{employee, clothing, price increase, bill, clothing class}	{Customers}
156	192	{"full_name": "Fry Carol", "position": "Cashier", "address": "samara, strashnaya street, house 11"}	52	'2015-10-24 15:31:18'	The campus performs above Notre Dame.	update	{clothing class, sale, add, customer}	{Orders, Sizes}
157	195	{"full_name": "Oconnell Michael", "position": "Inventory Control Specialist", "address": "Nizhniy Novgorod, Krasnih Zor street, house 9"}	192	'2020-4-24 13:48:43'	The weird television sings.	analysis	{add, bill}	{Purchases, Customers}
158	109	{"full_name": "Miller Irene", "position": "Buyer", "address": "Saint-Petersburg, Revoluzii street, house 3"}	16	'2020-4-22 15:37:55'	The politician jumps around Pablo.	insert 	{clothing, price}	{Purchases, Sizes, Customers, Customers}
159	156	{"full_name": "Griffin Norman", "position": "Customer Service Representative", "address": "Chelyabinsk, Geroev street, house 1"}	90	'2020-12-14 18:33:26'	The stupid musician is.	insert 	{price}	{Classes, Purchases}
160	6	{"full_name": "Harris Daniel", "position": "Cashier", "address": "Moscow, druzheskaya street, house 3"}	196	'2020-1-21 18:49:25'	The politician walks.	insert 	{bill, clothing class}	{Prices}
161	1	{"full_name": "Park Adrian", "position": "Buyer", "address": "Saint-Petersburg, Berezovskaya street, house 5"}	13	'2018-12-7 11:46:54'	Nick yells near the player.	delete	{price, sale, customer, delivery}	{Classes, Orders, Prices}
162	103	{"full_name": "Cabrales Mary", "position": "Inventory Control Specialist", "address": "Omsk, malenkaya street, house 7"}	167	'2019-5-16 18:34:38'	The puppy is.	insert 	{clothing, bill, customer}	{Prices, Classes, Products, Products}
163	49	{"full_name": "Riggle Anna", "position": "Cashier", "address": "samara, Nikonova street, house 7"}	53	'2017-5-12 18:22:16'	Pat performs.	delete	{sale, store, customer}	{Sizes}
164	37	{"full_name": "Marinese Clara", "position": "Store director", "address": "Novosibirsc, Nikonova street, house 1"}	72	'2018-1-10 18:46:31'	Kanye jumps.	update	{store, clothing class}	{Customers}
165	48	{"full_name": "Romney Arnold", "position": "Sales Associate", "address": "Moscow, Lyadova street, house 9"}	137	'2018-2-24 17:39:30'	Donald Trump walks.	update	{add}	{Purchases, tasks, Classes, Employees, Pull_classes}
166	58	{"full_name": "Mcdonough Jennifer", "position": "Customer Service Representative", "address": "Moscow, Krasnih Zor street, house 3"}	157	'2016-2-16 15:41:37'	The funny dog kicks around Kanye.	analysis	{clothing class, opening, sale}	{Classes, Prices, Sizes}
167	191	{"full_name": "Tovar Jack", "position": "Cashier", "address": "Saint-Petersburg, milaya street, house 7"}	13	'2020-9-3 18:33:55'	Nick kicks above Alumni Hall.	delete	{price}	{Purchases, Prices, tasks, Customers}
168	135	{"full_name": "Fleck Joann", "position": "Assistant Store Manager", "address": "Omsk, Moscovskaya street, house 5"}	21	'2017-12-23 17:16:29'	Pat plays.	update	{analyses, store, price increase, delivery}	{Prices, Customers, Products}
169	39	{"full_name": "Harrison Carol", "position": "Assistant Store Manager", "address": "Novosibirsc, Revoluzii street, house 11"}	152	'2015-6-13 14:40:49'	Bernie Sanders is!	update	{update, delivery}	{Products, Stores}
170	100	{"full_name": "Lawson Curtis", "position": "Store Manager", "address": "Chelyabinsk, krasivaya street, house 5"}	178	'2016-9-4 15:51:43'	The campus is.	analysis	{update, bill, size, delivery}	{Orders, Products, Stores}
171	99	{"full_name": "Mcfarlane Marlon", "position": "Customer Service Representative", "address": "Chelyabinsk, milaya street, house 9"}	144	'2019-9-15 17:39:38'	The beautiful dog kicks.	update	{customer}	{tasks, Customers, Stores}
172	178	{"full_name": "Zanchez Arnold", "position": "Sales Associate", "address": "Ekaterinburg, strashnaya street, house 7"}	109	'2020-6-18 18:32:27'	The stupid friend screams near the funny musician.	delete	{clothing class, update, employee}	{Stores, Sizes}
173	118	{"full_name": "Hoggard Barbara", "position": "Visual Merchandiser", "address": "Moscow, malenkaya street, house 5"}	55	'2020-2-11 15:25:14'	The beautiful program plays.	update	{update, clothing, price}	{Orders, Prices, Employees}
174	134	{"full_name": "Heikes David", "position": "Sales Associate", "address": "Novosibirsc, velikolepnaya street, house 1"}	134	'2019-3-20 12:31:15'	Pablo screams.	delete	{employee}	{Purchases, Orders, Stores, Orders}
175	118	{"full_name": "Mitchell Daniel", "position": "Inventory Control Specialist", "address": "Omsk, Lyadova street, house 11"}	137	'2019-2-23 14:51:54'	Bernie Sanders walks above the stupid dog.	update	{delivery, bill}	{tasks, Customers, Employees}
176	164	{"full_name": "Berenguer Clinton", "position": "Store Manager", "address": "Chelyabinsk, krasivaya street, house 11"}	117	'2018-9-27 13:38:17'	Donald Trump performs.	update	{clothing class, store, promotion}	{Employees, Products, Products}
177	108	{"full_name": "Bass Ron", "position": "Sales Associate", "address": "Chelyabinsk, milaya street, house 7"}	54	'2018-12-2 17:53:46'	Nick plays with Sara.	insert 	{opening}	{Products, Stores, Customers, Classes}
178	161	{"full_name": "Benton Bethany", "position": "Assistant Store Manager", "address": "Chelyabinsk, malenkaya street, house 7"}	86	'2015-7-6 17:14:52'	Bernie Sanders is at Donald Trump.	insert 	{clothing class, opening, delivery}	{Stores}
179	153	{"full_name": "Gabrielson Teresa", "position": "Store director", "address": "Kazan, Berezovskaya street, house 9"}	159	'2019-1-14 15:46:29'	Sara screams above Pat.	delete	{price, opening, analyses, clothing}	{Purchases, Pull_classes, Prices, Purchases}
180	20	{"full_name": "Hoggard Jack", "position": "Sales Associate", "address": "Novosibirsc, malenkaya street, house 7"}	87	'2016-3-19 12:22:19'	Kanye runs around Nick.	analysis	{delivery, store, new purchase}	{Orders, Prices, Purchases}
181	51	{"full_name": "Bebout Dylan", "position": "Cashier", "address": "Moscow, krasivaya street, house 11"}	7	'2015-8-16 11:45:27'	Sara performs.	insert 	{clothing class, bill, clothing class}	{tasks, Classes}
182	54	{"full_name": "Black Adrian", "position": "Inventory Control Specialist", "address": "Chelyabinsk, Lyadova street, house 9"}	127	'2018-8-17 12:47:23'	The funny puppy sings above the campus.	insert 	{promotion, sale, size, price}	{Prices, Products}
183	61	{"full_name": "Smith Kenneth", "position": "Assistant Store Manager", "address": "Ekaterinburg, Lyadova street, house 1"}	1	'2020-6-16 13:26:59'	The politician screams to Kanye.	delete	{price, employee, promotion}	{Stores, Sizes, Purchases}
184	36	{"full_name": "Harrison Allen", "position": "Assistant Store Manager", "address": "Omsk, strashnaya street, house 11"}	137	'2015-3-21 15:37:26'	Notre Dame is with the television.	delete	{delivery, bill, size}	{Products}
185	135	{"full_name": "To Joy", "position": "Inventory Control Specialist", "address": "Nizhniy Novgorod, zirkovaya street, house 3"}	85	'2017-12-12 13:31:18'	Pablo is with Jaylon Smith.	analysis	{employee, clothing, add, sale}	{Employees, Products, Orders}
186	39	{"full_name": "Wagner Raymond", "position": "Store director", "address": "Novosibirsc, druzheskaya street, house 5"}	163	'2017-5-8 18:38:30'	The weird musician jumps.	analysis	{price, opening}	{Pull_classes, Customers, Orders}
187	54	{"full_name": "Oritz Joseph", "position": "Store Manager", "address": "Moscow, Berezovskaya street, house 5"}	60	'2016-11-22 12:30:29'	Notre Dame yells to Alumni Hall.	update	{delivery, new purchase, promotion}	{Orders, Products, tasks}
188	50	{"full_name": "Cline Amanda", "position": "Cashier", "address": "Moscow, velikolepnaya street, house 7"}	113	'2017-1-27 11:44:58'	Bernie Sanders yells.	analysis	{sale}	{Prices, Customers, Stores}
189	66	{"full_name": "Mitchell Elizabeth", "position": "Sales Associate", "address": "Moscow, Krasnih Zor street, house 5"}	170	'2015-8-23 18:50:43'	The funny puppy jumps.	update	{employee, clothing, store, bill}	{Pull_classes, Employees}
190	144	{"full_name": "Baldwin Marlon", "position": "Sales Associate", "address": "Saint-Petersburg, druzheskaya street, house 7"}	64	'2016-9-15 14:18:37'	Notre Dame runs around Alumni Hall.	delete	{price increase}	{Purchases, Classes, tasks, Products}
191	41	{"full_name": "Mask Mary", "position": "Sales Associate", "address": "Saint-Petersburg, Geroev street, house 1"}	128	'2019-5-7 11:37:54'	The weird homework walks.	delete	{price increase, add}	{tasks, Classes, Employees, Stores}
192	180	{"full_name": "Wagner Janet", "position": "Cashier", "address": "Moscow, strashnaya street, house 9"}	68	'2015-2-15 13:50:33'	The weird musician screams.	insert 	{clothing, size, employee}	{Purchases, Pull_classes, tasks, Customers, Products}
193	38	{"full_name": "Bebout Yolanda", "position": "Visual Merchandiser", "address": "Ekaterinburg, zirkovaya street, house 11"}	144	'2020-3-14 14:20:21'	The stupid television is.	insert 	{analyses, clothing, size, customer, price}	{Customers}
194	149	{"full_name": "Fry Joy", "position": "Customer Service Representative", "address": "samara, Geroev street, house 9"}	187	'2019-9-10 17:36:42'	The beautiful program sings!	analysis	{clothing class, promotion, customer, add, clothing}	{tasks, Stores, Products}
195	34	{"full_name": "Rivera Anna", "position": "Store Manager", "address": "Ekaterinburg, Berezovskaya street, house 11"}	167	'2015-2-27 15:23:11'	The funny friend runs around Pat.	insert 	{price increase, update}	{Purchases, Prices, Sizes, Sizes}
196	199	{"full_name": "Lawson Amanda", "position": "Cashier", "address": "samara, velikolepnaya street, house 11"}	122	'2018-12-3 16:41:16'	Nick sings above Nick.	update	{delivery, analyses, update}	{Prices, Employees, Prices}
197	112	{"full_name": "Johnson Daniel", "position": "Visual Merchandiser", "address": "Saint-Petersburg, velikolepnaya street, house 9"}	127	'2018-4-1 11:14:35'	Pat walks to Notre Dame.	update	{price, add}	{Classes, Employees, Sizes, Stores}
198	102	{"full_name": "Bacon Lisa", "position": "Inventory Control Specialist", "address": "Omsk, malenkaya street, house 3"}	168	'2015-2-19 17:26:27'	The weird friend kicks with the weird homework.	insert 	{price, delivery, store, size, analyses}	{Orders, Purchases}
199	39	{"full_name": "Moyer Marlon", "position": "Store Manager", "address": "Chelyabinsk, zirkovaya street, house 3"}	194	'2020-7-5 11:13:45'	Nick is above Nick.	analysis	{price, size, bill}	{Employees, Products, Stores}
\.

ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);

ALTER TABLE ONLY sessions
    ADD CONSTRAINT session_pkey PRIMARY KEY (session_id);
ALTER TABLE ONLY sessions
    ADD FOREIGN KEY (user_id) REFERENCES users;

ALTER TABLE ONLY interactions
    ADD CONSTRAINT interaction_pkey PRIMARY KEY (interaction_id);
ALTER TABLE ONLY interactions
    ADD FOREIGN KEY (user_id) REFERENCES users;
ALTER TABLE ONLY interactions
    ADD FOREIGN KEY (session_id) REFERENCES sessions;
