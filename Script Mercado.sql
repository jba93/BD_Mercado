create database mercado;

use mercado;

create table cliente(
cpf varchar(14) primary key, -- para aceitar 123.345.567-89
nome varchar (30) not null, 
data_nasc date not null,
sexo enum('F','M'),
telefone varchar(20) not null, -- para aceitar "+55 11 99123-4567"
rua varchar(50),
numero int,
complemento varchar(20), -- para aceitar "fundos" ou "Bloco A - Apto. 101"
cidade varchar(50),
estado char(2),
cep varchar(9), -- para aceitar "12.345-67"
email varchar(100)
)default charset = utf8;

create table produto(
cod_barras varchar(13) primary key,
nome varchar(30),
descricao varchar(100),
distribuidor varchar(50),
preco decimal(7, 2) 
)default charset = utf8;

create table venda(
id int auto_increment primary key,
data_venda date,
hora_venda time,
valor_total decimal(7, 2),
cpf_cliente varchar(14),
cod_produto varchar(13),
foreign key (cpf_cliente) references cliente(cpf),
foreign key (cod_produto) references produto(cod_barras)
)default charset = utf8;

alter table cliente 
add column bairro varchar(20) after complemento;

insert into cliente values 
('123.547.788-95', 'João da Silva', '1989-02-13', 'M', '+55 11 99123-4567', 'Rua das Gaivotas', '32', 'Fundos', 'Vila Nova', 'São Paulo', 'SP', '11200-520', 'jss@hotmail.com');
