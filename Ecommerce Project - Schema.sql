-- Criação do banco de dados para E-commerce

CREATE DATABASE Ecommerce;
USE Ecommerce;

-- Criar tabelas

CREATE TABLE clients(
	idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lname VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    clientType ENUM('Pessoa física', 'Pessoa jurídica') DEFAULT 'Pessoa física',
    Address VARCHAR(40),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

CREATE TABLE product(
	idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(45),
    classification_kids BOOL,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10)
);

CREATE TABLE orders(
	idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    ordersStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    ordersDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

CREATE TABLE seller(
	idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName CHAR(15) NOT NULL,
    abstractName VARCHAR(45),
    CNPJ CHAR(15) NOT NULL, 
    CPF CHAR(11) NOT NULL,
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

CREATE TABLE supplier(
	idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL ,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

CREATE TABLE storages(
	idStorage INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(45),
    storageArea_in_meters INT
); 

CREATE TABLE productOrder(
	idPOProduct INT,
    idPOOrder INT,
    idPOClient INT,
    POQuantity INT DEFAULT 1,
    POStatus ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productOrder_order FOREIGN KEY (idPOOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_productOrder_client FOREIGN KEY (idPOClient) REFERENCES clients(idClient)
);

CREATE TABLE productSeller(
	idPSeller INT,
    idPProduct INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (idPSeller, idPProduct),
    CONSTRAINT fk_productSeller_seller FOREIGN KEY (idPSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_productSeller_product FOREIGN KEY (idPProduct) REFERENCES product(idProduct)
);

CREATE TABLE productStorage(
	idPSStorage INT,
    idPSProduct INT,
    quantity INT DEFAULT 0,
    CONSTRAINT fk_productStorage_storage FOREIGN KEY (idPSStorage) REFERENCES storages(idStorage),
    CONSTRAINT fk_productStorage_product FOREIGN KEY (idPSProduct) REFERENCES product(idProduct)
);

CREATE TABLE productSupply(
	idPSSupply INT,
    idPSProduct INT,
    quantity INT DEFAULT 1,
	CONSTRAINT fk_productSupply_storage FOREIGN KEY (idPSSupply) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_productSupply_product FOREIGN KEY (idPSProduct) REFERENCES product(idProduct)
);

CREATE TABLE payment(
	idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT,
    typePayment ENUM('Dinheiro', 'Boleto', 'Cartão', 'Pix') DEFAULT 'Dinheiro',
    defaultPaymentValue FLOAT,
    alternativePayment VARCHAR(45),
    alternativePaymentValue FLOAT,
    CONSTRAINT fk_payment_idClient FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

CREATE TABLE orderTracking (
	idOTOrder INT,
    idOTProduct INT,
    CONSTRAINT fk_idOrderTracking_order FOREIGN KEY (idOTOrder) REFERENCES orders(idOrder),
    CONSTRAINT fk_idOrderTracking_product FOREIGN KEY (idOTProduct) REFERENCES product(idProduct)
);