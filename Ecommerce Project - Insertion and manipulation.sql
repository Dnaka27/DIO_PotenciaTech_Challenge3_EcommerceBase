-- Inserindo dados

INSERT INTO clients (Fname, Minit, Lname, CPF, clientType, Address) VALUES
    ('João', 'A', 'Silva', '12345678901', 'Pessoa física', 'Rua das Flores, 123'),
    ('Maria', 'B', 'Santos', '23456789012', 'Pessoa física',  'Avenida Principal, 456'),
    ('Carlos', 'C', 'Pereira', '34567890123', 'Pessoa jurídica', 'Praça Central, 789'),
    ('Ana', 'D', 'Oliveira', '45678901234', 'Pessoa jurídica',  'Rua das Palmeiras, 567'),
    ('Pedro', 'E', 'Almeida', '56789012345', 'Pessoa física',  'Rua da Esperança, 789');
    
INSERT INTO orders (idOrderClient, ordersStatus, ordersDescription, sendValue) VALUES
    (1, 'Confirmado', 'Pedido de camisetas', 50.99),
    (2, 'Em processamento', 'Pedido de eletrônicos', 120.75),
    (3, 'Cancelado', 'Pedido de alimentos', 25.50),
    (1, 'Confirmado', 'Pedido de brinquedos', 30.00),
    (4, 'Em processamento', 'Pedido de móveis', 200.00);

INSERT INTO product (Pname, classification_kids, category, avaliação, size) VALUES
    ('Smartphone', FALSE, 'Eletrônico', 4.5, 'Médio'),
    ('Camiseta', TRUE, 'Vestimenta', 3.8, 'Grande'),
    ('Carrinho Remoto', TRUE, 'Brinquedos', 4.2, 'Pequeno'),
    ('Biscoitos', TRUE, 'Alimentos', 4.7, NULL),
    ('Sofá', FALSE, 'Móveis', 4.0, 'Grande');

INSERT INTO seller (socialName, abstractName, CNPJ, CPF, location, contact) VALUES
    ('Empresa A', 'Emp A', '34567890123456', '12345678901', 'Rua das Empresas, 123', '98765432101'),
    ('Comércio B', 'Com B', '23456789011345', '23456789012', 'Avenida Comercial, 456', '87654321012'),
    ('Fornecedor C', 'Forn C', '12345678901234', '34567890123', 'Praça dos Fornecedores, 789', '76543210987'),
    ('Revendedora D', 'Rev D', '45678911234567', '45678901234', 'Rua das Revendas, 1010', '65432109876'),
    ('Distribuidora E', 'Dist E', '56711012345678', '56789012345', 'Avenida dos Distribuidores, 1234', '54321098765');

INSERT INTO supplier (socialName, CNPJ, contact) VALUES
    ('Fornecedor C', '12345678901234', '98765432101'),
    ('Distribuidora B', '23456789012345', '87654321012'),
    ('Atacadista A', '34567890123456', '76543210987'),
    ('Importadora D', '45678901234567', '65432109876'),
    ('Fabricante E', '56789012345678', '54321098765');

INSERT INTO storages (location, storageArea_in_meters) VALUES
    ('Armazém A', 500),
    ('Depósito B', 300),
    ('Estoque C', 700),
    ('Galpão D', 1000),
    ('Depósito E', 400);
    
INSERT INTO payment (idClient, typePayment, defaultPaymentValue, alternativePayment, alternativePaymentValue) VALUES
    (1, 'Cartão', 10.00, 'Dinheiro', 100),
    (2, 'Boleto', 75.50, 'Pix', 45.25),
    (3, 'Cartão', 50, NULL, NULL),
    (1, 'Pix', 50.00, NULL, NULL),
    (4, 'Dinheiro', 150.00, 'Cartão', '50');
    
INSERT INTO productorder (idPOProduct, idPOOrder, idPOClient, POQuantity, POStatus) VALUES
    (1, 1, 1, 4, 'Disponível'),
    (2, 2, 2, 17, 'Sem estoque'),
    (3, 3, 3, 10, 'Disponível'),
    (4, 1, 1, 40, 'Disponível'),
    (5, 4, 4, 2, 'Sem estoque');

INSERT INTO productseller (idPSeller, idPProduct, quantity) VALUES
    (1, 1, 10),
    (2, 2, 5),
    (3, 3, 20),
    (1, 4, 8),
    (2, 5, 15);

INSERT INTO productstorage (idPSStorage, idPSProduct, quantity) VALUES
    (1, 1, 100),
    (2, 2, 50),
    (3, 3, 200),
    (4, 4, 150),
    (5, 5, 80);

INSERT INTO productsupply (idPSSupply, idPSProduct, quantity) VALUES
    (1, 1, 200),
    (2, 2, 100),
    (3, 3, 300),
    (4, 4, 150),
    (5, 5, 80);
    
-- Consultando dados

-- Todos clientes e pedidos cadastrados
SELECT idClient, concat(Fname, ' ', Minit, ' ', Lname) as Cliente, CPF, Address, idOrder, ordersStatus, ordersDescription, sendValue FROM clients c LEFT JOIN orders o ON c.idClient = o.idOrderClient;

-- Clientes cadastrados que não fizeram pedido
SELECT idClient, concat(Fname, ' ', Minit, ' ', Lname) as Cliente, CPF FROM clients c LEFT JOIN orders o ON c.idClient = o.idOrderClient WHERE o.idOrderClient IS NULL;

-- Quantidade de pedidos por cliente
SELECT idClient, concat(Fname, ' ', Minit, ' ', Lname) as Cliente, COUNT(*) FROM clients INNER JOIN orders ON idClient = idOrderClient GROUP BY idClient;

-- Ver todas informações das pessoas, pedidos e produto
SELECT * FROM clients LEFT JOIN orders ON idClient = idOrderClient LEFT JOIN productOrder ON idPOOrder = idOrder AND idPOClient = idClient LEFT JOIN product ON idPOProduct = idProduct;

-- Pedidos disponíveis
SELECT idClient, concat(Fname, ' ', Minit, ' ', Lname) as Cliente, CPF, Address, ordersStatus, ordersDescription, sendValue, POQuantity, POStatus, Pname, avaliação, size FROM clients INNER JOIN orders ON idClient = idOrderClient INNER JOIN productOrder ON idPOOrder = idOrder AND idPOClient = idClient INNER JOIN product ON idPOProduct = idProduct WHERE POStatus = 'Disponível';

-- Informações de armazéns/depósitos
SELECT idStorage, location, storageArea_in_meters as storageArea, quantity FROM storages INNER JOIN productStorage ON idPSStorage = idStorage;

-- Produtos disponíveis em quantidade
SELECT Pname, quantity FROM product INNER JOIN productStorage ON idProduct = idPSProduct WHERE quantity > 0;

-- Informações de armazéns/depósitos por produto 
SELECT idProduct, Pname, category, avaliação, size idStorage, location, storageArea_in_meters as storageArea, quantity FROM storages INNER JOIN productStorage ON idPSStorage = idStorage INNER JOIN product ON idProduct = idPSProduct;

-- Informação de fornecedores
SELECT * FROM supplier INNER JOIN productSupply ON idSupplier = idPSSupply;

-- Informação de fornecedores e produtos ordenados por quantidade
SELECT quantity, PName, category, avaliação, socialName, contact FROM product INNER JOIN productSupply ON idPSProduct = idProduct INNER JOIN supplier ON idSupplier = idPSSupply ORDER BY quantity;

-- Informações de pagamento
SELECT c.idClient, concat(Fname, ' ', Minit, ' ', Lname) as Cliente, typePayment, defaultPaymentValue, alternativePayment, alternativePaymentValue FROM clients c INNER JOIN payment p ON c.idClient = p.idClient;

-- Informação de vendedor
SELECT * FROM seller INNER JOIN productSeller ON idPSeller = idSeller;

-- Informação de vendedor por produto
SELECT * FROM product INNER JOIN productSeller ON idPProduct = idProduct INNER JOIN seller ON idSeller= idPSeller;

-- Informações de vendedores que venderam 15 ou mais produtos
SELECT idSeller AS M10Sellers, socialName, quantity, Pname, category FROM seller INNER JOIN productSeller ON idPSeller = idSeller INNER JOIN product ON idProduct = idPProduct GROUP BY M10Sellers, socialName, quantity, Pname, category HAVING quantity >= 15;

-- Vendedor que é fornecedor 
SELECT sel.socialName, sel.CNPJ, location FROM seller sel INNER JOIN supplier sup ON sel.CNPJ = sup.CNPJ;