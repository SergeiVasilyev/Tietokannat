INSERT INTO hyllypaikka VALUES (1, 6, 'C', 3)
INSERT INTO hyllypaikka VALUES (2, 10, 'B', 5)

INSERT INTO varastopaikka VALUES (1, 'Helsinki varasto', 'AA-001')
INSERT INTO varastopaikka VALUES (2, 'Turku varasto', 'AA-002')

INSERT INTO varastotapahtuma 
    (Yksilointikoodi, maara, asiakasnumero, hyllypaikan_id, paiva, varastopaikka_plus, varastopaikka_minus)
VALUES (1, 5, 1, 1, 2021-10-15, 1, 2)

SELECT asiakasnumero, nimike, maara, paiva, hyllynrivi, hyllyn_osio, hyllypaikka, varastopaikka_plus, varastopaikka_minus
FROM varastotapahtuma INNER JOIN asikas INNER JOIN tuote INNER JOIN hyllypaikka INNER JOIN varastopaikka
ON 