# <span style="color:#7929EC">- Sistema de Gerenciamento para Loja/Comércio -</span>

Este repositório é para um desafio do curso de ciência de dados da DIO, ele consiste em um banco de dados que representa um sistema simples de gerenciamento abrangente para um Ecommerce. O sistema é projetado para armazenar e rastrear informações relacionadas a clientes, produtos, pedidos, vendedores, fornecedores, pagamentos e estoques. A estrutura do banco de dados é planejada para garantir a integridade dos dados e facilitar a manipulação de informações complexas.

### <span style="color:#2990EC">Tabelas Principais e Características:</span>

### <span style="color:#58D68D">Tabela: Clients</span>
Armazena informações sobre os clientes, incluindo nome, sobrenome, CPF, tipo de cliente (pessoa física ou jurídica) e endereço. Cada cliente é identificado por um ID exclusivo.

### <span style="color:#58D68D">Tabela: Product</span>
Mantém os detalhes dos produtos oferecidos pela loja, como nome, categoria, avaliação, tamanho e classificação para crianças.

### <span style="color:#58D68D">Tabela: Orders</span>
Registra os detalhes de cada pedido feito pelos clientes. Esta tabela está vinculada às tabelas de clientes e produtos por meio de chaves estrangeiras.

### <span style="color:#58D68D">Tabela: Seller</span>
Contém informações sobre os vendedores ou fornecedores que abastecem a loja. Inclui detalhes como nome social, CNPJ, CPF, localização e informações de contato.

### <span style="color:#58D68D">Tabela: Supplier</span>
Similar à tabela de vendedores, mantém detalhes sobre os fornecedores dos produtos.

### <span style="color:#58D68D">Tabela: Storages</span>
Registra os locais de armazenamento, incluindo detalhes como localização e área disponível.

### <span style="color:#58D68D">Tabela: ProductOrder</span>
Rastreia os produtos associados a cada pedido, juntamente com quantidades e status de estoque.

### <span style="color:#58D68D">Tabela: ProductSeller</span>
Mantém o relacionamento entre os produtos e os vendedores que os fornecem, além das quantidades em estoque.

### <span style="color:#58D68D">Tabela: ProductStorage</span>
Registra a quantidade de cada produto armazenado em locais específicos.

### <span style="color:#58D68D">Tabela: ProductSupply</span>
Controla os produtos fornecidos pelos fornecedores, juntamente com as quantidades.

### <span style="color:#58D68D">Tabela: Payment</span>
Armazena informações sobre os pagamentos feitos pelos clientes. Inclui detalhes como o tipo de pagamento, valor padrão e métodos de pagamento alternativos.

### <span style="color:#58D68D">Tabela: OrderTracking</span>
Conecta pedidos a produtos, registrando os produtos associados a cada pedido.

### <span style="color:#58D68D">Integridade dos Dados</span>

O banco de dados é construído com chaves estrangeiras que garantem a consistência e integridade dos dados entre as tabelas. Isso permite que o sistema rastreie pedidos, produtos, pagamentos e estoques de forma eficaz, fornecendo informações valiosas para a gestão do negócio. Com essa estrutura robusta, é possível realizar consultas complexas e gerar relatórios precisos para melhorar a tomada de decisões e o funcionamento geral da loja ou comércio.
