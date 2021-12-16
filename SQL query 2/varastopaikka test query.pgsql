SELECT tuote.tuoteryhma, tuote.yksilointikoodi, tuote.nimike, tuote.merkki,
        tuote.malli, varastotapahtuma.id, varastotapahtuma.maara,
        varastotapahtuma.yksikko, 
        varastotapahtuma.lahdevarastoid,
        varastotapahtuma.kohdevarastoid,
        varastopaikka.varastopaikan_nimi AS lähtövarasto,
        varastopaikka.varastopaikan_nimi AS tulovarasto,
        varastotapahtuma.paivamaara,
        varastotapahtuma.asiakasnumero
FROM tuote INNER JOIN varastotapahtuma
ON tuote.yksilointikoodi = varastotapahtuma.yksilointikoodi
INNER JOIN varastopaikka
ON varastotapahtuma.lahdevarastoid = varastopaikka.varastopaikanid