DELIMITER $$
CREATE PROCEDURE query1 (IN Id INT)
	BEGIN
		SELECT Detetive.idDetetive , Detetive.nome
        FROM Detetive AS D INNER JOIN Departamento AS De ON D.departamento = De.idDepartamento
						   INNER JOIN Escritório As E ON De.escritorio = E.idEscritorio
		WHERE E.idEscritorio = Id;
	END 
$$
DELIMITER ;





DELIMITER $$
CREATE PROCEDURE query2 (IN nif INT)
	BEGIN
		SELECT C.idCaso
        FROM Casos AS C INNER JOIN Cliente AS Cl ON C.Cliente=Ca.idCliente
		WHERE Cl.idCliente=nif;
	END 
$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION query3(idEsc INT, mes INT)
		RETURNS FLOAT DETERMINISTIC
	BEGIN
		RETURN(SELECT sum(P.valor)
        FROM Pagamento AS P INNER JOIN Caso AS C ON P.caso=C.idCaso
							INNER JOIN Caso_por_Detetive AS CD ON c.idCaso=CD.caso
                            INNER JOIN Detetive AS D ON CD.detetive=D.idDetetive
                            INNER JOIN Departamento AS De ON D.departamento=DE.idDepartamento
                            INNER JOIN Escritório AS E ON De.escritorio=E.idEscritorio
		WHERE idEsc=E.idEscritorio AND mes=MONTH(P.data_pagamento));
	END 
$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE query4() 
	BEGIN
		SELECT C.idCaso
        FROM Caso AS C 
		WHERE C.data_fim IS NULL;
	END 
$$
DELIMITER ;

call query4;

DELIMITER $$
CREATE FUNCTION funcao1(NIF INT)
		RETURNS FLOAT DETERMINISTIC
	BEGIN
		RETURN(SELECT sum(P.valor)
        FROM Pagamento AS P INNER JOIN Caso AS C ON P.caso=C.idCaso
							INNER JOIN Cliente AS Cl ON c.cliente=Cl.idCliente
		WHERE Cl.idCliente=NIF);
	END $$
DELIMITER ;

    
    
DELIMITER $$
CREATE PROCEDURE procedure1(ano INT, dep INT) 
	BEGIN
		SELECT C.idCaso,Cl.nome
        FROM Caso AS C INNER JOIN Cliente AS Cl ON C.cliente=Cl.idCliente
					   INNER JOIN Caso_por_Detetive AS CD ON C.idCaso=CD.caso
					   INNER JOIN Detetive AS D ON CD.detetive=D.idDetetive
					   INNER JOIN Departamento AS De ON D.departamento=DE.idDepartamento
		WHERE DE.idDepartamento = 1 AND YEAR(C.data_inicio)=2004;
	END 
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trigger1
AFTER UPDATE ON Caso
FOR EACH ROW
BEGIN
    IF OLD.data_fim IS NULL AND NEW.data_fim IS NOT NULL THEN
        INSERT INTO Pagamento (valor, estado, data_pagamento, metodo, caso)
        SELECT valor, 'Pago', NEW.data_fim, metodo, caso
        FROM Pagamento
        WHERE caso = NEW.idCaso
        ORDER BY idPagamento
        LIMIT 1;
    END IF;
END $$
DELIMITER ;


INSERT INTO Caso (data_inicio, data_fim, cliente) VALUES ('2024-06-18', NULL, 123456789);

INSERT INTO Pagamento (valor, estado, data_pagamento, metodo, caso) VALUES (1500.00, 1, '2024-06-18', 'Numerário', 120);



UPDATE Caso
SET data_fim = '2025-12-10'
WHERE idCaso = 115;

select*
from Pagamento INNER JOIN Caso ON Pagamento.caso=Caso.idCaso
WHERE Caso.idCaso=115;

select* FROM Caso


