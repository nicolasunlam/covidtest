/*------- ELIMINACION --------*/

SET sql_safe_updates=0;
DELETE FROM notificacion;
DELETE FROM asignacion;
DELETE FROM cama;
DELETE FROM sala;
DELETE FROM sector;
DELETE FROM piso;
DELETE FROM usuario;
DELETE FROM domicilio;
DELETE FROM localidad;
DELETE FROM partido;
DELETE FROM provincia;
DELETE FROM zona;

/*----- INSERCION-------*/

INSERT INTO provincia (id, nombreProvincia)
VALUES (1, "BUENOS_AIRES"),
	   (2, "CORDOBA"),
       (3, "SANTA_FE");

       INSERT INTO zona(id, nombre)
VALUES (1, "Zona norte"),
	   (2, "Zona oeste"),
       (3, "Zona sur");

INSERT INTO partido (id, nombrePartido ,provincia_id)
VALUES (1, "Vicente López", 1),
	   (2, "San Isidro", 1),
       (3, "San Fernando", 1),
       (4, "Tigre", 1),
       (5, "Morón", 1),
       (6, "Hurlingham", 1),
       (7, "Ituzaingó", 1),
       (8, "Moreno", 1),
       (9, "La Matanza", 1),
       (10, "Avellaneda", 1),
       (11, "Lomas de Zamora", 1),
       (12, "Ezeiza", 1),
       (13, "Florencio Varela", 1);

INSERT INTO localidad (id, nombreLocalidad, partido_id, zona_id)
VALUES (1,"Vicente López", 1, 1),
	   (2, "Villa Martelli", 1, 2),
	   (3, "Munro", 1, 3),
       (4, "Martínez", 2, 2),
       (5, "San Isidro", 2, 1),
       (6, "Beccar", 2, 1),
       (7, "Victoria", 3, 2),
       (8, "Tigre", 4, 1),
       (9, "General Pacheco", 4, 1),
       (10, "Don Torcuato", 4, 3),
       (11, "Villa Sarmiento", 5, 3),
       (12, "El Palomar", 5, 2),
       (13, "Haedo", 5, 2),
       (14, "Morón", 5, 2),
       (15, "Castelar", 5, 2),
       (16, "Hurlingham", 6, 3),
       (17, "William C. Morris", 6, 3),
       (18, "Ituzaingó", 7, 2),
       (19, "Udaondo", 7, 3),
       (20, "Trujui", 8, 3),
       (21, "Paso del Rey", 8, 2),
       (22, "Moreno", 8, 2),
       (23, "La Reja", 8, 2),
       (24, "Lomas del Mirador", 9, 2),
       (25, "La Tablada", 9, 2),
       (26, "Isidro Casanova", 9, 2),
       (27, "Gregorio de Laferrere", 9, 2),
       (28, "San Justo", 9, 2),
       (29, "Wilde", 10, 3),
       (30, "Valentín Alsina", 10, 3),
       (31, "Villa Fiorito", 11, 3),
       (32, "Banfield", 11, 3),
       (33, "José María Ezeiza", 12, 2),
       (34, "Canning", 12, 2),
       (35, "Carlos Spegazzini", 12, 3);

INSERT INTO domicilio(id, calle, numero, localidad_id)
VALUES (1, "Las Heras", 1200, 1),
	   (2, "Los Arcos", 3300, 1),
	   (3, "Peribebuy", 450, 6),
	   (4, "Ingeniero Huergo", 1550, 6),
       (5, "Hipólito Yrigoyen", 1650, 4),
       (6, "Pilar", 950, 6),
       (7, "Av. Rivadavia", 17961, 5),
       (8, "Solís", 463, 5);

/* ----- ADMIN ----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, email, password, numeroDocumento, tipoDocumento, domicilio_id)
VALUES ("ADMIN", "Institucion", 1, "Operadora Central 1", "admin@email.com", "1234", "20100041007", "CUIT", 1);

/* ----- HOSPITAL ----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, email, password, numeroDocumento, tipoDocumento, tipo, domicilio_id,latitud,longitud)
VALUES ("INSTITUCION", "Institucion", 2, "Fundación Favaloro", "favaloro@email.com", "1234","20200020007", "CUIT", "HOSPITAL", 2,-34.5263629, -58.7300251),
       ("INSTITUCION", "Institucion", 3, "Hospital Italiano De Morón", "hospital_italiano_moron@email.com", "1234","20300030007", "CUIT", "HOSPITAL", 7, -34.6491816, -58.618947),
       ("INSTITUCION", "Institucion", 4, "Hospital Donación Francisco Santojanni", "santojanni@email.com", "1234","20400040007", "CUIT", "HOSPITAL", 6,-34.6494917, -58.5193395),
       ("INSTITUCION", "Institucion", 5, "Hospital Profesor Doctor Ramón Carrillo", "carillo@email.com", "1234", "20500050007", "CUIT", "HOSPITAL", 5, -34.6271404, -58.5576004);

/* ----- PACIENTE AUTOTEST POSITIVOS----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud, esFumador, tieneDiabetes, tieneEmbarazo, tieneEnfCardiologica, tieneEnfHepatica, tieneEnfRenal, tieneEnfRespiratoria)
VALUES("PACIENTE", "Paciente", 6, "Alejandro", "Rodriguez", "alejandro@email.com", "1234", "1", "DNI", 2, true, null, 4, 45, -34.72840647959868, -52.71369019379556, false, false, false, false, false, false, true),
      ("PACIENTE", "Paciente", 7, "Alejandra", "Rodriguez", "alejandra@email.com", "1234", "2", "DNI", 3, true, null, 4, 87, -34.72840647959868, -52.82369019379556, false, false, false, false, true, false, false),
	  ("PACIENTE", "Paciente", 8, "Alan", "Rodriguez", "alan@email.com", "1234", "3", "DNI", 4, true, null, 4, 54, -34.72840647959868, -58.61369019379556, false, false, false, false, true, false, false),
      ("PACIENTE", "Paciente", 9, "Ana", "Rodriguez", "ana@email.com", "1234", "4", "DNI", 3, true, null, 3, 64, -34.72840647959868, -58.61369019379556, false, true, true, true, false, false, false),
      ("PACIENTE", "Paciente", 10, "Carlos", "Gómez", "carlos@email.com", "1234", "32100100", "DNI", 3, true, null, 1, 54, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 11, "Carla", "Gómez", "carla@email.com", "1234", "32110100", "DNI", 3, true, null, 1, 88, -34.72840647959868, -58.61369019379556, true, true, true, false, true, true, true);
      
/* ----- PACIENTE INFECTADOS HISOPADO----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud, esFumador, tieneDiabetes, tieneEmbarazo, tieneEnfCardiologica, tieneEnfHepatica, tieneEnfRenal, tieneEnfRespiratoria)
VALUES("PACIENTE", "Paciente", 12, "Cristian", "Gómez", "cristian@email.com", "1234", "32120100", "DNI", 3, null, true, 5, 65, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 13, "Celeste", "Gómez", "celeste@email.com", "1234", "32130100", "DNI", 1, null, true, 5, 32, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
	  ("PACIENTE", "Paciente", 14, "Dario", "García", "dario@email.com", "1234", "32140100", "DNI", 2, null, true, 5, 32, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 15, "Danila", "García", "danila@email.com", "1234", "32150100", "DNI", 3, null, true, 5, 65, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
	  ("PACIENTE", "Paciente", 16, "Daniel", "García", "daniel@email.com", "1234", "32106100", "DNI", 4, null, false, 5, 97, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 17, "Daniela", "García", "daniela@email.com", "1234", "32160100", "DNI", 3, null, true, 1, 45, -34.72840647959868, -58.61369019379556, true, true, true, true, true, true, true),
      ("PACIENTE", "Paciente", 18, "Fabricio", "García", "fabricio@email.com", "1234", "32170100", "DNI", 1, null, true, 1, 64, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 19, "Fabián", "García", "fabian@email.com", "1234", "32108100", "PASAPORTE", 1, null, true, 1, 97, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 20, "Fabiana", "Garcia", "email12_pac@email.com", "1234", "16", "PASAPORTE", 3, null, true, 1, 45, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true);

/* ----- PACIENTE PARA INTERNAR----- */
INSERT INTO usuario(rol, DTYPE, id, nombre, apellido, email, password, numeroDocumento, tipoDocumento, domicilio_id, posibleInfectado, infectado, prioridad, edad, latitud, longitud, esFumador, tieneDiabetes, tieneEmbarazo, tieneEnfCardiologica, tieneEnfHepatica, tieneEnfRenal, tieneEnfRespiratoria)
VALUES("PACIENTE", "Paciente", 21, "Juan", "Gómez", "cristian@email.com", "1234", "42120100", "DNI", 3, null, null, 5, 45, -34.72840647959868, -53.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 22, "Juana", "Gómez", "celeste@email.com", "1234", "42130100", "DNI", 1, null, null, 5, 56, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
	  ("PACIENTE", "Paciente", 23, "José", "García", "dario@email.com", "1234", "42140100", "DNI", 2, null, null, 5, 32, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 24, "Josefa", "García", "danila@email.com", "1234", "42150100", "DNI", 3, null, null, 5, 25, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
	  ("PACIENTE", "Paciente", 25, "Julián", "García", "daniel@email.com", "1234", "42106100", "DNI", 4, null, null, 5, 36, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 26, "Juliana", "García", "daniela@email.com", "1234", "42160100", "DNI", 3, null, null, 5, 25, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 27, "Julieta", "García", "fabricio@email.com", "1234", "42170100", "DNI", 1, null, null, 5, 65, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, false),
      ("PACIENTE", "Paciente", 28, "Julia", "García", "julia@email.com", "1234", "42108100", "PASAPORTE", 1, null, null, 1, 78, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 29, "Julio", "Garcia", "julio@email.com", "1234", "46", "PASAPORTE", 3, null, null, 1, 56, -34.72840647959868, -58.61369019379556, true, true, true, false, true, true, true),
      ("PACIENTE", "Paciente", 30, "Julia", "García", "fabian@email.com", "1234", "52108100", "PASAPORTE", 1, null, null, 1, 69, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 31, "Lorenzo", "Horandle", "lorenzo@email.com", "1234", "56", "PASAPORTE", 3, null, null, 1, 32, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 32, "Laura", "Horandle", "laura@email.com", "1234", "42348100", "PASAPORTE", 1, null, null, 1, 78, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 33, "Lucia", "Iraola", "lucila@email.com", "1234", "64643", "PASAPORTE", 3, null, null, 1, 56, -34.72840647959868, -58.61369019379556, true, true, true, false, true, true, true),
      ("PACIENTE", "Paciente", 34, "Lucila", "Iraola", "lucila@email.com", "1234", "62122300", "PASAPORTE", 1, null, null, 1, 69, -34.72840647959868, -58.61369019379556, true, true, false, true, true, true, true),
      ("PACIENTE", "Paciente", 35, "Ludmila", "Imarriota", "ludmila@email.com", "1234", "435656", "PASAPORTE", 3, null, null, 4, 32, -34.72840647959868, -58.61369019379556, false, false, false, false, false, false, true),
	  ("PACIENTE", "Paciente", 36, "Alejandrito", "Ismael", "alejandrito@email.com", "1234", "127854", "DNI", 2, null, null, 1, 45,-34.72840647959868, -52.71369019379556, true, true, false, true, true, true, true);

INSERT INTO piso(id, numeroPiso, institucion_id)
		/*FAVALORO*/
VALUES (1, 0, 2),
	   (2, 1, 2),
       (3, 2, 2),
       (4, 3, 2),
       (5, 4, 2),
       
       /*MORON*/
       (6, 0, 3),
	   (7, 1, 3),
       (8, 2, 3),
       
       /*SANTOJJIANI*/
	   (9, 0, 4),
	   (10, 1, 4),
       (11, 2, 4),
       (12, 3, 4),
       
       /*CARRILLO*/
       (13, 0, 5),
	   (14, 1, 5),
       (15, 2, 5);
       
INSERT INTO sector(id, descripcion, tipoSector, piso_id)
		/*FAVALORO*/
VALUES (1, "Cirujia", NULL, 1),
	   (2, "Internación", NULL, 2),
       (3, "Radiografías", NULL, 3),
       (4, "Quemaduras", NULL, 4),
       /*MORON*/
       (5, "Cirujia", NULL, 6),
	   (6, "Internación", NULL, 6),
       (7, "Radiografías", NULL, 7),
       (8, "Quemaduras", NULL, 8),
       /*SANTOJANNI*/
       (9, "Cirujia", NULL, 9),
	   (10, "Internación", NULL, 10),
       (11, "Radiografías", NULL, 11),
       (12, "Quemaduras", NULL, 12),
       /*CARRILLO*/
       (13, "Cirujia", NULL, 13),
	   (14, "Internación", NULL, 14),
       (15, "Radiografías", NULL, 14),
       (16, "Quemaduras", NULL, 15),
       
       /*MÁS SECTORES PARA FAVALORO*/
       (17, "Cirujia", NULL, 2),
	   (18, "Internación", NULL, 3),
       (19, "Radiografías", NULL, 3),
       (20, "Quemaduras", NULL, 3);
       
INSERT INTO sala(id, descripcion, tipoSala, sector_id)
		/*FAVALORO*/
VALUES (1, "1", "TERAPIA_INTENSIVA", 1),
	   (2, "2", "TERAPIA_INTENSIVA", 2),
       (3, "3", "TERAPIA_INTENSIVA", 3),
       (4, "4", "TERAPIA_INTERMEDIA", 4),
       /*MORON*/
       (5, "1", "TERAPIA_INTERMEDIA", 5),
	   (6, "2", "TERAPIA_INTERMEDIA", 6),	
       (7, "3", "TERAPIA_INTERMEDIA", 7),
       (8, "4", "AISLAMIENTO", 8),
       /*SANTOJANNI*/
       (9, "1", "TERAPIA_INTENSIVA", 9),
	   (10, "2", "TERAPIA_INTENSIVA", 10),
       (11, "3", "TERAPIA_INTENSIVA", 11),
       (12, "4", "TERAPIA_INTERMEDIA", 12),
       /*CARRILLO*/
       (13, "1", "TERAPIA_INTENSIVA", 13),
	   (14, "2", "TERAPIA_INTERMEDIA", 14),
       (15, "3", "TERAPIA_INTERMEDIA", 15),
       (16, "4", "AISLAMIENTO", 16),
       
       /*MÁS SALAS PARA FAVALORO*/
       (17, "5", "TERAPIA_INTENSIVA", 17),
	   (18, "6", "TERAPIA_INTENSIVA", 18),
       (19, "7", "TERAPIA_INTENSIVA", 18),
       (20, "8", "TERAPIA_INTERMEDIA", 19);
       
INSERT INTO cama(id, descripcion, tipoCama, sala_id)
		/*FAVALORO*/
VALUES (1, "1", "ARTICULADA_MANUAL", 1),
	   (2, "2", "ARTICULADA_ELECTRICA", 1),
       (3, "3", "ARTICULADA_ELECTRICA", 1),
       (4, "4", "ARTICULADA_ELECTRICA", 1),
	   (5, "1", "ARTICULADA_MANUAL", 2),
       (6, "2", "ARTICULADA_MANUAL", 2),
       (7, "3", "ARTICULADA_ELECTRICA", 2),
	   (8, "4", "ARTICULADA_ELECTRICA", 2),
       (9, "1", "ARTICULADA_ELECTRICA", 3),
       (10, "2", "ARTICULADA_MANUAL", 3),
	   (11, "3", "ARTICULADA_MANUAL", 3),
       (12, "4", "ARTICULADA_MANUAL", 4),
       (13, "1", "FIJA", 4),
	   (14, "2", "FIJA", 4),
       (15, "3", "FIJA", 4),
       /*MORON*/
       (16, "1", "FIJA", 5),
	   (17, "2", "FIJA", 5),
       (18, "1", "FIJA", 6),
       (19, "2", "ARTICULADA_MANUAL", 6),
	   (20, "1", "ARTICULADA_MANUAL", 7),
       (21, "1", "FIJA", 8),
       /*SANTOJANNI*/
       (22, "1", "ARTICULADA_ELECTRICA", 9),
	   (23, "2", "ARTICULADA_ELECTRICA", 9),
       (24, "3", "ARTICULADA_ELECTRICA", 9),
       (25, "1", "ARTICULADA_MANUAL", 10),
	   (26, "1", "ARTICULADA_MANUAL", 11),
       (27, "2", "ARTICULADA_MANUAL", 11),
       (28, "3", "FIJA", 11),
	   (29, "1", "FIJA", 12),
       (30, "2", "FIJA", 12),
       (31, "3", "FIJA", 12),
       /*CARRILLO*/
	   (32, "1", "FIJA", 13),
       (33, "2", "FIJA", 13),
       (34, "3", "FIJA", 13),
	   (35, "1", "FIJA", 14),
       (36, "2", "ARTICULADA_MANUAL", 14),
       (37, "3", "FIJA", 14),
	   (38, "1", "ARTICULADA_MANUAL", 15),
       (39, "2", "ARTICULADA_MANUAL", 15),
       (40, "3", "ARTICULADA_ELECTRICA", 15),
	   (41, "4", "FIJA", 15),
       (42, "5", "FIJA", 15),
       (43, "5", "FIJA", 15),
	   (44, "6", "FIJA", 15),
       (45, "7", "FIJA", 15),
       (46, "1", "FIJA", 16),
	   (47, "2", "FIJA", 16),
       (48, "3", "FIJA", 16),
       
	   /*MÀS CAMAS PARA HOSP. FAVALORO*/
	   (49, "5", "ARTICULADA_ELECTRICA", 1),
       (50, "6", "ARTICULADA_ELECTRICA", 1),
       (51, "7", "ARTICULADA_ELECTRICA", 1),
	   (52, "8", "ARTICULADA_MANUAL", 1),
       (53, "9", "ARTICULADA_MANUAL", 1),
       (54, "10", "ARTICULADA_ELECTRICA", 1),
	   (55, "11", "ARTICULADA_ELECTRICA", 1),
       (56, "5", "ARTICULADA_ELECTRICA", 2),
       (57, "6", "ARTICULADA_MANUAL", 2),
	   (58, "7", "ARTICULADA_MANUAL", 2),
       (59, "8", "ARTICULADA_MANUAL", 2),
       (60, "9", "FIJA", 2),
	   (61, "10", "FIJA", 2),
       (62, "11", "FIJA", 2);

/* ----- INTERNACION ----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (1, '2020-01-01 01:00:00.000000', null, null, 1, 21),
	   (2, '2020-02-01 01:00:00.000000', null, null, 2, 22),
       (3, '2020-03-01 01:00:00.000000', null, null, 3, 23),
	   (4, '2020-04-01 01:00:00.000000', null, null, 4, 24);

/* ----- EGRESO ----- */
UPDATE asignacion a
SET a.horaEgreso = '2020-02-01 01:00:00.000000',
	a.motivoEgreso = "CURADO"
WHERE a.cama_id IN(1);

/* ----- INGRESO Y EGRESO A LA VEZ (SON EGRESOS EN DEFINITVA)----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (5, '2020-01-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "CURADO", 10, 25),
	   (6, '2020-02-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "CURADO", 11, 26),
       (7, '2020-03-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "FALLECIDO", 12, 27),
	   (8, '2020-04-01 01:00:00.000000', '2020-02-01 01:00:00.000000', "TRASLADADO", 13, 28);

/* ----- INTERNACION 2 (rehusando 2 camas liberadas)----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (9, '2020-01-01 01:00:00.000000', null, null, 27, 25),
	   (10, '2020-02-01 01:00:00.000000', null, null, 28, 26),
       (11, '2020-02-01 01:00:00.000000', null, null, 12, 27);
       
/* ----- INTERNACION ----- */
INSERT INTO asignacion(id, horaIngreso, horaEgreso, motivoEgreso, cama_id, paciente_id)
VALUES (12, '2020-01-01 01:00:00.000000', null, null, 40, 28),
	   (13, '2020-02-01 01:00:00.000000', null, null, 41, 29),
       (14, '2020-03-01 01:00:00.000000', null, null, 42, 30),
	   (15, '2020-04-01 01:00:00.000000', null, null, 9, 31);
       
/* ----- NOTIFICACIONES----- */
INSERT INTO notificacion(asunto, fechaHora, msg, destinatario_id, remitente_id)
VALUES ("Bienvenido", '2020-04-01 01:00:00.000000', "Bienvenido  a nuestro sistema de asignación de camas.", 6, 2),
	   ("Bienvenido", '2020-04-01 01:00:00.000000', "Bienvenido  a nuestro sistema de asignación de camas.", 7, 2),
	   ("Recordatorio", '2020-04-02 01:00:00.000000', "Se le recuerda que ...", 6, 2),
       ("Recordatorio", '2020-04-02 01:00:00.000000', "Muchas gracias.", 2, 6);
       
/* ----- RESERVAS POR TRASLADO ----- */
INSERT INTO asignacion(id, horaReserva, motivoTraslado, horaEgreso, motivoEgreso, cama_id, paciente_id, autorizada, urgencia)
VALUES 
		/*RECIBE EL HOSP. CARILLO*/
	   (16, '2020-05-01 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 43, 31, null, "Media"),
	   (17, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 44, 22, false, "Media"),
	   (18, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 48, 23, true, "Media"),
       
       /*RECIBE EL HOSP. FAVALORO*/
	   (19, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 14, 21, true, "Media"),
	   (20, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 15, 30, false, "Media"),
	   (21, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 15, 26, null, "Media"),
       
       /*RECIBE EL HOSP. SANTOJIANNI*/       
	   (22, '2020-05-05 01:00:00.000000', "FALTA_DE_MAQUINARIA", null, null, 25, 27, null, "Media");
       