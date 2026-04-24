create database video_locadora;
use video_locadora;

create table cliente (
id_cliente int auto_increment primary key,
nome varchar(100),
idade int,
telefone varchar(20)
);

create table filme(
id_filme int auto_increment primary key,
nome varchar(100),
tema varchar(100),
valor_fita decimal(10,2)
);



create table locacao(
id_cliente int,
id_filme int,
despesas decimal (10,2),
quantidade_dias int,
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_filme) REFERENCES filme(id_filme)
);

insert into cliente (nome, idade, telefone)
values 
('Ana Souza', 28, 11987654321),('Bruno Lima', 34, 11912345678),('Carla Mendes', 22, 11923456789),('Diego Oliveira', 45, 11934567890),('Elisa Ferreira', 31, 11945678901),
('Felipe Costa', 29, 11956789012),('Gabriela Rocha', 27, 11967890123),('Hugo Martins', 38, 11978901234),('Isabela Pereira', 26, '11989012345'),('João Santos', 41, '11990123456'),
('Karen Alves', 33, '11901234567'),('Lucas Barbosa', 24, '11912345098'),('Mariana Carvalho', 36, '11923450987'),('Nicolas Ribeiro', 30, '11934509876'),('Olivia Fernandes', 25, '11945698765'),
('Pedro Gomes', 40, '11956787654'),('Quésia Lima', 29, '11967876543'),('Rafael Araújo', 32, '11978965432'),('Sofia Nunes', 23, '11989054321'),('Thiago Rocha', 37, '11990143210'),
('Úrsula Pinto', 28, '11901239876'),('Vitor Mendes', 35, '11912349876'),('Wanessa Cardoso', 31, '11923459876'),('Xavier Silva', 39, '11934569876'),('Yasmin Castro', 27, '11945679876'),
('Zeca Moreira', 42, '11956789876'),('Alice Torres', 24, '11967899876'),('Brenda Lopes', 33, '11978919876'),('Caio Freitas', 30, '11989029876'),('Diana Teixeira', 26, '11990139876');

 insert into filme (nome, tema, valor_fita)
 values ('O Mistério da Lua', 'Suspense', 12.50),('Amor em Paris', 'Romance', 15.00),('Guerra de Titãs', 'Ação', 18.00),('Aventura na Selva', 'Aventura', 14.75),('Risos e Confusões', 'Comédia', 10.00),
('Noite Sombria', 'Terror', 16.50),('Viagem Espacial', 'Ficção Científica', 20.00),('Segredos do Passado', 'Drama', 13.25),('O Grande Circo', 'Família', 11.00),('Heróis Anônimos', 'Ação', 17.00),
('Corações Cruzados', 'Romance', 14.00),('O Último Samurai', 'Histórico', 19.50),('Mistério no Museu', 'Suspense', 12.75),('Rota das Estrelas', 'Ficção Científica', 18.25),('O Sorriso da Fortuna', 'Comédia', 11.50),
('Sombras da Cidade', 'Terror', 16.00),('Desafio Radical', 'Aventura', 15.25),('Lendas da Montanha', 'Aventura', 13.50),('Amigos para Sempre', 'Família', 12.00),('Caminho do Guerreiro', 'Histórico', 20.00),
('Segredos da Floresta', 'Suspense', 14.75),('Paixão Proibida', 'Romance', 13.25),('Operação Resgate', 'Ação', 17.50),('Rindo até o Fim', 'Comédia', 10.50),('Noite de Terror', 'Terror', 15.75),
('Exploradores do Universo', 'Ficção Científica', 19.00),('Drama na Cidade', 'Drama', 12.50),('O Circo Mágico', 'Família', 11.75),('Histórias do Passado', 'Histórico', 18.50),('Aventura no Mar', 'Aventura', 14.00),
('Amor e Destino', 'Romance', 13.75);

insert into locacao (id_cliente, id_filme, despezas, quantidade_dias)
values (1, 5, 25.00, 3),(2, 12, 30.00, 5),(3, 8, 18.50, 2),(4, 20, 40.00, 7),(5, 2, 15.75, 1),
(6, 17, 35.00, 4),(7, 11, 28.25, 3),(8, 3, 20.00, 2),(9, 14, 32.50, 5),(10, 7, 22.75, 3),
(11, 1, 12.50, 1),(12, 19, 37.00, 6),(13, 9, 24.00, 2),(14, 12, 25.75, 1),(14, 25, 45.00, 7);

select cliente.id_cliente,
filme.id_filme,
filme.nome,
filme.valor_fita,
locacao.despezas,
locacao.quantidade_dias
from locacao
inner join cliente
on locacao.id_cliente = cliente.id_cliente
inner join filme
on locacao.id_filme = filme.id_filme