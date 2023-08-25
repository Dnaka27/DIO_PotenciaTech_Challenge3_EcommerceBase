# - Sistema de Gerenciamento para Ecommerce -

Este repositório é para um desafio do curso de ciência de dados da DIO, ele consiste em um banco de dados que representa um sistema simples de gerenciamento para um Ecommerce. O sistema é projetado para armazenar e rastrear informações relacionadas a clientes, produtos, pedidos, vendedores, fornecedores, pagamentos e estoques. A estrutura do banco de dados é planejada para garantir a integridade dos dados e facilitar a manipulação de informações complexas.

### Tabelas Principais e Características:

- ### Tabela: Clients
Armazena informações sobre os clientes, incluindo nome, sobrenome, CPF, tipo de cliente (pessoa física ou jurídica) e endereço. Cada cliente é identificado por um ID exclusivo.

- ### Tabela: Product
Mantém os detalhes dos produtos oferecidos pela loja, como nome, categoria, avaliação, tamanho e classificação para crianças.

- ### Tabela: Orders
Registra os detalhes de cada pedido feito pelos clientes. Esta tabela está vinculada às tabelas de clientes e produtos por meio de chaves estrangeiras.

- ### Tabela: Seller
Contém informações sobre os vendedores ou fornecedores que abastecem a loja. Inclui detalhes como nome social, CNPJ, CPF, localização e informações de contato.

- ### Tabela: Supplier
Similar à tabela de vendedores, mantém detalhes sobre os fornecedores dos produtos.

- ### Tabela: Storages
Registra os locais de armazenamento, incluindo detalhes como localização e área disponível.

- ### Tabela: ProductOrder
Rastreia os produtos associados a cada pedido, juntamente com quantidades e status de estoque.

- ### Tabela: ProductSeller
Mantém o relacionamento entre os produtos e os vendedores que os fornecem, além das quantidades em estoque.

- ### Tabela: ProductStorage
Registra a quantidade de cada produto armazenado em locais específicos.

- ### Tabela: ProductSupply
Controla os produtos fornecidos pelos fornecedores, juntamente com as quantidades.

- ### Tabela: Payment
Armazena informações sobre os pagamentos feitos pelos clientes. Inclui detalhes como o tipo de pagamento, valor padrão e métodos de pagamento alternativos.

- ### Tabela: OrderTracking
Conecta pedidos a produtos, registrando os produtos associados a cada pedido.

### Integridade dos Dados

Assim, digo que o banco de dados é construído com chaves estrangeiras para dar consistência e integridade entre as tabelas. Isso permite que o sistema acompanhe pedidos, produtos, estoques e pagamentos informações valiosas para a gestão. Com essa estrutura é possível realizar consultas e gerar relatórios para ajudar no funcionamento geral do sistema e também na tomada de decisões.