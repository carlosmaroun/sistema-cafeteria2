-- Banco de dados para cafeteria
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) CHECK (preco > 0),
    estoque INT DEFAULT 0
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    produto_id INT REFERENCES produtos(id),
    quantidade INT NOT NULL,
    cliente VARCHAR(100)
);

-- Dados de exemplo
INSERT INTO produtos (nome, preco, estoque) VALUES
('Café Expresso', 5.50, 100),
('Capuccino', 8.00, 80);

INSERT INTO pedidos (produto_id, quantidade, cliente) VALUES
(1, 2, 'João Silva'),
(2, 1, 'Maria Oliveira');