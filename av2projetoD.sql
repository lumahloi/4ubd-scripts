-- Criação das tabelas do sistema de gestão de condomínios

-- Tabela Condomínio
CREATE TABLE Condominio (
    idCondominio NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    endereco VARCHAR2(200),
    num VARCHAR2(10),
    cep VARCHAR2(10),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(50),
    proprietario VARCHAR2(100),
    cnpj VARCHAR2(20) UNIQUE
);

-- Tabela Morador
CREATE TABLE Morador (
    idMorador NUMBER PRIMARY KEY,
    bloco VARCHAR2(10),
    numApart VARCHAR2(10),
    valorAluguel NUMBER(10, 2),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Tabela Síndico
CREATE TABLE Sindico (
    idSindico NUMBER PRIMARY KEY,
    inicioMandato DATE NOT NULL,
    fimMandato DATE,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Tabela Condôminos 
CREATE TABLE Condominos (
    idCondomino NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(14) UNIQUE NOT NULL,
    email VARCHAR2(100),
    senha VARCHAR2(100),
    username VARCHAR2(50),
-- nao pode usar USER pq é uma palavra reservada
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Tabela Tarefas
CREATE TABLE Tarefas (
    idTarefa NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    status VARCHAR2(20) DEFAULT 'pendente',
    dataConclusao DATE,
    descricao VARCHAR2(500),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Tabela Portaria
CREATE TABLE Portaria (
    idPortaria NUMBER PRIMARY KEY,
    portaria VARCHAR2(100),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Tabela Mensagem
CREATE TABLE Mensagem (
    id NUMBER PRIMARY KEY,
    destinatario VARCHAR2(100),
    mensagem CLOB,
    Condominios_idCondominio NUMBER NOT NULL,
    Portaria_idPortaria NUMBER,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio),
    FOREIGN KEY (Portaria_idPortaria) REFERENCES Portaria (idPortaria)
);

-- Tabela Solicitações
CREATE TABLE Solicitacoes (
    idSolicitacao NUMBER PRIMARY KEY,
    solicitacao VARCHAR2(500),
    justificativa VARCHAR2(500),
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);
