

CREATE VIEW dbo.KeskivuokraAikaTuoteryhmittäin
AS
   SELECT dbo.tuote.tuoteryhma, AVG(DATEDIFF(day, dbo.vuokraus.alkamispaiva, dbo.vuokraus.paattymispaiva) * dbo.tuote.paivavuokra) AS AikaKedkimäärin
   FROM dbo.tuote INNER JOIN
      dbo.vuokraus ON dbo.tuote.yksilointikoodi = dbo.vuokraus.yksilointikoodi
   GROUP BY dbo.tuote.tuoteryhma
GO

