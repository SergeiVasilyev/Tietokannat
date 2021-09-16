SELECT asiakas.asiakasnumero, asiakas.yritys, yhteyshenkilo.etunimi, yhteyshenkilo.sukunimi, asiakas.laskutusosoite, asiakas.postinumero, asiakas.postitoimipaikka 
FROM asiakas 
LEFT OUTER JOIN yhteyshenkilo ON asiakas.asiakasnumero = yhteyshenkilo.asiakasnumero
ORDER BY postitoimipaikka 
