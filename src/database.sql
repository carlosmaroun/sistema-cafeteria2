-- Banco de dados para cafeteria
-- Versão 1.0 - 10/04/2025

-- Tabela de produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) CHECK (preco > 0),
    estoque INT DEFAULT 0,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de clientes (NOVA - melhoria)
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de pedidos (ATUALIZADA)
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL REFERENCES produtos(id),
    cliente_id INT REFERENCES clientes(id),
    quantidade INT NOT NULL CHECK (quantidade > 0),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT
);

-- Dados iniciais de produtos
INSERT INTO produtos (nome, preco, estoque) VALUES
('Café Expresso', 5.50, 100),
('Capuccino', 8.00, 80),
('Bolo de Chocolate', 7.50, 20);

-- Dados iniciais de clientes (NOVOS)
INSERT INTO clientes (nome, telefone, email) VALUES
('João Silva', '(11) 9999-8888', 'joao@email.com'),
('Maria Oliveira', '(21) 7777-6666', 'maria@email.com');

-- Dados iniciais de pedidos (ATUALIZADOS)
INSERT INTO pedidos (produto_id, cliente_id, quantidade) VALUES
(1, 1, 2),  -- João pediu 2 cafés
(2, 2, 1);   -- Maria pediu 1 cappuccino

-- Criação de índice para melhor performance
CREATE INDEX idx_pedidos_cliente ON pedidos(cliente_id);
