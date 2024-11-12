-- Tabela EMPREGADO
CREATE TABLE EMPREGADO (
    Nome VARCHAR2(100),
    RG VARCHAR2(15) PRIMARY KEY,
    CIC VARCHAR2(15),
    Depto NUMBER(5),
    RG_Supervisor VARCHAR2(15),    
    Salario NUMBER(10, 2),
    FOREIGN KEY (RG_Supervisor) REFERENCES EMPREGADO(RG), 
    FOREIGN KEY (Depto) REFERENCES DEPARTAMENTO(Numero)
);

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Nome VARCHAR2(100),
    Numero NUMBER(5) PRIMARY KEY,   
    RG_Gerente VARCHAR2(15),      
    FOREIGN KEY (RG_Gerente) REFERENCES EMPREGADO(RG)
);

-- Tabela PROJETO
CREATE TABLE PROJETO (
    Nome VARCHAR2(100),
    Numero NUMBER(5) PRIMARY KEY,  
    Localizacao VARCHAR2(255)
);

-- Tabela DEPENDENTES
CREATE TABLE DEPENDENTES (
    RG_Responsavel VARCHAR2(15),    -
    Nome_Dependente VARCHAR2(100),
    Nascimento DATE,
    Relacao VARCHAR2(50),
    Sexo CHAR(1),
    PRIMARY KEY (RG_Responsavel, Nome_Dependente), 
    FOREIGN KEY (RG_Responsavel) REFERENCES EMPREGADO(RG)
);

-- Tabela DEPARTAMENTO_PROJETO
CREATE TABLE DEPARTAMENTO_PROJETO (
    Numero_Departamento NUMBER(5),  
    Numero_Projeto NUMBER(5),       
    PRIMARY KEY (Numero_Departamento, Numero_Projeto), 
    FOREIGN KEY (Numero_Departamento) REFERENCES DEPARTAMENTO(Numero), 
    FOREIGN KEY (Numero_Projeto) REFERENCES PROJETO(Numero) 
);

-- Tabela EMPREGADO_PROJETO
CREATE TABLE EMPREGADO_PROJETO (
    RG_Empregado VARCHAR2(15),       
    Numero_Projeto NUMBER(5),       
    Horas NUMBER(5, 2),            
    PRIMARY KEY (RG_Empregado, Numero_Projeto),
    FOREIGN KEY (RG_Empregado) REFERENCES EMPREGADO(RG),
    FOREIGN KEY (Numero_Projeto) REFERENCES PROJETO(Numero)
);
