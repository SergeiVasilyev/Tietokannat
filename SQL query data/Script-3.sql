SELECT asiakas.asiakasnumero, asiakas.yritys, yhteyshenkilo.etunimi, yhteyshenkilo.sukunimi 
FROM asiakas, yhteyshenkilo
WHERE asiakas.asiakasnumero = yhteyshenkilo.asiakasnumero 