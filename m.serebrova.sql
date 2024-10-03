
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS labor;


CREATE DATABASE labor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc ;


ALTER DATABASE labor OWNER TO postgres;

\connect labor

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public.education (
    id_education integer NOT NULL,
    degree_of_education character varying NOT NULL
);


ALTER TABLE public.education OWNER TO postgres;


CREATE TABLE public.firm (
    id_firm integer NOT NULL,
    branch_city character varying NOT NULL,
    money_turnover numeric NOT NULL,
    date_of_foundation date NOT NULL,
    name character varying
);


ALTER TABLE public.firm OWNER TO postgres;



CREATE TABLE public.job_title (
    id_job_title integer NOT NULL,
    additional_requirements character varying,
    bonuses character varying,
    premium character varying,
    job_title character varying NOT NULL,
    id_required_education integer NOT NULL
);


ALTER TABLE public.job_title OWNER TO postgres;



CREATE TABLE public.last_work (
    id_last_work integer NOT NULL,
    term_of_the_work character varying NOT NULL,
    responsibilities character varying NOT NULL,
    reason_for_dismissal character varying NOT NULL
);


ALTER TABLE public.last_work OWNER TO postgres;



CREATE TABLE public.responses (
    id_worker integer NOT NULL,
    id_vacancy integer NOT NULL,
    date date,
    status character varying
);


ALTER TABLE public.responses OWNER TO postgres;



CREATE TABLE public.vacancies (
    id_vacancy integer NOT NULL,
    responsibilities character varying NOT NULL,
    salary numeric NOT NULL,
    firm_id integer NOT NULL,
    job_title_id integer NOT NULL,
    date_of_publication date,
    name character varying
);


ALTER TABLE public.vacancies OWNER TO postgres;



CREATE TABLE public.workers (
    id_worker integer NOT NULL,
    surname character varying NOT NULL,
    name character varying NOT NULL,
    otchestvo character varying NOT NULL,
    login character varying NOT NULL,
    birthday date NOT NULL,
    family_status character varying NOT NULL,
    id_last_work integer NOT NULL,
    id_education integer NOT NULL,
    proposed_position character varying,
    work_experience integer
);


ALTER TABLE public.workers OWNER TO postgres;



COPY public.education (id_education, degree_of_education) FROM stdin;
1	дошкольное
2	начальное общее
4	среднее общее
3	основное общее
6	бакалавриат
5	среднее профессиональное
8	аспирантура
7	магистратура
\.




COPY public.firm (id_firm, branch_city, money_turnover, date_of_foundation, name) FROM stdin;
1	Владивосток	35000.00	2020-04-06	восадули
2	Тюмень	30000.00	2019-12-11	world class
3	Санкт-Петербург	50000.00	2017-10-11	trust
4	Москва	100000.00	2014-09-13	flip-flop
5	Пермь	33000.00	2018-02-02	Каляев
6	Сочи	60000.00	2017-04-09	Дримлэнд
7	Екатеринбург	40000.00	2016-09-09	Солнце Сахары
8	Тольятти	20000.00	2021-07-01	Алые паруса
9	Архангельск	25000.00	2020-03-05	Мятный карась
\.




COPY public.job_title (id_job_title, additional_requirements, bonuses, premium, job_title, id_required_education) FROM stdin;
7	водительские права	\N	чаевые\n	таксист\n	4
1	\N	бесплатный обед, членство в спортклубе	премии по заслугам работы 1 раз в месяц	учитель физкультуры	5
2	\N	\N	\N	уборщик	3
3	\N	медицинское страхование, оплачиваемый отпуск	премии по заслугам работы 3 раза в месяц	хирург\n	8
4	\N	\N	премия по заслугам работы 1 раз в месяц	маляр	3
5	коммуникабельность	бесплатное питание	чаевые	официант	3
6	\N	бесплатное питание	премии по заслугам работы 2 раза в месяц	повар	5
8	\N	\N	\N	продавец	3
9	\N	\N	\N	электрик	5
\.




COPY public.last_work (id_last_work, term_of_the_work, responsibilities, reason_for_dismissal) FROM stdin;
1	учитель ритмики	вести уроки танца	по собственному желанию\n
2	дворник	держать двор в чистоте	по собственному желанию
3	хирург	проводить операции	в связи с сокращением штата
4	маляр	подготовка и покраска поверхностей	по собственному желанию
5	официант	обслуживание гостей	неудовлетворительные условия работы
6	повар-кондитер	приготовление десертов	в связи с сокращением штата
7	личный водитель	осуществление перевозок нанимателя	банкротство нанимателя
8	продавец-консультант	консультирование посетителей и оформление покупок	в связи с сокращением штата
9	электрик	поддержание исправного состояния устройств	неудовлетворительные условия работы
\.




COPY public.responses (id_worker, id_vacancy, date, status) FROM stdin;
1	15	2024-02-14	under consideration
2	8	2024-01-13	under consideration
3	9	2024-01-26	under consideration
4	11	2024-01-09	approved
5	11	2024-01-28	under consideration
6	2	2024-01-09	approved
7	6	2024-02-25	approved
8	3	2024-02-02	approved
9	9	2024-02-21	under consideration
10	7	2024-01-09	under consideration
11	11	2024-02-22	under consideration
12	11	2024-02-19	under consideration
13	11	2024-02-08	under consideration
14	7	2024-02-09	under consideration
15	7	2024-02-01	under consideration
16	7	2024-02-20	under consideration
\.




COPY public.vacancies (id_vacancy, responsibilities, salary, firm_id, job_title_id, date_of_publication, name) FROM stdin;
1	проводить уроки физкультуры для средней школы	30000	1	1	2024-02-09	учитель
2	тщательно прибирать отведенную зону\n	15000	2	2	2023-12-12	уборщик
3	проводить уроки физкультуры для младшей школы	53000	4	1	2024-02-02	учитель
4	проводить уборку на отведенном этаже торгового центра	17500	3	2	2023-10-20	уборщик
5	проводить операции	150000	5	3	2023-07-07	хирург
6	красить стены\n	55000	3	4	2023-09-01	маляр
7	обслуживать гостей ресторана	50000	2	5	2024-01-30	официант
8	готовить блюда из меню	35000	7	6	2023-12-15	повар
9	производить поездки по заказам	45000	8	7	2023-09-08	таксист
10	стоять за кассой и обслуживать клиентов	20000	1	8	2024-02-03	кассир
11	обеспечивать поддержание исправного состояния оборудования	65000	3	9	2024-01-08	электрик
12	красить стены	40000	5	4	2023-09-23	маляр
13	обслуживать гостей кафе	50000	6	5	2023-02-03	официант
14	готовить блюда из меню	40000	6	6	2024-02-13	повар
15	ассистировать на операциях	250000	4	3	2024-01-26	хирург
\.



COPY public.workers (id_worker, surname, name, otchestvo, login, birthday, family_status, id_last_work, id_education, proposed_position, work_experience) FROM stdin;
1	Смирнов	Алексей	Романович	qw8u7	1990-09-04	не женат	3	8	хирург	7
2	Ефимова	Анастасия	Витальевна	we5o9	1985-09-24	замужем	6	5	кондитер	10
3	Попов	Дмитрий	Дмитриевич	ty0o8	1987-01-01	женат	7	3	таксист	4
4	Рожков	Олег	Игнатович	mj5j6	1980-04-25	женат	9	5	электрик	15
5	Филлипов	Дмитрий	Владиславович	js5t2	1979-02-26	не женат	9	5	электрик	17
6	Кульков	Василий	Михайлович	gy6c4	1991-07-21	не женат	2	3	дворник	6
7	Новосельцева	Ксения	Витальевна	iu3o0	1984-09-04	замужем	4	3	маляр	8
8	Рудаков	Михаил	Валерьевич	wr5g7\n	1990-05-07	не женат	1	5	учитель ритмики/ физкультуры	6
9	Кучеева	Дарья	Сергеевна	yy8u9	2004-09-14	замужем	7	3	личный водитель	1
10	Сереброва	Мария	Андреевна	jh9k3	2004-09-13	не замужем	5	4	официант	2
11	Кузютин	Михаил	Юрьевич	rt56y	1980-08-08	женат	9	5	электрик	13
12	Миронова	Марина	Александровна	u78i9	1975-09-03	замужем	9	5	электрик	15
13	Андреев	Валерий	Михайлович	io90p	1970-01-01	не женат	9	5	электрик	3
14	Попов	Иван	Кириллович	ii90o	1990-02-08	женат	5	4	официант	6
15	Фролов	Кирилл	Петрович	ji89k	1995-08-01	не женат	5	4	официант	4
16	Витальев	Алексей	Алексеевич	o9op0	1980-06-06	женат	5	4	официант	4
\.



ALTER TABLE public.workers
    ADD CONSTRAINT birthday CHECK ((date_part('year'::text, age((birthday)::timestamp with time zone)) > (18)::double precision)) NOT VALID;


ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id_education);




ALTER TABLE ONLY public.firm
    ADD CONSTRAINT firm_pkey PRIMARY KEY (id_firm);



ALTER TABLE ONLY public.job_title
    ADD CONSTRAINT job_title_pkey PRIMARY KEY (id_job_title);




ALTER TABLE ONLY public.last_work
    ADD CONSTRAINT "last work_pkey" PRIMARY KEY (id_last_work);




ALTER TABLE ONLY public.workers
    ADD CONSTRAINT login UNIQUE (login) INCLUDE (login);




ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT unique_employee_department EXCLUDE USING btree (id_vacancy WITH =, firm_id WITH =, job_title_id WITH =, date_of_publication WITH =);




ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id_vacancy);




ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id_worker);




ALTER TABLE ONLY public.responses
    ADD CONSTRAINT workers_vacancies_pkey PRIMARY KEY (id_worker, id_vacancy);




CREATE INDEX ix_birthday ON public.workers USING btree (birthday) WITH (deduplicate_items='true');




ALTER TABLE ONLY public.workers
    ADD CONSTRAINT education_fkey FOREIGN KEY (id_education) REFERENCES public.education(id_education) NOT VALID;




ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT firm_fkey FOREIGN KEY (firm_id) REFERENCES public.firm(id_firm) NOT VALID;




ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT job_title_fkey FOREIGN KEY (job_title_id) REFERENCES public.job_title(id_job_title) NOT VALID;




ALTER TABLE ONLY public.workers
    ADD CONSTRAINT last_work_fkey FOREIGN KEY (id_last_work) REFERENCES public.last_work(id_last_work) NOT VALID;




ALTER TABLE ONLY public.responses
    ADD CONSTRAINT vacancies_fkey FOREIGN KEY (id_vacancy) REFERENCES public.vacancies(id_vacancy) NOT VALID;




ALTER TABLE ONLY public.responses
    ADD CONSTRAINT workers_fkey FOREIGN KEY (id_worker) REFERENCES public.workers(id_worker) NOT VALID;



