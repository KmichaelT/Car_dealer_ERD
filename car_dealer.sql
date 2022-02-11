
create table sales_person(
	employee_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	phone_number INTEGER,
	address VARCHAR(100),
	city VARCHAR(50),
	state VARCHAR(2),
	zipcode INTEGER,
	country VARCHAR(50)
);

create table service_ticket(
	ticket_id SERIAL primary key,
	car_id INTEGER not NULL,
	customer_id INTEGER not NULL,
	date_of_service DATE,
	amount NUMERIC(6,2),
	date_received DATE,
	date_returned DATE,
	parts_used_id integer,
	foreign key(car_id) references cars(car_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(parts_used_id) references parts_line_order(parts_used_id)
);


create table cars(
	car_id SERIAL primary key,
	serial_num INTEGER,
	make VARCHAR(50),
	model VARCHAR(50),
	color VARCHAR(50),
	car_year INTEGER
);


create table invoice(
	invoice_id SERIAL primary key,
	amount NUMERIC(6,2),
	date_of_invoice DATE,
	employee_id INTEGER,
	customer_id INTEGER,
	foreign key (employee_id) references salesperson(employee_id),
	foreign key (customer_id) references customer(customer_id)
);



create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	ticket_id INTEGER,
	foreign key (ticket_id) references service_ticket(ticket_id)
);


create table parts_line_order (
	parts_used_id SERIAL primary key,
	ticket_id INTEGER,
	part_id INTEGER,
	quantity INTEGER,
	foreign key (part_id) references parts(part_id)
);


create table parts(
	part_id SERIAL primary key,
	part_name VARCHAR(50),
	part_number INTEGER,
	part_price NUMERIC(4,2)
);