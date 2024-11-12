-- Tabela EMPREGADO
INSERT INTO EMPREGADO (Nome, RG, CIC, Depto, RG_Supervisor, Salario) VALUES 
('João Luiz', '10101010', '111111111', 1, NULL, 3000.00),
('Fernando', '20202020', '222222222', 1, '10101010', 3200.00),
('Ricardo', '30303030', '333333333', 2, '10101010', 2300.00),
('Jorge', '40404040', '444444444', 2, '20202020', 2500.00),
('Renato', '50505050', '555555555', 3, '20202020', 2700.00);

-- Tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO (Nome, Numero, RG_Gerente) VALUES 
('Contabilidade', 1, '10101010'),
('Engenharia Civil', 2, '20202020'),
('Engenharia Mecânica', 3, '20202020');

-- Tabela PROJETO
INSERT INTO PROJETO (Nome, Numero, Localizacao) VALUES 
('Financeiro 1', 5, 'São Paulo'),
('Motor 3', 10, 'Rio Claro'),
('Prédio Central', 20, 'Campinas');

-- Tabela DEPENDENTES
INSERT INTO DEPENDENTES (RG_Responsavel, Nome_Dependentes, Nascimento, Relacao, Sexo) VALUES 
('10101010', 'Jorge', TO_DATE('27/12/86', 'DD/MM/YY'), 'Filho', 'Masculino'),
('10101010', 'Luiz', TO_DATE('18/11/79', 'DD/MM/YY'), 'Filho', 'Masculino'),
('20202020', 'Fernanda', TO_DATE('02/04/83', 'DD/MM/YY'), 'Conjuge', 'Feminino'),
('20202020', 'Angelo', TO_DATE('10/12/95', 'DD/MM/YY'), 'Filho', 'Masculino'),
('30303030', 'Andreia', TO_DATE('19/09/99', 'DD/MM/YY'), 'Filho', 'Feminino');

-- Tabela DEPARTAMENTO_PROJETO
INSERT INTO DEPARTAMENTO_PROJETO (Numero_Depto, Numero_Projeto) VALUES 
(1, 5),
(2, 10),
(3, 20);

-- Tabela EMPREGADO_PROJETO
INSERT INTO EMPREGADO_PROJETO (RG_Empregado, Numero_Projeto, Horas) VALUES 
('20202020', 5, 10),
('20202020', 10, 25),
('40404040', 10, 30),
('50505050', 20, 35);
