USE uf2_pa2_pelicules;
-- Tasca 1
SELECT DISTINCT d.nom, d.cognoms, p.titol, ap.rol
FROM directors d
	INNER JOIN directors_pelicules dp ON dp.id_director = d.id_director
	INNER JOIN pelicules p ON p.id_pelicula = dp.id_pelicula
    INNER JOIN actors_pelicules ap ON ap.id_pelicula = p.id_pelicula
    INNER JOIN actors a ON a.id_actor = ap.id_actor
WHERE (a.nom LIKE 'Claire') AND (a.cognoms LIKE 'Danes');

-- Tasca 2
SELECT p.titol, MAX(cp.valoracio) AS valoracio
FROM pelicules AS p
INNER JOIN critics_pelicules AS cp ON cp.id_pelicula = p.id_pelicula
	GROUP BY p.titol
    ORDER BY valoracio DESC;
    
-- Tasca 3
SELECT DISTINCT actp.rol, act.nom, act.cognoms, AVG(cip.valoracio) AS valoracio_mitjana
FROM actors_pelicules actp
	INNER JOIN actors act ON actp.id_actor = act.id_actor
	INNER JOIN pelicules pe ON act.id_pelicula = pe.id_pelicula
    INNER JOIN critics_pelicules cip ON pe.id_pelicula = cip.id_pelicula
WHERE (AVG(cip.valoracio_mitjana BETWEEN 5 AND 7);

-- Tasca 4
SELECT DISTINCT d.cognoms, d.nom
FROM directors d
INNER JOIN directors_pelicules dp ON d.id_director = dp.id_director
INNER JOIN pelicules p ON dp.id_pelicula = p.id_pelicula
INNER JOIN critics_pelicules cp ON p.id_pelicula = cp.id_pelicula
WHERE cp.valoracio >= 8
ORDER BY d.cognoms, d.nom;

-- Tasca 5
SELECT DISTINCT p.titol, COUNT(id_actor) AS totalActors, MIN(valoracio) AS valoracioMinima
FROM pelicules p
INNER JOIN critics_pelicules cp ON p.id_pelicula = cp.id_pelicula
INNER JOIN actors_pelicules ap ON p.id_pelicula = ap.id_pelicula
WHERE p.pais = 'UK'
ORDER BY valoracio DESC;


-- Tasca 6
SELECT DISTINCT c.nom, cp.valoracio, p.titol
FROM critics c
	INNER JOIN critics_pelicules cp ON cp.id_critic = c.id_critic
    INNER JOIN pelicules p ON p.id_pelicula = cp.id_pelicula
WHERE (cp.valoracio<5);