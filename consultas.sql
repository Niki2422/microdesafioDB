--- cinco cursos con mas unidades ---
SELECT c.titulo, COUNT(u.id) AS numero_unidades
FROM cursos c
JOIN unidades u ON c.id = u.id_curso
GROUP BY c.id, c.titulo
ORDER BY numero_unidades DESC
LIMIT 5;

--- media unidades por curso ---

SELECT c.titulo, AVG(num_unidades) AS media_unidades
FROM cursos c
JOIN (
    SELECT id_curso, COUNT(*) AS num_unidades
    FROM unidades
    GROUP BY id_curso
) AS unidades_por_curso ON c.id = unidades_por_curso.id_curso
GROUP BY c.titulo;

--- usuarios asociados a mas de 3 cursos ---

SELECT u.nombre
FROM usuarios u
JOIN (
    SELECT id_usuario, COUNT(*) AS num_cursos
    FROM usuarios_cursos
    GROUP BY id_usuario
    HAVING COUNT(*) > 3
) AS cursos_usuario ON u.id = cursos_usuario.id_usuario
ORDER BY u.nombre ASC;

--- 10 primeras clases que empiezen despues de .... -----

SELECT *
FROM clases
WHERE fecha_inicio > '2024-05-15' -- Fecha determinada
ORDER BY fecha_inicio ASC
LIMIT 10;

--- numero de bloques por titulo para una clase especifica----

SELECT titulo, COUNT(*) AS cantidad
FROM bloques
WHERE clase_id = 1 -- Clase específica (cambia el id si es necesario)
GROUP BY titulo;

--- nombre y apellido de usuarios sustituyendo los valores nulos por una cadena vacia ---

SELECT IFNULL(nombre, '') AS nombre, IFNULL(apellido, '') AS apellido
FROM usuarios;

--- 3 cursos con la mayor cantidad de usuarios ---

SELECT c.titulo, COUNT(uc.id_usuario) AS cantidad_usuarios
FROM cursos c
JOIN usuarios_cursos uc ON c.id = uc.id_curso
GROUP BY c.id, c.titulo
ORDER BY cantidad_usuarios DESC
LIMIT 3;

--- promedio de clases por unidad para cada curso ---

SELECT c.titulo, AVG(num_clases) AS promedio_clases_por_unidad
FROM cursos c
JOIN (
    SELECT id_curso, COUNT(*) AS num_clases
    FROM unidades u
    JOIN clases c ON u.id = c.id_unidad
    GROUP BY id_curso, id_unidad
) AS clases_por_unidad ON c.id = clases_por_unidad.id_curso
GROUP BY c.titulo;

--- ususarios con mas de 2 cursos que comienzan despues de una fecha determinada ---

SELECT u.nombre
FROM usuarios u
JOIN (
    SELECT id_usuario, COUNT(*) AS num_cursos
    FROM usuarios_cursos uc
    JOIN cursos c ON uc.id_curso = c.id
    WHERE c.fecha_inicio > '2024-06-01'
    GROUP BY id_usuario
    HAVING COUNT(*) > 2
) AS cursos_despues_fecha ON u.id = cursos_despues_fecha.id_usuario
ORDER BY u.nombre ASC;

--- ultimas 5 unidades que empiezan despues de una fecha determinada ---

SELECT *
FROM unidades
WHERE fecha_inicio > '2024-06-01'
ORDER BY fecha_inicio DESC
LIMIT 5;

--- numero de usuarios por categoria para un curso definido ---

SELECT u.categoria_id, COUNT(uc.id_usuario) AS cantidad_usuarios
FROM usuarios_cursos uc
JOIN usuarios u ON uc.id_usuario = u.id
WHERE uc.id_curso = 1 -- Curso específico (cambia el id si es necesario)
GROUP BY u.categoria_id;





