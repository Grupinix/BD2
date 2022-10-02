/* QUESTÃO 1 */
CREATE VIEW qtd_trilhas_album AS (
    SELECT A.ALBUMID , A.TITLE, COUNT(*) AS TRILHAS
    FROM ALBUM A JOIN TRACK T ON T.ALBUMID = A.ALBUMID
    GROUP BY A.ALBUMID, A.TITLE
);

DROP VIEW qtd_trilhas_album;

SELECT * FROM qtd_trilhas_album;

UPDATE qtd_trilhas_album
    SET TITLE = 'Rodigas'
    WHERE TITLE LIKE 'For Those About To Rock We Salute You';
/* Resposta: dá erro, não da atualizar uma VIEW que utiliza 2 tabelas (ORACLE) */

/* QUESTÃO 2 */
CREATE SEQUENCE sequencia
INCREMENT BY -1
START WITH 10
MAXVALUE 15
MINVALUE 0;

CREATE USER mathias IDENTIFIED BY oracle_password;

SELECT ORACLE_USER.SEQUENCIA.nextval FROM dual;

GRANT SELECT ON ORACLE_USER.SEQUENCIA TO MATHIAS;

/* Resposta: No primeiro caso, deu falha por falta de privilêgios do segundo user, já no segundo caso, o user(MATHIAS) conseguiu usar o comandod */

/* QUESTÃO 3 */