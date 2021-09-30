

-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT tuote.nimike, SUM (DATEDIFF (day, alkamispaiva, paattymispaiva) * tuote.paivavuokra)
AS laskutus
FROM tuote INNER JOIN vuokraus
ON tuote.yksilointikoodi = vuokraus.yksilointikoodi
GROUP BY nimike
