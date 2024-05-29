-- VIEWS



CREATE VIEW Casos_e_Detetives AS
	SELECT C.idCaso, C.data_inicio, C.data_fim, CL.nome AS Cliente, D.nome AS Detetive, D.departamento
	FROM Caso C
	INNER JOIN Cliente CL ON C.cliente = CL.idCliente
	INNER JOIN Caso_por_Detetive CD ON C.idCaso = CD.caso
	INNER JOIN Detetive D ON CD.detetive = D.idDetetive;
    
    
    
CREATE VIEW vw_Pagamentos_Casos AS
	SELECT C.idCaso,CL.nome AS Cliente,P.valor,P.estado,P.data_pagamento,P.metodo
	FROM Pagamento P
	JOIN Caso C ON P.caso = C.idCaso
	JOIN Cliente CL ON C.cliente = CL.idCliente;
    
    
    
CREATE VIEW vw_Clientes_Casos AS
	SELECT CL.idCliente,CL.nome,CL.telefone,CL.localidade,C.idCaso,C.data_inicio,C.data_fim
	FROM Cliente CL
	INNER JOIN Caso C ON CL.idCliente = C.cliente;
    
    
    
CREATE VIEW vw_Detetives_Departamentos AS
	SELECT D.idDetetive,D.nome AS Detetive,DP.idDepartamento AS Departamento,D.telefone,D.localidade
	FROM Detetive AS D
	INNER JOIN Departamento AS DP ON D.departamento = DP.idDepartamento;
    
    
    
    

    
 select*
 from Pagamento