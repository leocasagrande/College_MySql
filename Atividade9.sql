CREATE TABLE EX_CLIENTE(
  codcliente int,
  nome varchar(60),
  datanascimento date,
  cpf varchar(11),
  CONSTRAINT pk_ex_cliente PRIMARY KEY (codcliente)
);

CREATE TABLE EX_PEDIDO(
  codpedido int,
  codcliente int not null,
  datapedido date,
  nf varchar(12),
  valortotal decimal(10,2),
  CONSTRAINT pk_ex_pedido PRIMARY KEY (codpedido),
  CONSTRAINT pk_ex_pedido_cliente FOREIGN KEY (codcliente) REFERENCES
  EX_CLIENTE(codcliente) 
);

CREATE TABLE EX_PRODUTO(
  codproduto int,
  descricao varchar(100),
  CONSTRAINT pk_ex_produto PRIMARY KEY (codproduto)
);

CREATE TABLE EX_ITEMPEDIDO(
  codpedido int,
  numeroitem int,
  valorunitario decimal(10,2),
  quantidade int,
  codproduto int,
  CONSTRAINT pk_itempedido PRIMARY KEY (codpedido, numeroitem),
  CONSTRAINT fk_codpedido FOREIGN KEY (codpedido) REFERENCES EX_PEDIDO (codpedido),
  CONSTRAINT fk_itempedido_produto FOREIGN KEY (codproduto) REFERENCES EX_PRODUTO
  (codproduto) 
);

INSERT INTO EX_CLIENTE VALUES (1, 'Sylvio Barbon', '1984-05-12', '12315541212');
INSERT INTO EX_CLIENTE VALUES (2, 'Antonio Carlos da Silva', '1979-11-01', '12313345512');
INSERT INTO EX_CLIENTE VALUES (3, 'Thiago Ribeiro', '1964-11-15', '12315544411');
INSERT INTO EX_CLIENTE VALUES (4, 'Carlos Eduardo', '1924-10-25', '42515541212');
INSERT INTO EX_CLIENTE VALUES (5, 'Maria Cristina Goes', '1981-11-03', '67715541212');
INSERT INTO EX_CLIENTE VALUES (6, 'Ruan Manoel Fanjo', '1983-12-06', '32415541212');
INSERT INTO EX_CLIENTE VALUES (7, 'Patrícia Marques', '1944-02-01', '77715541212');

INSERT INTO EX_PRODUTO VALUES (1, 'Mouse');
INSERT INTO EX_PRODUTO VALUES (2, 'Teclado');
INSERT INTO EX_PRODUTO VALUES (3, 'Monitor LCD');
INSERT INTO EX_PRODUTO VALUES (4, 'Caixas Acústicas');
INSERT INTO EX_PRODUTO VALUES (5, 'Scanner de Mesa');

INSERT INTO EX_PEDIDO VALUES (1, 1, '2012-04-01', '00001',400.00); 
INSERT INTO EX_PEDIDO VALUES (2, 2, '2012-04-01', '00002',10.90);
INSERT INTO EX_PEDIDO VALUES (3, 2, '2012-04-01', '00003',21.80); 
INSERT INTO EX_PEDIDO VALUES (4, 3, '2012-05-01', '00004',169.10); 
INSERT INTO EX_PEDIDO VALUES (5, 4, '2012-05-01', '00005',100.90); 

INSERT INTO EX_ITEMPEDIDO VALUES (1, 1, 10.90, 1, 1);
INSERT INTO EX_ITEMPEDIDO VALUES (1, 2, 389.10, 1, 3);
INSERT INTO EX_ITEMPEDIDO VALUES (2, 1, 10.90, 1, 1);
INSERT INTO EX_ITEMPEDIDO VALUES (3, 1, 10.90, 1, 1);
INSERT INTO EX_ITEMPEDIDO VALUES (4, 1, 10.90, 1, 1);
INSERT INTO EX_ITEMPEDIDO VALUES (4, 2, 15.90, 2, 2);
INSERT INTO EX_ITEMPEDIDO VALUES (4, 3, 25.50, 1, 4);
INSERT INTO EX_ITEMPEDIDO VALUES (4, 4, 100.90, 1, 5);
INSERT INTO EX_ITEMPEDIDO VALUES (5, 1, 100.90, 1, 5);

/*
CREATE VIEW ULTIMO_PEDIDO_VIEW AS 
SELECT EX_CLIENTE.nome, MAX(EX_PEDIDO.datapedido) 
FROM EX_CLIENTE
INNER JOIN EX_PEDIDO 
ON EX_CLIENTE.codcliente = EX_PEDIDO.codcliente;

SELECT * FROM ULTIMO_PEDIDO_VIEW;
*/

/*
CREATE VIEW LISTA_NOTA_VIEW AS
SELECT EX_PEDIDO.nf, MAX(EX_PEDIDO.datapedido) 
FROM EX_PEDIDO
WHERE EX_PEDIDO.datapedido;

SELECT * FROM LISTA_NOTA_VIEW;
*/