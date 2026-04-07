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
on reserva.id_hospede=hospede.id_hospede;

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