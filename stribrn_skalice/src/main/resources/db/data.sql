-- Insertar Profesiones con UUIDs explícitos
INSERT INTO profesiones (id, nombre, salario_base)
VALUES ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'Herrero', 120.50),
       ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Granjero', 85.00),
       ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Alquimista', 250.75),
       ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Guardia', 110.00);

-- Insertar Ciudadanos, referenciando los UUIDs de profesiones
INSERT INTO ciudadanos (id, nombre, fecha_nacimiento, id_profesion)
VALUES ('c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f23', 'Baldric el Fuerte', '0985-05-10',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11'), -- Herrero
       ('c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f24', 'Elara la Cosechadora', '0990-03-22',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12'), -- Granjero
       ('c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f25', 'Lyra la Sabia', '0978-11-30',
        'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13'), -- Alquimista
       ('c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f26', 'Garrick sin profesión', '1001-01-15', NULL);

-- Insertar Pagos de Salarios, referenciando el UUID del ciudadano
INSERT INTO pagos_salarios (id, id_ciudadano, fecha_pago, monto)
VALUES ('d5b5b2b4-7c8d-5b2e-9c1b-8c9d0e1f2g34', 'c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f23',
        '1025-07-28 10:00:00', 120.50);
-- Pago para Baldric

-- Insertar Impuestos, referenciando los UUIDs de los ciudadanos
INSERT INTO impuestos_mensuales (id, id_ciudadano, ano, mes, tasa_porcentual, monto_fijo, pagado)
VALUES ('e6c6c3c5-8d9e-6c3f-ad2c-9d0e1f2g45h1', 'c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f23', 1025, 7,
        15.0, 5.0, TRUE),  -- Impuesto para Baldric
       ('e6c6c3c5-8d9e-6c3f-ad2c-9d0e1f2g45h2', 'c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f24', 1025, 7,
        12.5, 2.0, FALSE), -- Impuesto para Elara
       ('e6c6c3c5-8d9e-6c3f-ad2c-9d0e1f2g45h3', 'c4a4a1a3-6b7c-4a1d-8b0a-7b8c9d0e1f25', 1025, 7,
        25.0, 50.0, FALSE); -- Impuesto para Lyra