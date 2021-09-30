SELECT dbo.tuote.tuoteryhma, SUM (DATEDIFF(day, vuokraus.alkamispaiva, vuokraus.paattymispaiva) * tuote.paivavuokra) AS laskutus
FROM dbo.tuote INNER JOIN
        dbo.vuokraus ON dbo.tuote.yksilointikoodi = dbo.vuokraus.yksilointikoodi 
GROUP BY tuote.tuoteryhma, tuote.yksilointikoodi
