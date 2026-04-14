create database hotel;
use hotel;
drop table quartos;
create table quartos (
id_quarto int auto_increment primary key not null,
tipo varchar(200) not null,
valor_diaria decimal(10,2)
);

create table hospede (
id_hospede int auto_increment primary key,
nome varchar(100)
);

create table reserva (
id_reserva int auto_increment primary key,
id_hospede int, 
id_quarto int,
valor_diaria decimal(10,2),
dias int,
despesas DECIMAL(10,2),

FOREIGN KEY (id_hospede) REFERENCES hospede(id_hospede),
FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

-- Quartos
INSERT INTO quartos (tipo, valor_diaria)
VALUES
('Simples', 100.00),
('Duplo', 180.00);
-- Hóspedes
INSERT INTO hospede (nome)
VALUES
('João Silva'),
('Maria Souza');
-- Reservas
INSERT INTO reserva (id_hospede, id_quarto, valor_diaria, dias, despesas)
VALUES
(1, 1, 100.00, 3, 300.00),
(2, 2, 180.00, 2, 360.00);

SELECT * FROM quartos;
SELECT * FROM hospede;
SELECT * FROM reserva;

select 
hospede.nome,
quartos.tipo,
reserva.dias,
reserva.valor_diaria,
reserva.despesas
FROM reserva
inner join hospede
on reserva.id_hospede=hospede.id_hospede 
inner join quartos
on reserva.id_quarto=quartos.id_quarto;

select
hospede.nome,
quartos.tipo,
reserva.dias,
reserva.valor_diaria,
(reserva.dias * quartos.valor_diaria) AS total
FROM reserva
inner join hospede
on reserva.id_hospede=hospede.id_hospede
inner join quartos
on reserva.id_quarto=quartos.id_quarto;


-- acabei caralhoooooo

insert into quartos (tipo, valor_diaria)
values ('SimplesKS', 120.00), ('DuploKS', 220.00);

insert into hospede (nome)
values ('Carlos Pereira'), ('Ana Oliveira'), ('Bruno costa'), ('Fernanda Lima'), ('Ricardo Alvez'), ('Juliana Mendes');

insert into reserva (id_hospede, id_quarto, valor_diaria, dias, despesas)
values
(1, 2, 140.00, 1, 325.00),
(3, 6, 2200.00, 1, 500.00),
(4, 5, 200.00, 1, 328.00),
(6, 8, 260.00, 1, 60.00),
(2, 7, 240.00, 1, 4000.00),
(4, 3, 160.00, 1, 560.00);

SELECT * FROM quartos;
SELECT * FROM hospede;
select * from reserva;

-- Esse codigo vai mostrar na tabela reserva a soma(SUM) total  das despesas e vai nomerar(AS) como total_faturado
select sum(despesas) AS total_faturado
from reserva;

-- Esse codigo vai mostrar na tabela reserva a soma total das reservas, e vai nomerar como total_reservas
-- Count = QUANTIDADE
select count(*) AS total_reserva
from resrva;

-- Exemplo com JOIN = GROUP BY -Total gasto pro hospede

select 
hospede.nome,
sum(reserva.despesas) AS total_gasto
from reserva
INNER JOIN hospede
on reserva.id_hospede = hospede.id_hospede
group by hospede.nome;

-- Quantas reservas por tipo de quarto
SELECT
quartos.tipo,
COUNT(reserva.id_reserva) AS quantidade
FROM reserva
INNER JOIN quartos
ON reserva.id_quarto = quartos.id_quarto
GROUP BY quartos.tipo;

SELECT * FROM quartos
ORDER BY nome ASC;
SELECT * FROM hospede;
select * from reserva;
SELECT * FROM quartos
ORDER BY nome ASC;
SELECT * FROM hospede;
select * from reserva;
