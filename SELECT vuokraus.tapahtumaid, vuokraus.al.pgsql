SELECT vuokraus.tapahtumaid, vuokraus.alkamispaiva,
tuote.nimike, tuote.malli, tuote.merkki
FROM vuokraus
INNER JOIN tuote
ON vuokraus.yksilointikoodi = tuote.yksilointikoodi
WHERE vuokraus.paattymispaiva ISNULL