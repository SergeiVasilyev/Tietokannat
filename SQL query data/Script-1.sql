-- Kysely, jolla haetaan kaikki ne asiakkaat, joilla on vuokraus
-- liitenumero INNER JOIN korvaa WHERE-ehdon
-- Modernimpi ja tehokkaampi tapa hakujen suorittamiseen
SELECT vuokraus.asiakasnumero, asiakas.yritys
FROM vuokraus
INNER JOIN asiakas ON vuokraus.asiakasnumero = asiakas.asiakasnumero 