-- LISTA DE EXERCICIOS II

-- BANCO DE DADOS: HAMBURGUERIA


-- Primeiramente vamos criar as tabelas necessarios para
-- os exerc�cios

DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS forma_pgto;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS ref_forma_pgto;
DROP TABLE IF EXISTS ref_status;
DROP TABLE IF EXISTS cardapio;

CREATE TABLE cardapio(
	cardapio_id integer PRIMARY KEY,
	nome_item varchar(40),
	nome_secao varchar(40),
	preco NUMERIC(8,2));
	
CREATE TABLE ref_status(
	status_id integer PRIMARY KEY,
	descricao_status varchar(40));
	
CREATE TABLE ref_forma_pgto(
	pagamento_id integer PRIMARY KEY,
	tipo_pagamento varchar(40));

CREATE TABLE status(
	pedido_id integer PRIMARY KEY,
	status_id integer REFERENCES "ref_status" (status_id));

CREATE TABLE forma_pgto(
	pedido_id integer REFERENCES "status" (pedido_id),
	pagamento_id integer REFERENCES "ref_forma_pgto" (pagamento_id));

CREATE TABLE delivery(
	pedido_id integer REFERENCES "status" (pedido_id),
	item_id integer REFERENCES "cardapio" (cardapio_id),
	quantidade integer);

-- Agora preenchendo as tabelas:

INSERT INTO cardapio (cardapio_id, nome_item, nome_secao, preco)
	VALUES  (1,'Cheeseburguer','Lanches',27.90),
			(2,'Hamburguer','Lanches',22.90),
			(3,'X-Salada','Lanches',25.90),
			(4,'Veggieburguer','Lanches',30.90),
			(5,'X-Bacon','Lanches',32.90),
			(6,'Batata Frita','Acompanhamentos',9.90),
			(7,'Batata Turbinada','Acompanhamentos',15.90),
			(8,'Onion Rings','Acompanhamentos',12.90),
			(9,'Nuggets','Acompanhamentos',14.90),
			(10,'Maionese','Molhos',3.00),
			(11,'Ketchup','Molhos',2.50),
			(12,'Mostarda','Molhos',2.50),
			(13,'Refrigerante','Bebidas',6.50),
			(14,'Suco','Bebidas',4.50),
			(15,'Cerveja','Bebidas',11.90),
			(16,'Sorvete','Sobremesas',12.90),
			(17,'Brigadeiro','Sobremesas',10.90);
		

INSERT INTO ref_status(status_id, descricao_status)	
	VALUES  (1,'entregue'),
			(2,'em rota'),
			(3,'cancelado');
		

INSERT INTO ref_forma_pgto(pagamento_id, tipo_pagamento)	
	VALUES  (1,'dinheiro'),
			(2,'pix'),
			(3,'cart�o de d�bito'),
			(4,'cart�o de cr�dito');
		
		
INSERT INTO status(pedido_id, status_id)
	VALUES  (1,1),
			(2,2),
			(3,1),
			(4,1),
			(5,3),
			(6,1),
			(7,1),
			(8,1),
			(9,1),
			(10,1),
			(11,1),
			(12,1),
			(13,1),
			(14,1),
			(15,1),
			(16,1),
			(17,1),
			(18,1),
			(19,1),
			(20,1),
			(21,1),
			(22,1),
			(23,1),
			(24,1),
			(25,1),
			(26,1),
			(27,3),
			(28,1),
			(29,1),
			(30,1),
			(31,2),
			(32,1),
			(33,1),
			(34,1),
			(35,1),
			(36,1),
			(37,1),
			(38,1),
			(39,1),
			(40,1),
			(41,1),
			(42,1),
			(43,1),
			(44,1),
			(45,3),
			(46,1),
			(47,1),
			(48,1),
			(49,1),
			(50,1),
			(51,1),
			(52,1),
			(53,1),
			(54,2),
			(55,3),
			(56,1),
			(57,1),
			(58,1),
			(59,3),
			(60,1),
			(61,1),
			(62,1),
			(63,1),
			(64,1),
			(65,1),
			(66,1),
			(67,1),
			(68,1),
			(69,1),
			(70,3),
			(71,1),
			(72,1),
			(73,1),
			(74,2),
			(75,1),
			(76,1),
			(77,1),
			(78,1),
			(79,2),
			(80,2),
			(81,1),
			(82,3),
			(83,1),
			(84,1),
			(85,1),
			(86,2),
			(87,1),
			(88,1),
			(89,1),
			(90,2),
			(91,1),
			(92,1),
			(93,1),
			(94,1),
			(95,1),
			(96,1),
			(97,1),
			(98,2),
			(99,2),
			(100,3),
			(101,1),
			(102,1),
			(103,2),
			(104,2),
			(105,1),
			(106,1),
			(107,2),
			(108,2),
			(109,1),
			(110,2);


INSERT INTO forma_pgto(pedido_id, pagamento_id)
	VALUES  (1,3),
			(2,2),
			(3,1),
			(4,2),
			(5,2),
			(6,2),
			(7,4),
			(8,1),
			(9,1),
			(10,3),
			(11,2),
			(12,2),
			(13,2),
			(14,4),
			(15,2),
			(16,1),
			(17,4),
			(18,1),
			(19,3),
			(20,2),
			(21,2),
			(22,3),
			(23,4),
			(24,1),
			(25,4),
			(26,1),
			(27,4),
			(28,3),
			(29,4),
			(30,4),
			(31,4),
			(32,4),
			(33,1),
			(34,1),
			(35,3),
			(36,1),
			(37,1),
			(38,1),
			(39,1),
			(40,2),
			(41,1),
			(42,2),
			(43,3),
			(44,1),
			(45,2),
			(46,3),
			(47,4),
			(48,1),
			(49,3),
			(50,2),
			(51,1),
			(52,1),
			(53,4),
			(54,4),
			(55,1),
			(56,2),
			(57,3),
			(58,1),
			(59,2),
			(60,1),
			(61,2),
			(62,3),
			(63,1),
			(64,3),
			(65,2),
			(66,4),
			(67,2),
			(68,1),
			(69,3),
			(70,4),
			(71,2),
			(72,2),
			(73,3),
			(74,3),
			(75,4),
			(76,4),
			(77,2),
			(78,3),
			(79,4),
			(80,1),
			(81,1),
			(82,1),
			(83,1),
			(84,3),
			(85,3),
			(86,1),
			(87,1),
			(88,2),
			(89,2),
			(90,4),
			(91,3),
			(92,2),
			(93,4),
			(94,3),
			(95,1),
			(96,3),
			(97,2),
			(98,1),
			(99,3),
			(100,2),
			(101,1),
			(102,3),
			(103,3),
			(104,2),
			(105,2),
			(106,3),
			(107,1),
			(108,4),
			(109,3),
			(110,2);
		
	
INSERT INTO delivery (pedido_id, item_id, quantidade)
	VALUES  (1,1,3),
			(1,5,1),
			(1,4,2),
			(1,6,1),
			(1,13,3),
			(2,1,3),
			(2,3,2),
			(2,2,3),
			(2,7,2),
			(2,10,2),
			(2,15,3),
			(2,13,3),
			(3,3,3),
			(3,1,2),
			(3,14,2),
			(3,16,1),
			(4,2,1),
			(4,5,3),
			(4,1,2),
			(4,7,2),
			(4,9,1),
			(4,11,2),
			(4,13,2),
			(4,16,2),
			(5,4,1),
			(5,5,2),
			(5,6,2),
			(6,3,3),
			(6,4,2),
			(6,1,2),
			(6,7,2),
			(6,14,3),
			(6,17,2),
			(7,4,3),
			(7,5,3),
			(7,6,2),
			(7,12,2),
			(7,13,1),
			(8,4,2),
			(8,2,1),
			(8,1,2),
			(8,6,2),
			(8,8,1),
			(8,12,1),
			(8,14,1),
			(9,1,3),
			(9,7,1),
			(9,11,1),
			(9,15,2),
			(10,2,2),
			(10,4,3),
			(10,3,2),
			(10,6,1),
			(10,8,2),
			(10,11,3),
			(10,13,3),
			(10,16,3),
			(11,1,1),
			(11,9,2),
			(11,14,3),
			(12,1,1),
			(12,2,3),
			(12,7,1),
			(12,10,1),
			(12,13,1),
			(13,1,1),
			(13,4,1),
			(13,2,2),
			(13,6,1),
			(13,14,3),
			(13,16,3),
			(14,3,2),
			(14,4,3),
			(14,1,2),
			(14,6,2),
			(14,8,2),
			(14,13,3),
			(14,16,1),
			(15,3,2),
			(15,9,1),
			(15,13,2),
			(15,16,1),
			(16,3,2),
			(16,5,1),
			(16,2,1),
			(16,7,2),
			(16,8,3),
			(16,9,2),
			(16,15,2),
			(16,17,3),
			(17,4,1),
			(17,6,3),
			(17,13,2),
			(18,5,2),
			(18,2,2),
			(18,7,2),
			(18,12,1),
			(18,13,1),
			(18,16,3),
			(19,1,2),
			(19,8,1),
			(19,14,1),
			(20,2,3),
			(20,5,1),
			(20,9,3),
			(20,11,1),
			(20,15,1),
			(21,16,1),
			(21,2,1),
			(21,8,3),
			(21,14,1),
			(21,16,3),
			(22,4,3),
			(22,3,1),
			(22,6,2),
			(22,13,2),
			(23,3,3),
			(23,7,1),
			(23,13,3),
			(24,5,3),
			(24,9,2),
			(24,10,2),
			(24,15,1),
			(25,16,1),
			(25,5,2),
			(25,1,3),
			(25,7,2),
			(25,14,3),
			(25,16,1),
			(26,4,1),
			(26,2,1),
			(26,6,3),
			(26,7,1),
			(26,13,1),
			(26,16,1),
			(27,1,3),
			(27,5,1),
			(27,7,2),
			(27,14,1),
			(27,17,1),
			(28,4,2),
			(28,5,1),
			(28,6,2),
			(28,13,2),
			(29,5,2),
			(29,1,2),
			(29,8,1),
			(29,13,1),
			(29,16,2),
			(30,2,1),
			(30,3,1),
			(30,9,3),
			(30,10,1),
			(30,16,3),
			(31,5,1),
			(31,6,1),
			(31,12,2),
			(31,13,3),
			(32,5,3),
			(32,1,2),
			(32,14,3),
			(32,15,1),
			(33,2,1),
			(33,6,1),
			(33,14,1),
			(34,1,1),
			(34,7,2),
			(34,13,1),
			(34,17,2),
			(35,3,3),
			(35,2,2),
			(35,13,1),
			(35,4,3),
			(35,6,3),
			(35,16,2),
			(36,5,3),
			(36,2,2),
			(36,9,3),
			(36,10,2),
			(36,13,3),
			(36,16,3),
			(37,4,2),
			(37,5,1),
			(37,6,3),
			(37,14,2),
			(37,16,3),
			(38,1,2),
			(38,2,3),
			(38,8,2),
			(38,11,2),
			(38,14,3),
			(39,3,3),
			(39,8,3),
			(39,14,2),
			(40,1,3),
			(40,8,1),
			(40,13,3),
			(41,5,2),
			(41,3,3),
			(41,7,1),
			(41,12,2),
			(41,16,1),
			(42,4,3),
			(42,5,1),
			(42,6,1),
			(42,7,1),
			(42,14,1),
			(42,17,1),
			(43,3,1),
			(43,1,3),
			(43,8,1),
			(43,16,2),
			(44,5,1),
			(44,1,3),
			(44,9,3),
			(44,10,1),
			(44,13,1),
			(44,16,2),
			(45,5,2),
			(45,4,2),
			(45,1,1),
			(45,6,2),
			(45,7,2),
			(45,15,2),
			(45,16,2),
			(46,1,1),
			(46,8,1),
			(46,11,1),
			(46,13,3),
			(46,17,3),
			(47,2,1),
			(47,8,1),
			(47,9,2),
			(47,10,3),
			(47,13,2),
			(48,2,1),
			(48,3,2),
			(48,7,1),
			(48,12,2),
			(48,14,3),
			(49,2,3),
			(49,9,3),
			(49,13,2),
			(50,3,3),
			(50,2,2),
			(50,7,2),
			(50,11,3),
			(50,14,2),
			(51,4,3),
			(51,6,3),
			(51,10,1),
			(51,16,2),
			(52,4,1),
			(52,6,1),
			(52,12,2),
			(52,14,1),
			(53,4,3),
			(53,3,3),
			(53,6,1),
			(53,16,2),
			(54,3,2),
			(54,5,2),
			(54,7,2),
			(54,10,2),
			(54,13,1),
			(55,5,2),
			(55,6,2),
			(55,17,3),
			(56,2,1),
			(56,1,3),
			(56,8,1),
			(56,11,1),
			(56,13,2),
			(56,16,3),
			(57,1,3),
			(57,3,1),
			(57,4,1),
			(57,6,2),
			(57,9,3),
			(57,12,2),
			(57,14,1),
			(58,2,3),
			(58,4,1),
			(58,6,3),
			(58,7,1),
			(58,10,1),
			(58,15,1),
			(59,4,1),
			(59,6,3),
			(59,13,3),
			(60,2,1),
			(60,4,2),
			(60,6,3),
			(60,13,3),
			(60,16,2),
			(61,3,2),
			(61,2,3),
			(61,1,2),
			(61,8,2),
			(61,12,1),
			(61,13,1),
			(61,16,2),
			(62,5,2),
			(62,4,1),
			(62,6,1),
			(62,14,2),
			(62,17,2),
			(63,4,3),
			(63,6,1),
			(63,13,3),
			(63,17,3),
			(64,5,1),
			(64,1,3),
			(64,10,2),
			(64,13,3),
			(65,5,2),
			(65,8,2),
			(65,12,2),
			(65,13,1),
			(66,1,1),
			(66,7,1),
			(66,14,1),
			(67,1,1),
			(67,4,1),
			(67,6,2),
			(67,15,2),
			(68,4,1),
			(68,9,3),
			(68,11,1),
			(68,16,3),
			(69,4,3),
			(69,6,1),
			(69,13,2),
			(69,16,1),
			(70,1,1),
			(70,6,2),
			(70,13,3),
			(71,5,3),
			(71,3,2),
			(71,13,2),
			(71,16,3),
			(72,1,1),
			(72,2,1),
			(72,13,1),
			(72,17,1),
			(73,1,2),
			(73,2,2),
			(73,7,3),
			(73,8,3),
			(73,13,3),
			(73,16,3),
			(74,3,1),
			(74,2,1),
			(74,8,1),
			(74,11,1),
			(74,14,2),
			(75,3,1),
			(75,7,2),
			(75,11,1),
			(75,15,3),
			(76,4,3),
			(76,2,2),
			(76,6,2),
			(76,13,1),
			(77,2,1),
			(77,7,2),
			(77,13,1),
			(78,4,2),
			(78,1,3),
			(78,6,2),
			(78,10,3),
			(78,13,3),
			(78,16,2),
			(79,2,1),
			(79,6,1),
			(79,14,1),
			(79,17,2),
			(80,5,2),
			(80,7,2),
			(80,13,2),
			(81,3,1),
			(81,5,1),
			(81,6,3),
			(81,13,3),
			(82,5,2),
			(82,2,3),
			(82,7,2),
			(82,14,1),
			(83,5,3),
			(83,9,1),
			(83,13,2),
			(84,3,2),
			(84,5,2),
			(84,6,1),
			(84,13,3),
			(85,2,1),
			(85,4,3),
			(85,6,3),
			(85,13,1),
			(85,16,2),
			(86,2,2),
			(86,1,3),
			(86,10,3),
			(86,13,2),
			(87,4,2),
			(87,6,2),
			(87,13,2),
			(87,16,2),
			(88,1,3),
			(88,3,2),
			(88,4,2),
			(88,6,3),
			(88,13,2),
			(88,17,3),
			(89,2,2),
			(89,4,2),
			(89,3,3),
			(89,7,3),
			(89,6,3),
			(89,13,3),
			(89,16,2),
			(90,4,3),
			(90,5,3),
			(90,6,2),
			(90,13,1),
			(90,16,1),
			(91,3,3),
			(91,7,2),
			(91,13,3),
			(91,16,1),
			(92,3,2),
			(92,2,3),
			(92,6,2),
			(92,15,3),
			(92,17,2),
			(93,1,3),
			(93,8,1),
			(93,14,3),
			(93,16,1),
			(94,4,3),
			(94,2,2),
			(94,6,3),
			(94,10,2),
			(94,13,2),
			(95,1,3),
			(95,4,3),
			(95,6,2),
			(95,16,1),
			(96,4,3),
			(96,3,1),
			(96,1,3),
			(96,6,1),
			(96,9,2),
			(96,11,2),
			(96,13,1),
			(96,16,2),
			(97,1,1),
			(97,4,3),
			(97,6,2),
			(97,13,3),
			(97,16,2),
			(98,3,2),
			(98,6,3),
			(98,13,3),
			(98,17,2),
			(99,3,1),
			(99,2,3),
			(99,6,3),
			(99,15,2),
			(100,2,3),
			(100,5,1),
			(100,6,1),
			(100,8,1),
			(100,9,2),
			(100,12,1),
			(100,13,3),
			(100,16,3),
			(101,1,1),
			(101,6,2),
			(101,13,3),
			(102,1,3),
			(102,6,3),
			(102,13,3),
			(103,2,2),
			(103,6,1),
			(103,14,3),
			(103,16,2),
			(104,1,2),
			(104,2,2),
			(104,7,2),
			(104,13,1),
			(105,2,1),
			(105,6,2),
			(105,15,3),
			(105,17,2),
			(106,5,1),
			(106,3,1),
			(106,8,3),
			(106,9,1),
			(106,10,3),
			(106,13,1),
			(106,14,2),
			(107,2,3),
			(107,4,2),
			(107,6,1),
			(107,13,1),
			(108,4,2),
			(108,6,1),
			(108,14,3),
			(109,2,3),
			(109,5,3),
			(109,6,1),
			(109,11,2),
			(109,14,2),
			(110,1,1),
			(110,5,3),
			(110,9,1),
			(110,11,3),
			(110,13,1),
			(110,16,1);

		
		
-- EXERC�CIOS

-- 1) Monte uma tabela com todos os pedidos e o valor total de cada um deles?
-- Exemplos
-- 77 45,3
-- 25 107
SELECT
	*
FROM delivery	


SELECT
	---*
	COUNT(DISTINCT pedido_id)
FROM delivery


SELECT
	*
FROM cardapio


SELECT 
	item_id,
	SUM(total_venda) AS total_vendas
FROM sales 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
		

--- RESPOSTA *
SELECT
	pedido_id AS "Numero do Pedido",
	SUM(A.quantidade*C.preco) AS "Total da Venda em R$"
FROM delivery A
LEFT JOIN cardapio C ON A.item_id = C.cardapio_id
GROUP BY pedido_id
ORDER BY 2 DESC;


--- CHAT
SELECT s.pedido_id, SUM(c.preco * d.quantidade) AS valor_total
FROM status s
JOIN forma_pgto fp ON s.pedido_id = fp.pedido_id
JOIN delivery d ON s.pedido_id = d.pedido_id
JOIN cardapio c ON d.item_id = c.cardapio_id
GROUP BY s.pedido_id;


				
-- 2) Monte uma tabela com os tipo de forma de pagamento, quantidade de pedidos e valor total dos pedidos naquela forma?
-- Exemplos
-- pix 82 984,7
-- debito 66 854,7
SELECT * FROM delivery

SELECT COUNT(DISTINCT pedido_id) FROM delivery

SELECT * FROM cardapio

SELECT * FROM forma_pgto 

SELECT * FROM ref_forma_pgto -- possui os dados de forma de pgamento

SELECT * FROM status -- se o status_id e 1



SELECT 
  rf.tipo_pagamento,
  COUNT(DISTINCT CASE WHEN s.status_id = 1 THEN s.pedido_id ELSE 0 END) AS "Qtd CASE",
  SUM(DISTINCT CASE WHEN s.status_id = 1 THEN (c.preco * d.quantidade) ELSE 0 END) AS "Qtd CASE",
  COUNT(DISTINCT s.pedido_id) AS quantidade_pedidos,
  SUM(DISTINCT c.preco * d.quantidade) AS valor_total
FROM forma_pgto fp
JOIN ref_forma_pgto rf ON fp.pagamento_id = rf.pagamento_id
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN delivery d ON s.pedido_id = d.pedido_id
JOIN cardapio c ON d.item_id = c.cardapio_id
GROUP BY rf.tipo_pagamento
ORDER BY 1 DESC;


SELECT 
  R.tipo_pagamento,
  COUNT(DISTINCT D.pedido_id) AS quantidade_pedidos,
  SUM(DISTINCT C.preco * D.quantidade) AS valor_total
FROM delivery D
LEFT JOIN cardapio C ON D.pedido_id = C.cardapio_id 
LEFT JOIN forma_pgto F ON D.pedido_id = F.pedido_id 
LEFT JOIN ref_forma_pgto R ON F.pagamento_id = R.pagamento_id
LEFT JOIN status S ON F.pedido_id = S.pedido_id
GROUP BY R.tipo_pagamento
ORDER BY 1 DESC;

--- RESPOSTA 
SELECT 
  R.tipo_pagamento,
  COUNT(DISTINCT D.pedido_id) AS quantidade_pedidos,
  SUM(D.quantidade*C.preco) AS valor_total
FROM delivery D
LEFT JOIN cardapio C ON D.pedido_id = C.cardapio_id 
LEFT JOIN forma_pgto F ON D.pedido_id = F.pedido_id 
LEFT JOIN ref_forma_pgto R ON F.pagamento_id = R.pagamento_id
GROUP BY R.tipo_pagamento
ORDER BY 2 DESC;

---CHAT
SELECT 
  fp.pagamento_id,
  rf.tipo_pagamento,
  COUNT(DISTINCT s.pedido_id) AS quantidade_pedidos,
  SUM(c.preco * d.quantidade) AS valor_total
FROM forma_pgto fp
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN delivery d ON s.pedido_id = d.pedido_id
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN ref_forma_pgto rf ON fp.pagamento_id = rf.pagamento_id
GROUP BY fp.pagamento_id, rf.tipo_pagamento;
		
			
-- 3) Qual a forma de pagamento que teve mais pedidos cancelados?
-- Monte a tabela para todas as formas e rankeie
-- Exemplos
-- pix 153
-- dinheiro 148


SELECT 
  rf.tipo_pagamento,
  COUNT(CASE WHEN rs.status_id = 3 THEN s.pedido_id ELSE 0 END) AS quantidade_pedidos_cancelados,
  rs.descricao_status
FROM forma_pgto fp
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN ref_status rs ON s.status_id = rs.status_id
JOIN ref_forma_pgto rf ON fp.pagamento_id = rf.pagamento_id
--WHERE rs.status_id = 3  --'cancelado'
GROUP BY fp.pagamento_id, rf.tipo_pagamento, rs.descricao_status
ORDER BY quantidade_pedidos_cancelados DESC;



---RESPOSTA *
SELECT 
	R.tipo_pagamento, 
	count(F.pedido_id) AS total_cancelados 
FROM forma_pgto F
LEFT JOIN status S ON S.pedido_id = F.pedido_id 
LEFT JOIN ref_forma_pgto R ON R.pagamento_id = F.pagamento_id 
WHERE S.status_id = 3   ---cancelado
GROUP BY 1 ORDER BY 2 DESC;


---CHAT
SELECT 
  rf.tipo_pagamento,
  COUNT(DISTINCT s.pedido_id) AS quantidade_pedidos_cancelados
FROM forma_pgto fp
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN ref_status rs ON s.status_id = rs.status_id
JOIN ref_forma_pgto rf ON fp.pagamento_id = rf.pagamento_id
WHERE rs.descricao_status = 'cancelado'
GROUP BY fp.pagamento_id, rf.tipo_pagamento
ORDER BY quantidade_pedidos_cancelados DESC;


	
-- 4)  Monte uma tabela com os itens do cardapio e a quantidade itens vendidos
--(Utilize o nome do item!)
-- Exemplos
-- Refrigerante 128
-- Batata Frita 107

--- RESPOSTA *
SELECT 
  c.nome_item AS "Item",
  SUM(d.quantidade) AS "Quantidade vendida"
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
GROUP BY c.nome_item
ORDER BY 2 DESC;

---CHAT
SELECT 
  c.nome_item,
  SUM(d.quantidade) AS quantidade_vendida
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
GROUP BY c.nome_item;

	
		
-- 5) Monte uma tabela com o ranking das se��es do cardapio pelo total gasto nos pedidos
-- Exemplos
-- Lanches 11115,4
-- Acompanhamentos 2869

--- RESPOSTA *
SELECT 
  c.nome_secao AS "Se��o",
  SUM(d.quantidade * preco) AS "Total vendido em R$"
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
GROUP BY 1
ORDER BY 2 DESC;
			
---CHAT
SELECT 
  c.nome_secao,
  SUM(d.quantidade * c.preco) AS total_gasto
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN status s ON d.pedido_id = s.pedido_id
JOIN ref_status rs ON s.status_id = rs.status_id
---WHERE rs.descricao_status = 'concluido'
GROUP BY c.nome_secao
ORDER BY total_gasto DESC;

-- 6) Monte uma tabela com os valores totais por forma de pagamento para pedidos
-- em rota de entrega
-- Exemplos
-- pix 605,5
-- credito 604,1
		
---RESPOSTA *
SELECT 
  rfp.tipo_pagamento,
  SUM(c.preco * d.quantidade) AS total_valor
FROM forma_pgto fp
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN ref_forma_pgto rfp ON fp.pagamento_id = rfp.pagamento_id
JOIN delivery d ON s.pedido_id = d.pedido_id
JOIN cardapio c ON d.item_id = c.cardapio_id
WHERE s.status_id = 2
GROUP BY rfp.tipo_pagamento
ORDER BY 2 DESC;

---CHAT
SELECT 
  rfp.tipo_pagamento,
  SUM(c.preco * d.quantidade) AS total_valor
FROM forma_pgto fp
JOIN status s ON fp.pedido_id = s.pedido_id
JOIN ref_forma_pgto rfp ON fp.pagamento_id = rfp.pagamento_id
JOIN delivery d ON s.pedido_id = d.pedido_id
JOIN cardapio c ON d.item_id = c.cardapio_id
WHERE s.status_id = 2 -- em rota de entrega
GROUP BY rfp.tipo_pagamento;


-- 7) Monte uma tabela onde discrimine por pedido o quanto foi gasto
-- em cada se��o do cardapio (Crie colunas com o nome das se��es)
-- Exemplos
-- 1 Acompanhamentos 9,9
-- 1 Bebidas 19,5
-- 1 Lanches 178,4

---RESPOSTA *
SELECT 
  s.pedido_id AS "Pedido",
  SUM(CASE WHEN c.nome_secao = 'Acompanhamentos' THEN c.preco * d.quantidade ELSE 0 END) AS "Acompanhamentos",
  SUM(CASE WHEN c.nome_secao = 'Lanches' THEN c.preco * d.quantidade ELSE 0 END) AS "Lanches",
  SUM(CASE WHEN c.nome_secao = 'Sobremesas' THEN c.preco * d.quantidade ELSE 0 END) AS "Sobremesas",
  SUM(CASE WHEN c.nome_secao = 'Bebidas' THEN c.preco * d.quantidade ELSE 0 END) AS "Bebidas",
  SUM(CASE WHEN c.nome_secao = 'Molhos' THEN c.preco * d.quantidade ELSE 0 END) AS "Molhos"
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN status s ON d.pedido_id = s.pedido_id
GROUP BY s.pedido_id
ORDER BY 1;

---CHAT (ERRO)
SELECT 
  s.pedido_id,
  SUM(CASE WHEN c.nome_secao = 'Entradas' THEN c.preco * d.quantidade ELSE 0 END) AS valor_entradas,
  SUM(CASE WHEN c.nome_secao = 'Pratos Principais' THEN c.preco * d.quantidade ELSE 0 END) AS valor_pratos_principais,
  SUM(CASE WHEN c.nome_secao = 'Sobremesas' THEN c.preco * d.quantidade ELSE 0 END) AS valor_sobremesas,
  SUM(CASE WHEN c.nome_secao = 'Bebidas' THEN c.preco * d.quantidade ELSE 0 END) AS valor_bebidas
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN status s ON d.pedido_id = s.pedido_id
GROUP BY s.pedido_id;

			
-- 8) Quais os nomes dos itens mais vendidos no dinheiro por quantidade para pedidos entregues?
-- Exemplos
-- Batata Frita 35
-- Refrigerante 31

---RESPOSTA *
SELECT 
	c.nome_item AS "Item", 
	SUM(d.quantidade) AS "Quantidade total vendida"
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN status s ON d.pedido_id = s.pedido_id
JOIN forma_pgto fp ON s.pedido_id = fp.pedido_id
WHERE fp.pagamento_id = 1 AND S.status_id = 1 -- 1 representa a forma de pagamento "dinheiro"
GROUP BY c.nome_item
ORDER BY 2 DESC
LIMIT 10;
		

---CHAT
SELECT c.nome_item, SUM(d.quantidade) AS quantidade_total_vendida
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
JOIN status s ON d.pedido_id = s.pedido_id
JOIN forma_pgto fp ON s.pedido_id = fp.pedido_id
WHERE s.status_id = 3 AND fp.pagamento_id = 1 -- 3 representa o status de "entregue" e 1 representa a forma de pagamento "dinheiro"
GROUP BY c.nome_item
ORDER BY quantidade_total_vendida DESC
LIMIT 10;


-- 9) Monte uma tabela onde tem-se nas linhas as formas de pagamento e nas colunas os tipo de entregue
-- e sumarizando os valores pela quantidade de pedidos (DICA � uma PIVOT TABLE)
-- Exemplos
-- tipo_pgto entregue em_rota cancelado
-- pix 23 3 4
-- debito 23 3 0
		
---RESPOSTA *
SELECT
	D.tipo_pagamento AS "Tipo de Pagamento",
	SUM(CASE WHEN B.descricao_status  = 'entregue' THEN 1 ELSE 0 END) AS "Entregue",
	SUM(CASE WHEN B.descricao_status  = 'em rota' THEN 1 ELSE 0 END) AS "Em rota",
	SUM(CASE WHEN B.descricao_status  = 'cancelado' THEN 1 ELSE 0 END) AS "Cancelado"
FROM status A
LEFT JOIN ref_status B ON A.status_id = B.status_id 
LEFT JOIN forma_pgto C ON A.pedido_id = C.pedido_id 
LEFT JOIN ref_forma_pgto D ON C.pagamento_id = D.pagamento_id
GROUP BY 1
ORDER BY 1 DESC;


---CHAT
SELECT
  R.tipo_pagamento,
  SUM(CASE WHEN RF.status_id = 1 THEN 1 ELSE 0 END) AS entregue,
  SUM(CASE WHEN RF.status_id = 2 THEN 1 ELSE 0 END) AS em_rota,
  SUM(CASE WHEN RF.status_id = 3 THEN 1 ELSE 0 END) AS cancelado,
  SUM(CASE WHEN R.pagamento_id  = 1 THEN 1 ELSE 0 END) AS tipos,
  SUM(CASE WHEN R.tipo_pagamento  = 'pix' THEN 1 ELSE 0 END) AS tipos,
  SUM(CASE WHEN R.tipo_pagamento  = 'pix' THEN 1 ELSE 0 END) AS tipos,
  SUM(CASE WHEN R.tipo_pagamento  = 'pix' THEN 1 ELSE 0 END) AS tipos
FROM
  forma_pgto F
  INNER JOIN status S ON F.pedido_id = S.pedido_id
  INNER JOIN ref_forma_pgto R ON F.pagamento_id = R.pagamento_id
  INNER JOIN ref_status RF ON F.pedido_id = F.pedido_id
  INNER JOIN delivery D ON S.pedido_id = D.pedido_id
GROUP BY 1;


-- 10) Monte uma tabela onde tem-se nas linhas as se��es do card�pio e nas colunas as formas de pagamento
-- e sumarizando os valores totais gastos nos pedidos (DICA � uma PIVOT TABLE)
-- Exemplos
-- nome_secao dinheiro pix cartao_deb cartao_cred
-- Molhos 60 44 57,5 30,5
-- Bebidas 344,9 452,6 348,8 251,6

SELECT *
FROM status


SELECT
	CD.nome_secao AS "Se��o",
	SUM(CASE WHEN D.tipo_pagamento  = 'pix' THEN 1 ELSE 0 END) AS "Pix",
	SUM(CASE WHEN D.tipo_pagamento  = 'dinheiro' THEN 1 ELSE 0 END) AS "Dinheiro",
	SUM(CASE WHEN D.tipo_pagamento  = 'cart�o de d�bito' THEN 1 ELSE 0 END) AS "Cart�o de D�bito",
	SUM(CASE WHEN D.tipo_pagamento  = 'cart�o de cr�dito' THEN 1 ELSE 0 END) AS "Cart�o de Cr�dito"
FROM delivery A
LEFT JOIN status S ON A.pedido_id = S.pedido_id 
LEFT JOIN ref_status B ON S.status_id  = B.status_id 
LEFT JOIN forma_pgto C ON A.pedido_id = C.pedido_id 
LEFT JOIN ref_forma_pgto D ON C.pagamento_id = D.pagamento_id
LEFT JOIN cardapio CD ON A.item_id = CD.cardapio_id
GROUP BY 1
ORDER BY 1 DESC;	


---RESPOSTA *
SELECT
	CD.nome_secao AS "Se��o",
	SUM(CASE WHEN D.tipo_pagamento  = 'dinheiro' THEN CD.preco*A.quantidade  ELSE 0 END) AS "Dinheiro",
	SUM(CASE WHEN D.tipo_pagamento  = 'pix' THEN CD.preco*A.quantidade ELSE 0 END) AS "Pix",
	SUM(CASE WHEN D.tipo_pagamento  = 'cart�o de d�bito' THEN CD.preco*A.quantidade  ELSE 0 END) AS "Cart�o de D�bito",
	SUM(CASE WHEN D.tipo_pagamento  = 'cart�o de cr�dito' THEN CD.preco*A.quantidade  ELSE 0 END) AS "Cart�o de Cr�dito"
FROM delivery A
LEFT JOIN status S ON A.pedido_id = S.pedido_id 
LEFT JOIN ref_status B ON S.status_id  = B.status_id 
LEFT JOIN forma_pgto C ON A.pedido_id = C.pedido_id 
LEFT JOIN ref_forma_pgto D ON C.pagamento_id = D.pagamento_id
LEFT JOIN cardapio CD ON A.item_id = CD.cardapio_id
GROUP BY 1;

SELECT 
  c.nome_secao AS "Se��o",
  SUM(d.quantidade * preco) AS "Total vendido em R$",
  SUM(CASE WHEN G.tipo_pagamento  = 'pix' THEN 1 ELSE 0 END) AS "Entregue"
FROM delivery d
JOIN cardapio c ON d.item_id = c.cardapio_id
LEFT JOIN forma_pgto F ON d.pedido_id = F.pedido_id 
LEFT JOIN ref_forma_pgto G ON F.pagamento_id = G.pagamento_id
GROUP BY 1
ORDER BY 2 DESC;

		
		