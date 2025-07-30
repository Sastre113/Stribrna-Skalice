-- Habilitar la extensión pgcrypto si no estuviera disponible (en Postgres 13+  está disponible por defecto)
-- CREATE EXTENSION IF NOT EXISTS "pgcrypto";

DROP TABLE IF EXISTS impuestos_mensuales;
DROP TABLE IF EXISTS pagos_salarios;
DROP TABLE IF EXISTS ciudadanos;
DROP TABLE IF EXISTS profesiones;

CREATE TABLE profesiones
(
    id           VARCHAR(36) PRIMARY KEY,
    nombre       VARCHAR(100)   NOT NULL UNIQUE,
    salario_base DECIMAL(10, 2) NOT NULL CHECK (salario_base >= 0)
);

CREATE TABLE ciudadanos
(
    id               VARCHAR(36) PRIMARY KEY,
    nombre           VARCHAR(150) NOT NULL,
    fecha_nacimiento DATE,
    id_profesion     VARCHAR(36),
    FOREIGN KEY (id_profesion) REFERENCES profesiones (id) ON DELETE SET NULL
);

CREATE TABLE pagos_salarios
(
    id           VARCHAR(36) PRIMARY KEY,
    id_ciudadano VARCHAR(36)           NOT NULL,
    fecha_pago   TIMESTAMP      NOT NULL,
    monto        DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_ciudadano) REFERENCES ciudadanos (id) ON DELETE CASCADE
);

CREATE TABLE impuestos_mensuales
(
    id              VARCHAR(36) PRIMARY KEY,
    id_ciudadano    VARCHAR(36) NOT NULL,
    ano             INT  NOT NULL,
    mes             INT  NOT NULL,
    tasa_porcentual DECIMAL(5, 2)  DEFAULT 0.00,
    monto_fijo      DECIMAL(10, 2) DEFAULT 0.00,
    pagado          BOOLEAN        DEFAULT FALSE,
    FOREIGN KEY (id_ciudadano) REFERENCES ciudadanos (id) ON DELETE CASCADE,
    UNIQUE (id_ciudadano, ano, mes)
);