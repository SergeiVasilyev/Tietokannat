SELECT        dbo.tuote.nimike, dbo.tuote.tuoteryhma, SUM(DATEDIFF(day, dbo.vuokraus.alkamispaiva, dbo.vuokraus.paattymispaiva) * dbo.tuote.paivavuokra) AS luskutus
FROM            dbo.tuote INNER JOIN
                         dbo.vuokraus ON dbo.tuote.yksilointikoodi = dbo.vuokraus.yksilointikoodi
GROUP BY dbo.tuote.nimike, dbo.tuote.tuoteryhma