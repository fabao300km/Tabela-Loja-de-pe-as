
CREATE TABLE vendedor (
  codigo_vendedor NUMBER(5) PRIMARY KEY,
  nome_vendedor VARCHAR2(100),
  endereco VARCHAR2(100),
  percentual_comissao NUMBER(10)
);

CREATE TABLE cliente (
  codigo_cliente NUMBER(10) PRIMARY KEY,
  endereco_cliente VARCHAR2(100),
  faturamento_acumulado NUMBER(10),
  limite_credito NUMBER(10),
  nome_cliente VARCHAR2(100)
);

CREATE TABLE pedido (
  codigo_pedido NUMBER(10) PRIMARY KEY,
  data_pedido DATE
);

CREATE TABLE deposito (
  codigo_deposito NUMBER(4) PRIMARY KEY,
  endereco_deposito VARCHAR2(50)
);

CREATE TABLE peca (
  codigo_peca NUMBER(4) PRIMARY KEY,
  descricao_peca VARCHAR2(100),
  quantidade_estoque NUMBER(10),
  preco_unitario_peca NUMBER(10),
  codigo_deposito NUMBER(10)
);

CREATE TABLE atende (
  codigo_vendedor NUMBER(10),
  codigo_cliente VARCHAR(10),
  codigo_pedido VARCHAR(10),
  PRIMARY KEY(codigo_vendedor, codigo_cliente, codigo_pedido)
);

CREATE TABLE pedido_peca (
  quantidade_pecas_solicitadas NUMBER(10),
  preco_cotado_peca NUMBER(10),
  codigo_peca NUMBER(10),
  codigo_pedido NUMBER(10),
  FOREIGN KEY(codigo_peca) REFERENCES peca (codigo_peca),
  FOREIGN KEY(codigo_pedido) REFERENCES pedido (codigo_pedido)
);

ALTER TABLE peca
ADD FOREIGN KEY(codigo_deposito) REFERENCES deposito (codigo_deposito);
