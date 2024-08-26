CREATE TABLE ventas (
    venta_id SERIAL NOT NULL, 
    venta_fecha DATETIME YEAR TO MINUTE,
    venta_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (venta_id)
);

CREATE TABLE productos1 (
    producto_id SERIAL NOT NULL, 
    producto_nombre VARCHAR(50) NOT NULL, 
    producto_precio DECIMAL(10,2) NOT NULL, 
    producto_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (producto_id)
);

CREATE TABLE detalle_ventas (
    detalle_id SERIAL NOT NULL, 
    detalle_venta INTEGER,
    detalle_producto INTEGER,
    detalle_cantidad INTEGER, 
    detalle_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (detalle_id),
    FOREIGN KEY (detalle_venta) REFERENCES ventas (venta_id),
    FOREIGN KEY (detalle_producto) REFERENCES productos1 (producto_id)
);

INSERT INTO productos1 (producto_nombre, producto_precio) values ('MESA', 1500.25) 
INSERT INTO productos1 (producto_nombre, producto_precio) values ('ESCRITORIO', 9000) 
INSERT INTO productos1 (producto_nombre, producto_precio) values ('COMPUTADORA', 15000)

insert into ventas (venta_fecha) values (current) 
insert into ventas (venta_fecha) values (current)

insert into detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) values (1,1,1);
insert into detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) values (1,3,2);
insert into detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) values (2,2,3);
insert into detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) values (2,1,1);

SELECT PRODUCTO_NOMBRE AS PRODUCTO, sum(detalle_cantidad) as cantidad from detalle_ventas 
inner join productos1 on detalle_producto = producto_id where detalle_situacion = 1 
group by producto_nombre

select 

SELECT producto_nombre AS producto, sum(detalle_cantidad) as cantidad 
            from detalle_ventas 
            inner join productos on detalle_producto = producto_id where detalle_situacion = 1
            group by producto_nombre
            
            
CREATE TABLE cliente (
    cliente_id SERIAL NOT NULL, 
    cliente_nombre VARCHAR(100) NOT NULL,
    cliente_direccion VARCHAR(200),
    cliente_telefono VARCHAR(15),
    PRIMARY KEY (cliente_id)
);

drop table cliente

CREATE TABLE ventas (
    venta_id SERIAL NOT NULL, 
    venta_fecha DATETIME YEAR TO MINUTE,
    venta_cliente INTEGER NOT NULL, 
    venta_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (venta_id),
    FOREIGN KEY (venta_cliente) REFERENCES cliente (cliente_id)
);

drop table ventas 

CREATE TABLE productos (
    producto_id SERIAL NOT NULL, 
    producto_nombre VARCHAR(50) NOT NULL, 
    producto_precio DECIMAL(10,2) NOT NULL, 
    producto_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (producto_id)
);

CREATE TABLE detalle_ventas (
    detalle_id SERIAL NOT NULL, 
    detalle_venta INTEGER,
    detalle_producto INTEGER,
    detalle_cantidad INTEGER, 
    detalle_situacion SMALLINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (detalle_id),
    FOREIGN KEY (detalle_venta) REFERENCES ventas (venta_id),
    FOREIGN KEY (detalle_producto) REFERENCES productos (producto_id)
);

INSERT INTO cliente (cliente_nombre, cliente_direccion, cliente_telefono) 
VALUES('Roger Carpio', 'Calle 4', '1234567890');
INSERT INTO cliente (cliente_nombre, cliente_direccion, cliente_telefono) 
VALUES('Daniel Rivas', 'Calle 6', '0987654321');
INSERT INTO cliente (cliente_nombre, cliente_direccion, cliente_telefono) 
VALUES('Daniel Moran', 'Calle 8', '0987344321');
INSERT INTO cliente (cliente_nombre, cliente_direccion, cliente_telefono) 
VALUES('Isabel Mejia', 'Calle 9', '0346434546');

INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 1);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES(CURRENT, 2);


INSERT INTO detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) 
VALUES (1,1,1);
INSERT INTO detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) 
VALUES(1,3,2);
INSERT INTO detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) 
VALUES(2,2,3);
INSERT INTO detalle_ventas (detalle_venta, detalle_producto, detalle_cantidad) 
VALUES(2,1,1);

INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 1);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 1);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 1);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 1);

INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 2);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 2);

INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 3);
INSERT INTO ventas (venta_fecha, venta_cliente) VALUES (CURRENT, 3);


SELECT 
    cliente_id,
    cliente_nombre,
    COUNT(venta_id) AS total_ventas
FROM 
    cliente
JOIN 
    ventas ON cliente_id = venta_cliente
GROUP BY 
    cliente_id, cliente_nombre
ORDER BY 
    total_ventas DESC;