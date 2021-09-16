-- Haetaan kaikien asiakaiden kaikki vuokraukset
-- Asiakkaita, joilla ei ole vuokrauksia ei n�ytet�
-- Tuotteita, joita ei ole vuokrattu ei n�ytet�
SELECT vuokraus.asiakasnumero, asiakas.yritys, tuote.nimike 
FROM vuokraus, asiakas, tuote 
WHERE vuokraus.asiakasnumero = asiakas.asiakasnumero AND vuokraus.yksilointikoodi = tuote.yksilointikoodi 