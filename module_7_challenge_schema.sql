-- Creat tables and add primary keys

CREATE TABLE "transaction" (
	id INT CONSTRAINT pk_transaction PRIMARY KEY,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT
);

CREATE TABLE "credit_card" (
	card VARCHAR(20) CONSTRAINT pk_credit_card PRIMARY KEY,
	id_card_holder INT
);

CREATE TABLE "card_holder" (
	id INT CONSTRAINT pk_card_holder PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE "merchant" (
	id INT CONSTRAINT pk_merchant PRIMARY KEY,
	name VARCHAR(255),
	id_merchant_category INT
);

CREATE TABLE "merchant_category" (
	id INT CONSTRAINT pk_merchant_category PRIMARY KEY,
	name VARCHAR(255)
);

-- Add foreign keys

ALTER TABLE "transaction" ADD CONSTRAINT fk_transaction_id_merchant_merchant_id FOREIGN KEY(id_merchant) REFERENCES merchant (id);

ALTER TABLE "transaction" ADD CONSTRAINT fk_transaction_card_credit_card_card FOREIGN KEY(card) REFERENCES credit_card (card);

ALTER TABLE "credit_card" ADD CONSTRAINT fk_credit_card_id_credit_card_holder_id FOREIGN KEY(id_card_holder) REFERENCES card_holder (id);

ALTER TABLE "merchant" ADD CONSTRAINT fk_merchant_id_merchant_category_id FOREIGN KEY(id_merchant_category) REFERENCES merchant_category (id);

-- Sources
--- Adding primary key - https://www.commandprompt.com/education/how-to-add-or-drop-primary-key-constraints-in-postgresql/#:~:text=Conclusion-,Tables%20can%20be%20created%20with%20a%20primary%20key%20constraint%20using,with%20the%20ALTER%20TABLE%20command.
--- Adding foreign key - https://blog.devart.com/postgresql-foreign-key.html#:~:text=In%20PostgreSQL%2C%20you%20can%20add,TABLE%20statement%20can%20be%20used.

