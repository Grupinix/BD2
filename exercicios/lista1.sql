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
GRANT CONNECT, RESOURCE, CREATE SESSION TO mathias;

SELECT ORACLE_USER.SEQUENCIA.nextval FROM dual;

GRANT SELECT ON ORACLE_USER.SEQUENCIA TO MATHIAS;
/* Resposta: No primeiro caso, deu falha por falta de privilêgios do segundo user, já no segundo caso, o user(MATHIAS)
   conseguiu usar o comandod */

/* QUESTÃO 3 */
SELECT ORACLE_USER.SEQUENCIA.currval FROM dual;
/* Resposta: Para o user inicial deu X e para o user(MATHIAS) deu X-1. Criando uma nova conexão com o mesmo user, ainda
   assim o comportamento se repete */

/* QUESTÃO 4 */
CREATE VIEW mathias_track AS
SELECT TRACKID, NAME, ALBUMID, MEDIATYPEID, GENREID, COMPOSER, MILLISECONDS, BYTES
FROM TRACK;

GRANT SELECT ON ORACLE_USER.mathias_track TO Mathias;

SELECT * FROM mathias_track;

SELECT * FROM ORACLE_USER.TRACK; /* user(MATHIAS) não tem acesso a essa tabela */

SELECT UNITPRICE FROM mathias_track; /* a coluna não existe nessa view */
/* Resposta: Dada a permissão para o user(MATHIAS) de ver a view mathias_track, esse user, não teve acesso a ver coluna
   UNITPRICE */

/* QUESTÃO 5 */
CREATE VIEW album_track AS
SELECT A.ALBUMID, A.TITLE, A.ARTISTID, T.TRACKID, T.UNITPRICE
FROM TRACK T JOIN ALBUM A ON A.ALBUMID = T.ALBUMID;

SELECT * FROM ORACLE_USER.album_track;

UPDATE album_track SET TITLE = 'Rock Brabo' WHERE ALBUMID = 29;

UPDATE album_track SET UNITPRICE = 0.99 WHERE ALBUMID = 29;

/* Resposta: Algum tipo de erro na atualização do título, qunado utilizado o "WHERE ALBUMID = 29", já na atualização do
   UNITPRICE, não deu erro */

/* QUESTÃO 6 */

/* Resposta: */

