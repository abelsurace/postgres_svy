--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-3.pgdg18.04+1)

-- Started on 2019-11-15 18:38:30 MST

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

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 16474)
-- Name: book_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_nodes (
    parent_id integer,
    label_text character varying(255),
    node_id integer NOT NULL
);


ALTER TABLE public.book_nodes OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16423)
-- Name: book_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_text (
    note_text character varying(8000),
    node_id integer,
    comment_text character varying(8000),
    item_text character varying(8000),
    book_text_id integer NOT NULL
);


ALTER TABLE public.book_text OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16484)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(15) NOT NULL,
    description character varying(4000),
    picture bytea
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16464)
-- Name: chat_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_users (
    user_name character varying(50),
    ip_address character varying(50),
    login_time timestamp without time zone,
    chat_user_id integer NOT NULL,
    status integer
);


ALTER TABLE public.chat_users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16459)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customerid character(5) NOT NULL,
    companyname character varying(40) NOT NULL,
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16436)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    lastname character varying(20) NOT NULL,
    firstname character varying(10) NOT NULL,
    title character varying(30),
    titleofcourtesy character varying(25),
    birthdate timestamp without time zone,
    hiredate timestamp without time zone,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    homephone character varying(24),
    extension character varying(4),
    photo bytea,
    notes character varying(4000),
    reportsto integer,
    photopath character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16444)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    orderid integer NOT NULL,
    productid integer NOT NULL,
    unitprice integer NOT NULL,
    quantity integer NOT NULL,
    discount double precision NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16454)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    customerid character(5),
    employeeid integer,
    orderdate timestamp without time zone,
    requireddate timestamp without time zone,
    shippeddate timestamp without time zone,
    shipvia integer,
    freight integer,
    shipname character varying(40),
    shipaddress character varying(60),
    shipcity character varying(15),
    shipregion character varying(15),
    shippostalcode character varying(10),
    shipcountry character varying(15)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16449)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(40) NOT NULL,
    supplierid integer,
    categoryid integer,
    quantityperunit character varying(20),
    unitprice double precision,
    unitsinstock integer,
    unitsonorder integer,
    reorderlevel integer,
    discontinued integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16469)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.region (
    regionid integer NOT NULL,
    regiondescription character(50) NOT NULL
);


ALTER TABLE public.region OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16431)
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    shipperid integer NOT NULL,
    companyname character varying(40) NOT NULL,
    phone character varying(24)
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16492)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplierid integer NOT NULL,
    companyname character varying(40) NOT NULL,
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage character varying(4000)
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16479)
-- Name: territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territories (
    territoryid character varying(20) NOT NULL,
    territorydescription character(50) NOT NULL,
    regionid integer NOT NULL
);


ALTER TABLE public.territories OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 16474)
-- Dependencies: 205
-- Data for Name: book_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book_nodes (parent_id, label_text, node_id) VALUES (0, 'Dead Men Tell No Tales', 1);
INSERT INTO public.book_nodes (parent_id, label_text, node_id) VALUES (1, '1 Love on the Ocean', 2);
INSERT INTO public.book_nodes (parent_id, label_text, node_id) VALUES (2, '1', 3);
INSERT INTO public.book_nodes (parent_id, label_text, node_id) VALUES (2, '2', 4);
INSERT INTO public.book_nodes (parent_id, label_text, node_id) VALUES (1, '2 The Mysterious Cargo', 5);


--
-- TOC entry 2996 (class 0 OID 16423)
-- Dependencies: 196
-- Data for Name: book_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book_text (note_text, node_id, comment_text, item_text, book_text_id) VALUES ('^^^^ This panel is also resizeable. ^^^^', 3, '<-- This panel is resizeable.

It''s done by using the "JPanel" bean. To see how it''s done - choose "Editor" from the "Tools" menu and double click the method "loadFormsInBean". Also have a look at the way the form was designed (Tools -> Designer). There are tabless tabpanels with one form in them and then 3 instances of the JPanel Bean. The, on the "onLoad" event of the form the method "loadFormsInBean" is run to set everything up.', 'Nothing is so easy as falling in love on a long sea voyage, except falling out of love. Especially was this the case in the days when the wooden clippers did finely to land you in Sydney or in Melbourne under the four full months. We all saw far too much of each other, unless, indeed, we were to see still more. Our superficial attractions mutually exhausted, we lost heart and patience in the disappointing strata which lie between the surface and the bed-rock of most natures. My own experience was confined to the round voyage of the Lady Jermyn, in the year 1853. It was no common experience, as was only too well known at the time. And I may add that I for my part had not the faintest intention of falling in love on board; nay, after all these years, let me confess that I had good cause to hold myself proof against such weakness. Yet we carried a young lady, coming home, who, God knows, might have made short work of many a better man!', 1);
INSERT INTO public.book_text (note_text, node_id, comment_text, item_text, book_text_id) VALUES ('Note text goes here.', 4, 'Sample Comment Here.', 'Eva Denison was her name, and she cannot have been more than nineteen years of age. I remember her telling me that she had not yet come out, the very first time I assisted her to promenade the poop. My own name was still unknown to her, and yet I recollect being quite fascinated by her frankness and self-possession. She was exquisitely young, and yet ludicrously old for her years; had been admirably educated, chiefly abroad, and, as we were soon to discover, possessed accomplishments which would have made the plainest old maid a popular personage on board ship. Miss Denison, however, was as beautiful as she was young, with the bloom of ideal health upon her perfect skin. She had a wealth of lovely hair, with strange elusive strands of gold among the brown, that drowned her ears (I thought we were to have that mode again?) in sunny ripples; and a soul greater than the mind, and a heart greater than either, lay sleeping somewhere in the depths of her grave, gray eyes. ', 2);
INSERT INTO public.book_text (note_text, node_id, comment_text, item_text, book_text_id) VALUES ('More sample note text.', 5, 'Another sample comment here.', '"Wake up, Cole! The ship''s on fire!"       It was young Ready''s hollow voice, as cool, however, as though he were telling me I was late for breakfast. I started up and sought him wildly in the darkness.   "You''re joking," was my first thought and utterance; for now he was lighting my candle, and blowing out the match with a care that seemed in itself a contradiction.   "I wish I were," he answered. "Listen to that!"   ', 3);


--
-- TOC entry 3007 (class 0 OID 16484)
-- Dependencies: 207
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (3, 'Confections', 'Desserts, candies, and sweet breads', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (4, 'Dairy Products', 'Cheeses', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (6, 'Meat/Poultry', 'Prepared meats', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (7, 'Produce', 'Dried fruit and bean curd', NULL);
INSERT INTO public.categories (categoryid, categoryname, description, picture) VALUES (8, 'Seafood', 'Seaweed and fish', NULL);


--
-- TOC entry 3003 (class 0 OID 16464)
-- Dependencies: 203
-- Data for Name: chat_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3002 (class 0 OID 16459)
-- Dependencies: 202
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Sales Representative', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany', '030-0074321', '030-0076545');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Owner', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico', '(5) 555-4729', '(5) 555-3745');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Owner', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico', '(5) 555-3932', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('AROUT', 'Around the Horn', 'Thomas Hardy', 'Sales Representative', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'UK', '(171) 555-7788', '(171) 555-6750');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Order Administrator', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden', '0921-12 34 65', '0921-12 34 67');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Sales Representative', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany', '0621-08460', '0621-08924');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BLONP', 'Blondesddsl père et fils', 'Frédérique Citeaux', 'Marketing Manager', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France', '88.60.15.31', '88.60.15.32');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Owner', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain', '(91) 555 22 82', '(91) 555 91 99');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BONAP', 'Bon app''', 'Laurence Lebihan', 'Owner', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France', '91.24.45.40', '91.24.45.41');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Accounting Manager', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada', '(604) 555-4729', '(604) 555-3745');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('BSBEV', 'B''s Beverages', 'Victoria Ashworth', 'Sales Representative', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK', '(171) 555-1212', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Sales Agent', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Marketing Manager', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico', '(5) 555-3392', '(5) 555-7293');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Owner', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Switzerland', '0452-076545', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Sales Associate', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil', '(11) 555-7647', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Sales Representative', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK', '(171) 555-2282', '(171) 555-9199');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Order Administrator', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany', '0241-039123', '0241-059428');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('DUMON', 'Du monde entier', 'Janine Labrune', 'Owner', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France', '40.67.88.88', '40.67.89.89');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('EASTC', 'Eastern Connection', 'Ann Devon', 'Sales Agent', '35 King George', 'London', NULL, 'WX3 6FW', 'UK', '(171) 555-0297', '(171) 555-3373');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Sales Manager', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria', '7675-3425', '7675-3426');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Marketing Assistant', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil', '(11) 555-9857', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Accounting Manager', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Spain', '(91) 555 94 44', '(91) 555 55 93');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistant Sales Agent', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France', '20.16.10.16', '20.16.10.17');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Owner', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden', '0695-34 67 21', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FRANK', 'Frankenversand', 'Peter Franken', 'Marketing Manager', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany', '089-0877310', '089-0877451');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FRANR', 'France restauration', 'Carine Schmitt', 'Marketing Manager', '54, rue Royale', 'Nantes', NULL, '44000', 'France', '40.32.21.21', '40.32.21.20');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Sales Representative', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy', '011-4988260', '011-4988261');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez', 'Sales Manager', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Marketing Manager', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Spain', '(93) 203 4560', '(93) 203 4561');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Sales Manager', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain', '(95) 555 82 82', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Sales Associate', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil', '(11) 555-9482', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Marketing Manager', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA', '(503) 555-7555', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Owner', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Accounting Manager', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil', '(21) 555-0091', '(21) 555-8765');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('HILAA', 'HILARION-Abastos', 'Carlos Hernández', 'Sales Representative', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Sales Representative', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA', '(503) 555-6874', '(503) 555-2376');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Sales Associate', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland', '2967 542', '2967 3333');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ISLAT', 'Island Trading', 'Helen Bennett', 'Marketing Manager', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK', '(198) 555-8888', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('KOENE', 'Königlich Essen', 'Philip Cramer', 'Sales Associate', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany', '0555-09876', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LACOR', 'La corne d''abondance', 'Daniel Tonini', 'Sales Representative', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France', '30.59.84.10', '30.59.85.11');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LAMAI', 'La maison d''Asie', 'Annette Roulet', 'Sales Manager', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France', '61.77.61.10', '61.77.61.11');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Marketing Assistant', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada', '(604) 555-3392', '(604) 555-7293');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Marketing Manager', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA', '(509) 555-7969', '(509) 555-6221');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Sales Representative', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany', '069-0245984', '069-0245874');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LETSS', 'Let''s Stop N Shop', 'Jaime Yorres', 'Owner', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA', '(415) 555-5938', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LILAS', 'LILA-Supermercado', 'Carlos González', 'Accounting Manager', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Owner', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Sales Manager', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA', '(503) 555-9573', '(503) 555-9646');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Marketing Manager', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy', '035-640230', '035-640231');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Sales Agent', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium', '(02) 201 24 67', '(02) 201 24 68');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Marketing Assistant', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-8054', '(514) 555-8055');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Marketing Assistant', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany', '0342-023176', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('NORTS', 'North/South', 'Simon Crowther', 'Sales Associate', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK', '(171) 555-7733', '(171) 555-2530');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Sales Agent', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Sales Representative', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA', '(907) 555-7584', '(907) 555-2880');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Owner', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany', '0221-0644327', '0221-0765721');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Owner', '265, boulevard Charonne', 'Paris', NULL, '75012', 'France', '(1) 42.34.22.66', '(1) 42.34.22.77');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Sales Representative', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico', '(5) 552-3745', '(5) 545-3745');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Sales Manager', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria', '6562-9722', '6562-9723');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Sales Representative', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Accounting Manager', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil', '(21) 555-4252', '(21) 555-4545');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Marketing Assistant', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil', '(11) 555-1189', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Accounting Manager', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany', '0372-035188', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Sales Representative', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistant Sales Representative', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA', '(505) 555-5939', '(505) 555-3620');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Sales Associate', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy', '0522-556721', '0522-556722');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistant Sales Agent', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil', '(21) 555-3412', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Sales Manager', 'Grenzacherweg 237', 'Genève', NULL, '1203', 'Switzerland', '0897-034214', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Accounting Manager', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain', '(91) 745 6200', '(91) 745 6210');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Owner', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway', '07-98 92 35', '07-98 92 47');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Sales Representative', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA', '(208) 555-8097', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Sales Manager', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK', '(171) 555-1717', '(171) 555-5646');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Owner', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark', '31 12 34 56', '31 13 35 57');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Marketing Manager', '25, rue Lauriston', 'Paris', NULL, '75016', 'France', '(1) 47.55.60.10', '(1) 47.55.60.20');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Sales Manager', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA', '(307) 555-4680', '(307) 555-6525');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Accounting Manager', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium', '(071) 23 67 22 20', '(071) 23 67 22 21');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('THEBI', 'The Big Cheese', 'Liz Nixon', 'Marketing Manager', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA', '(503) 555-3612', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('THECR', 'The Cracker Box', 'Liu Wong', 'Marketing Assistant', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA', '(406) 555-5834', '(406) 555-8083');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Marketing Manager', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany', '0251-031259', '0251-035695');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Owner', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico', '(5) 555-2933', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Sales Representative', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil', '(11) 555-2167', '(11) 555-2168');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('TRAIH', 'Trail''s Head Gourmet Provisioners', 'Helvetius Nagy', 'Sales Associate', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA', '(206) 555-8257', '(206) 555-2174');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Sales Manager', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark', '86 21 32 43', '86 22 33 44');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Sales Agent', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France', '78.32.54.86', '78.32.54.87');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Accounting Manager', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France', '26.47.15.10', '26.47.15.11');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Sales Representative', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany', '0711-020361', '0711-035428');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Accounting Manager', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland', '981-443655', '981-443655');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WELLI', 'Wellington Importadora', 'Paula Parente', 'Sales Manager', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil', '(14) 555-8122', NULL);
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Owner', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', 'USA', '(206) 555-4112', '(206) 555-4115');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Owner/Marketing Assistant', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland', '90-224 8858', '90-224 8858');
INSERT INTO public.customers (customerid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) VALUES ('WOLZA', 'Wolski Zajazd', 'Zbyszek Piestrzeniewicz', 'Owner', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland', '(26) 642-7012', '(26) 642-7012');


--
-- TOC entry 2998 (class 0 OID 16436)
-- Dependencies: 198
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (1, 'Davolio', 'Nancy', 'Sales Representative', 'Ms.', '1948-12-08 03:00:00', '1992-05-01 03:00:00', '507 - 20th Ave. E.Apt. 2A', 'Seattle', 'WA', '98122', 'USA', '(206) 555-9857', '5467', NULL, 'Education includes a BA in psychology from Colorado State University in 1970. She also completed "The Art of the Cold Call." Nancy is a member of Toastmasters International.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (2, 'Fuller', 'Andrew', 'Vice President, Sales', 'Dr.', '1952-02-19 03:00:00', '1992-08-14 03:00:00', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'USA', '(206) 555-9482', '3457', NULL, 'Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager in January 1992 and to vice president of sales in March 1993. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.', NULL, 'http://accweb/emmployees/fuller.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (3, 'Leverling', 'Janet', 'Sales Representative', 'Ms.', '1963-08-30 03:00:00', '1992-04-01 02:00:00', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'USA', '(206) 555-3412', '3355', NULL, 'Janet has a BS degree in chemistry from Boston College (1984). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.', 2, 'http://accweb/emmployees/leverling.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (4, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '1937-09-19 03:00:00', '1993-05-03 03:00:00', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'USA', '(206) 555-8122', '5176', NULL, 'Margaret holds a BA in English literature from Concordia College (1958) and an MA from theerican Institute of Culinary Arts (1966). She was assigned to the London office temporarily from July through November 1992.', 2, 'http://accweb/emmployees/peacock.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (5, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '1955-03-04 03:00:00', '1993-10-17 04:00:00', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'UK', '(71) 555-4848', '3453', NULL, 'Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree in 1976. Upon joining the company as a sales representative in 1992, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London. He was promoted to sales manager in March 1993. Mr. Buchanan has completed the courses "Successful Telemarketing" and "International Sales Management." He is fluent in French.', 2, 'http://accweb/emmployees/buchanan.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (6, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '1963-07-02 03:00:00', '1993-10-17 04:00:00', 'Coventry HouseMiner Rd.', 'London', NULL, 'EC2 7JR', 'UK', '(71) 555-7773', '428', NULL, 'Michael is a graduate of Sussex University (MA, economics, 1983) and the University of California at Los Angeles (MBA, marketing, 1986). He has also taken the courses "Multi-Cultural Selling" and "Time Management for the Sales Professional." He is fluent in Japanese and can read and write French, Portuguese, and Spanish.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (7, 'King', 'Robert', 'Sales Representative', 'Mr.', '1960-05-29 03:00:00', '1994-01-02 03:00:00', 'Edgeham HollowWinchester Way', 'London', NULL, 'RG1 9SP', 'UK', '(71) 555-5598', '465', NULL, 'Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992, the year he joined the company. After completing a course entitled "Selling in Europe," he was transferred to the London office in March 1993.', 5, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (8, 'Callahan', 'Laura', 'Inside Sales Coordinator', 'Ms.', '1958-01-09 03:00:00', '1994-03-05 03:00:00', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'USA', '(206) 555-1189', '2344', NULL, 'Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.', 2, 'http://accweb/emmployees/davolio.bmp');
INSERT INTO public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) VALUES (9, 'Dodsworth', 'Anne', 'Sales Representative', 'Ms.', '1966-01-27 03:00:00', '1994-11-15 03:00:00', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'UK', '(71) 555-4444', '452', NULL, 'Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.', 5, 'http://accweb/emmployees/davolio.bmp');


--
-- TOC entry 2999 (class 0 OID 16444)
-- Dependencies: 199
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10248, 11, 14, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10248, 42, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10248, 72, 35, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10249, 14, 19, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10249, 51, 42, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10250, 41, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10250, 51, 42, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10250, 65, 17, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10251, 22, 17, 6, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10251, 57, 16, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10251, 65, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10252, 20, 65, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10252, 33, 2, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10252, 60, 27, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10253, 31, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10253, 39, 14, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10253, 49, 16, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10254, 24, 4, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10254, 55, 19, 21, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10254, 74, 8, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10255, 2, 15, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10255, 16, 14, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10255, 36, 15, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10255, 59, 44, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10256, 53, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10256, 77, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10257, 27, 35, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10257, 39, 14, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10257, 77, 10, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10258, 2, 15, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10258, 5, 17, 65, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10258, 32, 26, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10259, 21, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10259, 37, 21, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10260, 41, 8, 16, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10260, 57, 16, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10260, 62, 39, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10260, 70, 12, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10261, 21, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10261, 35, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10262, 5, 17, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10262, 7, 24, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10262, 56, 30, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10263, 16, 14, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10263, 24, 4, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10263, 30, 21, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10263, 74, 8, 36, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10264, 2, 15, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10264, 41, 8, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10265, 17, 31, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10265, 70, 12, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10266, 12, 30, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10267, 40, 15, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10267, 59, 44, 70, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10267, 76, 14, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10268, 29, 99, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10268, 72, 28, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10269, 33, 2, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10269, 72, 28, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10270, 36, 15, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10270, 43, 37, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10271, 33, 2, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10272, 20, 65, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10272, 31, 10, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10272, 72, 28, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10273, 10, 25, 24, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10273, 31, 10, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10273, 33, 2, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10273, 40, 15, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10273, 76, 14, 33, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10274, 71, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10274, 72, 28, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10275, 24, 4, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10275, 59, 44, 6, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10276, 10, 25, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10276, 13, 5, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10277, 28, 36, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10277, 62, 39, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10278, 44, 16, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10278, 59, 44, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10278, 63, 35, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10278, 73, 12, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10279, 17, 31, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10280, 24, 4, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10280, 55, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10280, 75, 6, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10281, 19, 7, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10281, 24, 4, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10281, 35, 14, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10282, 30, 21, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10282, 57, 16, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10283, 15, 12, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10283, 19, 7, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10283, 60, 27, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10283, 72, 28, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10284, 27, 35, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10284, 44, 16, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10284, 60, 27, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10284, 67, 11, 5, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10285, 1, 14, 45, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10285, 40, 15, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10285, 53, 26, 36, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10286, 35, 14, 100, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10286, 62, 39, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10287, 16, 14, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10287, 34, 11, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10287, 46, 10, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10288, 54, 6, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10288, 68, 10, 3, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10289, 3, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10289, 64, 27, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10290, 5, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10290, 29, 99, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10290, 49, 16, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10290, 77, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10291, 13, 5, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10291, 44, 16, 24, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10291, 51, 42, 2, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10292, 20, 65, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10293, 18, 50, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10293, 24, 4, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10293, 63, 35, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10293, 75, 6, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10294, 1, 14, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10294, 17, 31, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10294, 43, 37, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10294, 60, 27, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10294, 75, 6, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10295, 56, 30, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10296, 11, 17, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10296, 16, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10296, 69, 29, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10297, 39, 14, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10297, 72, 28, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10298, 2, 15, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10298, 36, 15, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10298, 59, 44, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10298, 62, 39, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10299, 19, 7, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10299, 70, 12, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10300, 66, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10300, 68, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10301, 40, 15, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10301, 56, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10302, 17, 31, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10302, 28, 36, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10302, 43, 37, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10303, 40, 15, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10303, 65, 17, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10303, 68, 10, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10304, 49, 16, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10304, 59, 44, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10304, 71, 17, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10305, 18, 50, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10305, 29, 99, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10305, 39, 14, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10306, 30, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10306, 53, 26, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10306, 54, 6, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10307, 62, 39, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10307, 68, 10, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10308, 69, 29, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10308, 70, 12, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10309, 4, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10309, 6, 20, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10309, 42, 11, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10309, 43, 37, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10309, 71, 17, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10310, 16, 14, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10310, 62, 39, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10311, 42, 11, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10311, 69, 29, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10312, 28, 36, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10312, 43, 37, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10312, 53, 26, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10312, 75, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10313, 36, 15, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10314, 32, 26, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10314, 58, 11, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10314, 62, 39, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10315, 34, 11, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10315, 70, 12, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10316, 41, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10316, 62, 39, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10317, 1, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10318, 41, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10318, 76, 14, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10319, 17, 31, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10319, 28, 36, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10319, 76, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10320, 71, 17, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10321, 35, 14, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10322, 52, 6, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10323, 15, 12, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10323, 25, 11, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10323, 39, 14, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10324, 16, 14, 21, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10324, 35, 14, 70, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10324, 46, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10324, 59, 44, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10324, 63, 35, 80, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10325, 6, 20, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10325, 13, 5, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10325, 14, 19, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10325, 31, 10, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10325, 72, 28, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10326, 4, 18, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10326, 57, 16, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10326, 75, 6, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10327, 2, 15, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10327, 11, 17, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10327, 30, 21, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10327, 58, 11, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10328, 59, 44, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10328, 65, 17, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10328, 68, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10329, 19, 7, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10329, 30, 21, 8, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10329, 38, 211, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10329, 56, 30, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10330, 26, 25, 50, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10330, 72, 28, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10331, 54, 6, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10332, 18, 50, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10332, 42, 11, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10332, 47, 8, 16, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10333, 14, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10333, 21, 8, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10333, 71, 17, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10334, 52, 6, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10334, 68, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10335, 2, 15, 7, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10335, 31, 10, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10335, 32, 26, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10335, 51, 42, 48, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10336, 4, 18, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10337, 23, 7, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10337, 26, 25, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10337, 36, 15, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10337, 37, 21, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10337, 72, 28, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10338, 17, 31, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10338, 30, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10339, 4, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10339, 17, 31, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10339, 62, 39, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10340, 18, 50, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10340, 41, 8, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10340, 43, 37, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10341, 33, 2, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10341, 59, 44, 9, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10342, 2, 15, 24, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10342, 31, 10, 56, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10342, 36, 15, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10342, 55, 19, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10343, 64, 27, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10343, 68, 10, 4, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10343, 76, 14, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10344, 4, 18, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10344, 8, 32, 70, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10345, 8, 32, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10345, 19, 7, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10345, 42, 11, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10346, 17, 31, 36, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10346, 56, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10347, 25, 11, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10347, 39, 14, 50, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10347, 40, 15, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10347, 75, 6, 6, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10348, 1, 14, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10348, 23, 7, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10349, 54, 6, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10350, 50, 13, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10350, 69, 29, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10351, 38, 211, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10351, 41, 8, 13, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10351, 44, 16, 77, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10351, 65, 17, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10352, 24, 4, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10352, 54, 6, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10353, 11, 17, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10353, 38, 211, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10354, 1, 14, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10354, 29, 99, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10355, 24, 4, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10355, 57, 16, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10356, 31, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10356, 55, 19, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10356, 69, 29, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10357, 10, 25, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10357, 26, 25, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10357, 60, 27, 8, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10358, 24, 4, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10358, 34, 11, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10358, 36, 15, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10359, 16, 14, 56, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10359, 31, 10, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10359, 60, 27, 80, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10360, 28, 36, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10360, 29, 99, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10360, 38, 211, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10360, 49, 16, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10360, 54, 6, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10361, 39, 14, 54, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10361, 60, 27, 55, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10362, 25, 11, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10362, 51, 42, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10362, 54, 6, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10363, 31, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10363, 75, 6, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10363, 76, 14, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10364, 69, 29, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10364, 71, 17, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10365, 11, 17, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10366, 65, 17, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10366, 77, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10367, 34, 11, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10367, 54, 6, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10367, 65, 17, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10367, 77, 10, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10368, 21, 8, 5, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10368, 28, 36, 13, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10368, 57, 16, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10368, 64, 27, 35, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10369, 29, 99, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10369, 56, 30, 18, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10370, 1, 14, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10370, 64, 27, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10370, 74, 8, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10371, 36, 15, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10372, 20, 65, 12, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10372, 38, 211, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10372, 60, 27, 70, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10372, 72, 28, 42, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10373, 58, 11, 80, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10373, 71, 17, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10374, 31, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10374, 58, 11, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10375, 14, 19, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10375, 54, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10376, 31, 10, 42, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10377, 28, 36, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10377, 39, 14, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10378, 71, 17, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10379, 41, 8, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10379, 63, 35, 16, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10379, 65, 17, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10380, 30, 21, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10380, 53, 26, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10380, 60, 27, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10380, 70, 12, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10381, 74, 8, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10382, 5, 17, 32, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10382, 18, 50, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10382, 29, 99, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10382, 33, 2, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10382, 74, 8, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10383, 13, 5, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10383, 50, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10383, 56, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10384, 20, 65, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10384, 60, 27, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10385, 7, 24, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10385, 60, 27, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10385, 68, 10, 8, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10386, 24, 4, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10386, 34, 11, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10387, 24, 4, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10387, 28, 36, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10387, 59, 44, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10387, 71, 17, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10388, 45, 8, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10388, 52, 6, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10388, 53, 26, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10389, 10, 25, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10389, 55, 19, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10389, 62, 39, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10389, 70, 12, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10390, 31, 10, 60, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10390, 35, 14, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10390, 46, 10, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10390, 72, 28, 24, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10391, 13, 5, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10392, 69, 29, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10393, 2, 15, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10393, 14, 19, 42, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10393, 25, 11, 7, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10393, 26, 25, 70, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10393, 31, 10, 32, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10394, 13, 5, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10394, 62, 39, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10395, 46, 10, 28, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10395, 53, 26, 70, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10395, 69, 29, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10396, 23, 7, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10396, 71, 17, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10396, 72, 28, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10397, 21, 8, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10397, 51, 42, 18, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10398, 35, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10398, 55, 19, 120, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10399, 68, 10, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10399, 71, 17, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10399, 76, 14, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10399, 77, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10400, 29, 99, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10400, 35, 14, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10400, 49, 16, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10401, 30, 21, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10401, 56, 30, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10401, 65, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10401, 71, 17, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10402, 23, 7, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10402, 63, 35, 65, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10403, 16, 14, 21, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10403, 48, 10, 70, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10404, 26, 25, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10404, 42, 11, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10404, 49, 16, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10405, 3, 8, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10406, 1, 14, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10406, 21, 8, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10406, 28, 36, 42, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10406, 36, 15, 5, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10406, 40, 15, 2, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10407, 11, 17, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10407, 69, 29, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10407, 71, 17, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10408, 37, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10408, 54, 6, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10408, 62, 39, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10409, 14, 19, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10409, 21, 8, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10410, 33, 2, 49, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10410, 59, 44, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10411, 41, 8, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10411, 44, 16, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10411, 59, 44, 9, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10412, 14, 19, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10413, 1, 14, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10413, 62, 39, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10413, 76, 14, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10414, 19, 7, 18, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10414, 33, 2, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10415, 17, 31, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10415, 33, 2, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10416, 19, 7, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10416, 53, 26, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10416, 57, 16, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10417, 38, 211, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10417, 46, 10, 2, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10417, 68, 10, 36, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10417, 77, 10, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10418, 2, 15, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10418, 47, 8, 55, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10418, 61, 23, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10418, 74, 8, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10419, 60, 27, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10419, 69, 29, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10420, 9, 78, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10420, 13, 5, 2, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10420, 70, 12, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10420, 73, 12, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10421, 19, 7, 4, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10421, 26, 25, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10421, 53, 26, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10421, 77, 10, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10422, 26, 25, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10423, 31, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10423, 59, 44, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10424, 35, 14, 60, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10424, 38, 211, 49, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10424, 68, 10, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10425, 55, 19, 10, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10425, 76, 14, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10426, 56, 30, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10426, 64, 27, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10427, 14, 19, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10428, 46, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10429, 50, 13, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10429, 63, 35, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10430, 17, 31, 45, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10430, 21, 8, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10430, 56, 30, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10430, 59, 44, 70, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10431, 17, 31, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10431, 40, 15, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10431, 47, 8, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10432, 26, 25, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10432, 54, 6, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10433, 56, 30, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10434, 11, 17, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10434, 76, 14, 18, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10435, 2, 15, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10435, 22, 17, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10435, 72, 28, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10436, 46, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10436, 56, 30, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10436, 64, 27, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10436, 75, 6, 24, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10437, 53, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10438, 19, 7, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10438, 34, 11, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10438, 57, 16, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10439, 12, 30, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10439, 16, 14, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10439, 64, 27, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10439, 74, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10440, 2, 15, 45, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10440, 16, 14, 49, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10440, 29, 99, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10440, 61, 23, 90, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10441, 27, 35, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10442, 11, 17, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10442, 54, 6, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10442, 66, 14, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10443, 11, 17, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10443, 28, 36, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10444, 17, 31, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10444, 26, 25, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10444, 35, 14, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10444, 41, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10445, 39, 14, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10445, 54, 6, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10446, 19, 7, 12, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10446, 24, 4, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10446, 31, 10, 3, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10446, 52, 6, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10447, 19, 7, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10447, 65, 17, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10447, 71, 17, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10448, 26, 25, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10448, 40, 15, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10449, 10, 25, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10449, 52, 6, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10449, 62, 39, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10450, 10, 25, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10450, 54, 6, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10451, 55, 19, 120, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10451, 64, 27, 35, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10451, 65, 17, 28, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10451, 77, 10, 55, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10452, 28, 36, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10452, 44, 16, 100, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10453, 48, 10, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10453, 70, 12, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10454, 16, 14, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10454, 33, 2, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10454, 46, 10, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10455, 39, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10455, 53, 26, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10455, 61, 23, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10455, 71, 17, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10456, 21, 8, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10456, 49, 16, 21, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10457, 59, 44, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10458, 26, 25, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10458, 28, 36, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10458, 43, 37, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10458, 56, 30, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10458, 71, 17, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10459, 7, 24, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10459, 46, 10, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10459, 72, 28, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10460, 68, 10, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10460, 75, 6, 4, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10461, 21, 8, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10461, 30, 21, 28, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10461, 55, 19, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10462, 13, 5, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10462, 23, 7, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10463, 19, 7, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10463, 42, 11, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10464, 4, 18, 16, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10464, 43, 37, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10464, 56, 30, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10464, 60, 27, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10465, 24, 4, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10465, 29, 99, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10465, 40, 15, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10465, 45, 8, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10465, 50, 13, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10466, 11, 17, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10466, 46, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10467, 24, 4, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10467, 25, 11, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10468, 30, 21, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10468, 43, 37, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10469, 2, 15, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10469, 16, 14, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10469, 44, 16, 2, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10470, 18, 50, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10470, 23, 7, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10470, 64, 27, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10471, 7, 24, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10471, 56, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10472, 24, 4, 80, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10472, 51, 42, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10473, 33, 2, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10473, 71, 17, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10474, 14, 19, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10474, 28, 36, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10474, 40, 15, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10474, 75, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10475, 31, 10, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10475, 66, 14, 60, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10475, 76, 14, 42, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10476, 55, 19, 2, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10476, 70, 12, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10477, 1, 14, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10477, 21, 8, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10477, 39, 14, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10478, 10, 25, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10479, 38, 211, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10479, 53, 26, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10479, 59, 44, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10479, 64, 27, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10480, 47, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10480, 59, 44, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10481, 49, 16, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10481, 60, 27, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10482, 40, 15, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10483, 34, 11, 35, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10483, 77, 10, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10484, 21, 8, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10484, 40, 15, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10484, 51, 42, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10485, 2, 15, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10485, 3, 8, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10485, 55, 19, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10485, 70, 12, 60, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10486, 11, 17, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10486, 51, 42, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10486, 74, 8, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10487, 19, 7, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10487, 26, 25, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10487, 54, 6, 24, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10488, 59, 44, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10488, 73, 12, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10489, 11, 17, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10489, 16, 14, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10490, 59, 44, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10490, 68, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10490, 75, 6, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10491, 44, 16, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10491, 77, 10, 7, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10492, 25, 11, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10492, 42, 11, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10493, 65, 17, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10493, 66, 14, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10493, 69, 29, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10494, 56, 30, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10495, 23, 7, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10495, 41, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10495, 77, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10496, 31, 10, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10497, 56, 30, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10497, 72, 28, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10497, 77, 10, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10498, 24, 5, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10498, 40, 18, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10498, 42, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10499, 28, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10499, 49, 20, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10500, 15, 16, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10500, 28, 46, 8, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10501, 54, 7, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10502, 45, 10, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10502, 53, 33, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10502, 67, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10503, 14, 23, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10503, 65, 21, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10504, 2, 19, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10504, 21, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10504, 53, 33, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10504, 61, 29, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10505, 62, 49, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10506, 25, 14, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10506, 70, 15, 14, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10507, 43, 46, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10507, 48, 13, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10508, 13, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10508, 39, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10509, 28, 46, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10510, 29, 124, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10510, 75, 8, 36, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10511, 4, 22, 50, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10511, 7, 30, 50, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10511, 8, 40, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10512, 24, 5, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10512, 46, 12, 9, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10512, 47, 10, 6, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10512, 60, 34, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10513, 21, 10, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10513, 32, 32, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10513, 61, 29, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10514, 20, 81, 39, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10514, 28, 46, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10514, 56, 38, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10514, 65, 21, 39, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10514, 75, 8, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10515, 9, 97, 16, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10515, 16, 17, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10515, 27, 44, 120, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10515, 33, 3, 16, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10515, 60, 34, 84, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10516, 18, 63, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10516, 41, 10, 80, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10516, 42, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10517, 52, 7, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10517, 59, 55, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10517, 70, 15, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10518, 24, 5, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10518, 38, 264, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10518, 44, 19, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10519, 10, 31, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10519, 56, 38, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10519, 60, 34, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10520, 24, 5, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10520, 53, 33, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10521, 35, 18, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10521, 41, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10521, 68, 13, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10522, 1, 18, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10522, 8, 40, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10522, 30, 26, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10522, 40, 18, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10523, 17, 39, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10523, 20, 81, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10523, 37, 26, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10523, 41, 10, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10524, 10, 31, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10524, 30, 26, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10524, 43, 46, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10524, 54, 7, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10525, 36, 19, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10525, 40, 18, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10526, 1, 18, 8, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10526, 13, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10526, 56, 38, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10527, 4, 22, 50, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10527, 36, 19, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10528, 11, 21, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10528, 33, 3, 8, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10528, 72, 35, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10529, 55, 24, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10529, 68, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10529, 69, 36, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10530, 17, 39, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10530, 43, 46, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10530, 61, 29, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10530, 76, 18, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10531, 59, 55, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10532, 30, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10532, 66, 17, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10533, 4, 22, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10533, 72, 35, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10533, 73, 15, 24, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10534, 30, 26, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10534, 40, 18, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10534, 54, 7, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10535, 11, 21, 50, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10535, 40, 18, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10535, 57, 20, 5, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10535, 59, 55, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10536, 12, 38, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10536, 31, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10536, 33, 3, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10536, 60, 34, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10537, 31, 13, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10537, 51, 53, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10537, 58, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10537, 72, 35, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10537, 73, 15, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10538, 70, 15, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10538, 72, 35, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10539, 13, 6, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10539, 21, 10, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10539, 33, 3, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10539, 49, 20, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10540, 3, 10, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10540, 26, 31, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10540, 38, 264, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10540, 68, 13, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10541, 24, 5, 35, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10541, 38, 264, 4, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10541, 65, 21, 36, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10541, 71, 22, 9, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10542, 11, 21, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10542, 54, 7, 24, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10543, 12, 38, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10543, 23, 9, 70, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10544, 28, 46, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10544, 67, 14, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10545, 11, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10546, 7, 30, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10546, 35, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10546, 62, 49, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10547, 32, 32, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10547, 36, 19, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10548, 34, 14, 10, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10548, 41, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10549, 31, 13, 55, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10549, 45, 10, 100, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10549, 51, 53, 48, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10550, 17, 39, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10550, 19, 9, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10550, 21, 10, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10550, 61, 29, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10551, 16, 17, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10551, 35, 18, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10551, 44, 19, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10552, 69, 36, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10552, 75, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10553, 11, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10553, 16, 17, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10553, 22, 21, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10553, 31, 13, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10553, 35, 18, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10554, 16, 17, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10554, 23, 9, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10554, 62, 49, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10554, 77, 13, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10555, 14, 23, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10555, 19, 9, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10555, 24, 5, 18, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10555, 51, 53, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10555, 56, 38, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10556, 72, 35, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10557, 64, 33, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10557, 75, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10558, 47, 10, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10558, 51, 53, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10558, 52, 7, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10558, 53, 33, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10558, 73, 15, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10559, 41, 10, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10559, 55, 24, 18, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10560, 30, 26, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10560, 62, 49, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10561, 44, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10561, 51, 53, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10562, 33, 3, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10562, 62, 49, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10563, 36, 19, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10563, 52, 7, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10564, 17, 39, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10564, 31, 13, 6, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10564, 55, 24, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10565, 24, 5, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10565, 64, 33, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10566, 11, 21, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10566, 18, 63, 18, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10566, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10567, 31, 13, 60, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10567, 51, 53, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10567, 59, 55, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10568, 10, 31, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10569, 31, 13, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10569, 76, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10570, 11, 21, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10570, 56, 38, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10571, 14, 23, 11, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10571, 42, 14, 28, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10572, 16, 17, 12, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10572, 32, 32, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10572, 40, 18, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10572, 75, 8, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10573, 17, 39, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10573, 34, 14, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10573, 53, 33, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10574, 33, 3, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10574, 40, 18, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10574, 62, 49, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10574, 64, 33, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10575, 59, 55, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10575, 63, 44, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10575, 72, 35, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10575, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10576, 1, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10576, 31, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10576, 44, 19, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10577, 39, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10577, 75, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10577, 77, 13, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10578, 35, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10578, 57, 20, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10579, 15, 16, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10579, 75, 8, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10580, 14, 23, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10580, 41, 10, 9, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10580, 65, 21, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10581, 75, 8, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10582, 57, 20, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10582, 76, 18, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10583, 29, 124, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10583, 60, 34, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10583, 69, 36, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10584, 31, 13, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10585, 47, 10, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10586, 52, 7, 4, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10587, 26, 31, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10587, 35, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10587, 77, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10588, 18, 63, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10588, 42, 14, 100, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10589, 35, 18, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10590, 1, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10590, 77, 13, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10591, 3, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10591, 7, 30, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10591, 54, 7, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10592, 15, 16, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10592, 26, 31, 5, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10593, 20, 81, 21, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10593, 69, 36, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10593, 76, 18, 4, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10594, 52, 7, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10594, 58, 13, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10595, 35, 18, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10595, 61, 29, 120, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10595, 69, 36, 65, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10596, 56, 38, 5, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10596, 63, 44, 24, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10596, 75, 8, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10597, 24, 5, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10597, 57, 20, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10597, 65, 21, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10598, 27, 44, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10598, 71, 22, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10599, 62, 49, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10600, 54, 7, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10600, 73, 15, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10601, 13, 6, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10601, 59, 55, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10602, 77, 13, 5, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10603, 22, 21, 48, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10603, 49, 20, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10604, 48, 13, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10604, 76, 18, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10605, 16, 17, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10605, 59, 55, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10605, 60, 34, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10605, 71, 22, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10606, 4, 22, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10606, 55, 24, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10606, 62, 49, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10607, 7, 30, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10607, 17, 39, 100, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10607, 33, 3, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10607, 40, 18, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10607, 72, 35, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10608, 56, 38, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10609, 1, 18, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10609, 10, 31, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10609, 21, 10, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10610, 36, 19, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10611, 1, 18, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10611, 2, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10611, 60, 34, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10612, 10, 31, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10612, 36, 19, 55, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10612, 49, 20, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10612, 60, 34, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10612, 76, 18, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10613, 13, 6, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10613, 75, 8, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10614, 11, 21, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10614, 21, 10, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10614, 39, 18, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10615, 55, 24, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10616, 38, 264, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10616, 56, 38, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10616, 70, 15, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10616, 71, 22, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10617, 59, 55, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10618, 6, 25, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10618, 56, 38, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10618, 68, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10619, 21, 10, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10619, 22, 21, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10620, 24, 5, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10620, 52, 7, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10621, 19, 9, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10621, 23, 9, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10621, 70, 15, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10621, 71, 22, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10622, 2, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10622, 68, 13, 18, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10623, 14, 23, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10623, 19, 9, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10623, 21, 10, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10623, 24, 5, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10623, 35, 18, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10624, 28, 46, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10624, 29, 124, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10624, 44, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10625, 14, 23, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10625, 42, 14, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10625, 60, 34, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10626, 53, 33, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10626, 60, 34, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10626, 71, 22, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10627, 62, 49, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10627, 73, 15, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10628, 1, 18, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10629, 29, 124, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10629, 64, 33, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10630, 55, 24, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10630, 76, 18, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10631, 75, 8, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10632, 2, 19, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10632, 33, 3, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10633, 12, 38, 36, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10633, 13, 6, 13, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10633, 26, 31, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10633, 62, 49, 80, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10634, 7, 30, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10634, 18, 63, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10634, 51, 53, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10634, 75, 8, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10635, 4, 22, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10635, 5, 21, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10635, 22, 21, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10636, 4, 22, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10636, 58, 13, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10637, 11, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10637, 50, 16, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10637, 56, 38, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10638, 45, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10638, 65, 21, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10638, 72, 35, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10639, 18, 63, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10640, 69, 36, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10640, 70, 15, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10641, 2, 19, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10641, 40, 18, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10642, 21, 10, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10642, 61, 29, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10643, 28, 46, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10643, 39, 18, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10643, 46, 12, 2, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10644, 18, 63, 4, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10644, 43, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10644, 46, 12, 21, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10645, 18, 63, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10645, 36, 19, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10646, 1, 18, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10646, 10, 31, 18, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10646, 71, 22, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10646, 77, 13, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10647, 19, 9, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10647, 39, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10648, 22, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10648, 24, 5, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10649, 28, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10649, 72, 35, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10650, 30, 26, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10650, 53, 33, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10650, 54, 7, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10651, 19, 9, 12, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10651, 22, 21, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10652, 30, 26, 2, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10652, 42, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10653, 16, 17, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10653, 60, 34, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10654, 4, 22, 12, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10654, 39, 18, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10654, 54, 7, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10655, 41, 10, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10656, 14, 23, 3, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10656, 44, 19, 28, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10656, 47, 10, 6, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 15, 16, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 41, 10, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 46, 12, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 47, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 56, 38, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10657, 60, 34, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10658, 21, 10, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10658, 40, 18, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10658, 60, 34, 55, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10658, 77, 13, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10659, 31, 13, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10659, 40, 18, 24, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10659, 70, 15, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10660, 20, 81, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10661, 39, 18, 3, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10661, 58, 13, 49, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10662, 68, 13, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10663, 40, 18, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10663, 42, 14, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10663, 51, 53, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10664, 10, 31, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10664, 56, 38, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10664, 65, 21, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10665, 51, 53, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10665, 59, 55, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10665, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10666, 29, 124, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10666, 65, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10667, 69, 36, 45, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10667, 71, 22, 14, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10668, 31, 13, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10668, 55, 24, 4, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10668, 64, 33, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10669, 36, 19, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10670, 23, 9, 32, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10670, 46, 12, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10670, 67, 14, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10670, 73, 15, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10670, 75, 8, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10671, 16, 17, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10671, 62, 49, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10671, 65, 21, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10672, 38, 264, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10672, 71, 22, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10673, 16, 17, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10673, 42, 14, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10673, 43, 46, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10674, 23, 9, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10675, 14, 23, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10675, 53, 33, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10675, 58, 13, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10676, 10, 31, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10676, 19, 9, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10676, 44, 19, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10677, 26, 31, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10677, 33, 3, 8, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10678, 12, 38, 100, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10678, 33, 3, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10678, 41, 10, 120, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10678, 54, 7, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10679, 59, 55, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10680, 16, 17, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10680, 31, 13, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10680, 42, 14, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10681, 19, 9, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10681, 21, 10, 12, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10681, 64, 33, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10682, 33, 3, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10682, 66, 17, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10682, 75, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10683, 52, 7, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10684, 40, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10684, 47, 10, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10684, 60, 34, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10685, 10, 31, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10685, 41, 10, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10685, 47, 10, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10686, 17, 39, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10686, 26, 31, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10687, 9, 97, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10687, 29, 124, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10687, 36, 19, 6, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10688, 10, 31, 18, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10688, 28, 46, 60, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10688, 34, 14, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10689, 1, 18, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10690, 56, 38, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10690, 77, 13, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10691, 1, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10691, 29, 124, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10691, 43, 46, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10691, 44, 19, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10691, 62, 49, 48, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10692, 63, 44, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10693, 9, 97, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10693, 54, 7, 60, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10693, 69, 36, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10693, 73, 15, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10694, 7, 30, 90, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10694, 59, 55, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10694, 70, 15, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10695, 8, 40, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10695, 12, 38, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10695, 24, 5, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10696, 17, 39, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10696, 46, 12, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10697, 19, 9, 7, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10697, 35, 18, 9, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10697, 58, 13, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10697, 70, 15, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10698, 11, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10698, 17, 39, 8, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10698, 29, 124, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10698, 65, 21, 65, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10698, 70, 15, 8, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10699, 47, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10700, 1, 18, 5, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10700, 34, 14, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10700, 68, 13, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10700, 71, 22, 60, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10701, 59, 55, 42, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10701, 71, 22, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10701, 76, 18, 35, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10702, 3, 10, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10702, 76, 18, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10703, 2, 19, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10703, 59, 55, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10703, 73, 15, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10704, 4, 22, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10704, 24, 5, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10704, 48, 13, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10705, 31, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10705, 32, 32, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10706, 16, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10706, 43, 46, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10706, 59, 55, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10707, 55, 24, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10707, 57, 20, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10707, 70, 15, 28, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10708, 5, 21, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10708, 36, 19, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10709, 8, 40, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10709, 51, 53, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10709, 60, 34, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10710, 19, 9, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10710, 47, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10711, 19, 9, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10711, 41, 10, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10711, 53, 33, 120, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10712, 53, 33, 3, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10712, 56, 38, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10713, 10, 31, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10713, 26, 31, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10713, 45, 10, 110, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10713, 46, 12, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10714, 2, 19, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10714, 17, 39, 27, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10714, 47, 10, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10714, 56, 38, 18, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10714, 58, 13, 12, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10715, 10, 31, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10715, 71, 22, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10716, 21, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10716, 51, 53, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10716, 61, 29, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10717, 21, 10, 32, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10717, 54, 7, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10717, 69, 36, 25, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10718, 12, 38, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10718, 16, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10718, 36, 19, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10718, 62, 49, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10719, 18, 63, 12, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10719, 30, 26, 3, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10719, 54, 7, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10720, 35, 18, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10720, 71, 22, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10721, 44, 19, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10722, 2, 19, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10722, 31, 13, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10722, 68, 13, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10722, 75, 8, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10723, 26, 31, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10724, 10, 31, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10724, 61, 29, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10725, 41, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10725, 52, 7, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10725, 55, 24, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10726, 4, 22, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10726, 11, 21, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10727, 17, 39, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10727, 56, 38, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10727, 59, 55, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10728, 30, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10728, 40, 18, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10728, 55, 24, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10728, 60, 34, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10729, 1, 18, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10729, 21, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10729, 50, 16, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10730, 16, 17, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10730, 31, 13, 3, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10730, 65, 21, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10731, 21, 10, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10731, 51, 53, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10732, 76, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10733, 14, 23, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10733, 28, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10733, 52, 7, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10734, 6, 25, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10734, 30, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10734, 76, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10735, 61, 29, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10735, 77, 13, 2, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10736, 65, 21, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10736, 75, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10737, 13, 6, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10737, 41, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10738, 16, 17, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10739, 36, 19, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10739, 52, 7, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10740, 28, 46, 5, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10740, 35, 18, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10740, 45, 10, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10740, 56, 38, 14, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10741, 2, 19, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10742, 3, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10742, 60, 34, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10742, 72, 35, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10743, 46, 12, 28, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10744, 40, 18, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10745, 18, 63, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10745, 44, 19, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10745, 59, 55, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10745, 72, 35, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10746, 13, 6, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10746, 42, 14, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10746, 62, 49, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10746, 69, 36, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10747, 31, 13, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10747, 41, 10, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10747, 63, 44, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10747, 69, 36, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10748, 23, 9, 44, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10748, 40, 18, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10748, 56, 38, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10749, 56, 38, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10749, 59, 55, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10749, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10750, 14, 23, 5, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10750, 45, 10, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10750, 59, 55, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10751, 26, 31, 12, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10751, 30, 26, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10751, 50, 16, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10751, 73, 15, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10752, 1, 18, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10752, 69, 36, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10753, 45, 10, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10753, 74, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10754, 40, 18, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10755, 47, 10, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10755, 56, 38, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10755, 57, 20, 14, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10755, 69, 36, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10756, 18, 63, 21, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10756, 36, 19, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10756, 68, 13, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10756, 69, 36, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10757, 34, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10757, 59, 55, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10757, 62, 49, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10757, 64, 33, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10758, 26, 31, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10758, 52, 7, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10758, 70, 15, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10759, 32, 32, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10760, 25, 14, 12, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10760, 27, 44, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10760, 43, 46, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10761, 25, 14, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10761, 75, 8, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10762, 39, 18, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10762, 47, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10762, 51, 53, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10762, 56, 38, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10763, 21, 10, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10763, 22, 21, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10763, 24, 5, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10764, 3, 10, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10764, 39, 18, 130, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10765, 65, 21, 80, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10766, 2, 19, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10766, 7, 30, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10766, 68, 13, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10767, 42, 14, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10768, 22, 21, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10768, 31, 13, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10768, 60, 34, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10768, 71, 22, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10769, 41, 10, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10769, 52, 7, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10769, 61, 29, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10769, 62, 49, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10770, 11, 21, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10771, 71, 22, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10772, 29, 124, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10772, 59, 55, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10773, 17, 39, 33, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10773, 31, 13, 70, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10773, 75, 8, 7, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10774, 31, 13, 2, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10774, 66, 17, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10775, 10, 31, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10775, 67, 14, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10776, 31, 13, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10776, 42, 14, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10776, 45, 10, 27, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10776, 51, 53, 120, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10777, 42, 14, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10778, 41, 10, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10779, 16, 17, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10779, 62, 49, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10780, 70, 15, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10780, 77, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10781, 54, 7, 3, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10781, 56, 38, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10781, 74, 10, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10782, 31, 13, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10783, 31, 13, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10783, 38, 264, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10784, 36, 19, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10784, 39, 18, 2, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10784, 72, 35, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10785, 10, 31, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10785, 75, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10786, 8, 40, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10786, 30, 26, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10786, 75, 8, 42, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10787, 2, 19, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10787, 29, 124, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10788, 19, 9, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10788, 75, 8, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10789, 18, 63, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10789, 35, 18, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10789, 63, 44, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10789, 68, 13, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10790, 7, 30, 3, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10790, 56, 38, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10791, 29, 124, 14, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10791, 41, 10, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10792, 2, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10792, 54, 7, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10792, 68, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10793, 41, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10793, 52, 7, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10794, 14, 23, 15, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10794, 54, 7, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10795, 16, 17, 65, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10795, 17, 39, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10796, 26, 31, 21, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10796, 44, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10796, 64, 33, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10796, 69, 36, 24, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10797, 11, 21, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10798, 62, 49, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10798, 72, 35, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10799, 13, 6, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10799, 24, 5, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10799, 59, 55, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10800, 11, 21, 50, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10800, 51, 53, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10800, 54, 7, 7, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10801, 17, 39, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10801, 29, 124, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10802, 30, 26, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10802, 51, 53, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10802, 55, 24, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10802, 62, 49, 5, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10803, 19, 9, 24, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10803, 25, 14, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10803, 59, 55, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10804, 10, 31, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10804, 28, 46, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10804, 49, 20, 4, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10805, 34, 14, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10805, 38, 264, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10806, 2, 19, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10806, 65, 21, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10806, 74, 10, 15, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10807, 40, 18, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10808, 56, 38, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10808, 76, 18, 50, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10809, 52, 7, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10810, 13, 6, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10810, 25, 14, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10810, 70, 15, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10811, 19, 9, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10811, 23, 9, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10811, 40, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10812, 31, 13, 16, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10812, 72, 35, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10812, 77, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10813, 2, 19, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10813, 46, 12, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10814, 41, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10814, 43, 46, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10814, 48, 13, 8, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10814, 61, 29, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10815, 33, 3, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10816, 38, 264, 30, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10816, 62, 49, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10817, 26, 31, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10817, 38, 264, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10817, 40, 18, 60, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10817, 62, 49, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10818, 32, 32, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10818, 41, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10819, 43, 46, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10819, 75, 8, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10820, 56, 38, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10821, 35, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10821, 51, 53, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10822, 62, 49, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10822, 70, 15, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10823, 11, 21, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10823, 57, 20, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10823, 59, 55, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10823, 77, 13, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10824, 41, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10824, 70, 15, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10825, 26, 31, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10825, 53, 33, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10826, 31, 13, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10826, 57, 20, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10827, 10, 31, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10827, 39, 18, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10828, 20, 81, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10828, 38, 264, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10829, 2, 19, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10829, 8, 40, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10829, 13, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10829, 60, 34, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10830, 6, 25, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10830, 39, 18, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10830, 60, 34, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10830, 68, 13, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10831, 19, 9, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10831, 35, 18, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10831, 38, 264, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10831, 43, 46, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10832, 13, 6, 3, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10832, 25, 14, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10832, 44, 19, 16, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10832, 64, 33, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10833, 7, 30, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10833, 31, 13, 9, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10833, 53, 33, 9, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10834, 29, 124, 8, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10834, 30, 26, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10835, 59, 55, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10835, 77, 13, 2, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10836, 22, 21, 52, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10836, 35, 18, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10836, 57, 20, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10836, 60, 34, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10836, 64, 33, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10837, 13, 6, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10837, 40, 18, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10837, 47, 10, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10837, 76, 18, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10838, 1, 18, 4, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10838, 18, 63, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10838, 36, 19, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10839, 58, 13, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10839, 72, 35, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10840, 25, 14, 6, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10840, 39, 18, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10841, 10, 31, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10841, 56, 38, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10841, 59, 55, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10841, 77, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10842, 11, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10842, 43, 46, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10842, 68, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10842, 70, 15, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10843, 51, 53, 4, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10844, 22, 21, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10845, 23, 9, 70, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10845, 35, 18, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10845, 42, 14, 42, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10845, 58, 13, 60, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10845, 64, 33, 48, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10846, 4, 22, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10846, 70, 15, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10846, 74, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 1, 18, 80, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 19, 9, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 37, 26, 60, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 45, 10, 36, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 60, 34, 45, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10847, 71, 22, 55, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10848, 5, 21, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10848, 9, 97, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10849, 3, 10, 49, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10849, 26, 31, 18, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10850, 25, 14, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10850, 33, 3, 4, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10850, 70, 15, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10851, 2, 19, 5, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10851, 25, 14, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10851, 57, 20, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10851, 59, 55, 42, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10852, 2, 19, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10852, 17, 39, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10852, 62, 49, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10853, 18, 63, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10854, 10, 31, 100, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10854, 13, 6, 65, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10855, 16, 17, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10855, 31, 13, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10855, 56, 38, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10855, 65, 21, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10856, 2, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10856, 42, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10857, 3, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10857, 26, 31, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10857, 29, 124, 10, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10858, 7, 30, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10858, 27, 44, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10858, 70, 15, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10859, 24, 5, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10859, 54, 7, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10859, 64, 33, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10860, 51, 53, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10860, 76, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10861, 17, 39, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10861, 18, 63, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10861, 21, 10, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10861, 33, 3, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10861, 62, 49, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10862, 11, 21, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10862, 52, 7, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10863, 1, 18, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10863, 58, 13, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10864, 35, 18, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10864, 67, 14, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10865, 38, 264, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10865, 39, 18, 80, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10866, 2, 19, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10866, 24, 5, 6, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10866, 30, 26, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10867, 53, 33, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10868, 26, 31, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10868, 35, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10868, 49, 20, 42, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10869, 1, 18, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10869, 11, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10869, 23, 9, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10869, 68, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10870, 35, 18, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10870, 51, 53, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10871, 6, 25, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10871, 16, 17, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10871, 17, 39, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10872, 55, 24, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10872, 62, 49, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10872, 64, 33, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10872, 65, 21, 21, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10873, 21, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10873, 28, 46, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10874, 10, 31, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10875, 19, 9, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10875, 47, 10, 21, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10875, 49, 20, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10876, 46, 12, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10876, 64, 33, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10877, 16, 17, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10877, 18, 63, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10878, 20, 81, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10879, 40, 18, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10879, 65, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10879, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10880, 23, 9, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10880, 61, 29, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10880, 70, 15, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10881, 73, 15, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10882, 42, 14, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10882, 49, 20, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10882, 54, 7, 32, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10883, 24, 5, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10884, 21, 10, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10884, 56, 38, 21, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10884, 65, 21, 12, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10885, 2, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10885, 24, 5, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10885, 70, 15, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10885, 77, 13, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10886, 10, 31, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10886, 31, 13, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10886, 77, 13, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10887, 25, 14, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10888, 2, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10888, 68, 13, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10889, 11, 21, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10889, 38, 264, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10890, 17, 39, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10890, 34, 14, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10890, 41, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10891, 30, 26, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10892, 59, 55, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10893, 8, 40, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10893, 24, 5, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10893, 29, 124, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10893, 30, 26, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10893, 36, 19, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10894, 13, 6, 28, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10894, 69, 36, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10894, 75, 8, 120, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10895, 24, 5, 110, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10895, 39, 18, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10895, 40, 18, 91, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10895, 60, 34, 100, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10896, 45, 10, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10896, 56, 38, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10897, 29, 124, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10897, 30, 26, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10898, 13, 6, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10899, 39, 18, 8, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10900, 70, 15, 3, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10901, 41, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10901, 71, 22, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10902, 55, 24, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10902, 62, 49, 6, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10903, 13, 6, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10903, 65, 21, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10903, 68, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10904, 58, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10904, 62, 49, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10905, 1, 18, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10906, 61, 29, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10907, 75, 8, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10908, 7, 30, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10908, 52, 7, 14, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10909, 7, 30, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10909, 16, 17, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10909, 41, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10910, 19, 9, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10910, 49, 20, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10910, 61, 29, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10911, 1, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10911, 17, 39, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10911, 67, 14, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10912, 11, 21, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10912, 29, 124, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10913, 4, 22, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10913, 33, 3, 40, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10913, 58, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10914, 71, 22, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10915, 17, 39, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10915, 33, 3, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10915, 54, 7, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10916, 16, 17, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10916, 32, 32, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10916, 57, 20, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10917, 30, 26, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10917, 60, 34, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10918, 1, 18, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10918, 60, 34, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10919, 16, 17, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10919, 25, 14, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10919, 40, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10920, 50, 16, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10921, 35, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10921, 63, 44, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10922, 17, 39, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10922, 24, 5, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10923, 42, 14, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10923, 43, 46, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10923, 67, 14, 24, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10924, 10, 31, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10924, 28, 46, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10924, 75, 8, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10925, 36, 19, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10925, 52, 7, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10926, 11, 21, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10926, 13, 6, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10926, 19, 9, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10926, 72, 35, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10927, 20, 81, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10927, 52, 7, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10927, 76, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10928, 47, 10, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10928, 76, 18, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10929, 21, 10, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10929, 75, 8, 49, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10929, 77, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10930, 21, 10, 36, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10930, 27, 44, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10930, 55, 24, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10930, 58, 13, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10931, 13, 6, 42, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10931, 57, 20, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10932, 16, 17, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10932, 62, 49, 14, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10932, 72, 35, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10932, 75, 8, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10933, 53, 33, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10933, 61, 29, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10934, 6, 25, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10935, 1, 18, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10935, 18, 63, 4, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10935, 23, 9, 8, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10936, 36, 19, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10937, 28, 46, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10937, 34, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10938, 13, 6, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10938, 43, 46, 24, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10938, 60, 34, 49, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10938, 71, 22, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10939, 2, 19, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10939, 67, 14, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10940, 7, 30, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10940, 13, 6, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10941, 31, 13, 44, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10941, 62, 49, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10941, 68, 13, 80, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10941, 72, 35, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10942, 49, 20, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10943, 13, 6, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10943, 22, 21, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10943, 46, 12, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10944, 11, 21, 5, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10944, 44, 19, 18, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10944, 56, 38, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10945, 13, 6, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10945, 31, 13, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10946, 10, 31, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10946, 24, 5, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10946, 77, 13, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10947, 59, 55, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10948, 50, 16, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10948, 51, 53, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10948, 55, 24, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10949, 6, 25, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10949, 10, 31, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10949, 17, 39, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10949, 62, 49, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10950, 4, 22, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10951, 33, 3, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10951, 41, 10, 6, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10951, 75, 8, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10952, 6, 25, 16, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10952, 28, 46, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10953, 20, 81, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10953, 31, 13, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10954, 16, 17, 28, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10954, 31, 13, 25, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10954, 45, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10954, 60, 34, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10955, 75, 8, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10956, 21, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10956, 47, 10, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10956, 51, 53, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10957, 30, 26, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10957, 35, 18, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10957, 64, 33, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10958, 5, 21, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10958, 7, 30, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10958, 72, 35, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10959, 75, 8, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10960, 24, 5, 10, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10960, 41, 10, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10961, 52, 7, 6, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10961, 76, 18, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10962, 7, 30, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10962, 13, 6, 77, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10962, 53, 33, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10962, 69, 36, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10962, 76, 18, 44, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10963, 60, 34, 2, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10964, 18, 63, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10964, 38, 264, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10964, 69, 36, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10965, 51, 53, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10966, 37, 26, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10966, 56, 38, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10966, 62, 49, 12, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10967, 19, 9, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10967, 49, 20, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10968, 12, 38, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10968, 24, 5, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10968, 64, 33, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10969, 46, 12, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10970, 52, 7, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10971, 29, 124, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10972, 17, 39, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10972, 33, 3, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10973, 26, 31, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10973, 41, 10, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10973, 75, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10974, 63, 44, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10975, 8, 40, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10975, 75, 8, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10976, 28, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10977, 39, 18, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10977, 47, 10, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10977, 51, 53, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10977, 63, 44, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10978, 8, 40, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10978, 21, 10, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10978, 40, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10978, 44, 19, 6, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 7, 30, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 12, 38, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 24, 5, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 27, 44, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 31, 13, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10979, 63, 44, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10980, 75, 8, 40, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10981, 38, 264, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10982, 7, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10982, 43, 46, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10983, 13, 6, 84, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10983, 57, 20, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10984, 16, 17, 55, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10984, 24, 5, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10984, 36, 19, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10985, 16, 17, 36, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10985, 18, 63, 8, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10985, 32, 32, 35, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10986, 11, 21, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10986, 20, 81, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10986, 76, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10986, 77, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10987, 7, 30, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10987, 43, 46, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10987, 72, 35, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10988, 7, 30, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10988, 62, 49, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10989, 6, 25, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10989, 11, 21, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10989, 41, 10, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10990, 21, 10, 65, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10990, 34, 14, 60, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10990, 55, 24, 65, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10990, 61, 29, 66, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10991, 2, 19, 50, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10991, 70, 15, 20, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10991, 76, 18, 90, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10992, 72, 35, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10993, 29, 124, 50, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10993, 41, 10, 35, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10994, 59, 55, 18, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10995, 51, 53, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10995, 60, 34, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10996, 42, 14, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10997, 32, 32, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10997, 46, 12, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10997, 52, 7, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10998, 24, 5, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10998, 61, 29, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10998, 74, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10998, 75, 8, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10999, 41, 10, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10999, 51, 53, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (10999, 77, 13, 21, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11000, 4, 22, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11000, 24, 5, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11000, 77, 13, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11001, 7, 30, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11001, 22, 21, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11001, 46, 12, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11001, 55, 24, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11002, 13, 6, 56, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11002, 35, 18, 15, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11002, 42, 14, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11002, 55, 24, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11003, 1, 18, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11003, 40, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11003, 52, 7, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11004, 26, 31, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11004, 76, 18, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11005, 1, 18, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11005, 59, 55, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11006, 1, 18, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11006, 29, 124, 2, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11007, 8, 40, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11007, 29, 124, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11007, 42, 14, 14, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11008, 28, 46, 70, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11008, 34, 14, 90, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11008, 71, 22, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11009, 24, 5, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11009, 36, 19, 18, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11009, 60, 34, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11010, 7, 30, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11010, 24, 5, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11011, 58, 13, 40, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11011, 71, 22, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11012, 19, 9, 50, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11012, 60, 34, 36, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11012, 71, 22, 60, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11013, 23, 9, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11013, 42, 14, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11013, 45, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11013, 68, 13, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11014, 41, 10, 28, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11015, 30, 26, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11015, 77, 13, 18, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11016, 31, 13, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11016, 36, 19, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11017, 3, 10, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11017, 59, 55, 110, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11017, 70, 15, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11018, 12, 38, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11018, 18, 63, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11018, 56, 38, 5, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11019, 46, 12, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11019, 49, 20, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11020, 10, 31, 24, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11021, 2, 19, 11, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11021, 20, 81, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11021, 26, 31, 63, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11021, 51, 53, 44, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11021, 72, 35, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11022, 19, 9, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11022, 69, 36, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11023, 7, 30, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11023, 43, 46, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11024, 26, 31, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11024, 33, 3, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11024, 65, 21, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11024, 71, 22, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11025, 1, 18, 10, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11025, 13, 6, 20, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11026, 18, 63, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11026, 51, 53, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11027, 24, 5, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11027, 62, 49, 21, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11028, 55, 24, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11028, 59, 55, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11029, 56, 38, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11029, 63, 44, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11030, 2, 19, 100, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11030, 5, 21, 70, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11030, 29, 124, 60, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11030, 59, 55, 100, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11031, 1, 18, 45, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11031, 13, 6, 80, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11031, 24, 5, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11031, 64, 33, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11031, 71, 22, 16, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11032, 36, 19, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11032, 38, 264, 25, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11032, 59, 55, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11033, 53, 33, 70, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11033, 69, 36, 36, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11034, 21, 10, 15, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11034, 44, 19, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11034, 61, 29, 6, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11035, 1, 18, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11035, 35, 18, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11035, 42, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11035, 54, 7, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11036, 13, 6, 7, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11036, 59, 55, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11037, 70, 15, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11038, 40, 18, 5, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11038, 52, 7, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11038, 71, 22, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11039, 28, 46, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11039, 35, 18, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11039, 49, 20, 60, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11039, 57, 20, 28, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11040, 21, 10, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11041, 2, 19, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11041, 63, 44, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11042, 44, 19, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11042, 61, 29, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11043, 11, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11044, 62, 49, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11045, 33, 3, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11045, 51, 53, 24, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11046, 12, 38, 20, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11046, 32, 32, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11046, 35, 18, 18, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11047, 1, 18, 25, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11047, 5, 21, 30, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11048, 68, 13, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11049, 2, 19, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11049, 12, 38, 4, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11050, 76, 18, 50, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11051, 24, 5, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11052, 43, 46, 30, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11052, 61, 29, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11053, 18, 63, 35, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11053, 32, 32, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11053, 64, 33, 25, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11054, 33, 3, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11054, 67, 14, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11055, 24, 5, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11055, 25, 14, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11055, 51, 53, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11055, 57, 20, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11056, 7, 30, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11056, 55, 24, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11056, 60, 34, 50, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11057, 70, 15, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11058, 21, 10, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11058, 60, 34, 21, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11058, 61, 29, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11059, 13, 6, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11059, 17, 39, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11059, 60, 34, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11060, 60, 34, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11060, 77, 13, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11061, 60, 34, 15, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11062, 53, 33, 10, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11062, 70, 15, 12, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11063, 34, 14, 30, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11063, 40, 18, 40, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11063, 41, 10, 30, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11064, 17, 39, 77, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11064, 41, 10, 12, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11064, 53, 33, 25, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11064, 55, 24, 4, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11064, 68, 13, 55, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11065, 30, 26, 4, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11065, 54, 7, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11066, 16, 17, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11066, 19, 9, 42, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11066, 34, 14, 35, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11067, 41, 10, 9, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11068, 28, 46, 8, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11068, 43, 46, 36, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11068, 77, 13, 28, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11069, 39, 18, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11070, 1, 18, 40, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11070, 2, 19, 20, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11070, 16, 17, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11070, 31, 13, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11071, 7, 30, 15, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11071, 13, 6, 10, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11072, 2, 19, 8, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11072, 41, 10, 40, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11072, 50, 16, 22, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11072, 64, 33, 130, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11073, 11, 21, 10, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11073, 24, 5, 20, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11074, 16, 17, 14, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11075, 2, 19, 10, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11075, 46, 12, 30, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11075, 76, 18, 2, 0.150000005960464006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11076, 6, 25, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11076, 14, 23, 20, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11076, 19, 9, 10, 0.25);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 2, 19, 24, 0.200000002980231989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 3, 10, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 4, 22, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 6, 25, 1, 0.0199999995529651989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 7, 30, 1, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 8, 40, 2, 0.100000001490115994);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 10, 31, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 12, 38, 2, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 13, 6, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 14, 23, 1, 0.0299999993294477012);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 16, 17, 2, 0.0299999993294477012);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 20, 81, 1, 0.0399999991059303006);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 23, 9, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 32, 32, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 39, 18, 2, 0.0500000007450581013);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 41, 10, 3, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 46, 12, 3, 0.0199999995529651989);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 52, 7, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 55, 24, 2, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 60, 34, 2, 0.0599999986588954995);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 64, 33, 2, 0.0299999993294477012);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 66, 17, 1, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 73, 15, 2, 0.00999999977648258036);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 75, 8, 4, 0);
INSERT INTO public.order_details (orderid, productid, unitprice, quantity, discount) VALUES (11077, 77, 13, 2, 0);


--
-- TOC entry 3001 (class 0 OID 16454)
-- Dependencies: 201
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10248, 'VINET', 5, '1996-07-04 03:00:00', '1996-08-01 03:00:00', '1996-07-16 03:00:00', 3, 32, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10249, 'TOMSP', 6, '1996-07-05 03:00:00', '1996-08-16 03:00:00', '1996-07-10 03:00:00', 1, 12, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10250, 'HANAR', 4, '1996-07-08 03:00:00', '1996-08-05 03:00:00', '1996-07-12 03:00:00', 2, 66, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10251, 'VICTE', 3, '1996-07-08 03:00:00', '1996-08-05 03:00:00', '1996-07-15 03:00:00', 1, 41, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10252, 'SUPRD', 4, '1996-07-09 03:00:00', '1996-08-06 03:00:00', '1996-07-11 03:00:00', 2, 51, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10253, 'HANAR', 3, '1996-07-10 03:00:00', '1996-07-24 03:00:00', '1996-07-16 03:00:00', 2, 58, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10254, 'CHOPS', 5, '1996-07-11 03:00:00', '1996-08-08 03:00:00', '1996-07-23 03:00:00', 2, 23, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10255, 'RICSU', 9, '1996-07-12 03:00:00', '1996-08-09 03:00:00', '1996-07-15 03:00:00', 3, 148, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10256, 'WELLI', 3, '1996-07-15 03:00:00', '1996-08-12 03:00:00', '1996-07-17 03:00:00', 2, 14, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10257, 'HILAA', 4, '1996-07-16 03:00:00', '1996-08-13 03:00:00', '1996-07-22 03:00:00', 3, 82, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10258, 'ERNSH', 1, '1996-07-17 03:00:00', '1996-08-14 03:00:00', '1996-07-23 03:00:00', 1, 141, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10259, 'CENTC', 4, '1996-07-18 03:00:00', '1996-08-15 03:00:00', '1996-07-25 03:00:00', 3, 3, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10260, 'OTTIK', 4, '1996-07-19 03:00:00', '1996-08-16 03:00:00', '1996-07-29 03:00:00', 1, 55, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10261, 'QUEDE', 4, '1996-07-19 03:00:00', '1996-08-16 03:00:00', '1996-07-30 03:00:00', 2, 3, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10262, 'RATTC', 8, '1996-07-22 03:00:00', '1996-08-19 03:00:00', '1996-07-25 03:00:00', 3, 48, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10263, 'ERNSH', 9, '1996-07-23 03:00:00', '1996-08-20 03:00:00', '1996-07-31 03:00:00', 3, 146, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10264, 'FOLKO', 6, '1996-07-24 03:00:00', '1996-08-21 03:00:00', '1996-08-23 03:00:00', 3, 4, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10265, 'BLONP', 2, '1996-07-25 03:00:00', '1996-08-22 03:00:00', '1996-08-12 03:00:00', 1, 55, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10266, 'WARTH', 3, '1996-07-26 03:00:00', '1996-09-06 03:00:00', '1996-07-31 03:00:00', 3, 26, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10267, 'FRANK', 4, '1996-07-29 03:00:00', '1996-08-26 03:00:00', '1996-08-06 03:00:00', 1, 209, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10268, 'GROSR', 8, '1996-07-30 03:00:00', '1996-08-27 03:00:00', '1996-08-02 03:00:00', 3, 66, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10269, 'WHITC', 5, '1996-07-31 03:00:00', '1996-08-14 03:00:00', '1996-08-09 03:00:00', 1, 5, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10270, 'WARTH', 1, '1996-08-01 03:00:00', '1996-08-29 03:00:00', '1996-08-02 03:00:00', 1, 137, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10271, 'SPLIR', 6, '1996-08-01 03:00:00', '1996-08-29 03:00:00', '1996-08-30 03:00:00', 2, 5, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10272, 'RATTC', 6, '1996-08-02 03:00:00', '1996-08-30 03:00:00', '1996-08-06 03:00:00', 2, 98, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10273, 'QUICK', 3, '1996-08-05 03:00:00', '1996-09-02 03:00:00', '1996-08-12 03:00:00', 3, 76, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10274, 'VINET', 6, '1996-08-06 03:00:00', '1996-09-03 03:00:00', '1996-08-16 03:00:00', 1, 6, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10275, 'MAGAA', 1, '1996-08-07 03:00:00', '1996-09-04 03:00:00', '1996-08-09 03:00:00', 1, 27, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10276, 'TORTU', 8, '1996-08-08 03:00:00', '1996-08-22 03:00:00', '1996-08-14 03:00:00', 3, 14, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10277, 'MORGK', 2, '1996-08-09 03:00:00', '1996-09-06 03:00:00', '1996-08-13 03:00:00', 3, 126, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10278, 'BERGS', 8, '1996-08-12 03:00:00', '1996-09-09 03:00:00', '1996-08-16 03:00:00', 2, 93, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10279, 'LEHMS', 8, '1996-08-13 03:00:00', '1996-09-10 03:00:00', '1996-08-16 03:00:00', 2, 26, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10280, 'BERGS', 2, '1996-08-14 03:00:00', '1996-09-11 03:00:00', '1996-09-12 03:00:00', 1, 9, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10281, 'ROMEY', 4, '1996-08-14 03:00:00', '1996-08-28 03:00:00', '1996-08-21 03:00:00', 1, 3, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10282, 'ROMEY', 4, '1996-08-15 03:00:00', '1996-09-12 03:00:00', '1996-08-21 03:00:00', 1, 13, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10283, 'LILAS', 3, '1996-08-16 03:00:00', '1996-09-13 03:00:00', '1996-08-23 03:00:00', 3, 85, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10284, 'LEHMS', 4, '1996-08-19 03:00:00', '1996-09-16 03:00:00', '1996-08-27 03:00:00', 1, 77, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10285, 'QUICK', 1, '1996-08-20 03:00:00', '1996-09-17 03:00:00', '1996-08-26 03:00:00', 2, 77, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10286, 'QUICK', 8, '1996-08-21 03:00:00', '1996-09-18 03:00:00', '1996-08-30 03:00:00', 3, 229, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10287, 'RICAR', 8, '1996-08-22 03:00:00', '1996-09-19 03:00:00', '1996-08-28 03:00:00', 3, 13, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10288, 'REGGC', 4, '1996-08-23 03:00:00', '1996-09-20 03:00:00', '1996-09-03 03:00:00', 1, 7, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10289, 'BSBEV', 7, '1996-08-26 03:00:00', '1996-09-23 03:00:00', '1996-08-28 03:00:00', 3, 23, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10290, 'COMMI', 8, '1996-08-27 03:00:00', '1996-09-24 03:00:00', '1996-09-03 03:00:00', 1, 80, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10291, 'QUEDE', 6, '1996-08-27 03:00:00', '1996-09-24 03:00:00', '1996-09-04 03:00:00', 2, 6, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10292, 'TRADH', 1, '1996-08-28 03:00:00', '1996-09-25 03:00:00', '1996-09-02 03:00:00', 2, 1, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10293, 'TORTU', 1, '1996-08-29 03:00:00', '1996-09-26 03:00:00', '1996-09-11 03:00:00', 3, 21, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10294, 'RATTC', 4, '1996-08-30 03:00:00', '1996-09-27 03:00:00', '1996-09-05 03:00:00', 2, 147, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10295, 'VINET', 2, '1996-09-02 03:00:00', '1996-09-30 03:00:00', '1996-09-10 03:00:00', 2, 1, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10296, 'LILAS', 6, '1996-09-03 03:00:00', '1996-10-01 03:00:00', '1996-09-11 03:00:00', 1, 0, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10297, 'BLONP', 5, '1996-09-04 03:00:00', '1996-10-16 03:00:00', '1996-09-10 03:00:00', 2, 6, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10298, 'HUNGO', 6, '1996-09-05 03:00:00', '1996-10-03 03:00:00', '1996-09-11 03:00:00', 2, 168, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10299, 'RICAR', 4, '1996-09-06 03:00:00', '1996-10-04 03:00:00', '1996-09-13 03:00:00', 2, 30, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10300, 'MAGAA', 2, '1996-09-09 03:00:00', '1996-10-07 03:00:00', '1996-09-18 03:00:00', 2, 18, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10301, 'WANDK', 8, '1996-09-09 03:00:00', '1996-10-07 03:00:00', '1996-09-17 03:00:00', 2, 45, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10412, 'WARTH', 8, '1997-01-13 03:00:00', '1997-02-10 03:00:00', '1997-01-15 03:00:00', 2, 4, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10302, 'SUPRD', 4, '1996-09-10 03:00:00', '1996-10-08 03:00:00', '1996-10-09 03:00:00', 2, 6, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10303, 'GODOS', 7, '1996-09-11 03:00:00', '1996-10-09 03:00:00', '1996-09-18 03:00:00', 2, 108, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10304, 'TORTU', 1, '1996-09-12 03:00:00', '1996-10-10 03:00:00', '1996-09-17 03:00:00', 2, 64, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10305, 'OLDWO', 8, '1996-09-13 03:00:00', '1996-10-11 03:00:00', '1996-10-09 03:00:00', 3, 258, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10306, 'ROMEY', 1, '1996-09-16 03:00:00', '1996-10-14 03:00:00', '1996-09-23 03:00:00', 3, 8, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10307, 'LONEP', 2, '1996-09-17 03:00:00', '1996-10-15 03:00:00', '1996-09-25 03:00:00', 2, 1, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10308, 'ANATR', 7, '1996-09-18 03:00:00', '1996-10-16 03:00:00', '1996-09-24 03:00:00', 3, 2, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10309, 'HUNGO', 3, '1996-09-19 03:00:00', '1996-10-17 03:00:00', '1996-10-23 03:00:00', 1, 47, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10310, 'THEBI', 8, '1996-09-20 03:00:00', '1996-10-18 03:00:00', '1996-09-27 03:00:00', 2, 18, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10311, 'DUMON', 1, '1996-09-20 03:00:00', '1996-10-04 03:00:00', '1996-09-26 03:00:00', 3, 25, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10312, 'WANDK', 2, '1996-09-23 03:00:00', '1996-10-21 03:00:00', '1996-10-03 03:00:00', 2, 40, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10313, 'QUICK', 2, '1996-09-24 03:00:00', '1996-10-22 03:00:00', '1996-10-04 03:00:00', 2, 2, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10314, 'RATTC', 1, '1996-09-25 03:00:00', '1996-10-23 03:00:00', '1996-10-04 03:00:00', 2, 74, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10315, 'ISLAT', 4, '1996-09-26 03:00:00', '1996-10-24 03:00:00', '1996-10-03 03:00:00', 2, 42, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10316, 'RATTC', 1, '1996-09-27 03:00:00', '1996-10-25 03:00:00', '1996-10-08 03:00:00', 3, 150, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10317, 'LONEP', 6, '1996-09-30 03:00:00', '1996-10-28 03:00:00', '1996-10-10 03:00:00', 1, 13, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10318, 'ISLAT', 8, '1996-10-01 03:00:00', '1996-10-29 03:00:00', '1996-10-04 03:00:00', 2, 5, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10319, 'TORTU', 7, '1996-10-02 03:00:00', '1996-10-30 03:00:00', '1996-10-11 03:00:00', 3, 65, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10320, 'WARTH', 5, '1996-10-03 03:00:00', '1996-10-17 03:00:00', '1996-10-18 03:00:00', 3, 35, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10321, 'ISLAT', 3, '1996-10-03 03:00:00', '1996-10-31 03:00:00', '1996-10-11 03:00:00', 2, 3, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10322, 'PERIC', 7, '1996-10-04 03:00:00', '1996-11-01 03:00:00', '1996-10-23 03:00:00', 3, 0, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10323, 'KOENE', 4, '1996-10-07 03:00:00', '1996-11-04 03:00:00', '1996-10-14 03:00:00', 1, 5, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10324, 'SAVEA', 9, '1996-10-08 03:00:00', '1996-11-05 03:00:00', '1996-10-10 03:00:00', 1, 214, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10325, 'KOENE', 1, '1996-10-09 03:00:00', '1996-10-23 03:00:00', '1996-10-14 03:00:00', 3, 65, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10326, 'BOLID', 4, '1996-10-10 03:00:00', '1996-11-07 03:00:00', '1996-10-14 03:00:00', 2, 78, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10327, 'FOLKO', 2, '1996-10-11 03:00:00', '1996-11-08 03:00:00', '1996-10-14 03:00:00', 1, 63, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10328, 'FURIB', 4, '1996-10-14 03:00:00', '1996-11-11 03:00:00', '1996-10-17 03:00:00', 3, 87, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10329, 'SPLIR', 4, '1996-10-15 03:00:00', '1996-11-26 03:00:00', '1996-10-23 03:00:00', 2, 192, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10330, 'LILAS', 3, '1996-10-16 03:00:00', '1996-11-13 03:00:00', '1996-10-28 03:00:00', 1, 13, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10331, 'BONAP', 9, '1996-10-16 03:00:00', '1996-11-27 03:00:00', '1996-10-21 03:00:00', 1, 10, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10332, 'MEREP', 3, '1996-10-17 03:00:00', '1996-11-28 03:00:00', '1996-10-21 03:00:00', 2, 53, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10333, 'WARTH', 5, '1996-10-18 03:00:00', '1996-11-15 03:00:00', '1996-10-25 03:00:00', 3, 1, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10334, 'VICTE', 8, '1996-10-21 03:00:00', '1996-11-18 03:00:00', '1996-10-28 03:00:00', 2, 9, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10335, 'HUNGO', 7, '1996-10-22 03:00:00', '1996-11-19 03:00:00', '1996-10-24 03:00:00', 2, 42, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10336, 'PRINI', 7, '1996-10-23 03:00:00', '1996-11-20 03:00:00', '1996-10-25 03:00:00', 2, 16, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10337, 'FRANK', 4, '1996-10-24 03:00:00', '1996-11-21 03:00:00', '1996-10-29 03:00:00', 3, 108, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10338, 'OLDWO', 4, '1996-10-25 03:00:00', '1996-11-22 03:00:00', '1996-10-29 03:00:00', 3, 84, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10339, 'MEREP', 2, '1996-10-28 03:00:00', '1996-11-25 03:00:00', '1996-11-04 03:00:00', 2, 16, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10340, 'BONAP', 1, '1996-10-29 03:00:00', '1996-11-26 03:00:00', '1996-11-08 03:00:00', 3, 166, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10341, 'SIMOB', 7, '1996-10-29 03:00:00', '1996-11-26 03:00:00', '1996-11-05 03:00:00', 3, 27, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10342, 'FRANK', 4, '1996-10-30 03:00:00', '1996-11-13 03:00:00', '1996-11-04 03:00:00', 2, 55, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10343, 'LEHMS', 4, '1996-10-31 03:00:00', '1996-11-28 03:00:00', '1996-11-06 03:00:00', 1, 110, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10344, 'WHITC', 4, '1996-11-01 03:00:00', '1996-11-29 03:00:00', '1996-11-05 03:00:00', 2, 23, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10345, 'QUICK', 2, '1996-11-04 03:00:00', '1996-12-02 03:00:00', '1996-11-11 03:00:00', 2, 249, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10346, 'RATTC', 3, '1996-11-05 03:00:00', '1996-12-17 03:00:00', '1996-11-08 03:00:00', 3, 142, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10347, 'FAMIA', 4, '1996-11-06 03:00:00', '1996-12-04 03:00:00', '1996-11-08 03:00:00', 3, 3, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10348, 'WANDK', 4, '1996-11-07 03:00:00', '1996-12-05 03:00:00', '1996-11-15 03:00:00', 2, 1, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10349, 'SPLIR', 7, '1996-11-08 03:00:00', '1996-12-06 03:00:00', '1996-11-15 03:00:00', 1, 9, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10350, 'LAMAI', 6, '1996-11-11 03:00:00', '1996-12-09 03:00:00', '1996-12-03 03:00:00', 2, 64, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10351, 'ERNSH', 1, '1996-11-11 03:00:00', '1996-12-09 03:00:00', '1996-11-20 03:00:00', 1, 162, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10352, 'FURIB', 3, '1996-11-12 03:00:00', '1996-11-26 03:00:00', '1996-11-18 03:00:00', 3, 1, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10353, 'PICCO', 7, '1996-11-13 03:00:00', '1996-12-11 03:00:00', '1996-11-25 03:00:00', 3, 361, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10354, 'PERIC', 8, '1996-11-14 03:00:00', '1996-12-12 03:00:00', '1996-11-20 03:00:00', 3, 54, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10355, 'AROUT', 6, '1996-11-15 03:00:00', '1996-12-13 03:00:00', '1996-11-20 03:00:00', 1, 42, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10356, 'WANDK', 6, '1996-11-18 03:00:00', '1996-12-16 03:00:00', '1996-11-27 03:00:00', 2, 37, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10357, 'LILAS', 1, '1996-11-19 03:00:00', '1996-12-17 03:00:00', '1996-12-02 03:00:00', 3, 35, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10358, 'LAMAI', 5, '1996-11-20 03:00:00', '1996-12-18 03:00:00', '1996-11-27 03:00:00', 1, 20, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10359, 'SEVES', 5, '1996-11-21 03:00:00', '1996-12-19 03:00:00', '1996-11-26 03:00:00', 3, 288, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10360, 'BLONP', 4, '1996-11-22 03:00:00', '1996-12-20 03:00:00', '1996-12-02 03:00:00', 3, 132, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10361, 'QUICK', 1, '1996-11-22 03:00:00', '1996-12-20 03:00:00', '1996-12-03 03:00:00', 2, 183, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10362, 'BONAP', 3, '1996-11-25 03:00:00', '1996-12-23 03:00:00', '1996-11-28 03:00:00', 1, 96, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10363, 'DRACD', 4, '1996-11-26 03:00:00', '1996-12-24 03:00:00', '1996-12-04 03:00:00', 3, 31, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10364, 'EASTC', 1, '1996-11-26 03:00:00', '1997-01-07 03:00:00', '1996-12-04 03:00:00', 1, 72, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10365, 'ANTON', 3, '1996-11-27 03:00:00', '1996-12-25 03:00:00', '1996-12-02 03:00:00', 2, 22, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10366, 'GALED', 8, '1996-11-28 03:00:00', '1997-01-09 03:00:00', '1996-12-30 03:00:00', 2, 10, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10367, 'VAFFE', 7, '1996-11-28 03:00:00', '1996-12-26 03:00:00', '1996-12-02 03:00:00', 3, 14, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10368, 'ERNSH', 2, '1996-11-29 03:00:00', '1996-12-27 03:00:00', '1996-12-02 03:00:00', 2, 102, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10369, 'SPLIR', 8, '1996-12-02 03:00:00', '1996-12-30 03:00:00', '1996-12-09 03:00:00', 2, 196, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10370, 'CHOPS', 6, '1996-12-03 03:00:00', '1996-12-31 03:00:00', '1996-12-27 03:00:00', 2, 1, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10371, 'LAMAI', 1, '1996-12-03 03:00:00', '1996-12-31 03:00:00', '1996-12-24 03:00:00', 1, 0, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10372, 'QUEEN', 5, '1996-12-04 03:00:00', '1997-01-01 03:00:00', '1996-12-09 03:00:00', 2, 891, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10373, 'HUNGO', 4, '1996-12-05 03:00:00', '1997-01-02 03:00:00', '1996-12-11 03:00:00', 3, 124, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10374, 'WOLZA', 1, '1996-12-05 03:00:00', '1997-01-02 03:00:00', '1996-12-09 03:00:00', 3, 4, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10375, 'HUNGC', 3, '1996-12-06 03:00:00', '1997-01-03 03:00:00', '1996-12-09 03:00:00', 2, 20, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10376, 'MEREP', 1, '1996-12-09 03:00:00', '1997-01-06 03:00:00', '1996-12-13 03:00:00', 2, 20, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10377, 'SEVES', 1, '1996-12-09 03:00:00', '1997-01-06 03:00:00', '1996-12-13 03:00:00', 3, 22, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10378, 'FOLKO', 5, '1996-12-10 03:00:00', '1997-01-07 03:00:00', '1996-12-19 03:00:00', 3, 5, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10379, 'QUEDE', 2, '1996-12-11 03:00:00', '1997-01-08 03:00:00', '1996-12-13 03:00:00', 1, 45, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10380, 'HUNGO', 8, '1996-12-12 03:00:00', '1997-01-09 03:00:00', '1997-01-16 03:00:00', 3, 35, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10381, 'LILAS', 3, '1996-12-12 03:00:00', '1997-01-09 03:00:00', '1996-12-13 03:00:00', 3, 8, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10382, 'ERNSH', 4, '1996-12-13 03:00:00', '1997-01-10 03:00:00', '1996-12-16 03:00:00', 1, 95, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10383, 'AROUT', 8, '1996-12-16 03:00:00', '1997-01-13 03:00:00', '1996-12-18 03:00:00', 3, 34, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10384, 'BERGS', 3, '1996-12-16 03:00:00', '1997-01-13 03:00:00', '1996-12-20 03:00:00', 3, 169, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10385, 'SPLIR', 1, '1996-12-17 03:00:00', '1997-01-14 03:00:00', '1996-12-23 03:00:00', 2, 31, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10386, 'FAMIA', 9, '1996-12-18 03:00:00', '1997-01-01 03:00:00', '1996-12-25 03:00:00', 3, 14, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10387, 'SANTG', 1, '1996-12-18 03:00:00', '1997-01-15 03:00:00', '1996-12-20 03:00:00', 2, 94, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10388, 'SEVES', 2, '1996-12-19 03:00:00', '1997-01-16 03:00:00', '1996-12-20 03:00:00', 1, 35, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10389, 'BOTTM', 4, '1996-12-20 03:00:00', '1997-01-17 03:00:00', '1996-12-24 03:00:00', 2, 47, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10390, 'ERNSH', 6, '1996-12-23 03:00:00', '1997-01-20 03:00:00', '1996-12-26 03:00:00', 1, 126, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10391, 'DRACD', 3, '1996-12-23 03:00:00', '1997-01-20 03:00:00', '1996-12-31 03:00:00', 3, 5, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10392, 'PICCO', 2, '1996-12-24 03:00:00', '1997-01-21 03:00:00', '1997-01-01 03:00:00', 3, 122, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10393, 'SAVEA', 1, '1996-12-25 03:00:00', '1997-01-22 03:00:00', '1997-01-03 03:00:00', 3, 127, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10394, 'HUNGC', 1, '1996-12-25 03:00:00', '1997-01-22 03:00:00', '1997-01-03 03:00:00', 3, 30, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10395, 'HILAA', 6, '1996-12-26 03:00:00', '1997-01-23 03:00:00', '1997-01-03 03:00:00', 1, 184, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10396, 'FRANK', 1, '1996-12-27 03:00:00', '1997-01-10 03:00:00', '1997-01-06 03:00:00', 3, 135, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10397, 'PRINI', 5, '1996-12-27 03:00:00', '1997-01-24 03:00:00', '1997-01-02 03:00:00', 1, 60, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10398, 'SAVEA', 2, '1996-12-30 03:00:00', '1997-01-27 03:00:00', '1997-01-09 03:00:00', 3, 89, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10399, 'VAFFE', 8, '1996-12-31 03:00:00', '1997-01-14 03:00:00', '1997-01-08 03:00:00', 3, 27, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10400, 'EASTC', 1, '1997-01-01 03:00:00', '1997-01-29 03:00:00', '1997-01-16 03:00:00', 3, 84, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10401, 'RATTC', 1, '1997-01-01 03:00:00', '1997-01-29 03:00:00', '1997-01-10 03:00:00', 1, 13, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10402, 'ERNSH', 8, '1997-01-02 03:00:00', '1997-02-13 03:00:00', '1997-01-10 03:00:00', 2, 68, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10403, 'ERNSH', 4, '1997-01-03 03:00:00', '1997-01-31 03:00:00', '1997-01-09 03:00:00', 3, 74, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10404, 'MAGAA', 2, '1997-01-03 03:00:00', '1997-01-31 03:00:00', '1997-01-08 03:00:00', 1, 156, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10405, 'LINOD', 1, '1997-01-06 03:00:00', '1997-02-03 03:00:00', '1997-01-22 03:00:00', 1, 35, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10406, 'QUEEN', 7, '1997-01-07 03:00:00', '1997-02-18 03:00:00', '1997-01-13 03:00:00', 1, 108, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10407, 'OTTIK', 2, '1997-01-07 03:00:00', '1997-02-04 03:00:00', '1997-01-30 03:00:00', 2, 91, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10408, 'FOLIG', 8, '1997-01-08 03:00:00', '1997-02-05 03:00:00', '1997-01-14 03:00:00', 1, 11, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10409, 'OCEAN', 3, '1997-01-09 03:00:00', '1997-02-06 03:00:00', '1997-01-14 03:00:00', 1, 30, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10410, 'BOTTM', 3, '1997-01-10 03:00:00', '1997-02-07 03:00:00', '1997-01-15 03:00:00', 3, 2, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10411, 'BOTTM', 9, '1997-01-10 03:00:00', '1997-02-07 03:00:00', '1997-01-21 03:00:00', 3, 24, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10413, 'LAMAI', 3, '1997-01-14 03:00:00', '1997-02-11 03:00:00', '1997-01-16 03:00:00', 2, 96, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10414, 'FAMIA', 2, '1997-01-14 03:00:00', '1997-02-11 03:00:00', '1997-01-17 03:00:00', 3, 21, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10415, 'HUNGC', 3, '1997-01-15 03:00:00', '1997-02-12 03:00:00', '1997-01-24 03:00:00', 1, 0, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10416, 'WARTH', 8, '1997-01-16 03:00:00', '1997-02-13 03:00:00', '1997-01-27 03:00:00', 3, 23, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10417, 'SIMOB', 4, '1997-01-16 03:00:00', '1997-02-13 03:00:00', '1997-01-28 03:00:00', 3, 70, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10418, 'QUICK', 4, '1997-01-17 03:00:00', '1997-02-14 03:00:00', '1997-01-24 03:00:00', 1, 18, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10419, 'RICSU', 4, '1997-01-20 03:00:00', '1997-02-17 03:00:00', '1997-01-30 03:00:00', 2, 137, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10420, 'WELLI', 3, '1997-01-21 03:00:00', '1997-02-18 03:00:00', '1997-01-27 03:00:00', 1, 44, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10421, 'QUEDE', 8, '1997-01-21 03:00:00', '1997-03-04 03:00:00', '1997-01-27 03:00:00', 1, 99, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10422, 'FRANS', 2, '1997-01-22 03:00:00', '1997-02-19 03:00:00', '1997-01-31 03:00:00', 1, 3, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10423, 'GOURL', 6, '1997-01-23 03:00:00', '1997-02-06 03:00:00', '1997-02-24 03:00:00', 3, 25, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10424, 'MEREP', 7, '1997-01-23 03:00:00', '1997-02-20 03:00:00', '1997-01-27 03:00:00', 2, 371, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10425, 'LAMAI', 6, '1997-01-24 03:00:00', '1997-02-21 03:00:00', '1997-02-14 03:00:00', 2, 8, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10426, 'GALED', 4, '1997-01-27 03:00:00', '1997-02-24 03:00:00', '1997-02-06 03:00:00', 1, 19, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10427, 'PICCO', 4, '1997-01-27 03:00:00', '1997-02-24 03:00:00', '1997-03-03 03:00:00', 2, 31, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10428, 'REGGC', 7, '1997-01-28 03:00:00', '1997-02-25 03:00:00', '1997-02-04 03:00:00', 1, 11, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10429, 'HUNGO', 3, '1997-01-29 03:00:00', '1997-03-12 03:00:00', '1997-02-07 03:00:00', 2, 57, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10430, 'ERNSH', 4, '1997-01-30 03:00:00', '1997-02-13 03:00:00', '1997-02-03 03:00:00', 1, 459, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10431, 'BOTTM', 4, '1997-01-30 03:00:00', '1997-02-13 03:00:00', '1997-02-07 03:00:00', 2, 44, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10432, 'SPLIR', 3, '1997-01-31 03:00:00', '1997-02-14 03:00:00', '1997-02-07 03:00:00', 2, 4, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10433, 'PRINI', 3, '1997-02-03 03:00:00', '1997-03-03 03:00:00', '1997-03-04 03:00:00', 3, 74, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10434, 'FOLKO', 3, '1997-02-03 03:00:00', '1997-03-03 03:00:00', '1997-02-13 03:00:00', 2, 18, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10435, 'CONSH', 8, '1997-02-04 03:00:00', '1997-03-18 03:00:00', '1997-02-07 03:00:00', 2, 9, 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10436, 'BLONP', 3, '1997-02-05 03:00:00', '1997-03-05 03:00:00', '1997-02-11 03:00:00', 2, 157, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10437, 'WARTH', 8, '1997-02-05 03:00:00', '1997-03-05 03:00:00', '1997-02-12 03:00:00', 1, 20, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10438, 'TOMSP', 3, '1997-02-06 03:00:00', '1997-03-06 03:00:00', '1997-02-14 03:00:00', 2, 8, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10439, 'MEREP', 6, '1997-02-07 03:00:00', '1997-03-07 03:00:00', '1997-02-10 03:00:00', 3, 4, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10440, 'SAVEA', 4, '1997-02-10 03:00:00', '1997-03-10 03:00:00', '1997-02-28 03:00:00', 2, 87, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10441, 'OLDWO', 3, '1997-02-10 03:00:00', '1997-03-24 03:00:00', '1997-03-14 03:00:00', 2, 73, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10442, 'ERNSH', 3, '1997-02-11 03:00:00', '1997-03-11 03:00:00', '1997-02-18 03:00:00', 2, 48, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10443, 'REGGC', 8, '1997-02-12 03:00:00', '1997-03-12 03:00:00', '1997-02-14 03:00:00', 1, 14, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10444, 'BERGS', 3, '1997-02-12 03:00:00', '1997-03-12 03:00:00', '1997-02-21 03:00:00', 3, 4, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10445, 'BERGS', 3, '1997-02-13 03:00:00', '1997-03-13 03:00:00', '1997-02-20 03:00:00', 1, 9, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10446, 'TOMSP', 6, '1997-02-14 03:00:00', '1997-03-14 03:00:00', '1997-02-19 03:00:00', 1, 15, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10447, 'RICAR', 4, '1997-02-14 03:00:00', '1997-03-14 03:00:00', '1997-03-07 03:00:00', 2, 69, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10448, 'RANCH', 4, '1997-02-17 03:00:00', '1997-03-17 03:00:00', '1997-02-24 03:00:00', 2, 39, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10449, 'BLONP', 3, '1997-02-18 03:00:00', '1997-03-18 03:00:00', '1997-02-27 03:00:00', 2, 53, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10450, 'VICTE', 8, '1997-02-19 03:00:00', '1997-03-19 03:00:00', '1997-03-11 03:00:00', 2, 7, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10451, 'QUICK', 4, '1997-02-19 03:00:00', '1997-03-05 03:00:00', '1997-03-12 03:00:00', 3, 189, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10452, 'SAVEA', 8, '1997-02-20 03:00:00', '1997-03-20 03:00:00', '1997-02-26 03:00:00', 1, 140, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10453, 'AROUT', 1, '1997-02-21 03:00:00', '1997-03-21 03:00:00', '1997-02-26 03:00:00', 2, 25, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10454, 'LAMAI', 4, '1997-02-21 03:00:00', '1997-03-21 03:00:00', '1997-02-25 03:00:00', 3, 3, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10455, 'WARTH', 8, '1997-02-24 03:00:00', '1997-04-07 03:00:00', '1997-03-03 03:00:00', 2, 180, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10456, 'KOENE', 8, '1997-02-25 03:00:00', '1997-04-08 03:00:00', '1997-02-28 03:00:00', 2, 8, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10457, 'KOENE', 2, '1997-02-25 03:00:00', '1997-03-25 03:00:00', '1997-03-03 03:00:00', 1, 12, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10458, 'SUPRD', 7, '1997-02-26 03:00:00', '1997-03-26 03:00:00', '1997-03-04 03:00:00', 3, 147, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10459, 'VICTE', 4, '1997-02-27 03:00:00', '1997-03-27 03:00:00', '1997-02-28 03:00:00', 2, 25, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10460, 'FOLKO', 8, '1997-02-28 03:00:00', '1997-03-28 03:00:00', '1997-03-03 03:00:00', 1, 16, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10461, 'LILAS', 1, '1997-02-28 03:00:00', '1997-03-28 03:00:00', '1997-03-05 03:00:00', 3, 149, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10462, 'CONSH', 2, '1997-03-03 03:00:00', '1997-03-31 02:00:00', '1997-03-18 03:00:00', 1, 6, 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10463, 'SUPRD', 5, '1997-03-04 03:00:00', '1997-04-01 02:00:00', '1997-03-06 03:00:00', 3, 15, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10464, 'FURIB', 4, '1997-03-04 03:00:00', '1997-04-01 02:00:00', '1997-03-14 03:00:00', 2, 89, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10465, 'VAFFE', 1, '1997-03-05 03:00:00', '1997-04-02 02:00:00', '1997-03-14 03:00:00', 3, 145, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10466, 'COMMI', 4, '1997-03-06 03:00:00', '1997-04-03 02:00:00', '1997-03-13 03:00:00', 1, 12, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10467, 'MAGAA', 8, '1997-03-06 03:00:00', '1997-04-03 02:00:00', '1997-03-11 03:00:00', 2, 5, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10468, 'KOENE', 3, '1997-03-07 03:00:00', '1997-04-04 02:00:00', '1997-03-12 03:00:00', 3, 44, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10469, 'WHITC', 1, '1997-03-10 03:00:00', '1997-04-07 03:00:00', '1997-03-14 03:00:00', 1, 60, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10470, 'BONAP', 4, '1997-03-11 03:00:00', '1997-04-08 03:00:00', '1997-03-14 03:00:00', 2, 65, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10471, 'BSBEV', 2, '1997-03-11 03:00:00', '1997-04-08 03:00:00', '1997-03-18 03:00:00', 3, 46, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10472, 'SEVES', 8, '1997-03-12 03:00:00', '1997-04-09 03:00:00', '1997-03-19 03:00:00', 1, 4, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10473, 'ISLAT', 1, '1997-03-13 03:00:00', '1997-03-27 03:00:00', '1997-03-21 03:00:00', 3, 16, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10474, 'PERIC', 5, '1997-03-13 03:00:00', '1997-04-10 03:00:00', '1997-03-21 03:00:00', 2, 83, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10475, 'SUPRD', 9, '1997-03-14 03:00:00', '1997-04-11 03:00:00', '1997-04-04 02:00:00', 1, 69, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10476, 'HILAA', 8, '1997-03-17 03:00:00', '1997-04-14 03:00:00', '1997-03-24 03:00:00', 3, 4, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10477, 'PRINI', 5, '1997-03-17 03:00:00', '1997-04-14 03:00:00', '1997-03-25 03:00:00', 2, 13, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10478, 'VICTE', 2, '1997-03-18 03:00:00', '1997-04-01 02:00:00', '1997-03-26 03:00:00', 3, 5, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10479, 'RATTC', 3, '1997-03-19 03:00:00', '1997-04-16 03:00:00', '1997-03-21 03:00:00', 3, 709, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10480, 'FOLIG', 6, '1997-03-20 03:00:00', '1997-04-17 03:00:00', '1997-03-24 03:00:00', 2, 1, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10481, 'RICAR', 8, '1997-03-20 03:00:00', '1997-04-17 03:00:00', '1997-03-25 03:00:00', 2, 64, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10482, 'LAZYK', 1, '1997-03-21 03:00:00', '1997-04-18 03:00:00', '1997-04-10 03:00:00', 3, 7, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10483, 'WHITC', 7, '1997-03-24 03:00:00', '1997-04-21 03:00:00', '1997-04-25 03:00:00', 2, 15, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10484, 'BSBEV', 3, '1997-03-24 03:00:00', '1997-04-21 03:00:00', '1997-04-01 02:00:00', 3, 7, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10485, 'LINOD', 4, '1997-03-25 03:00:00', '1997-04-08 03:00:00', '1997-03-31 02:00:00', 2, 64, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10486, 'HILAA', 1, '1997-03-26 03:00:00', '1997-04-23 03:00:00', '1997-04-02 02:00:00', 2, 31, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10487, 'QUEEN', 2, '1997-03-26 03:00:00', '1997-04-23 03:00:00', '1997-03-28 03:00:00', 2, 71, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10488, 'FRANK', 8, '1997-03-27 03:00:00', '1997-04-24 03:00:00', '1997-04-02 02:00:00', 2, 5, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10489, 'PICCO', 6, '1997-03-28 03:00:00', '1997-04-25 03:00:00', '1997-04-09 03:00:00', 2, 5, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10490, 'HILAA', 7, '1997-03-31 02:00:00', '1997-04-28 03:00:00', '1997-04-03 02:00:00', 2, 210, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10491, 'FURIB', 8, '1997-03-31 02:00:00', '1997-04-28 03:00:00', '1997-04-08 03:00:00', 3, 17, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10492, 'BOTTM', 3, '1997-04-01 02:00:00', '1997-04-29 03:00:00', '1997-04-11 03:00:00', 1, 63, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10493, 'LAMAI', 4, '1997-04-02 02:00:00', '1997-04-30 03:00:00', '1997-04-10 03:00:00', 3, 11, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10494, 'COMMI', 4, '1997-04-02 02:00:00', '1997-04-30 03:00:00', '1997-04-09 03:00:00', 2, 66, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10495, 'LAUGB', 3, '1997-04-03 02:00:00', '1997-05-01 03:00:00', '1997-04-11 03:00:00', 3, 5, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10496, 'TRADH', 7, '1997-04-04 02:00:00', '1997-05-02 03:00:00', '1997-04-07 03:00:00', 2, 47, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10497, 'LEHMS', 7, '1997-04-04 02:00:00', '1997-05-02 03:00:00', '1997-04-07 03:00:00', 1, 36, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10498, 'HILAA', 8, '1997-04-07 03:00:00', '1997-05-05 03:00:00', '1997-04-11 03:00:00', 2, 30, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10499, 'LILAS', 4, '1997-04-08 03:00:00', '1997-05-06 03:00:00', '1997-04-16 03:00:00', 2, 102, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10500, 'LAMAI', 6, '1997-04-09 03:00:00', '1997-05-07 03:00:00', '1997-04-17 03:00:00', 1, 43, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10501, 'BLAUS', 9, '1997-04-09 03:00:00', '1997-05-07 03:00:00', '1997-04-16 03:00:00', 3, 9, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10502, 'PERIC', 2, '1997-04-10 03:00:00', '1997-05-08 03:00:00', '1997-04-29 03:00:00', 1, 69, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10503, 'HUNGO', 6, '1997-04-11 03:00:00', '1997-05-09 03:00:00', '1997-04-16 03:00:00', 2, 17, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10504, 'WHITC', 4, '1997-04-11 03:00:00', '1997-05-09 03:00:00', '1997-04-18 03:00:00', 3, 59, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10505, 'MEREP', 3, '1997-04-14 03:00:00', '1997-05-12 03:00:00', '1997-04-21 03:00:00', 3, 7, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10506, 'KOENE', 9, '1997-04-15 03:00:00', '1997-05-13 03:00:00', '1997-05-02 03:00:00', 2, 21, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10507, 'ANTON', 7, '1997-04-15 03:00:00', '1997-05-13 03:00:00', '1997-04-22 03:00:00', 1, 47, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10508, 'OTTIK', 1, '1997-04-16 03:00:00', '1997-05-14 03:00:00', '1997-05-13 03:00:00', 2, 5, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10509, 'BLAUS', 4, '1997-04-17 03:00:00', '1997-05-15 03:00:00', '1997-04-29 03:00:00', 1, 0, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10510, 'SAVEA', 6, '1997-04-18 03:00:00', '1997-05-16 03:00:00', '1997-04-28 03:00:00', 3, 368, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10511, 'BONAP', 4, '1997-04-18 03:00:00', '1997-05-16 03:00:00', '1997-04-21 03:00:00', 3, 351, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10512, 'FAMIA', 7, '1997-04-21 03:00:00', '1997-05-19 03:00:00', '1997-04-24 03:00:00', 2, 4, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10513, 'WANDK', 7, '1997-04-22 03:00:00', '1997-06-03 03:00:00', '1997-04-28 03:00:00', 1, 106, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10514, 'ERNSH', 3, '1997-04-22 03:00:00', '1997-05-20 03:00:00', '1997-05-16 03:00:00', 2, 790, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10515, 'QUICK', 2, '1997-04-23 03:00:00', '1997-05-07 03:00:00', '1997-05-23 03:00:00', 1, 204, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10516, 'HUNGO', 2, '1997-04-24 03:00:00', '1997-05-22 03:00:00', '1997-05-01 03:00:00', 3, 63, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10517, 'NORTS', 3, '1997-04-24 03:00:00', '1997-05-22 03:00:00', '1997-04-29 03:00:00', 3, 32, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10518, 'TORTU', 4, '1997-04-25 03:00:00', '1997-05-09 03:00:00', '1997-05-05 03:00:00', 2, 218, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10519, 'CHOPS', 6, '1997-04-28 03:00:00', '1997-05-26 03:00:00', '1997-05-01 03:00:00', 3, 92, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10520, 'SANTG', 7, '1997-04-29 03:00:00', '1997-05-27 03:00:00', '1997-05-01 03:00:00', 1, 13, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10521, 'CACTU', 8, '1997-04-29 03:00:00', '1997-05-27 03:00:00', '1997-05-02 03:00:00', 2, 17, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10522, 'LEHMS', 4, '1997-04-30 03:00:00', '1997-05-28 03:00:00', '1997-05-06 03:00:00', 1, 45, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10523, 'SEVES', 7, '1997-05-01 03:00:00', '1997-05-29 03:00:00', '1997-05-30 03:00:00', 2, 78, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10524, 'BERGS', 1, '1997-05-01 03:00:00', '1997-05-29 03:00:00', '1997-05-07 03:00:00', 2, 245, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10525, 'BONAP', 1, '1997-05-02 03:00:00', '1997-05-30 03:00:00', '1997-05-23 03:00:00', 2, 11, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10526, 'WARTH', 4, '1997-05-05 03:00:00', '1997-06-02 03:00:00', '1997-05-15 03:00:00', 2, 59, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10527, 'QUICK', 7, '1997-05-05 03:00:00', '1997-06-02 03:00:00', '1997-05-07 03:00:00', 1, 42, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10528, 'GREAL', 6, '1997-05-06 03:00:00', '1997-05-20 03:00:00', '1997-05-09 03:00:00', 2, 3, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10529, 'MAISD', 5, '1997-05-07 03:00:00', '1997-06-04 03:00:00', '1997-05-09 03:00:00', 2, 67, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10530, 'PICCO', 3, '1997-05-08 03:00:00', '1997-06-05 03:00:00', '1997-05-12 03:00:00', 2, 339, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10531, 'OCEAN', 7, '1997-05-08 03:00:00', '1997-06-05 03:00:00', '1997-05-19 03:00:00', 1, 8, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10532, 'EASTC', 7, '1997-05-09 03:00:00', '1997-06-06 03:00:00', '1997-05-12 03:00:00', 3, 74, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10533, 'FOLKO', 8, '1997-05-12 03:00:00', '1997-06-09 03:00:00', '1997-05-22 03:00:00', 1, 188, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10534, 'LEHMS', 8, '1997-05-12 03:00:00', '1997-06-09 03:00:00', '1997-05-14 03:00:00', 2, 28, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10535, 'ANTON', 4, '1997-05-13 03:00:00', '1997-06-10 03:00:00', '1997-05-21 03:00:00', 1, 16, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10536, 'LEHMS', 3, '1997-05-14 03:00:00', '1997-06-11 03:00:00', '1997-06-06 03:00:00', 2, 59, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10537, 'RICSU', 1, '1997-05-14 03:00:00', '1997-05-28 03:00:00', '1997-05-19 03:00:00', 1, 79, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10538, 'BSBEV', 9, '1997-05-15 03:00:00', '1997-06-12 03:00:00', '1997-05-16 03:00:00', 3, 5, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10539, 'BSBEV', 6, '1997-05-16 03:00:00', '1997-06-13 03:00:00', '1997-05-23 03:00:00', 3, 12, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10540, 'QUICK', 3, '1997-05-19 03:00:00', '1997-06-16 03:00:00', '1997-06-13 03:00:00', 3, 1008, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10541, 'HANAR', 2, '1997-05-19 03:00:00', '1997-06-16 03:00:00', '1997-05-29 03:00:00', 1, 69, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10542, 'KOENE', 1, '1997-05-20 03:00:00', '1997-06-17 03:00:00', '1997-05-26 03:00:00', 3, 11, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10543, 'LILAS', 8, '1997-05-21 03:00:00', '1997-06-18 03:00:00', '1997-05-23 03:00:00', 2, 48, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10544, 'LONEP', 4, '1997-05-21 03:00:00', '1997-06-18 03:00:00', '1997-05-30 03:00:00', 1, 25, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10545, 'LAZYK', 8, '1997-05-22 03:00:00', '1997-06-19 03:00:00', '1997-06-26 03:00:00', 2, 12, 'Lazy K Kountry Store', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10546, 'VICTE', 1, '1997-05-23 03:00:00', '1997-06-20 03:00:00', '1997-05-27 03:00:00', 3, 195, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10547, 'SEVES', 3, '1997-05-23 03:00:00', '1997-06-20 03:00:00', '1997-06-02 03:00:00', 2, 178, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10548, 'TOMSP', 3, '1997-05-26 03:00:00', '1997-06-23 03:00:00', '1997-06-02 03:00:00', 2, 1, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10549, 'QUICK', 5, '1997-05-27 03:00:00', '1997-06-10 03:00:00', '1997-05-30 03:00:00', 1, 171, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10550, 'GODOS', 7, '1997-05-28 03:00:00', '1997-06-25 03:00:00', '1997-06-06 03:00:00', 3, 4, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10551, 'FURIB', 4, '1997-05-28 03:00:00', '1997-07-09 03:00:00', '1997-06-06 03:00:00', 3, 73, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10552, 'HILAA', 2, '1997-05-29 03:00:00', '1997-06-26 03:00:00', '1997-06-05 03:00:00', 1, 83, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10553, 'WARTH', 2, '1997-05-30 03:00:00', '1997-06-27 03:00:00', '1997-06-03 03:00:00', 2, 149, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10554, 'OTTIK', 4, '1997-05-30 03:00:00', '1997-06-27 03:00:00', '1997-06-05 03:00:00', 3, 121, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10555, 'SAVEA', 6, '1997-06-02 03:00:00', '1997-06-30 03:00:00', '1997-06-04 03:00:00', 3, 252, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10556, 'SIMOB', 2, '1997-06-03 03:00:00', '1997-07-15 03:00:00', '1997-06-13 03:00:00', 1, 10, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10557, 'LEHMS', 9, '1997-06-03 03:00:00', '1997-06-17 03:00:00', '1997-06-06 03:00:00', 2, 97, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10558, 'AROUT', 1, '1997-06-04 03:00:00', '1997-07-02 03:00:00', '1997-06-10 03:00:00', 2, 73, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10559, 'BLONP', 6, '1997-06-05 03:00:00', '1997-07-03 03:00:00', '1997-06-13 03:00:00', 1, 8, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10560, 'FRANK', 8, '1997-06-06 03:00:00', '1997-07-04 03:00:00', '1997-06-09 03:00:00', 1, 37, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10561, 'FOLKO', 2, '1997-06-06 03:00:00', '1997-07-04 03:00:00', '1997-06-09 03:00:00', 2, 242, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10562, 'REGGC', 1, '1997-06-09 03:00:00', '1997-07-07 03:00:00', '1997-06-12 03:00:00', 1, 23, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10563, 'RICAR', 2, '1997-06-10 03:00:00', '1997-07-22 03:00:00', '1997-06-24 03:00:00', 2, 60, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10564, 'RATTC', 4, '1997-06-10 03:00:00', '1997-07-08 03:00:00', '1997-06-16 03:00:00', 3, 14, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10565, 'MEREP', 8, '1997-06-11 03:00:00', '1997-07-09 03:00:00', '1997-06-18 03:00:00', 2, 7, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10566, 'BLONP', 9, '1997-06-12 03:00:00', '1997-07-10 03:00:00', '1997-06-18 03:00:00', 1, 88, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10567, 'HUNGO', 1, '1997-06-12 03:00:00', '1997-07-10 03:00:00', '1997-06-17 03:00:00', 1, 34, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10568, 'GALED', 3, '1997-06-13 03:00:00', '1997-07-11 03:00:00', '1997-07-09 03:00:00', 3, 7, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10569, 'RATTC', 5, '1997-06-16 03:00:00', '1997-07-14 03:00:00', '1997-07-11 03:00:00', 1, 59, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10570, 'MEREP', 3, '1997-06-17 03:00:00', '1997-07-15 03:00:00', '1997-06-19 03:00:00', 3, 189, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10571, 'ERNSH', 8, '1997-06-17 03:00:00', '1997-07-29 03:00:00', '1997-07-04 03:00:00', 3, 26, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10572, 'BERGS', 3, '1997-06-18 03:00:00', '1997-07-16 03:00:00', '1997-06-25 03:00:00', 2, 116, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10573, 'ANTON', 7, '1997-06-19 03:00:00', '1997-07-17 03:00:00', '1997-06-20 03:00:00', 3, 85, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10574, 'TRAIH', 4, '1997-06-19 03:00:00', '1997-07-17 03:00:00', '1997-06-30 03:00:00', 2, 38, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10575, 'MORGK', 5, '1997-06-20 03:00:00', '1997-07-04 03:00:00', '1997-06-30 03:00:00', 1, 127, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10576, 'TORTU', 3, '1997-06-23 03:00:00', '1997-07-07 03:00:00', '1997-06-30 03:00:00', 3, 19, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10577, 'TRAIH', 9, '1997-06-23 03:00:00', '1997-08-04 03:00:00', '1997-06-30 03:00:00', 2, 25, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10578, 'BSBEV', 4, '1997-06-24 03:00:00', '1997-07-22 03:00:00', '1997-07-25 03:00:00', 3, 30, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10579, 'LETSS', 1, '1997-06-25 03:00:00', '1997-07-23 03:00:00', '1997-07-04 03:00:00', 2, 14, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10580, 'OTTIK', 4, '1997-06-26 03:00:00', '1997-07-24 03:00:00', '1997-07-01 03:00:00', 3, 76, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10581, 'FAMIA', 3, '1997-06-26 03:00:00', '1997-07-24 03:00:00', '1997-07-02 03:00:00', 1, 3, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10582, 'BLAUS', 3, '1997-06-27 03:00:00', '1997-07-25 03:00:00', '1997-07-14 03:00:00', 2, 28, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10583, 'WARTH', 2, '1997-06-30 03:00:00', '1997-07-28 03:00:00', '1997-07-04 03:00:00', 2, 7, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10584, 'BLONP', 4, '1997-06-30 03:00:00', '1997-07-28 03:00:00', '1997-07-04 03:00:00', 1, 59, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10585, 'WELLI', 7, '1997-07-01 03:00:00', '1997-07-29 03:00:00', '1997-07-10 03:00:00', 1, 13, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10586, 'REGGC', 9, '1997-07-02 03:00:00', '1997-07-30 03:00:00', '1997-07-09 03:00:00', 1, 0, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10587, 'QUEDE', 1, '1997-07-02 03:00:00', '1997-07-30 03:00:00', '1997-07-09 03:00:00', 1, 63, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10588, 'QUICK', 2, '1997-07-03 03:00:00', '1997-07-31 03:00:00', '1997-07-10 03:00:00', 3, 195, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10589, 'GREAL', 8, '1997-07-04 03:00:00', '1997-08-01 03:00:00', '1997-07-14 03:00:00', 2, 4, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10590, 'MEREP', 4, '1997-07-07 03:00:00', '1997-08-04 03:00:00', '1997-07-14 03:00:00', 3, 45, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10591, 'VAFFE', 1, '1997-07-07 03:00:00', '1997-07-21 03:00:00', '1997-07-16 03:00:00', 1, 56, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10592, 'LEHMS', 3, '1997-07-08 03:00:00', '1997-08-05 03:00:00', '1997-07-16 03:00:00', 1, 32, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10593, 'LEHMS', 7, '1997-07-09 03:00:00', '1997-08-06 03:00:00', '1997-08-13 03:00:00', 2, 174, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10594, 'OLDWO', 3, '1997-07-09 03:00:00', '1997-08-06 03:00:00', '1997-07-16 03:00:00', 2, 5, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10595, 'ERNSH', 2, '1997-07-10 03:00:00', '1997-08-07 03:00:00', '1997-07-14 03:00:00', 1, 97, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10596, 'WHITC', 8, '1997-07-11 03:00:00', '1997-08-08 03:00:00', '1997-08-12 03:00:00', 1, 16, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10597, 'PICCO', 7, '1997-07-11 03:00:00', '1997-08-08 03:00:00', '1997-07-18 03:00:00', 3, 35, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10598, 'RATTC', 1, '1997-07-14 03:00:00', '1997-08-11 03:00:00', '1997-07-18 03:00:00', 3, 44, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10599, 'BSBEV', 6, '1997-07-15 03:00:00', '1997-08-26 03:00:00', '1997-07-21 03:00:00', 3, 30, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10600, 'HUNGC', 4, '1997-07-16 03:00:00', '1997-08-13 03:00:00', '1997-07-21 03:00:00', 1, 45, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10601, 'HILAA', 7, '1997-07-16 03:00:00', '1997-08-27 03:00:00', '1997-07-22 03:00:00', 1, 58, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10602, 'VAFFE', 8, '1997-07-17 03:00:00', '1997-08-14 03:00:00', '1997-07-22 03:00:00', 2, 3, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10603, 'SAVEA', 8, '1997-07-18 03:00:00', '1997-08-15 03:00:00', '1997-08-08 03:00:00', 2, 49, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10604, 'FURIB', 1, '1997-07-18 03:00:00', '1997-08-15 03:00:00', '1997-07-29 03:00:00', 1, 7, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10605, 'MEREP', 1, '1997-07-21 03:00:00', '1997-08-18 03:00:00', '1997-07-29 03:00:00', 2, 379, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10606, 'TRADH', 4, '1997-07-22 03:00:00', '1997-08-19 03:00:00', '1997-07-31 03:00:00', 3, 79, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10607, 'SAVEA', 5, '1997-07-22 03:00:00', '1997-08-19 03:00:00', '1997-07-25 03:00:00', 1, 200, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10608, 'TOMSP', 4, '1997-07-23 03:00:00', '1997-08-20 03:00:00', '1997-08-01 03:00:00', 2, 28, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10609, 'DUMON', 7, '1997-07-24 03:00:00', '1997-08-21 03:00:00', '1997-07-30 03:00:00', 2, 2, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10610, 'LAMAI', 8, '1997-07-25 03:00:00', '1997-08-22 03:00:00', '1997-08-06 03:00:00', 1, 27, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10611, 'WOLZA', 6, '1997-07-25 03:00:00', '1997-08-22 03:00:00', '1997-08-01 03:00:00', 2, 81, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10612, 'SAVEA', 1, '1997-07-28 03:00:00', '1997-08-25 03:00:00', '1997-08-01 03:00:00', 2, 544, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10613, 'HILAA', 4, '1997-07-29 03:00:00', '1997-08-26 03:00:00', '1997-08-01 03:00:00', 2, 8, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10614, 'BLAUS', 8, '1997-07-29 03:00:00', '1997-08-26 03:00:00', '1997-08-01 03:00:00', 3, 2, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10615, 'WILMK', 2, '1997-07-30 03:00:00', '1997-08-27 03:00:00', '1997-08-06 03:00:00', 3, 1, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10616, 'GREAL', 1, '1997-07-31 03:00:00', '1997-08-28 03:00:00', '1997-08-05 03:00:00', 2, 117, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10617, 'GREAL', 4, '1997-07-31 03:00:00', '1997-08-28 03:00:00', '1997-08-04 03:00:00', 2, 19, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10618, 'MEREP', 1, '1997-08-01 03:00:00', '1997-09-12 03:00:00', '1997-08-08 03:00:00', 1, 155, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10619, 'MEREP', 3, '1997-08-04 03:00:00', '1997-09-01 03:00:00', '1997-08-07 03:00:00', 3, 91, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10620, 'LAUGB', 2, '1997-08-05 03:00:00', '1997-09-02 03:00:00', '1997-08-14 03:00:00', 3, 1, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10621, 'ISLAT', 4, '1997-08-05 03:00:00', '1997-09-02 03:00:00', '1997-08-11 03:00:00', 2, 24, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10622, 'RICAR', 4, '1997-08-06 03:00:00', '1997-09-03 03:00:00', '1997-08-11 03:00:00', 3, 51, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10623, 'FRANK', 8, '1997-08-07 03:00:00', '1997-09-04 03:00:00', '1997-08-12 03:00:00', 2, 97, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10624, 'THECR', 4, '1997-08-07 03:00:00', '1997-09-04 03:00:00', '1997-08-19 03:00:00', 2, 95, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10625, 'ANATR', 3, '1997-08-08 03:00:00', '1997-09-05 03:00:00', '1997-08-14 03:00:00', 1, 44, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10626, 'BERGS', 1, '1997-08-11 03:00:00', '1997-09-08 03:00:00', '1997-08-20 03:00:00', 2, 139, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10627, 'SAVEA', 8, '1997-08-11 03:00:00', '1997-09-22 03:00:00', '1997-08-21 03:00:00', 3, 107, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10628, 'BLONP', 4, '1997-08-12 03:00:00', '1997-09-09 03:00:00', '1997-08-20 03:00:00', 3, 30, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10629, 'GODOS', 4, '1997-08-12 03:00:00', '1997-09-09 03:00:00', '1997-08-20 03:00:00', 3, 85, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10630, 'KOENE', 1, '1997-08-13 03:00:00', '1997-09-10 03:00:00', '1997-08-19 03:00:00', 2, 32, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10631, 'LAMAI', 8, '1997-08-14 03:00:00', '1997-09-11 03:00:00', '1997-08-15 03:00:00', 1, 1, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10632, 'WANDK', 8, '1997-08-14 03:00:00', '1997-09-11 03:00:00', '1997-08-19 03:00:00', 1, 41, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10633, 'ERNSH', 7, '1997-08-15 03:00:00', '1997-09-12 03:00:00', '1997-08-18 03:00:00', 3, 478, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10634, 'FOLIG', 4, '1997-08-15 03:00:00', '1997-09-12 03:00:00', '1997-08-21 03:00:00', 3, 487, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10635, 'MAGAA', 8, '1997-08-18 03:00:00', '1997-09-15 03:00:00', '1997-08-21 03:00:00', 3, 47, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10636, 'WARTH', 4, '1997-08-19 03:00:00', '1997-09-16 03:00:00', '1997-08-26 03:00:00', 1, 1, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10637, 'QUEEN', 6, '1997-08-19 03:00:00', '1997-09-16 03:00:00', '1997-08-26 03:00:00', 1, 201, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10638, 'LINOD', 3, '1997-08-20 03:00:00', '1997-09-17 03:00:00', '1997-09-01 03:00:00', 1, 158, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10639, 'SANTG', 7, '1997-08-20 03:00:00', '1997-09-17 03:00:00', '1997-08-27 03:00:00', 3, 39, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10640, 'WANDK', 4, '1997-08-21 03:00:00', '1997-09-18 03:00:00', '1997-08-28 03:00:00', 1, 24, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10641, 'HILAA', 4, '1997-08-22 03:00:00', '1997-09-19 03:00:00', '1997-08-26 03:00:00', 2, 180, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10642, 'SIMOB', 7, '1997-08-22 03:00:00', '1997-09-19 03:00:00', '1997-09-05 03:00:00', 3, 42, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10643, 'ALFKI', 6, '1997-08-25 03:00:00', '1997-09-22 03:00:00', '1997-09-02 03:00:00', 1, 29, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10644, 'WELLI', 3, '1997-08-25 03:00:00', '1997-09-22 03:00:00', '1997-09-01 03:00:00', 2, 0, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10645, 'HANAR', 4, '1997-08-26 03:00:00', '1997-09-23 03:00:00', '1997-09-02 03:00:00', 1, 12, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10646, 'HUNGO', 9, '1997-08-27 03:00:00', '1997-10-08 03:00:00', '1997-09-03 03:00:00', 3, 142, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10647, 'QUEDE', 4, '1997-08-27 03:00:00', '1997-09-10 03:00:00', '1997-09-03 03:00:00', 2, 46, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10648, 'RICAR', 5, '1997-08-28 03:00:00', '1997-10-09 03:00:00', '1997-09-09 03:00:00', 2, 14, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10649, 'MAISD', 5, '1997-08-28 03:00:00', '1997-09-25 03:00:00', '1997-08-29 03:00:00', 3, 6, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10650, 'FAMIA', 5, '1997-08-29 03:00:00', '1997-09-26 03:00:00', '1997-09-03 03:00:00', 3, 177, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10651, 'WANDK', 8, '1997-09-01 03:00:00', '1997-09-29 03:00:00', '1997-09-11 03:00:00', 2, 21, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10652, 'GOURL', 4, '1997-09-01 03:00:00', '1997-09-29 03:00:00', '1997-09-08 03:00:00', 2, 7, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10653, 'FRANK', 1, '1997-09-02 03:00:00', '1997-09-30 03:00:00', '1997-09-19 03:00:00', 1, 93, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10654, 'BERGS', 5, '1997-09-02 03:00:00', '1997-09-30 03:00:00', '1997-09-11 03:00:00', 1, 55, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10655, 'REGGC', 1, '1997-09-03 03:00:00', '1997-10-01 03:00:00', '1997-09-11 03:00:00', 2, 4, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10656, 'GREAL', 6, '1997-09-04 03:00:00', '1997-10-02 03:00:00', '1997-09-10 03:00:00', 1, 57, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10657, 'SAVEA', 2, '1997-09-04 03:00:00', '1997-10-02 03:00:00', '1997-09-15 03:00:00', 2, 353, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10658, 'QUICK', 4, '1997-09-05 03:00:00', '1997-10-03 03:00:00', '1997-09-08 03:00:00', 1, 364, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10659, 'QUEEN', 7, '1997-09-05 03:00:00', '1997-10-03 03:00:00', '1997-09-10 03:00:00', 2, 106, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10660, 'HUNGC', 8, '1997-09-08 03:00:00', '1997-10-06 03:00:00', '1997-10-15 03:00:00', 1, 111, 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10661, 'HUNGO', 7, '1997-09-09 03:00:00', '1997-10-07 03:00:00', '1997-09-15 03:00:00', 3, 18, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10662, 'LONEP', 3, '1997-09-09 03:00:00', '1997-10-07 03:00:00', '1997-09-18 03:00:00', 2, 1, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10663, 'BONAP', 2, '1997-09-10 03:00:00', '1997-09-24 03:00:00', '1997-10-03 03:00:00', 2, 113, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10664, 'FURIB', 1, '1997-09-10 03:00:00', '1997-10-08 03:00:00', '1997-09-19 03:00:00', 3, 1, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10665, 'LONEP', 1, '1997-09-11 03:00:00', '1997-10-09 03:00:00', '1997-09-17 03:00:00', 2, 26, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10666, 'RICSU', 7, '1997-09-12 03:00:00', '1997-10-10 03:00:00', '1997-09-22 03:00:00', 2, 232, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10667, 'ERNSH', 7, '1997-09-12 03:00:00', '1997-10-10 03:00:00', '1997-09-19 03:00:00', 1, 78, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10668, 'WANDK', 1, '1997-09-15 03:00:00', '1997-10-13 03:00:00', '1997-09-23 03:00:00', 2, 47, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10669, 'SIMOB', 2, '1997-09-15 03:00:00', '1997-10-13 03:00:00', '1997-09-22 03:00:00', 1, 24, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10670, 'FRANK', 4, '1997-09-16 03:00:00', '1997-10-14 03:00:00', '1997-09-18 03:00:00', 1, 203, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10671, 'FRANR', 1, '1997-09-17 03:00:00', '1997-10-15 03:00:00', '1997-09-24 03:00:00', 1, 30, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10672, 'BERGS', 9, '1997-09-17 03:00:00', '1997-10-01 03:00:00', '1997-09-26 03:00:00', 2, 96, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10673, 'WILMK', 2, '1997-09-18 03:00:00', '1997-10-16 03:00:00', '1997-09-19 03:00:00', 1, 23, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10674, 'ISLAT', 4, '1997-09-18 03:00:00', '1997-10-16 03:00:00', '1997-09-30 03:00:00', 2, 1, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10675, 'FRANK', 5, '1997-09-19 03:00:00', '1997-10-17 03:00:00', '1997-09-23 03:00:00', 2, 32, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10676, 'TORTU', 2, '1997-09-22 03:00:00', '1997-10-20 03:00:00', '1997-09-29 03:00:00', 2, 2, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10677, 'ANTON', 1, '1997-09-22 03:00:00', '1997-10-20 03:00:00', '1997-09-26 03:00:00', 3, 4, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10678, 'SAVEA', 7, '1997-09-23 03:00:00', '1997-10-21 03:00:00', '1997-10-16 03:00:00', 3, 389, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10679, 'BLONP', 8, '1997-09-23 03:00:00', '1997-10-21 03:00:00', '1997-09-30 03:00:00', 3, 28, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10680, 'OLDWO', 1, '1997-09-24 03:00:00', '1997-10-22 03:00:00', '1997-09-26 03:00:00', 1, 27, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10681, 'GREAL', 3, '1997-09-25 03:00:00', '1997-10-23 03:00:00', '1997-09-30 03:00:00', 3, 76, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10682, 'ANTON', 3, '1997-09-25 03:00:00', '1997-10-23 03:00:00', '1997-10-01 03:00:00', 2, 36, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10683, 'DUMON', 2, '1997-09-26 03:00:00', '1997-10-24 03:00:00', '1997-10-01 03:00:00', 1, 4, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10684, 'OTTIK', 3, '1997-09-26 03:00:00', '1997-10-24 03:00:00', '1997-09-30 03:00:00', 1, 146, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10685, 'GOURL', 4, '1997-09-29 03:00:00', '1997-10-13 03:00:00', '1997-10-03 03:00:00', 2, 34, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10686, 'PICCO', 2, '1997-09-30 03:00:00', '1997-10-28 03:00:00', '1997-10-08 03:00:00', 1, 97, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10687, 'HUNGO', 9, '1997-09-30 03:00:00', '1997-10-28 03:00:00', '1997-10-30 03:00:00', 2, 296, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10688, 'VAFFE', 4, '1997-10-01 03:00:00', '1997-10-15 03:00:00', '1997-10-07 03:00:00', 2, 299, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10689, 'BERGS', 1, '1997-10-01 03:00:00', '1997-10-29 03:00:00', '1997-10-07 03:00:00', 2, 13, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10690, 'HANAR', 1, '1997-10-02 03:00:00', '1997-10-30 03:00:00', '1997-10-03 03:00:00', 1, 16, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10691, 'QUICK', 2, '1997-10-03 03:00:00', '1997-11-14 03:00:00', '1997-10-22 03:00:00', 2, 810, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10692, 'ALFKI', 4, '1997-10-03 03:00:00', '1997-10-31 03:00:00', '1997-10-13 03:00:00', 2, 61, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10693, 'WHITC', 3, '1997-10-06 03:00:00', '1997-10-20 03:00:00', '1997-10-10 03:00:00', 3, 139, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10694, 'QUICK', 8, '1997-10-06 03:00:00', '1997-11-03 03:00:00', '1997-10-09 03:00:00', 3, 398, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10695, 'WILMK', 7, '1997-10-07 03:00:00', '1997-11-18 03:00:00', '1997-10-14 03:00:00', 1, 17, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10696, 'WHITC', 8, '1997-10-08 03:00:00', '1997-11-19 03:00:00', '1997-10-14 03:00:00', 3, 103, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10697, 'LINOD', 3, '1997-10-08 03:00:00', '1997-11-05 03:00:00', '1997-10-14 03:00:00', 1, 46, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10698, 'ERNSH', 4, '1997-10-09 03:00:00', '1997-11-06 03:00:00', '1997-10-17 03:00:00', 1, 272, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10699, 'MORGK', 3, '1997-10-09 03:00:00', '1997-11-06 03:00:00', '1997-10-13 03:00:00', 3, 1, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10700, 'SAVEA', 3, '1997-10-10 03:00:00', '1997-11-07 03:00:00', '1997-10-16 03:00:00', 1, 65, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10701, 'HUNGO', 6, '1997-10-13 03:00:00', '1997-10-27 03:00:00', '1997-10-15 03:00:00', 3, 220, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10702, 'ALFKI', 4, '1997-10-13 03:00:00', '1997-11-24 03:00:00', '1997-10-21 03:00:00', 1, 24, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10703, 'FOLKO', 6, '1997-10-14 03:00:00', '1997-11-11 03:00:00', '1997-10-20 03:00:00', 2, 152, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10704, 'QUEEN', 6, '1997-10-14 03:00:00', '1997-11-11 03:00:00', '1997-11-07 03:00:00', 1, 5, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10705, 'HILAA', 9, '1997-10-15 03:00:00', '1997-11-12 03:00:00', '1997-11-18 03:00:00', 2, 4, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10706, 'OLDWO', 8, '1997-10-16 03:00:00', '1997-11-13 03:00:00', '1997-10-21 03:00:00', 3, 136, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10707, 'AROUT', 4, '1997-10-16 03:00:00', '1997-10-30 03:00:00', '1997-10-23 03:00:00', 3, 22, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10708, 'THEBI', 6, '1997-10-17 03:00:00', '1997-11-28 03:00:00', '1997-11-05 03:00:00', 2, 3, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10709, 'GOURL', 1, '1997-10-17 03:00:00', '1997-11-14 03:00:00', '1997-11-20 03:00:00', 3, 211, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10710, 'FRANS', 1, '1997-10-20 03:00:00', '1997-11-17 03:00:00', '1997-10-23 03:00:00', 1, 5, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10711, 'SAVEA', 5, '1997-10-21 03:00:00', '1997-12-02 03:00:00', '1997-10-29 03:00:00', 2, 52, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10712, 'HUNGO', 3, '1997-10-21 03:00:00', '1997-11-18 03:00:00', '1997-10-31 03:00:00', 1, 90, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10713, 'SAVEA', 1, '1997-10-22 03:00:00', '1997-11-19 03:00:00', '1997-10-24 03:00:00', 1, 167, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10714, 'SAVEA', 5, '1997-10-22 03:00:00', '1997-11-19 03:00:00', '1997-10-27 03:00:00', 3, 24, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10715, 'BONAP', 3, '1997-10-23 03:00:00', '1997-11-06 03:00:00', '1997-10-29 03:00:00', 1, 63, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10716, 'RANCH', 4, '1997-10-24 03:00:00', '1997-11-21 03:00:00', '1997-10-27 03:00:00', 2, 23, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10717, 'FRANK', 1, '1997-10-24 03:00:00', '1997-11-21 03:00:00', '1997-10-29 03:00:00', 2, 59, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10718, 'KOENE', 1, '1997-10-27 03:00:00', '1997-11-24 03:00:00', '1997-10-29 03:00:00', 3, 171, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10719, 'LETSS', 8, '1997-10-27 03:00:00', '1997-11-24 03:00:00', '1997-11-05 03:00:00', 2, 51, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10720, 'QUEDE', 8, '1997-10-28 03:00:00', '1997-11-11 03:00:00', '1997-11-05 03:00:00', 2, 10, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10721, 'QUICK', 5, '1997-10-29 03:00:00', '1997-11-26 03:00:00', '1997-10-31 03:00:00', 3, 49, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10722, 'SAVEA', 8, '1997-10-29 03:00:00', '1997-12-10 03:00:00', '1997-11-04 03:00:00', 1, 75, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10723, 'WHITC', 3, '1997-10-30 03:00:00', '1997-11-27 03:00:00', '1997-11-25 03:00:00', 1, 22, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10724, 'MEREP', 8, '1997-10-30 03:00:00', '1997-12-11 03:00:00', '1997-11-05 03:00:00', 2, 58, 'Mère Paillarde', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10725, 'FAMIA', 4, '1997-10-31 03:00:00', '1997-11-28 03:00:00', '1997-11-05 03:00:00', 3, 11, 'Familia Arquibaldo', 'Rua Orós, 92', 'Sao Paulo', 'SP', '05442-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10726, 'EASTC', 4, '1997-11-03 03:00:00', '1997-11-17 03:00:00', '1997-12-05 03:00:00', 1, 17, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10727, 'REGGC', 2, '1997-11-03 03:00:00', '1997-12-01 03:00:00', '1997-12-05 03:00:00', 1, 90, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10728, 'QUEEN', 4, '1997-11-04 03:00:00', '1997-12-02 03:00:00', '1997-11-11 03:00:00', 2, 58, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10729, 'LINOD', 8, '1997-11-04 03:00:00', '1997-12-16 03:00:00', '1997-11-14 03:00:00', 3, 141, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10730, 'BONAP', 5, '1997-11-05 03:00:00', '1997-12-03 03:00:00', '1997-11-14 03:00:00', 1, 20, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10731, 'CHOPS', 7, '1997-11-06 03:00:00', '1997-12-04 03:00:00', '1997-11-14 03:00:00', 1, 97, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10732, 'BONAP', 3, '1997-11-06 03:00:00', '1997-12-04 03:00:00', '1997-11-07 03:00:00', 1, 17, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10733, 'BERGS', 1, '1997-11-07 03:00:00', '1997-12-05 03:00:00', '1997-11-10 03:00:00', 3, 110, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10734, 'GOURL', 2, '1997-11-07 03:00:00', '1997-12-05 03:00:00', '1997-11-12 03:00:00', 3, 2, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10735, 'LETSS', 6, '1997-11-10 03:00:00', '1997-12-08 03:00:00', '1997-11-21 03:00:00', 2, 46, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10736, 'HUNGO', 9, '1997-11-11 03:00:00', '1997-12-09 03:00:00', '1997-11-21 03:00:00', 2, 44, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10737, 'VINET', 2, '1997-11-11 03:00:00', '1997-12-09 03:00:00', '1997-11-18 03:00:00', 2, 8, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10738, 'SPECD', 2, '1997-11-12 03:00:00', '1997-12-10 03:00:00', '1997-11-18 03:00:00', 1, 3, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10739, 'VINET', 3, '1997-11-12 03:00:00', '1997-12-10 03:00:00', '1997-11-17 03:00:00', 3, 11, 'Vins et alcools Chevalier', '59 rue de l''Abbaye', 'Reims', NULL, '51100', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10740, 'WHITC', 4, '1997-11-13 03:00:00', '1997-12-11 03:00:00', '1997-11-25 03:00:00', 2, 82, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10741, 'AROUT', 4, '1997-11-14 03:00:00', '1997-11-28 03:00:00', '1997-11-18 03:00:00', 3, 11, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10742, 'BOTTM', 3, '1997-11-14 03:00:00', '1997-12-12 03:00:00', '1997-11-18 03:00:00', 3, 244, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10743, 'AROUT', 1, '1997-11-17 03:00:00', '1997-12-15 03:00:00', '1997-11-21 03:00:00', 2, 24, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10744, 'VAFFE', 6, '1997-11-17 03:00:00', '1997-12-15 03:00:00', '1997-11-24 03:00:00', 1, 69, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10745, 'QUICK', 9, '1997-11-18 03:00:00', '1997-12-16 03:00:00', '1997-11-27 03:00:00', 1, 4, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10746, 'CHOPS', 1, '1997-11-19 03:00:00', '1997-12-17 03:00:00', '1997-11-21 03:00:00', 3, 31, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10747, 'PICCO', 6, '1997-11-19 03:00:00', '1997-12-17 03:00:00', '1997-11-26 03:00:00', 1, 117, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10748, 'SAVEA', 3, '1997-11-20 03:00:00', '1997-12-18 03:00:00', '1997-11-28 03:00:00', 1, 233, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10749, 'ISLAT', 4, '1997-11-20 03:00:00', '1997-12-18 03:00:00', '1997-12-19 03:00:00', 2, 62, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10750, 'WARTH', 9, '1997-11-21 03:00:00', '1997-12-19 03:00:00', '1997-11-24 03:00:00', 1, 79, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10751, 'RICSU', 3, '1997-11-24 03:00:00', '1997-12-22 03:00:00', '1997-12-03 03:00:00', 3, 131, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10752, 'NORTS', 2, '1997-11-24 03:00:00', '1997-12-22 03:00:00', '1997-11-28 03:00:00', 3, 1, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10753, 'FRANS', 3, '1997-11-25 03:00:00', '1997-12-23 03:00:00', '1997-11-27 03:00:00', 1, 8, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10754, 'MAGAA', 6, '1997-11-25 03:00:00', '1997-12-23 03:00:00', '1997-11-27 03:00:00', 3, 2, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10755, 'BONAP', 4, '1997-11-26 03:00:00', '1997-12-24 03:00:00', '1997-11-28 03:00:00', 2, 17, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10756, 'SPLIR', 8, '1997-11-27 03:00:00', '1997-12-25 03:00:00', '1997-12-02 03:00:00', 2, 73, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10757, 'SAVEA', 6, '1997-11-27 03:00:00', '1997-12-25 03:00:00', '1997-12-15 03:00:00', 1, 8, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10758, 'RICSU', 3, '1997-11-28 03:00:00', '1997-12-26 03:00:00', '1997-12-04 03:00:00', 3, 138, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10759, 'ANATR', 3, '1997-11-28 03:00:00', '1997-12-26 03:00:00', '1997-12-12 03:00:00', 3, 12, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10760, 'MAISD', 4, '1997-12-01 03:00:00', '1997-12-29 03:00:00', '1997-12-10 03:00:00', 1, 156, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10761, 'RATTC', 5, '1997-12-02 03:00:00', '1997-12-30 03:00:00', '1997-12-08 03:00:00', 2, 19, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10762, 'FOLKO', 3, '1997-12-02 03:00:00', '1997-12-30 03:00:00', '1997-12-09 03:00:00', 1, 329, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10763, 'FOLIG', 3, '1997-12-03 03:00:00', '1997-12-31 03:00:00', '1997-12-08 03:00:00', 3, 37, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10764, 'ERNSH', 6, '1997-12-03 03:00:00', '1997-12-31 03:00:00', '1997-12-08 03:00:00', 3, 145, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10765, 'QUICK', 3, '1997-12-04 03:00:00', '1998-01-01 03:00:00', '1997-12-09 03:00:00', 3, 43, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10766, 'OTTIK', 4, '1997-12-05 03:00:00', '1998-01-02 03:00:00', '1997-12-09 03:00:00', 1, 158, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10767, 'SUPRD', 4, '1997-12-05 03:00:00', '1998-01-02 03:00:00', '1997-12-15 03:00:00', 3, 2, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10768, 'AROUT', 3, '1997-12-08 03:00:00', '1998-01-05 03:00:00', '1997-12-15 03:00:00', 2, 146, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10769, 'VAFFE', 3, '1997-12-08 03:00:00', '1998-01-05 03:00:00', '1997-12-12 03:00:00', 1, 65, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10770, 'HANAR', 8, '1997-12-09 03:00:00', '1998-01-06 03:00:00', '1997-12-17 03:00:00', 3, 5, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10771, 'ERNSH', 9, '1997-12-10 03:00:00', '1998-01-07 03:00:00', '1998-01-02 03:00:00', 2, 11, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10772, 'LEHMS', 3, '1997-12-10 03:00:00', '1998-01-07 03:00:00', '1997-12-19 03:00:00', 2, 91, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10773, 'ERNSH', 1, '1997-12-11 03:00:00', '1998-01-08 03:00:00', '1997-12-16 03:00:00', 3, 96, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10774, 'FOLKO', 4, '1997-12-11 03:00:00', '1997-12-25 03:00:00', '1997-12-12 03:00:00', 1, 48, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10775, 'THECR', 7, '1997-12-12 03:00:00', '1998-01-09 03:00:00', '1997-12-26 03:00:00', 1, 20, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10776, 'ERNSH', 1, '1997-12-15 03:00:00', '1998-01-12 03:00:00', '1997-12-18 03:00:00', 3, 352, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10777, 'GOURL', 7, '1997-12-15 03:00:00', '1997-12-29 03:00:00', '1998-01-21 03:00:00', 2, 3, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10778, 'BERGS', 3, '1997-12-16 03:00:00', '1998-01-13 03:00:00', '1997-12-24 03:00:00', 1, 7, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10779, 'MORGK', 3, '1997-12-16 03:00:00', '1998-01-13 03:00:00', '1998-01-14 03:00:00', 2, 58, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10780, 'LILAS', 2, '1997-12-16 03:00:00', '1997-12-30 03:00:00', '1997-12-25 03:00:00', 1, 42, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10781, 'WARTH', 2, '1997-12-17 03:00:00', '1998-01-14 03:00:00', '1997-12-19 03:00:00', 3, 73, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10782, 'CACTU', 9, '1997-12-17 03:00:00', '1998-01-14 03:00:00', '1997-12-22 03:00:00', 3, 1, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10783, 'HANAR', 4, '1997-12-18 03:00:00', '1998-01-15 03:00:00', '1997-12-19 03:00:00', 2, 125, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10784, 'MAGAA', 4, '1997-12-18 03:00:00', '1998-01-15 03:00:00', '1997-12-22 03:00:00', 3, 70, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10785, 'GROSR', 1, '1997-12-18 03:00:00', '1998-01-15 03:00:00', '1997-12-24 03:00:00', 3, 2, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10786, 'QUEEN', 8, '1997-12-19 03:00:00', '1998-01-16 03:00:00', '1997-12-23 03:00:00', 1, 111, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10787, 'LAMAI', 2, '1997-12-19 03:00:00', '1998-01-02 03:00:00', '1997-12-26 03:00:00', 1, 250, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10788, 'QUICK', 1, '1997-12-22 03:00:00', '1998-01-19 03:00:00', '1998-01-19 03:00:00', 2, 43, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10789, 'FOLIG', 1, '1997-12-22 03:00:00', '1998-01-19 03:00:00', '1997-12-31 03:00:00', 2, 101, 'Folies gourmandes', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10790, 'GOURL', 6, '1997-12-22 03:00:00', '1998-01-19 03:00:00', '1997-12-26 03:00:00', 1, 28, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10791, 'FRANK', 6, '1997-12-23 03:00:00', '1998-01-20 03:00:00', '1998-01-01 03:00:00', 2, 17, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10792, 'WOLZA', 1, '1997-12-23 03:00:00', '1998-01-20 03:00:00', '1997-12-31 03:00:00', 3, 24, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10793, 'AROUT', 3, '1997-12-24 03:00:00', '1998-01-21 03:00:00', '1998-01-08 03:00:00', 3, 5, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10794, 'QUEDE', 6, '1997-12-24 03:00:00', '1998-01-21 03:00:00', '1998-01-02 03:00:00', 1, 21, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10795, 'ERNSH', 8, '1997-12-24 03:00:00', '1998-01-21 03:00:00', '1998-01-20 03:00:00', 2, 127, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10796, 'HILAA', 3, '1997-12-25 03:00:00', '1998-01-22 03:00:00', '1998-01-14 03:00:00', 1, 27, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10797, 'DRACD', 7, '1997-12-25 03:00:00', '1998-01-22 03:00:00', '1998-01-05 03:00:00', 2, 33, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10798, 'ISLAT', 2, '1997-12-26 03:00:00', '1998-01-23 03:00:00', '1998-01-05 03:00:00', 1, 2, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10799, 'KOENE', 9, '1997-12-26 03:00:00', '1998-02-06 03:00:00', '1998-01-05 03:00:00', 3, 31, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10800, 'SEVES', 1, '1997-12-26 03:00:00', '1998-01-23 03:00:00', '1998-01-05 03:00:00', 3, 137, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10801, 'BOLID', 4, '1997-12-29 03:00:00', '1998-01-26 03:00:00', '1997-12-31 03:00:00', 2, 97, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10802, 'SIMOB', 4, '1997-12-29 03:00:00', '1998-01-26 03:00:00', '1998-01-02 03:00:00', 2, 257, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10803, 'WELLI', 4, '1997-12-30 03:00:00', '1998-01-27 03:00:00', '1998-01-06 03:00:00', 1, 55, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10804, 'SEVES', 6, '1997-12-30 03:00:00', '1998-01-27 03:00:00', '1998-01-07 03:00:00', 2, 27, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10805, 'THEBI', 2, '1997-12-30 03:00:00', '1998-01-27 03:00:00', '1998-01-09 03:00:00', 3, 237, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10806, 'VICTE', 3, '1997-12-31 03:00:00', '1998-01-28 03:00:00', '1998-01-05 03:00:00', 2, 22, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10807, 'FRANS', 4, '1997-12-31 03:00:00', '1998-01-28 03:00:00', '1998-01-30 03:00:00', 1, 1, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10808, 'OLDWO', 2, '1998-01-01 03:00:00', '1998-01-29 03:00:00', '1998-01-09 03:00:00', 3, 46, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10809, 'WELLI', 7, '1998-01-01 03:00:00', '1998-01-29 03:00:00', '1998-01-07 03:00:00', 1, 5, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10810, 'LAUGB', 2, '1998-01-01 03:00:00', '1998-01-29 03:00:00', '1998-01-07 03:00:00', 3, 4, 'Laughing Bacchus Wine Cellars', '2319 Elm St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10811, 'LINOD', 8, '1998-01-02 03:00:00', '1998-01-30 03:00:00', '1998-01-08 03:00:00', 1, 31, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10812, 'REGGC', 5, '1998-01-02 03:00:00', '1998-01-30 03:00:00', '1998-01-12 03:00:00', 1, 60, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10813, 'RICAR', 1, '1998-01-05 03:00:00', '1998-02-02 03:00:00', '1998-01-09 03:00:00', 1, 47, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10814, 'VICTE', 3, '1998-01-05 03:00:00', '1998-02-02 03:00:00', '1998-01-14 03:00:00', 3, 131, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10815, 'SAVEA', 2, '1998-01-05 03:00:00', '1998-02-02 03:00:00', '1998-01-14 03:00:00', 3, 15, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10816, 'GREAL', 4, '1998-01-06 03:00:00', '1998-02-03 03:00:00', '1998-02-04 03:00:00', 2, 720, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10817, 'KOENE', 3, '1998-01-06 03:00:00', '1998-01-20 03:00:00', '1998-01-13 03:00:00', 2, 306, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10818, 'MAGAA', 7, '1998-01-07 03:00:00', '1998-02-04 03:00:00', '1998-01-12 03:00:00', 3, 65, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10819, 'CACTU', 2, '1998-01-07 03:00:00', '1998-02-04 03:00:00', '1998-01-16 03:00:00', 3, 20, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10820, 'RATTC', 3, '1998-01-07 03:00:00', '1998-02-04 03:00:00', '1998-01-13 03:00:00', 2, 38, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10821, 'SPLIR', 1, '1998-01-08 03:00:00', '1998-02-05 03:00:00', '1998-01-15 03:00:00', 1, 37, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10822, 'TRAIH', 6, '1998-01-08 03:00:00', '1998-02-05 03:00:00', '1998-01-16 03:00:00', 3, 7, 'Trail''s Head Gourmet Provisioners', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10823, 'LILAS', 5, '1998-01-09 03:00:00', '1998-02-06 03:00:00', '1998-01-13 03:00:00', 2, 164, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10824, 'FOLKO', 8, '1998-01-09 03:00:00', '1998-02-06 03:00:00', '1998-01-30 03:00:00', 1, 1, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10825, 'DRACD', 1, '1998-01-09 03:00:00', '1998-02-06 03:00:00', '1998-01-14 03:00:00', 1, 79, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10826, 'BLONP', 6, '1998-01-12 03:00:00', '1998-02-09 03:00:00', '1998-02-06 03:00:00', 1, 7, 'Blondel père et fils', '24, place Kléber', 'Strasbourg', NULL, '67000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10827, 'BONAP', 1, '1998-01-12 03:00:00', '1998-01-26 03:00:00', '1998-02-06 03:00:00', 2, 64, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10828, 'RANCH', 9, '1998-01-13 03:00:00', '1998-01-27 03:00:00', '1998-02-04 03:00:00', 1, 91, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10829, 'ISLAT', 9, '1998-01-13 03:00:00', '1998-02-10 03:00:00', '1998-01-23 03:00:00', 1, 155, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10830, 'TRADH', 4, '1998-01-13 03:00:00', '1998-02-24 03:00:00', '1998-01-21 03:00:00', 2, 82, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10831, 'SANTG', 3, '1998-01-14 03:00:00', '1998-02-11 03:00:00', '1998-01-23 03:00:00', 2, 72, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10832, 'LAMAI', 2, '1998-01-14 03:00:00', '1998-02-11 03:00:00', '1998-01-19 03:00:00', 2, 43, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10833, 'OTTIK', 6, '1998-01-15 03:00:00', '1998-02-12 03:00:00', '1998-01-23 03:00:00', 2, 71, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10834, 'TRADH', 1, '1998-01-15 03:00:00', '1998-02-12 03:00:00', '1998-01-19 03:00:00', 3, 30, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10835, 'ALFKI', 1, '1998-01-15 03:00:00', '1998-02-12 03:00:00', '1998-01-21 03:00:00', 3, 70, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10836, 'ERNSH', 7, '1998-01-16 03:00:00', '1998-02-13 03:00:00', '1998-01-21 03:00:00', 1, 412, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10837, 'BERGS', 9, '1998-01-16 03:00:00', '1998-02-13 03:00:00', '1998-01-23 03:00:00', 3, 13, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10838, 'LINOD', 3, '1998-01-19 03:00:00', '1998-02-16 03:00:00', '1998-01-23 03:00:00', 3, 59, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10839, 'TRADH', 3, '1998-01-19 03:00:00', '1998-02-16 03:00:00', '1998-01-22 03:00:00', 3, 35, 'Tradiçao Hipermercados', 'Av. Inês de Castro, 414', 'Sao Paulo', 'SP', '05634-030', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10840, 'LINOD', 4, '1998-01-19 03:00:00', '1998-03-02 03:00:00', '1998-02-16 03:00:00', 2, 3, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10841, 'SUPRD', 5, '1998-01-20 03:00:00', '1998-02-17 03:00:00', '1998-01-29 03:00:00', 2, 424, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10842, 'TORTU', 1, '1998-01-20 03:00:00', '1998-02-17 03:00:00', '1998-01-29 03:00:00', 3, 54, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10843, 'VICTE', 4, '1998-01-21 03:00:00', '1998-02-18 03:00:00', '1998-01-26 03:00:00', 2, 9, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10844, 'PICCO', 8, '1998-01-21 03:00:00', '1998-02-18 03:00:00', '1998-01-26 03:00:00', 2, 25, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10845, 'QUICK', 8, '1998-01-21 03:00:00', '1998-02-04 03:00:00', '1998-01-30 03:00:00', 1, 213, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10846, 'SUPRD', 2, '1998-01-22 03:00:00', '1998-03-05 03:00:00', '1998-01-23 03:00:00', 3, 56, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10847, 'SAVEA', 4, '1998-01-22 03:00:00', '1998-02-05 03:00:00', '1998-02-10 03:00:00', 3, 488, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10848, 'CONSH', 7, '1998-01-23 03:00:00', '1998-02-20 03:00:00', '1998-01-29 03:00:00', 2, 38, 'Consolidated Holdings', 'Berkeley Gardens 12 Brewery', 'London', NULL, 'WX1 6LT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10849, 'KOENE', 9, '1998-01-23 03:00:00', '1998-02-20 03:00:00', '1998-01-30 03:00:00', 2, 1, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10850, 'VICTE', 1, '1998-01-23 03:00:00', '1998-03-06 03:00:00', '1998-01-30 03:00:00', 1, 49, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', NULL, '69004', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10851, 'RICAR', 5, '1998-01-26 03:00:00', '1998-02-23 03:00:00', '1998-02-02 03:00:00', 1, 161, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10852, 'RATTC', 8, '1998-01-26 03:00:00', '1998-02-09 03:00:00', '1998-01-30 03:00:00', 1, 174, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10853, 'BLAUS', 9, '1998-01-27 03:00:00', '1998-02-24 03:00:00', '1998-02-03 03:00:00', 2, 54, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10854, 'ERNSH', 3, '1998-01-27 03:00:00', '1998-02-24 03:00:00', '1998-02-05 03:00:00', 2, 100, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10855, 'OLDWO', 3, '1998-01-27 03:00:00', '1998-02-24 03:00:00', '1998-02-04 03:00:00', 1, 171, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10856, 'ANTON', 3, '1998-01-28 03:00:00', '1998-02-25 03:00:00', '1998-02-10 03:00:00', 2, 58, 'Antonio Moreno Taquería', 'Mataderos 2312', 'México D.F.', NULL, '05023', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10857, 'BERGS', 8, '1998-01-28 03:00:00', '1998-02-25 03:00:00', '1998-02-06 03:00:00', 2, 189, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10858, 'LACOR', 2, '1998-01-29 03:00:00', '1998-02-26 03:00:00', '1998-02-03 03:00:00', 1, 53, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10859, 'FRANK', 1, '1998-01-29 03:00:00', '1998-02-26 03:00:00', '1998-02-02 03:00:00', 2, 76, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10860, 'FRANR', 3, '1998-01-29 03:00:00', '1998-02-26 03:00:00', '1998-02-04 03:00:00', 3, 19, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10861, 'WHITC', 4, '1998-01-30 03:00:00', '1998-02-27 03:00:00', '1998-02-17 03:00:00', 2, 15, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10862, 'LEHMS', 8, '1998-01-30 03:00:00', '1998-03-13 03:00:00', '1998-02-02 03:00:00', 2, 53, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10863, 'HILAA', 4, '1998-02-02 03:00:00', '1998-03-02 03:00:00', '1998-02-17 03:00:00', 2, 30, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10864, 'AROUT', 4, '1998-02-02 03:00:00', '1998-03-02 03:00:00', '1998-02-09 03:00:00', 2, 3, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10865, 'QUICK', 2, '1998-02-02 03:00:00', '1998-02-16 03:00:00', '1998-02-12 03:00:00', 1, 348, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10866, 'BERGS', 5, '1998-02-03 03:00:00', '1998-03-03 03:00:00', '1998-02-12 03:00:00', 1, 109, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10867, 'LONEP', 6, '1998-02-03 03:00:00', '1998-03-17 03:00:00', '1998-02-11 03:00:00', 1, 2, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10868, 'QUEEN', 7, '1998-02-04 03:00:00', '1998-03-04 03:00:00', '1998-02-23 03:00:00', 2, 191, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10869, 'SEVES', 5, '1998-02-04 03:00:00', '1998-03-04 03:00:00', '1998-02-09 03:00:00', 1, 143, 'Seven Seas Imports', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10870, 'WOLZA', 5, '1998-02-04 03:00:00', '1998-03-04 03:00:00', '1998-02-13 03:00:00', 3, 12, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10871, 'BONAP', 9, '1998-02-05 03:00:00', '1998-03-05 03:00:00', '1998-02-10 03:00:00', 2, 112, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10872, 'GODOS', 5, '1998-02-05 03:00:00', '1998-03-05 03:00:00', '1998-02-09 03:00:00', 2, 175, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10873, 'WILMK', 4, '1998-02-06 03:00:00', '1998-03-06 03:00:00', '1998-02-09 03:00:00', 1, 1, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10874, 'GODOS', 5, '1998-02-06 03:00:00', '1998-03-06 03:00:00', '1998-02-11 03:00:00', 2, 20, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10875, 'BERGS', 4, '1998-02-06 03:00:00', '1998-03-06 03:00:00', '1998-03-03 03:00:00', 2, 32, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10876, 'BONAP', 7, '1998-02-09 03:00:00', '1998-03-09 03:00:00', '1998-02-12 03:00:00', 3, 60, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10877, 'RICAR', 1, '1998-02-09 03:00:00', '1998-03-09 03:00:00', '1998-02-19 03:00:00', 1, 38, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10878, 'QUICK', 4, '1998-02-10 03:00:00', '1998-03-10 03:00:00', '1998-02-12 03:00:00', 1, 47, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10879, 'WILMK', 3, '1998-02-10 03:00:00', '1998-03-10 03:00:00', '1998-02-12 03:00:00', 3, 9, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10880, 'FOLKO', 7, '1998-02-10 03:00:00', '1998-03-24 03:00:00', '1998-02-18 03:00:00', 1, 88, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10881, 'CACTU', 4, '1998-02-11 03:00:00', '1998-03-11 03:00:00', '1998-02-18 03:00:00', 1, 3, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10882, 'SAVEA', 4, '1998-02-11 03:00:00', '1998-03-11 03:00:00', '1998-02-20 03:00:00', 3, 23, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10883, 'LONEP', 8, '1998-02-12 03:00:00', '1998-03-12 03:00:00', '1998-02-20 03:00:00', 3, 1, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10884, 'LETSS', 4, '1998-02-12 03:00:00', '1998-03-12 03:00:00', '1998-02-13 03:00:00', 2, 91, 'Let''s Stop N Shop', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10885, 'SUPRD', 6, '1998-02-12 03:00:00', '1998-03-12 03:00:00', '1998-02-18 03:00:00', 3, 6, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10886, 'HANAR', 1, '1998-02-13 03:00:00', '1998-03-13 03:00:00', '1998-03-02 03:00:00', 1, 5, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10887, 'GALED', 8, '1998-02-13 03:00:00', '1998-03-13 03:00:00', '1998-02-16 03:00:00', 3, 1, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10888, 'GODOS', 1, '1998-02-16 03:00:00', '1998-03-16 03:00:00', '1998-02-23 03:00:00', 2, 52, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10889, 'RATTC', 9, '1998-02-16 03:00:00', '1998-03-16 03:00:00', '1998-02-23 03:00:00', 3, 281, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10890, 'DUMON', 7, '1998-02-16 03:00:00', '1998-03-16 03:00:00', '1998-02-18 03:00:00', 1, 33, 'Du monde entier', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10891, 'LEHMS', 7, '1998-02-17 03:00:00', '1998-03-17 03:00:00', '1998-02-19 03:00:00', 2, 20, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10892, 'MAISD', 4, '1998-02-17 03:00:00', '1998-03-17 03:00:00', '1998-02-19 03:00:00', 2, 120, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10893, 'KOENE', 9, '1998-02-18 03:00:00', '1998-03-18 03:00:00', '1998-02-20 03:00:00', 2, 78, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10894, 'SAVEA', 1, '1998-02-18 03:00:00', '1998-03-18 03:00:00', '1998-02-20 03:00:00', 1, 116, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10895, 'ERNSH', 3, '1998-02-18 03:00:00', '1998-03-18 03:00:00', '1998-02-23 03:00:00', 1, 163, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10896, 'MAISD', 7, '1998-02-19 03:00:00', '1998-03-19 03:00:00', '1998-02-27 03:00:00', 3, 32, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10897, 'HUNGO', 3, '1998-02-19 03:00:00', '1998-03-19 03:00:00', '1998-02-25 03:00:00', 2, 604, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10898, 'OCEAN', 4, '1998-02-20 03:00:00', '1998-03-20 03:00:00', '1998-03-06 03:00:00', 2, 1, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10899, 'LILAS', 5, '1998-02-20 03:00:00', '1998-03-20 03:00:00', '1998-02-26 03:00:00', 3, 1, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10900, 'WELLI', 1, '1998-02-20 03:00:00', '1998-03-20 03:00:00', '1998-03-04 03:00:00', 2, 2, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10901, 'HILAA', 4, '1998-02-23 03:00:00', '1998-03-23 03:00:00', '1998-02-26 03:00:00', 1, 62, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10902, 'FOLKO', 1, '1998-02-23 03:00:00', '1998-03-23 03:00:00', '1998-03-03 03:00:00', 1, 44, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10903, 'HANAR', 3, '1998-02-24 03:00:00', '1998-03-24 03:00:00', '1998-03-04 03:00:00', 3, 37, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10904, 'WHITC', 3, '1998-02-24 03:00:00', '1998-03-24 03:00:00', '1998-02-27 03:00:00', 3, 163, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10905, 'WELLI', 9, '1998-02-24 03:00:00', '1998-03-24 03:00:00', '1998-03-06 03:00:00', 2, 14, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10906, 'WOLZA', 4, '1998-02-25 03:00:00', '1998-03-11 03:00:00', '1998-03-03 03:00:00', 3, 26, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10907, 'SPECD', 6, '1998-02-25 03:00:00', '1998-03-25 03:00:00', '1998-02-27 03:00:00', 3, 9, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10908, 'REGGC', 4, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-06 03:00:00', 2, 33, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10909, 'SANTG', 1, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-10 03:00:00', 2, 53, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10910, 'WILMK', 1, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-04 03:00:00', 3, 38, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10911, 'GODOS', 3, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-05 03:00:00', 1, 38, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10912, 'HUNGO', 2, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-18 03:00:00', 2, 581, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10913, 'QUEEN', 4, '1998-02-26 03:00:00', '1998-03-26 03:00:00', '1998-03-04 03:00:00', 1, 33, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10914, 'QUEEN', 6, '1998-02-27 03:00:00', '1998-03-27 03:00:00', '1998-03-02 03:00:00', 1, 21, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10915, 'TORTU', 2, '1998-02-27 03:00:00', '1998-03-27 03:00:00', '1998-03-02 03:00:00', 2, 4, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10916, 'RANCH', 1, '1998-02-27 03:00:00', '1998-03-27 03:00:00', '1998-03-09 03:00:00', 2, 64, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10917, 'ROMEY', 4, '1998-03-02 03:00:00', '1998-03-30 02:00:00', '1998-03-11 03:00:00', 2, 8, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10918, 'BOTTM', 3, '1998-03-02 03:00:00', '1998-03-30 02:00:00', '1998-03-11 03:00:00', 3, 49, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10919, 'LINOD', 2, '1998-03-02 03:00:00', '1998-03-30 02:00:00', '1998-03-04 03:00:00', 2, 20, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10920, 'AROUT', 4, '1998-03-03 03:00:00', '1998-03-31 02:00:00', '1998-03-09 03:00:00', 2, 30, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10921, 'VAFFE', 1, '1998-03-03 03:00:00', '1998-04-14 03:00:00', '1998-03-09 03:00:00', 1, 176, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10922, 'HANAR', 5, '1998-03-03 03:00:00', '1998-03-31 02:00:00', '1998-03-05 03:00:00', 3, 63, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10923, 'LAMAI', 7, '1998-03-03 03:00:00', '1998-04-14 03:00:00', '1998-03-13 03:00:00', 3, 68, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10924, 'BERGS', 3, '1998-03-04 03:00:00', '1998-04-01 02:00:00', '1998-04-08 03:00:00', 2, 152, 'Berglunds snabbköp', 'Berguvsvägen 8', 'Luleå', NULL, 'S-958 22', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10925, 'HANAR', 3, '1998-03-04 03:00:00', '1998-04-01 02:00:00', '1998-03-13 03:00:00', 1, 2, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10926, 'ANATR', 4, '1998-03-04 03:00:00', '1998-04-01 02:00:00', '1998-03-11 03:00:00', 3, 40, 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10927, 'LACOR', 4, '1998-03-05 03:00:00', '1998-04-02 02:00:00', '1998-04-08 03:00:00', 1, 20, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10928, 'GALED', 1, '1998-03-05 03:00:00', '1998-04-02 02:00:00', '1998-03-18 03:00:00', 1, 1, 'Galería del gastronómo', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '8022', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10929, 'FRANK', 6, '1998-03-05 03:00:00', '1998-04-02 02:00:00', '1998-03-12 03:00:00', 1, 34, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10930, 'SUPRD', 4, '1998-03-06 03:00:00', '1998-04-17 03:00:00', '1998-03-18 03:00:00', 3, 16, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10931, 'RICSU', 4, '1998-03-06 03:00:00', '1998-03-20 03:00:00', '1998-03-19 03:00:00', 2, 14, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10932, 'BONAP', 8, '1998-03-06 03:00:00', '1998-04-03 02:00:00', '1998-03-24 03:00:00', 1, 135, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10933, 'ISLAT', 6, '1998-03-06 03:00:00', '1998-04-03 02:00:00', '1998-03-16 03:00:00', 3, 54, 'Island Trading', 'Garden House Crowther Way', 'Cowes', 'Isle of Wight', 'PO31 7PJ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10934, 'LEHMS', 3, '1998-03-09 03:00:00', '1998-04-06 03:00:00', '1998-03-12 03:00:00', 3, 32, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10935, 'WELLI', 4, '1998-03-09 03:00:00', '1998-04-06 03:00:00', '1998-03-18 03:00:00', 3, 48, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10936, 'GREAL', 3, '1998-03-09 03:00:00', '1998-04-06 03:00:00', '1998-03-18 03:00:00', 2, 34, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10937, 'CACTU', 7, '1998-03-10 03:00:00', '1998-03-24 03:00:00', '1998-03-13 03:00:00', 3, 32, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10938, 'QUICK', 3, '1998-03-10 03:00:00', '1998-04-07 03:00:00', '1998-03-16 03:00:00', 2, 32, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10939, 'MAGAA', 2, '1998-03-10 03:00:00', '1998-04-07 03:00:00', '1998-03-13 03:00:00', 2, 76, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10940, 'BONAP', 8, '1998-03-11 03:00:00', '1998-04-08 03:00:00', '1998-03-23 03:00:00', 3, 20, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10941, 'SAVEA', 7, '1998-03-11 03:00:00', '1998-04-08 03:00:00', '1998-03-20 03:00:00', 2, 401, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10942, 'REGGC', 9, '1998-03-11 03:00:00', '1998-04-08 03:00:00', '1998-03-18 03:00:00', 3, 18, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10943, 'BSBEV', 4, '1998-03-11 03:00:00', '1998-04-08 03:00:00', '1998-03-19 03:00:00', 2, 2, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10944, 'BOTTM', 6, '1998-03-12 03:00:00', '1998-03-26 03:00:00', '1998-03-13 03:00:00', 3, 53, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10945, 'MORGK', 4, '1998-03-12 03:00:00', '1998-04-09 03:00:00', '1998-03-18 03:00:00', 1, 10, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10946, 'VAFFE', 1, '1998-03-12 03:00:00', '1998-04-09 03:00:00', '1998-03-19 03:00:00', 2, 27, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10947, 'BSBEV', 3, '1998-03-13 03:00:00', '1998-04-10 03:00:00', '1998-03-16 03:00:00', 2, 3, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10948, 'GODOS', 3, '1998-03-13 03:00:00', '1998-04-10 03:00:00', '1998-03-19 03:00:00', 3, 23, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10949, 'BOTTM', 2, '1998-03-13 03:00:00', '1998-04-10 03:00:00', '1998-03-17 03:00:00', 3, 74, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10950, 'MAGAA', 1, '1998-03-16 03:00:00', '1998-04-13 03:00:00', '1998-03-23 03:00:00', 2, 3, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10951, 'RICSU', 9, '1998-03-16 03:00:00', '1998-04-27 03:00:00', '1998-04-07 03:00:00', 2, 31, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10952, 'ALFKI', 1, '1998-03-16 03:00:00', '1998-04-27 03:00:00', '1998-03-24 03:00:00', 1, 40, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10953, 'AROUT', 9, '1998-03-16 03:00:00', '1998-03-30 02:00:00', '1998-03-25 03:00:00', 2, 24, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10954, 'LINOD', 5, '1998-03-17 03:00:00', '1998-04-28 03:00:00', '1998-03-20 03:00:00', 1, 28, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10955, 'FOLKO', 8, '1998-03-17 03:00:00', '1998-04-14 03:00:00', '1998-03-20 03:00:00', 2, 3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10956, 'BLAUS', 6, '1998-03-17 03:00:00', '1998-04-28 03:00:00', '1998-03-20 03:00:00', 2, 45, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10957, 'HILAA', 8, '1998-03-18 03:00:00', '1998-04-15 03:00:00', '1998-03-27 03:00:00', 3, 105, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10958, 'OCEAN', 7, '1998-03-18 03:00:00', '1998-04-15 03:00:00', '1998-03-27 03:00:00', 2, 50, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10959, 'GOURL', 6, '1998-03-18 03:00:00', '1998-04-29 03:00:00', '1998-03-23 03:00:00', 2, 5, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10960, 'HILAA', 3, '1998-03-19 03:00:00', '1998-04-02 02:00:00', '1998-04-08 03:00:00', 1, 2, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10961, 'QUEEN', 8, '1998-03-19 03:00:00', '1998-04-16 03:00:00', '1998-03-30 02:00:00', 1, 104, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10962, 'QUICK', 8, '1998-03-19 03:00:00', '1998-04-16 03:00:00', '1998-03-23 03:00:00', 2, 276, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10963, 'FURIB', 9, '1998-03-19 03:00:00', '1998-04-16 03:00:00', '1998-03-26 03:00:00', 3, 3, 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10964, 'SPECD', 3, '1998-03-20 03:00:00', '1998-04-17 03:00:00', '1998-03-24 03:00:00', 2, 87, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10965, 'OLDWO', 6, '1998-03-20 03:00:00', '1998-04-17 03:00:00', '1998-03-30 02:00:00', 3, 144, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10966, 'CHOPS', 4, '1998-03-20 03:00:00', '1998-04-17 03:00:00', '1998-04-08 03:00:00', 1, 27, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10967, 'TOMSP', 2, '1998-03-23 03:00:00', '1998-04-20 03:00:00', '1998-04-02 02:00:00', 2, 62, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10968, 'ERNSH', 1, '1998-03-23 03:00:00', '1998-04-20 03:00:00', '1998-04-01 02:00:00', 3, 75, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10969, 'COMMI', 1, '1998-03-23 03:00:00', '1998-04-20 03:00:00', '1998-03-30 02:00:00', 2, 0, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10970, 'BOLID', 9, '1998-03-24 03:00:00', '1998-04-07 03:00:00', '1998-04-24 03:00:00', 1, 16, 'Bólido Comidas preparadas', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10971, 'FRANR', 2, '1998-03-24 03:00:00', '1998-04-21 03:00:00', '1998-04-02 02:00:00', 2, 122, 'France restauration', '54, rue Royale', 'Nantes', NULL, '44000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10972, 'LACOR', 4, '1998-03-24 03:00:00', '1998-04-21 03:00:00', '1998-03-26 03:00:00', 2, 0, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10973, 'LACOR', 6, '1998-03-24 03:00:00', '1998-04-21 03:00:00', '1998-03-27 03:00:00', 2, 15, 'La corne d''abondance', '67, avenue de l''Europe', 'Versailles', NULL, '78000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10974, 'SPLIR', 3, '1998-03-25 03:00:00', '1998-04-08 03:00:00', '1998-04-03 02:00:00', 3, 13, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10975, 'BOTTM', 1, '1998-03-25 03:00:00', '1998-04-22 03:00:00', '1998-03-27 03:00:00', 3, 32, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10976, 'HILAA', 1, '1998-03-25 03:00:00', '1998-05-06 03:00:00', '1998-04-03 02:00:00', 1, 38, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10977, 'FOLKO', 8, '1998-03-26 03:00:00', '1998-04-23 03:00:00', '1998-04-10 03:00:00', 3, 209, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10978, 'MAISD', 9, '1998-03-26 03:00:00', '1998-04-23 03:00:00', '1998-04-23 03:00:00', 2, 33, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10979, 'ERNSH', 8, '1998-03-26 03:00:00', '1998-04-23 03:00:00', '1998-03-31 02:00:00', 2, 353, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10980, 'FOLKO', 4, '1998-03-27 03:00:00', '1998-05-08 03:00:00', '1998-04-17 03:00:00', 1, 1, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10981, 'HANAR', 1, '1998-03-27 03:00:00', '1998-04-24 03:00:00', '1998-04-02 02:00:00', 2, 193, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10982, 'BOTTM', 2, '1998-03-27 03:00:00', '1998-04-24 03:00:00', '1998-04-08 03:00:00', 1, 14, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10983, 'SAVEA', 2, '1998-03-27 03:00:00', '1998-04-24 03:00:00', '1998-04-06 03:00:00', 2, 658, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10984, 'SAVEA', 1, '1998-03-30 02:00:00', '1998-04-27 03:00:00', '1998-04-03 02:00:00', 3, 211, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10985, 'HUNGO', 2, '1998-03-30 02:00:00', '1998-04-27 03:00:00', '1998-04-02 02:00:00', 1, 92, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10986, 'OCEAN', 8, '1998-03-30 02:00:00', '1998-04-27 03:00:00', '1998-04-21 03:00:00', 2, 218, 'Océano Atlántico Ltda.', 'Ing. Gustavo Moncada 8585 Piso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10987, 'EASTC', 8, '1998-03-31 02:00:00', '1998-04-28 03:00:00', '1998-04-06 03:00:00', 1, 185, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10988, 'RATTC', 3, '1998-03-31 02:00:00', '1998-04-28 03:00:00', '1998-04-10 03:00:00', 2, 61, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10989, 'QUEDE', 2, '1998-03-31 02:00:00', '1998-04-28 03:00:00', '1998-04-02 02:00:00', 1, 35, 'Que Delícia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10990, 'ERNSH', 2, '1998-04-01 02:00:00', '1998-05-13 03:00:00', '1998-04-07 03:00:00', 3, 118, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10991, 'QUICK', 1, '1998-04-01 02:00:00', '1998-04-29 03:00:00', '1998-04-07 03:00:00', 1, 39, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10992, 'THEBI', 1, '1998-04-01 02:00:00', '1998-04-29 03:00:00', '1998-04-03 02:00:00', 3, 4, 'The Big Cheese', '89 Jefferson Way Suite 2', 'Portland', 'OR', '97201', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10993, 'FOLKO', 7, '1998-04-01 02:00:00', '1998-04-29 03:00:00', '1998-04-10 03:00:00', 3, 9, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10994, 'VAFFE', 2, '1998-04-02 02:00:00', '1998-04-16 03:00:00', '1998-04-09 03:00:00', 3, 66, 'Vaffeljernet', 'Smagsloget 45', 'Århus', NULL, '8200', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10995, 'PERIC', 1, '1998-04-02 02:00:00', '1998-04-30 03:00:00', '1998-04-06 03:00:00', 3, 46, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10996, 'QUICK', 4, '1998-04-02 02:00:00', '1998-04-30 03:00:00', '1998-04-10 03:00:00', 2, 1, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10997, 'LILAS', 8, '1998-04-03 02:00:00', '1998-05-15 03:00:00', '1998-04-13 03:00:00', 2, 74, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10998, 'WOLZA', 8, '1998-04-03 02:00:00', '1998-04-17 03:00:00', '1998-04-17 03:00:00', 2, 20, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (10999, 'OTTIK', 6, '1998-04-03 02:00:00', '1998-05-01 03:00:00', '1998-04-10 03:00:00', 2, 96, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11000, 'RATTC', 2, '1998-04-06 03:00:00', '1998-05-04 03:00:00', '1998-04-14 03:00:00', 3, 55, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11001, 'FOLKO', 2, '1998-04-06 03:00:00', '1998-05-04 03:00:00', '1998-04-14 03:00:00', 2, 197, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11002, 'SAVEA', 4, '1998-04-06 03:00:00', '1998-05-04 03:00:00', '1998-04-16 03:00:00', 1, 141, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11003, 'THECR', 3, '1998-04-06 03:00:00', '1998-05-04 03:00:00', '1998-04-08 03:00:00', 3, 15, 'The Cracker Box', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11004, 'MAISD', 3, '1998-04-07 03:00:00', '1998-05-05 03:00:00', '1998-04-20 03:00:00', 1, 45, 'Maison Dewey', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11005, 'WILMK', 2, '1998-04-07 03:00:00', '1998-05-05 03:00:00', '1998-04-10 03:00:00', 1, 1, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11006, 'GREAL', 3, '1998-04-07 03:00:00', '1998-05-05 03:00:00', '1998-04-15 03:00:00', 2, 25, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11007, 'PRINI', 8, '1998-04-08 03:00:00', '1998-05-06 03:00:00', '1998-04-13 03:00:00', 2, 202, 'Princesa Isabel Vinhos', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11008, 'ERNSH', 7, '1998-04-08 03:00:00', '1998-05-06 03:00:00', NULL, 3, 79, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11009, 'GODOS', 2, '1998-04-08 03:00:00', '1998-05-06 03:00:00', '1998-04-10 03:00:00', 1, 59, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11010, 'REGGC', 2, '1998-04-09 03:00:00', '1998-05-07 03:00:00', '1998-04-21 03:00:00', 2, 29, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11011, 'ALFKI', 3, '1998-04-09 03:00:00', '1998-05-07 03:00:00', '1998-04-13 03:00:00', 1, 1, 'Alfred''s Futterkiste', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11012, 'FRANK', 1, '1998-04-09 03:00:00', '1998-04-23 03:00:00', '1998-04-17 03:00:00', 3, 243, 'Frankenversand', 'Berliner Platz 43', 'München', NULL, '80805', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11013, 'ROMEY', 2, '1998-04-09 03:00:00', '1998-05-07 03:00:00', '1998-04-10 03:00:00', 1, 33, 'Romero y tomillo', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11014, 'LINOD', 2, '1998-04-10 03:00:00', '1998-05-08 03:00:00', '1998-04-15 03:00:00', 3, 24, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11015, 'SANTG', 2, '1998-04-10 03:00:00', '1998-04-24 03:00:00', '1998-04-20 03:00:00', 2, 5, 'Santé Gourmet', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Norway');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11016, 'AROUT', 9, '1998-04-10 03:00:00', '1998-05-08 03:00:00', '1998-04-13 03:00:00', 2, 34, 'Around the Horn', 'Brook Farm Stratford St. Mary', 'Colchester', 'Essex', 'CO7 6JX', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11017, 'ERNSH', 9, '1998-04-13 03:00:00', '1998-05-11 03:00:00', '1998-04-20 03:00:00', 2, 754, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11018, 'LONEP', 4, '1998-04-13 03:00:00', '1998-05-11 03:00:00', '1998-04-16 03:00:00', 2, 12, 'Lonesome Pine Restaurant', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11019, 'RANCH', 6, '1998-04-13 03:00:00', '1998-05-11 03:00:00', NULL, 3, 3, 'Rancho grande', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11020, 'OTTIK', 2, '1998-04-14 03:00:00', '1998-05-12 03:00:00', '1998-04-16 03:00:00', 2, 43, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11021, 'QUICK', 3, '1998-04-14 03:00:00', '1998-05-12 03:00:00', '1998-04-21 03:00:00', 1, 297, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11022, 'HANAR', 9, '1998-04-14 03:00:00', '1998-05-12 03:00:00', '1998-05-04 03:00:00', 2, 6, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11023, 'BSBEV', 1, '1998-04-14 03:00:00', '1998-04-28 03:00:00', '1998-04-24 03:00:00', 2, 124, 'B''s Beverages', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11024, 'EASTC', 4, '1998-04-15 03:00:00', '1998-05-13 03:00:00', '1998-04-20 03:00:00', 1, 74, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11025, 'WARTH', 6, '1998-04-15 03:00:00', '1998-05-13 03:00:00', '1998-04-24 03:00:00', 3, 29, 'Wartian Herkku', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11026, 'FRANS', 4, '1998-04-15 03:00:00', '1998-05-13 03:00:00', '1998-04-28 03:00:00', 1, 47, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11027, 'BOTTM', 1, '1998-04-16 03:00:00', '1998-05-14 03:00:00', '1998-04-20 03:00:00', 1, 53, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11028, 'KOENE', 2, '1998-04-16 03:00:00', '1998-05-14 03:00:00', '1998-04-22 03:00:00', 1, 30, 'Königlich Essen', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11029, 'CHOPS', 4, '1998-04-16 03:00:00', '1998-05-14 03:00:00', '1998-04-27 03:00:00', 1, 48, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11030, 'SAVEA', 7, '1998-04-17 03:00:00', '1998-05-15 03:00:00', '1998-04-27 03:00:00', 2, 831, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11031, 'SAVEA', 6, '1998-04-17 03:00:00', '1998-05-15 03:00:00', '1998-04-24 03:00:00', 2, 227, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11032, 'WHITC', 2, '1998-04-17 03:00:00', '1998-05-15 03:00:00', '1998-04-23 03:00:00', 3, 606, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11033, 'RICSU', 7, '1998-04-17 03:00:00', '1998-05-15 03:00:00', '1998-04-23 03:00:00', 3, 85, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11034, 'OLDWO', 8, '1998-04-20 03:00:00', '1998-06-01 03:00:00', '1998-04-27 03:00:00', 1, 40, 'Old World Delicatessen', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11035, 'SUPRD', 2, '1998-04-20 03:00:00', '1998-05-18 03:00:00', '1998-04-24 03:00:00', 2, 0, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11036, 'DRACD', 8, '1998-04-20 03:00:00', '1998-05-18 03:00:00', '1998-04-22 03:00:00', 3, 149, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11037, 'GODOS', 7, '1998-04-21 03:00:00', '1998-05-19 03:00:00', '1998-04-27 03:00:00', 1, 3, 'Godos Cocina Típica', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Spain');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11038, 'SUPRD', 1, '1998-04-21 03:00:00', '1998-05-19 03:00:00', '1998-04-30 03:00:00', 2, 30, 'Suprêmes délices', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Belgium');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11039, 'LINOD', 1, '1998-04-21 03:00:00', '1998-05-19 03:00:00', NULL, 2, 65, 'LINO-Delicateses', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11040, 'GREAL', 4, '1998-04-22 03:00:00', '1998-05-20 03:00:00', NULL, 3, 19, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11041, 'CHOPS', 3, '1998-04-22 03:00:00', '1998-05-20 03:00:00', '1998-04-28 03:00:00', 2, 48, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', NULL, '3012', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11042, 'COMMI', 2, '1998-04-22 03:00:00', '1998-05-06 03:00:00', '1998-05-01 03:00:00', 1, 30, 'Comércio Mineiro', 'Av. dos Lusíadas, 23', 'Sao Paulo', 'SP', '05432-043', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11043, 'SPECD', 5, '1998-04-22 03:00:00', '1998-05-20 03:00:00', '1998-04-29 03:00:00', 2, 9, 'Spécialités du monde', '25, rue Lauriston', 'Paris', NULL, '75016', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11044, 'WOLZA', 4, '1998-04-23 03:00:00', '1998-05-21 03:00:00', '1998-05-01 03:00:00', 1, 9, 'Wolski Zajazd', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Poland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11045, 'BOTTM', 6, '1998-04-23 03:00:00', '1998-05-21 03:00:00', NULL, 2, 71, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11046, 'WANDK', 8, '1998-04-23 03:00:00', '1998-05-21 03:00:00', '1998-04-24 03:00:00', 2, 72, 'Die Wandernde Kuh', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11047, 'EASTC', 7, '1998-04-24 03:00:00', '1998-05-22 03:00:00', '1998-05-01 03:00:00', 3, 47, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11048, 'BOTTM', 7, '1998-04-24 03:00:00', '1998-05-22 03:00:00', '1998-04-30 03:00:00', 3, 24, 'Bottom-Dollar Markets', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canada');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11049, 'GOURL', 3, '1998-04-24 03:00:00', '1998-05-22 03:00:00', '1998-05-04 03:00:00', 1, 8, 'Gourmet Lanchonetes', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11050, 'FOLKO', 8, '1998-04-27 03:00:00', '1998-05-25 03:00:00', '1998-05-05 03:00:00', 2, 59, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Sweden');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11051, 'LAMAI', 7, '1998-04-27 03:00:00', '1998-05-25 03:00:00', NULL, 3, 3, 'La maison d''Asie', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11052, 'HANAR', 3, '1998-04-27 03:00:00', '1998-05-25 03:00:00', '1998-05-01 03:00:00', 1, 67, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11053, 'PICCO', 2, '1998-04-27 03:00:00', '1998-05-25 03:00:00', '1998-04-29 03:00:00', 2, 53, 'Piccolo und mehr', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11054, 'CACTU', 8, '1998-04-28 03:00:00', '1998-05-26 03:00:00', NULL, 1, 0, 'Cactus Comidas para llevar', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11055, 'HILAA', 7, '1998-04-28 03:00:00', '1998-05-26 03:00:00', '1998-05-05 03:00:00', 2, 121, 'HILARION-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11056, 'EASTC', 8, '1998-04-28 03:00:00', '1998-05-12 03:00:00', '1998-05-01 03:00:00', 2, 279, 'Eastern Connection', '35 King George', 'London', NULL, 'WX3 6FW', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11057, 'NORTS', 3, '1998-04-29 03:00:00', '1998-05-27 03:00:00', '1998-05-01 03:00:00', 3, 4, 'North/South', 'South House 300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'UK');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11058, 'BLAUS', 9, '1998-04-29 03:00:00', '1998-05-27 03:00:00', NULL, 3, 31, 'Blauer See Delikatessen', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11059, 'RICAR', 2, '1998-04-29 03:00:00', '1998-06-10 03:00:00', NULL, 2, 86, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11060, 'FRANS', 2, '1998-04-30 03:00:00', '1998-05-28 03:00:00', '1998-05-04 03:00:00', 2, 11, 'Franchi S.p.A.', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11061, 'GREAL', 4, '1998-04-30 03:00:00', '1998-06-11 03:00:00', NULL, 3, 14, 'Great Lakes Food Market', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11062, 'REGGC', 4, '1998-04-30 03:00:00', '1998-05-28 03:00:00', NULL, 2, 30, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Italy');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11063, 'HUNGO', 3, '1998-04-30 03:00:00', '1998-05-28 03:00:00', '1998-05-06 03:00:00', 2, 82, 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Ireland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11064, 'SAVEA', 1, '1998-05-01 03:00:00', '1998-05-29 03:00:00', '1998-05-04 03:00:00', 1, 30, 'Save-a-lot Markets', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11065, 'LILAS', 8, '1998-05-01 03:00:00', '1998-05-29 03:00:00', NULL, 1, 13, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11066, 'WHITC', 7, '1998-05-01 03:00:00', '1998-05-29 03:00:00', '1998-05-04 03:00:00', 2, 45, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'USA');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11067, 'DRACD', 1, '1998-05-04 03:00:00', '1998-05-18 03:00:00', '1998-05-06 03:00:00', 2, 8, 'Drachenblut Delikatessen', 'Walserweg 21', 'Aachen', NULL, '52066', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11068, 'QUEEN', 8, '1998-05-04 03:00:00', '1998-06-01 03:00:00', NULL, 2, 82, 'Queen Cozinha', 'Alameda dos Canàrios, 891', 'Sao Paulo', 'SP', '05487-020', 'Brazil');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11069, 'TORTU', 1, '1998-05-04 03:00:00', '1998-06-01 03:00:00', '1998-05-06 03:00:00', 2, 16, 'Tortuga Restaurante', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11070, 'LEHMS', 2, '1998-05-05 03:00:00', '1998-06-02 03:00:00', NULL, 1, 136, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', NULL, '60528', 'Germany');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11071, 'LILAS', 1, '1998-05-05 03:00:00', '1998-06-02 03:00:00', NULL, 1, 1, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11072, 'ERNSH', 4, '1998-05-05 03:00:00', '1998-06-02 03:00:00', NULL, 2, 259, 'Ernst Handel', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Austria');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11073, 'PERIC', 2, '1998-05-05 03:00:00', '1998-06-02 03:00:00', NULL, 2, 25, 'Pericles Comidas clásicas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'Mexico');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11074, 'SIMOB', 7, '1998-05-06 03:00:00', '1998-06-03 03:00:00', NULL, 2, 18, 'Simons bistro', 'Vinbæltet 34', 'Kobenhavn', NULL, '1734', 'Denmark');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11075, 'RICSU', 8, '1998-05-06 03:00:00', '1998-06-03 03:00:00', NULL, 2, 6, 'Richter Supermarkt', 'Starenweg 5', 'Genève', NULL, '1204', 'Switzerland');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11076, 'BONAP', 4, '1998-05-06 03:00:00', '1998-06-03 03:00:00', NULL, 2, 38, 'Bon app''', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'France');
INSERT INTO public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) VALUES (11077, 'RATTC', 1, '1998-05-06 03:00:00', '1998-06-03 03:00:00', NULL, 2, 9, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'USA');


--
-- TOC entry 3000 (class 0 OID 16449)
-- Dependencies: 200
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (1, 'Chai', 1, 1, '10 boxes x 20 bags', 18, 39, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (2, 'Chang', 1, 1, '24 - 12 oz bottles', 19, 17, 40, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10, 13, 70, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22, 53, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 boxes', 21.3500000000000014, 0, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25, 120, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30, 15, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (8, 'Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40, 6, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (9, 'Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97, 29, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (10, 'Ikura', 4, 8, '12 - 200 ml jars', 31, 31, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (11, 'Queso Cabrales', 5, 4, '1 kg pkg.', 21, 22, 30, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (12, 'Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38, 86, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (13, 'Konbu', 6, 8, '2 kg box', 6, 24, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (14, 'Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (15, 'Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.5, 39, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (16, 'Pavlova', 7, 3, '32 - 500 g boxes', 17.4499999999999993, 29, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (17, 'Alice Mutton', 7, 6, '20 - 1 kg tins', 39, 0, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (18, 'Carnarvon Tigers', 7, 8, '16 kg pkg.', 62.5, 42, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 9.19999999999999929, 25, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (20, 'Sir Rodney''s Marmalade', 8, 3, '30 gift boxes', 81, 40, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (21, 'Sir Rodney''s Scones', 8, 3, '24 pkgs. x 4 pieces', 10, 3, 40, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (22, 'Gustaf''s Knäckebröd', 9, 5, '24 - 500 g pkgs.', 21, 104, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (23, 'Tunnbröd', 9, 5, '12 - 250 g pkgs.', 9, 61, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (24, 'Guaraná Fantástica', 10, 1, '12 - 355 ml cans', 4.5, 20, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 - 450 g glasses', 14, 76, 0, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (26, 'Gumbär Gummibärchen', 11, 3, '100 - 250 g bags', 31.2300000000000004, 15, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (27, 'Schoggi Schokolade', 11, 3, '100 - 100 g pieces', 43.8999999999999986, 49, 0, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (28, 'Rössle Sauerkraut', 12, 7, '25 - 825 g cans', 45.6000000000000014, 26, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (29, 'Thüringer Rostbratwurst', 12, 6, '50 bags x 30 sausgs.', 123.790000000000006, 0, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (30, 'Nord-Ost Matjeshering', 13, 8, '10 - 200 g glasses', 25.8900000000000006, 10, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (31, 'Gorgonzola Telino', 14, 4, '12 - 100 g pkgs', 12.5, 0, 70, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 - 200 g pkgs.', 32, 9, 40, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (33, 'Geitost', 15, 4, '500 g', 2.5, 112, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (34, 'Sasquatch Ale', 16, 1, '24 - 12 oz bottles', 14, 111, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (35, 'Steeleye Stout', 16, 1, '24 - 12 oz bottles', 18, 20, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (36, 'Inlagd Sill', 17, 8, '24 - 250 g jars', 19, 112, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (37, 'Gravad lax', 17, 8, '12 - 500 g pkgs.', 26, 11, 50, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (38, 'Côte de Blaye', 18, 1, '12 - 75 cl bottles', 263.5, 17, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (39, 'Chartreuse verte', 18, 1, '750 cc per bottle', 18, 69, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (40, 'Boston Crab Meat', 19, 8, '24 - 4 oz tins', 18.3999999999999986, 123, 0, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (41, 'Jack''s New England Clam Chowder', 19, 8, '12 - 12 oz cans', 9.65000000000000036, 85, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 - 1 kg pkgs.', 14, 26, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (43, 'Ipoh Coffee', 20, 1, '16 - 500 g tins', 46, 17, 10, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (44, 'Gula Malacca', 20, 2, '20 - 2 kg bags', 19.4499999999999993, 27, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (45, 'Rogede sild', 21, 8, '1k pkg.', 9.5, 5, 70, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (46, 'Spegesild', 21, 8, '4 - 450 g glasses', 12, 95, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (47, 'Zaanse koeken', 22, 3, '10 - 4 oz boxes', 9.5, 36, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (48, 'Chocolade', 22, 3, '10 pkgs.', 12.75, 15, 70, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (49, 'Maxilaku', 23, 3, '24 - 50 g pkgs.', 20, 10, 60, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (50, 'Valkoinen suklaa', 23, 3, '12 - 100 g bars', 16.25, 65, 0, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (51, 'Manjimup Dried Apples', 24, 7, '50 - 300 g pkgs.', 53, 20, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (52, 'Filo Mix', 24, 5, '16 - 2 kg boxes', 7, 38, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (53, 'Perth Pasties', 24, 6, '48 pieces', 32.7999999999999972, 0, 0, 0, -1);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (54, 'Tourtière', 25, 6, '16 pies', 7.45000000000000018, 21, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (55, 'Pâté chinois', 25, 6, '24 boxes x 2 pies', 24, 115, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (56, 'Gnocchi di nonna Alice', 26, 5, '24 - 250 g pkgs.', 38, 21, 10, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (57, 'Ravioli Angelo', 26, 5, '24 - 250 g pkgs.', 19.5, 36, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (58, 'Escargots de Bourgogne', 27, 8, '24 pieces', 13.25, 62, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (59, 'Raclette Courdavault', 28, 4, '5 kg pkg.', 55, 79, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (60, 'Camembert Pierrot', 28, 4, '15 - 300 g rounds', 34, 19, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (61, 'Sirop d''érable', 29, 2, '24 - 500 ml bottles', 28.5, 113, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (62, 'Tarte au sucre', 29, 3, '48 pies', 49.2999999999999972, 17, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (63, 'Vegie-spread', 7, 2, '15 - 625 g jars', 43.8999999999999986, 24, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (64, 'Wimmers gute Semmelknödel', 12, 5, '20 bags x 4 pieces', 33.25, 22, 80, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 - 8 oz bottles', 21.0500000000000007, 76, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 - 8 oz jars', 17, 4, 100, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (67, 'Laughing Lumberjack Lager', 16, 1, '24 - 12 oz bottles', 14, 52, 0, 10, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (68, 'Scottish Longbreads', 8, 3, '10 boxes x 8 pieces', 12.5, 6, 10, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (69, 'Gudbrandsdalsost', 15, 4, '10 kg pkg.', 36, 26, 0, 15, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (70, 'Outback Lager', 7, 1, '24 - 355 ml bottles', 15, 15, 10, 30, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (71, 'Flotemysost', 15, 4, '10 - 500 g pkgs.', 21.5, 26, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (72, 'Mozzarella di Giovanni', 14, 4, '24 - 200 g pkgs.', 34.7999999999999972, 14, 0, 0, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (73, 'Röd Kaviar', 17, 8, '24 - 150 g jars', 15, 101, 0, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (74, 'Longlife Tofu', 4, 7, '5 kg pkg.', 10, 4, 20, 5, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (75, 'Rhönbräu Klosterbier', 12, 1, '24 - 0.5 l bottles', 7.75, 125, 0, 25, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (76, 'Lakkalikööri', 23, 1, '500 ml', 18, 57, 0, 20, 0);
INSERT INTO public.products (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) VALUES (77, 'Original Frankfurter grüne Soße', 12, 2, '12 boxes', 13, 32, 0, 15, 0);


--
-- TOC entry 3004 (class 0 OID 16469)
-- Dependencies: 204
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.region (regionid, regiondescription) VALUES (1, 'Eastern                                           ');
INSERT INTO public.region (regionid, regiondescription) VALUES (2, 'Western                                           ');
INSERT INTO public.region (regionid, regiondescription) VALUES (3, 'Northern                                          ');
INSERT INTO public.region (regionid, regiondescription) VALUES (4, 'Southern                                          ');


--
-- TOC entry 2997 (class 0 OID 16431)
-- Dependencies: 197
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shippers (shipperid, companyname, phone) VALUES (1, 'Speedy Express', '(503) 555-9831');
INSERT INTO public.shippers (shipperid, companyname, phone) VALUES (2, 'United Package', '(503) 555-3199');
INSERT INTO public.shippers (shipperid, companyname, phone) VALUES (3, 'Federal Shipping', '(503) 555-9931');


--
-- TOC entry 3008 (class 0 OID 16492)
-- Dependencies: 208
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Purchasing Manager', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'UK', '(171) 555-2222', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Order Administrator', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'USA', '(100) 555-4822', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (3, 'Grandma Kelly''s Homestead', 'Regina Murphy', 'Sales Representative', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'USA', '(313) 555-5735', '(313) 555-3349', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (4, 'Tokyo Traders', 'Yoshi Nagase', 'Marketing Manager', '9-8 Sekimai Musashino-shi', 'Tokyo', NULL, '100', 'Japan', '(03) 3555-5011', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (5, 'Cooperativa de Quesos ''Las Cabras''', 'Antonio del Valle Saavedra', 'Export Administrator', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Spain', '(98) 598 76 54', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (6, 'Mayumi''s', 'Mayumi Ohno', 'Marketing Representative', '92 Setsuko Chuo-ku', 'Osaka', NULL, '545', 'Japan', '(06) 431-7877', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (7, 'Pavlova, Ltd.', 'Ian Devling', 'Marketing Manager', '74 Rose St. Moonie Ponds', 'Melbourne', 'Victoria', '3058', 'Australia', '(03) 444-2343', '(03) 444-6588', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Sales Representative', '29 King''s Way', 'Manchester', NULL, 'M14 GSD', 'UK', '(161) 555-4448', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Sales Agent', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Sweden', '031-987 65 43', '031-987 65 91', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (10, 'Refrescosericanas LTDA', 'Carlos Diaz', 'Marketing Manager', 'Av. dasericanas 12.890', 'Sao Paulo', NULL, '5442', 'Brazil', '(11) 555 4640', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Sales Manager', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Germany', '(010) 9984510', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'International Marketing Mgr.', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Germany', '(069) 992755', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinator Foreign Markets', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Germany', '(04721) 8713', '(04721) 8714', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Sales Representative', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Italy', '(0544) 60323', '(0544) 60603', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (15, 'Norske Meierier', 'Beate Vileid', 'Marketing Manager', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Norway', '(0)2-953010', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Regional Account Rep.', '3400 - 8th Avenue Suite 210', 'Bend', 'OR', '97101', 'USA', '(503) 555-9931', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (17, 'Svensk Sjöföda AB', 'Michael Björn', 'Sales Representative', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Sweden', '08-123 45 67', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Sales Manager', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'France', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (19, 'New England Seafood Cannery', 'Robb Merchant', 'Wholesale Account Agent', 'Order Processing Dept. 2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'USA', '(617) 555-3267', '(617) 555-3389', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (20, 'Leka Trading', 'Chandra Leka', 'Owner', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Singapore', '555-8787', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (21, 'Lyngbysild', 'Niels Petersen', 'Sales Manager', 'Lyngbysild Fiskebakken 10', 'Lyngby', NULL, '2800', 'Denmark', '43844108', '43844115', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Accounting Manager', 'Verkoop Rijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Netherlands', '(12345) 1212', '(12345) 1210', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (23, 'Karkki Oy', 'Anne Heikkonen', 'Product Manager', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finland', '(953) 10956', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (24, 'G''day, Mate', 'Wendy Mackenzie', 'Sales Representative', '170 Prince Edward Parade Hunter''s Hill', 'Sydney', 'NSW', '2042', 'Australia', '(02) 555-5914', '(02) 555-4873', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Marketing Manager', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canada', '(514) 555-9022', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Order Administrator', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Italy', '(089) 6547665', '(089) 6547667', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (27, 'Escargots Nouveaux', 'Marie Delamare', 'Sales Manager', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'France', '85.57.00.07', NULL, NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (28, 'Gai pâturage', 'Eliane Noz', 'Sales Representative', 'Bat. B 3, rue des Alpes', 'Annecy', NULL, '74000', 'France', '38.76.98.06', '38.76.98.58', NULL);
INSERT INTO public.suppliers (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) VALUES (29, 'Forêts d''érables', 'Chantal Goulet', 'Accounting Manager', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canada', '(514) 555-2955', '(514) 555-2921', NULL);


--
-- TOC entry 3006 (class 0 OID 16479)
-- Dependencies: 206
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('01581', 'Westboro                                          ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('01730', 'Bedford                                           ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('01833', 'Georgetow                                         ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('02116', 'Boston                                            ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('02139', 'Cambridge                                         ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('02184', 'Braintree                                         ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('02903', 'Providence                                        ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('03049', 'Hollis                                            ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('03801', 'Portsmouth                                        ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('06897', 'Wilton                                            ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('07960', 'Morristown                                        ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('08837', 'Edison                                            ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('10019', 'New York                                          ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('10038', 'New York                                          ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('11747', 'Mellvile                                          ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('14450', 'Fairport                                          ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('19428', 'Philadelphia                                      ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('19713', 'Neward                                            ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('20852', 'Rockville                                         ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('27403', 'Greensboro                                        ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('27511', 'Cary                                              ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('29202', 'Columbia                                          ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('30346', 'Atlanta                                           ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('31406', 'Savannah                                          ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('32859', 'Orlando                                           ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('33607', 'Tampa                                             ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('40222', 'Louisville                                        ', 1);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('44122', 'Beachwood                                         ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('45839', 'Findlay                                           ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('48075', 'Southfield                                        ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('48084', 'Troy                                              ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('48304', 'Bloomfield Hills                                  ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('53404', 'Racine                                            ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('55113', 'Roseville                                         ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('55439', 'Minneapolis                                       ', 3);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('60179', 'Hoffman Estates                                   ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('60601', 'Chicago                                           ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('72716', 'Bentonville                                       ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('75234', 'Dallas                                            ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('78759', 'Austin                                            ', 4);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('80202', 'Denver                                            ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('80909', 'Colorado Springs                                  ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('85014', 'Phoenix                                           ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('85251', 'Scottsdale                                        ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('90405', 'Santa Monica                                      ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('94025', 'Menlo Park                                        ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('94105', 'San Francisco                                     ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('95008', 'Campbell                                          ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('95054', 'Santa Clara                                       ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('95060', 'Santa Cruz                                        ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('98004', 'Bellevue                                          ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('98052', 'Redmond                                           ', 2);
INSERT INTO public.territories (territoryid, territorydescription, regionid) VALUES ('98104', 'Seattle                                           ', 2);


--
-- TOC entry 2868 (class 2606 OID 16478)
-- Name: book_nodes book_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_nodes
    ADD CONSTRAINT book_nodes_pkey PRIMARY KEY (node_id);


--
-- TOC entry 2850 (class 2606 OID 16430)
-- Name: book_text book_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_text
    ADD CONSTRAINT book_text_pkey PRIMARY KEY (book_text_id);


--
-- TOC entry 2872 (class 2606 OID 16491)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 2864 (class 2606 OID 16468)
-- Name: chat_users chat_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_users
    ADD CONSTRAINT chat_users_pkey PRIMARY KEY (chat_user_id);


--
-- TOC entry 2862 (class 2606 OID 16463)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- TOC entry 2854 (class 2606 OID 16443)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- TOC entry 2856 (class 2606 OID 16448)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (orderid, productid);


--
-- TOC entry 2860 (class 2606 OID 16458)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- TOC entry 2858 (class 2606 OID 16453)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 2866 (class 2606 OID 16473)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);


--
-- TOC entry 2852 (class 2606 OID 16435)
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (shipperid);


--
-- TOC entry 2874 (class 2606 OID 16499)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);


--
-- TOC entry 2870 (class 2606 OID 16483)
-- Name: territories territories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT territories_pkey PRIMARY KEY (territoryid);


-- Completed on 2019-11-15 18:38:30 MST

--
-- PostgreSQL database dump complete
--

