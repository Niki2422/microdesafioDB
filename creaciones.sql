INSERT INTO usuarios (id,nombre, apellido, email, contraseña, categoria_id, curso_id)
VALUES (1,'Juan', 'Perez', 'juan@example.com', 'contraseña123', 1, 3);

select * from usuarios;

INSERT INTO usuarios (id,nombre, apellido, email, contraseña, categoria_id, curso_id)
VALUES (1,'Juan', 'Perez', 'juan@example.com', 'contraseña123', 1, 3);

INSERT INTO usuarios (id,nombre, apellido, email, contraseña, categoria_id, curso_id)
VALUES (2,'María', 'Gómez', 'maria@example.com', 'maria123', 2, 5),
(3,'Pedro', 'López', 'pedro@example.com', 'pedro123', 1, 4),
(4,'Ana', 'Martínez', 'ana@example.com', 'ana123', 3, 2),
(5,'Carlos', 'Sánchez', 'carlos@example.com', 'carlos123', 2, 3);

select * from usuarios;

INSERT INTO usuarios (id,nombre, apellido, email, contraseña, categoria_id, curso_id)
VALUES 
(6,'Laura', 'Rodríguez', 'laura@example.com', 'laura123', 1, 3),
(7,'Sergio', 'García', 'sergio@example.com', 'sergio123', 2, 5),
(8,'Lucía', 'Fernández', 'lucia@example.com', 'lucia123', 1, 4),
(9,'Pablo', 'Díaz', 'pablo@example.com', 'pablo123', 3, 2),
(10,'Elena', 'López', 'elena@example.com', 'elena123', 2, 3),
(11,'David', 'Martínez', 'david@example.com', 'david123', 1, 3),
(12,'Andrea', 'González', 'andrea@example.com', 'andrea123', 2, 5),
(13,'Diego', 'Pérez', 'diego@example.com', 'diego123', 1, 4),
(14,'Carmen', 'Ruiz', 'carmen@example.com', 'carmen123', 3, 2),
(15,'Manuel', 'Sánchez', 'manuel@example.com', 'manuel123', 2, 3),
(16,'Marta', 'Jiménez', 'marta@example.com', 'marta123', 1, 3),
(17, 'Javier', 'Gómez', 'javier@example.com', 'javier123', 2, 5),
(18,'Eva', 'Hernández', 'eva@example.com', 'eva123', 1, 4),
(19,'Adrián', 'Fernández', 'adrian@example.com', 'adrian123', 3, 2),
(20,'Sara', 'Díaz', 'sara@example.com', 'sara123', 2, 3),
(21,'Ismael', 'Martín', 'ismael@example.com', 'ismael123', 1, 3),
(22,'Nuria', 'Alvarez', 'nuria@example.com', 'nuria123', 2, 5),
(23,'Alberto', 'Gutiérrez', 'alberto@example.com', 'alberto123', 1, 4),
(24,'Patricia', 'Ortega', 'patricia@example.com', 'patricia123', 3, 2);

select * from usuarios;

INSERT INTO cursos (id,titulo, descripcion, imagen, fecha_inicio, fecha_finalizacion, cupo_maximo)
VALUES 
(1,'Curso de Programación en Python', 'Aprende Python desde cero con este curso completo.', 'python.jpg', '2024-05-01', '2024-06-30', 50),
(2,'Curso de Desarrollo Web', 'Aprende a desarrollar aplicaciones web con HTML, CSS y JavaScript.', 'web.jpg', '2024-05-10', '2024-07-10', 40),
(3,'Curso de Introducción a la Inteligencia Artificial', 'Descubre los fundamentos de la inteligencia artificial con este curso.', 'ia.jpg', '2024-06-01', '2024-07-31', 30),
(4,'Curso de Diseño Gráfico', 'Aprende las técnicas y herramientas para el diseño gráfico profesional.', 'diseno.jpg', '2024-06-15', '2024-08-15', 35),
(5,'Curso de Marketing Digital', 'Domina las estrategias de marketing digital para promocionar tu negocio.', 'marketing.jpg', '2024-07-01', '2024-08-30', 45),
(6,'Curso de Fotografía', 'Aprende los principios básicos de la fotografía y mejora tus habilidades.', 'fotografia.jpg', '2024-07-15', '2024-09-15', 25);

-- Modificar la tabla cursos para permitir valores nulos en la columna imagen
ALTER TABLE cursos MODIFY COLUMN imagen VARCHAR(255) NULL;

ALTER TABLE cursos DROP COLUMN usuarios_id;

select * from cursos;

select * from usuarios_cursos;
--- paso los datos de las tablas , a la tabla intermedia ---
ALTER TABLE usuarios_cursos
ADD FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
ADD FOREIGN KEY (id_curso) REFERENCES cursos(id);

select * from usuarios;

INSERT INTO usuarios_cursos (id,id_usuario, id_curso) 
VALUE (1,1, 3),
(2,2, 5),
(3,3, 4),
(4,4, 2),
(5,5, 3),
(6,6, 3),
(7,7, 5),
(8,8, 4),
(9,9, 2),
(10,10, 3),
(11,11, 3);


select * from cursos;

-- Para la tabla usuarios
ALTER TABLE usuarios MODIFY COLUMN id INT AUTO_INCREMENT;
-- Para la tabla cursos
ALTER TABLE cursos MODIFY COLUMN id INT AUTO_INCREMENT;
-- Para la tabla usuarios_cursos
ALTER TABLE usuarios_cursos MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE clases MODIFY COLUMN id INT AUTO_INCREMENT;

INSERT INTO unidades (id,titulo, descripcion, fecha_inicio, id_curso)
VALUES 
(1,'Unidad 1', 'Introducción al curso', '2024-05-01', 1),
(2,'Unidad 2', 'Desarrollo del tema 1', '2024-05-10', 1),
(3,'Unidad 3', 'Desarrollo del tema 2', '2024-05-20', 1),
(4,'Unidad 4', 'Desarrollo del tema 3', '2024-06-01', 1),
(5,'Unidad 5', 'Evaluación final', '2024-06-15', 1),

(6,'Unidad 1', 'Introducción al curso', '2024-05-01', 2),
(7,'Unidad 2', 'Desarrollo del tema 1', '2024-05-10', 2),
(8,'Unidad 3', 'Desarrollo del tema 2', '2024-05-20', 2),
(9,'Unidad 4', 'Desarrollo del tema 3', '2024-06-01', 2),
(10,'Unidad 5', 'Evaluación final', '2024-06-15', 2),

(11,'Unidad 1', 'Introducción al curso', '2024-06-01', 3),
(12,'Unidad 2', 'Desarrollo del tema 1', '2024-06-10', 3),
(13,'Unidad 3', 'Desarrollo del tema 2', '2024-06-20', 3),
(14,'Unidad 4', 'Desarrollo del tema 3', '2024-07-01', 3),
(15,'Unidad 5', 'Evaluación final', '2024-07-15', 3),

(16,'Unidad 1', 'Introducción al curso', '2024-06-01', 3),
(17,'Unidad 2', 'Desarrollo del tema 1', '2024-06-10', 3),
(18,'Unidad 3', 'Desarrollo del tema 2', '2024-06-20', 3),
(19,'Unidad 4', 'Desarrollo del tema 3', '2024-07-01', 3),
(20,'Unidad 5', 'Evaluación final', '2024-07-15', 3),

(21,'Unidad 1', 'Introducción al curso', '2024-06-01', 3),
(22,'Unidad 2', 'Desarrollo del tema 1', '2024-06-10', 3),
(23,'Unidad 3', 'Desarrollo del tema 2', '2024-06-20', 3),
(24,'Unidad 4', 'Desarrollo del tema 3', '2024-07-01', 3),
(25,'Unidad 5', 'Evaluación final', '2024-07-15', 3),

(26,'Unidad 1', 'Introducción al curso', '2024-06-01', 3),
(27,'Unidad 2', 'Desarrollo del tema 1', '2024-06-10', 3),
(28,'Unidad 3', 'Desarrollo del tema 2', '2024-06-20', 3),
(29,'Unidad 4', 'Desarrollo del tema 3', '2024-07-01', 3),
(30,'Unidad 5', 'Evaluación final', '2024-07-15', 3);


INSERT INTO bloques (id,clase_id, titulo, visibilidad)
VALUES 
(1,1, 'Clase 1', 'Introducción al tema 1', '2024-05-10', 1),
(2,1, 'Clase 2', 'Desarrollo del tema 1', '2024-05-15', 1),
(3,1, 'Clase 3', 'Conclusiones del tema 1', '2024-05-20', 1),

(4,2, 'Clase 1', 'Introducción al tema 2', '2024-05-20', 1),
(5,2, 'Clase 2', 'Desarrollo del tema 2', '2024-05-25', 1),
(6,2, 'Clase 3', 'Conclusiones del tema 2', '2024-05-30', 1),

(7,3, 'Clase 1', 'Introducción al tema 3', '2024-06-10', 1),
(8,3, 'Clase 2', 'Desarrollo del tema 3', '2024-06-15', 1),
(9,3, 'Clase 3', 'Conclusiones del tema 3', '2024-06-20', 1),

(10,4, 'Clase 1', 'Introducción al tema 4', '2024-06-20', 1),
(11,4, 'Clase 2', 'Desarrollo del tema 4', '2024-06-25', 1),
(12,4, 'Clase 3', 'Conclusiones del tema 4', '2024-06-30', 1),

(13,5, 'Clase 1', 'Evaluación final', '2024-07-01', 1);

select * from bloque_contenic;


INSERT INTO bloque_contenico (id,id_bloque,contenido)
VALUES 
(1,1, 'Video Introductorio', 1),
(2,1, 'Presentación Tema 1', 1),
(3,1, 'Material complementario', 1),

(4,2, 'Video Clase 1', 1),
(5,2, 'Presentación Clase 1', 1),
(6,2, 'Ejercicios prácticos', 1);

INSERT INTO bloque_contenido (id,id_bloque, contenido)
VALUES 
(1,1, 'URL_DEL_VIDEO_1'),
(2,1, 'URL_DE_LA_PRESENTACION_1'),
(3,1, 'URL_DEL_MATERIAL_COMPLEMENTARIO_1'),

(4,2, 'URL_DEL_VIDEO_CLASE_1'),
(5,2, 'URL_DE_LA_PRESENTACION_CLASE_1'),
(6,2, 'EJERCICIOS_PRÁCTICOS_CLASE_1'),

(7,3, 'URL_DEL_VIDEO_CLASE_2'),
(8,3, 'URL_DE_LA_PRESENTACION_CLASE_2'),
(9,3, 'EJERCICIOS_PRÁCTICOS_CLASE_2'),

(10,4, 'URL_DEL_VIDEO_CLASE_3'),
(11,4, 'URL_DE_LA_PRESENTACION_CLASE_3'),
(12,4, 'EJERCICIOS_PRÁCTICOS_CLASE_3'),

(13,5, 'URL_DEL_EXAMEN_FINAL');


(7,3, 'Video Clase 2', 1),
(8,3, 'Presentación Clase 2', 1),
(9,3, 'Ejercicios prácticos', 1),

(10,4, 'Video Clase 3', 1),
(11,4, 'Presentación Clase 3', 1),
(12,4, 'Ejercicios prácticos', 1),

(13,5, 'Examen final', 1);


CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nombre_categoria VARCHAR(255)
);

INSERT INTO categorias (id_categoria, nombre_categoria) VALUES
(1, 'Estudiante'),
(2, 'Docente'),
(3, 'Editor'),
(4, 'Administrador');

