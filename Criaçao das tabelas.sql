CREATE SCHEMA IF NOT EXISTS AgenciaDeteta;

USE AgenciaDeteta;

CREATE TABLE IF NOT EXISTS Escritório (
	idEscritorio INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    cod_postal INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    localidade VARCHAR(45) NOT NULL,
    porta INT NOT NULL,
    PRIMARY KEY (idEscritorio)
    );

#DESC Escritório;

CREATE TABLE IF NOT EXISTS Departamento (
	idDepartamento INT NOT NULL,
    tipo ENUM('Homicídios', 'Roubos', 'Sequestros') NOT NULL,
    escritorio INT NOT NULL,
    PRIMARY KEY (idDepartamento),
    FOREIGN KEY (escritorio) REFERENCES Escritório(idEscritorio)
    );

#DESC Departamento;

CREATE TABLE IF NOT EXISTS Detetive (
	idDetetive INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    dta_nascimento DATE NOT NULL,
    cod_postal INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    localidade VARCHAR(45) NOT NULL,
    porta INT NOT NULL,
    estado ENUM('No Ativo', 'Reformado') NOT NULL,
    departamento INT NOT NULL,
    PRIMARY KEY (idDetetive),
    FOREIGN KEY (departamento) REFERENCES Departamento(idDepartamento)
    );

#DESC Detetive;

CREATE TABLE IF NOT EXISTS Cliente (
	idCliente INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    cod_postal INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    localidade VARCHAR(45) NOT NULL,
    porta INT NOT NULL,
    PRIMARY KEY (idCliente)
    );

#DESC Cliente;

CREATE TABLE IF NOT EXISTS Caso (
	idCaso INT NOT NULL AUTO_INCREMENT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    cliente INT NOT NULL,
    PRIMARY KEY (idCaso),
    FOREIGN KEY (cliente) REFERENCES Cliente(idCliente)
    );

#DESC Caso;

CREATE TABLE IF NOT EXISTS Pagamento (
	idPagamento INT NOT NULL AUTO_INCREMENT,
    valor INT NOT NULL,
    estado ENUM('Pago', 'Não Pago') NOT NULL,
    data_pagamento DATE NOT NULL,
    metodo ENUM('Numerário', 'Cartão', 'MBWay', 'Transferência') NOT NULL,
    caso INT NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (caso) REFERENCES Caso(idCaso)
    );

#DESC Pagamento;

CREATE TABLE IF NOT EXISTS Caso_por_Detetive (
	detetive INT NOT NULL,
    caso INT NOT NULL,
    PRIMARY KEY (detetive, caso),
    FOREIGN KEY (detetive) REFERENCES Detetive(idDetetive),
    FOREIGN KEY (caso) REFERENCES Caso(idCaso)
    );
    
#DESC Caso_por_Detetive;
