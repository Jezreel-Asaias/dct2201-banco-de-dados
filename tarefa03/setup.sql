-- setup.sql: recria do zero o banco biblioteca (idempotente)
DROP DATABASE IF EXISTS biblioteca;
CREATE DATABASE biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE biblioteca;

CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  pais VARCHAR(50),
  ano_nascimento INT
);

CREATE TABLE livros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  ano_publicacao INT,
  preco DECIMAL(10,2),
  autor_id INT,
  FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE emprestimos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  livro_id INT,
  data_emprestimo DATE,
  devolvido BOOLEAN,
  FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- Usuários e privilégios
DROP USER IF EXISTS 'app_biblioteca'@'%';
DROP USER IF EXISTS 'consulta'@'%';
DROP USER IF EXISTS 'relatorios'@'%';

CREATE USER 'app_biblioteca'@'%' IDENTIFIED BY 'AppBib2026!';
GRANT SELECT, INSERT, UPDATE, DELETE ON biblioteca.* TO 'app_biblioteca'@'%';

CREATE USER 'consulta'@'%' IDENTIFIED BY 'Consulta2026!';
GRANT SELECT ON biblioteca.* TO 'consulta'@'%';

CREATE USER 'relatorios'@'%' IDENTIFIED BY 'Relatorios2026!';
GRANT SELECT ON biblioteca.livros TO 'relatorios'@'%';

FLUSH PRIVILEGES;

-- Carga inicial
INSERT INTO autores (nome, pais, ano_nascimento) VALUES
('Machado de Assis', 'Brasil', 1839),
('Clarice Lispector', 'Brasil', 1920),
('Gabriel García Márquez', 'Colômbia', 1927),
('Jane Austen', 'Inglaterra', 1775);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Dom Casmurro', 1899, 39.90, 1),
('Memórias Póstumas de Brás Cubas', 1881, 45.00, 1),
('A Hora da Estrela', 1977, 32.50, 2),
('Cem Anos de Solidão', 1967, 59.90, 3),
('Orgulho e Preconceito', 1813, 29.90, 4);

-- Carga expandida (povoamento)
INSERT INTO autores (id, nome, pais, ano_nascimento) VALUES
(5, 'Leo Tolstói', 'Rússia', 1828),
(6, 'Fiódor Dostoiévski', 'Rússia', 1821),
(7, 'Franz Kafka', 'República Tcheca', 1883),
(8, 'Virginia Woolf', 'Inglaterra', 1882),
(9, 'Jorge Luis Borges', 'Argentina', 1899),
(10, 'Haruki Murakami', 'Japão', 1949),
(11, 'Chimamanda Ngozi Adichie', 'Nigéria', 1977),
(12, 'Victor Hugo', 'França', 1802),
(13, 'Fernando Pessoa', 'Portugal', 1888),
(14, 'Cecília Meireles', 'Brasil', 1901);

INSERT INTO livros (titulo, ano_publicacao, preco, autor_id) VALUES
('Quincas Borba', 1891, 34.90, 1),
('Esaú e Jacó', 1904, 36.90, 1),
('Perto do Coração Selvagem', 1943, 39.90, 2),
('A Paixão Segundo G.H.', 1964, 42.90, 2),
('O Amor nos Tempos do Cólera', 1985, 54.90, 3),
('Crônica de uma Morte Anunciada', 1981, 36.90, 3),
('Emma', 1815, 32.90, 4),
('Razão e Sensibilidade', 1811, 34.90, 4),
('Guerra e Paz', 1869, 89.90, 5),
('Anna Kariênina', 1878, 69.90, 5),
('A Morte de Ivan Ilitch', 1886, 24.90, 5),
('Crime e Castigo', 1866, 59.90, 6),
('Os Irmãos Karamázov', 1880, 94.90, 6),
('Memórias do Subsolo', 1864, 29.90, 6),
('A Metamorfose', 1915, 22.90, 7),
('O Processo', 1925, 39.90, 7),
('O Castelo', 1926, 44.90, 7),
('Mrs. Dalloway', 1925, 38.90, 8),
('Ao Farol', 1927, 41.90, 8),
('Orlando', 1928, 42.90, 8),
('Ficções', 1944, 49.90, 9),
('O Aleph', 1949, 46.90, 9),
('Norwegian Wood', 1987, 54.90, 10),
('Kafka à Beira-Mar', 2002, 69.90, 10),
('1Q84', 2009, 99.90, 10),
('Meio Sol Amarelo', 2006, 59.90, 11),
('Americanah', 2013, 64.90, 11),
('Os Miseráveis', 1862, 109.90, 12),
('O Corcunda de Notre-Dame', 1831, 49.90, 12),
('Mensagem', 1934, 27.90, 13),
('Livro do Desassossego', 1982, 59.90, 13),
('Viagem', 1939, 34.90, 14),
('Romanceiro da Inconfidência', 1953, 39.90, 14);

-- Empréstimos
INSERT INTO emprestimos (livro_id, data_emprestimo, devolvido) VALUES
(1, '2026-10-01', FALSE),
(3, '2026-10-05', FALSE),
(4, '2026-09-20', TRUE);
