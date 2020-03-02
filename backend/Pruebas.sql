CREATE TABLE elecciones (id INTEGER NOT NULL, categoria VARCHAR(12) NOT NULL CHECK (categoria IN ('Municipales','Federales')), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (id) );
CREATE TABLE colegios (id INTEGER NOT NULL, nombre VARCHAR(30) NOT NULL, direccion VARCHAR(150) NOT NULL, id_elecciones INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (id), FOREIGN KEY (id_elecciones) REFERENCES elecciones(id) );
CREATE TABLE mesas (letra VARCHAR(5) NOT NULL, votos_blancos INTEGER, votos_nulos INTEGER, id_colegio INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (letra), FOREIGN KEY (id_colegio) REFERENCES colegios(id) );
CREATE TABLE votantes (ine VARCHAR(30) NOT NULL, nombre VARCHAR(50) NOT NULL, fecha_nacimiento DATE NOT NULL, direccion VARCHAR(150) NOT NULL, nacionalidad VARCHAR(20) NOT NULL, letra_mesa VARCHAR(5) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (ine), FOREIGN KEY (letra_mesa) REFERENCES mesas(letra) );
CREATE TABLE mexicanos (ine VARCHAR(30) NOT NULL, puesto VARCHAR(9) NOT NULL CHECK (puesto IN ('Miembro', 'Suplente')), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (ine), FOREIGN KEY (ine) REFERENCES votantes(ine) );
CREATE TABLE miembros (ine VARCHAR(30) NOT NULL, ine_suplente VARCHAR(30) NOT NULL, cargo VARCHAR(11) NOT NULL CHECK (cargo IN ('Presidente','Vocal')), sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY (ine), FOREIGN KEY (ine) REFERENCES mexicanos(ine), FOREIGN KEY (ine_suplente) REFERENCES mexicanos(ine) );
CREATE TABLE partidos (siglas VARCHAR(10) NOT NULL, nombre VARCHAR(50) NOT NULL, presidente VARCHAR(50) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY(siglas) );
CREATE TABLE apoderados (ine VARCHAR(30) NOT NULL, nombre VARCHAR(50) NOT NULL, partido VARCHAR(10) NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), PRIMARY KEY(ine), FOREIGN KEY (partido) REFERENCES partidos(siglas) );
CREATE TABLE votos_por_mesa (letra_mesa VARCHAR(5) NOT NULL, partido VARCHAR(10) NOT NULL, votos INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW BEGIN, sys_end TIMESTAMP(12) NOT NULL GENERATED ALWAYS AS ROW END, create_id TIMESTAMP(12) GENERATED ALWAYS AS TRANSACTION START ID, PERIOD SYSTEM_TIME (sys_start, sys_end), FOREIGN KEY (letra_mesa) REFERENCES mesas(letra), FOREIGN KEY (partido) REFERENCES partidos(siglas) );

CREATE TABLE elecciones_history (id INTEGER NOT NULL, categoria VARCHAR(12) NOT NULL CHECK (categoria IN ('Municipales','Federales')), sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (id) );
ALTER TABLE elecciones ADD VERSIONING USE HISTORY TABLE elecciones_history;

CREATE TABLE colegios_history (id INTEGER NOT NULL, nombre VARCHAR(30) NOT NULL, direccion VARCHAR(150) NOT NULL, id_elecciones INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (id) );
ALTER TABLE colegios ADD VERSIONING USE HISTORY TABLE colegios_history;

CREATE TABLE mesas_history (letra VARCHAR(5) NOT NULL, votos_blancos INTEGER, votos_nulos INTEGER, id_colegio INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (letra));
ALTER TABLE mesas ADD VERSIONING USE HISTORY TABLE mesas_history;

CREATE TABLE votantes_history (ine VARCHAR(30) NOT NULL, nombre VARCHAR(50) NOT NULL, fecha_nacimiento DATE NOT NULL, direccion VARCHAR(150) NOT NULL, nacionalidad VARCHAR(20) NOT NULL, letra_mesa VARCHAR(5) NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (ine) );
ALTER TABLE votantes ADD VERSIONING USE HISTORY TABLE votantes_history;

CREATE TABLE mexicanos_history (ine VARCHAR(30) NOT NULL, puesto VARCHAR(9) NOT NULL CHECK (puesto IN ('Miembro', 'Suplente')), sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (ine) );
ALTER TABLE mexicanos ADD VERSIONING USE HISTORY TABLE mexicanos_history;

CREATE TABLE miembros_history (ine VARCHAR(30) NOT NULL, ine_suplente VARCHAR(30) NOT NULL, cargo VARCHAR(11) NOT NULL CHECK (cargo IN ('Presidente','Vocal')), sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY (ine) );
ALTER TABLE miembros ADD VERSIONING USE HISTORY TABLE miembros_history;

CREATE TABLE partidos_history (siglas VARCHAR(10) NOT NULL, nombre VARCHAR(50) NOT NULL, presidente VARCHAR(50) NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY(siglas) );
ALTER TABLE partidos ADD VERSIONING USE HISTORY TABLE partidos_history;

CREATE TABLE apoderados_history (ine VARCHAR(30) NOT NULL, nombre VARCHAR(50) NOT NULL, partido VARCHAR(10) NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12), PRIMARY KEY(ine) );
ALTER TABLE apoderados ADD VERSIONING USE HISTORY TABLE apoderados_history;

CREATE TABLE votos_por_mesa_history (letra_mesa VARCHAR(5) NOT NULL, partido VARCHAR(10) NOT NULL, votos INTEGER NOT NULL, sys_start TIMESTAMP(12) NOT NULL, sys_end TIMESTAMP(12) NOT NULL, create_id TIMESTAMP(12));
ALTER TABLE votos_por_mesa ADD VERSIONING USE HISTORY TABLE votos_por_mesa_history;