
use mydb;
/* selects tables */
SELECT * FROM usuario;
SELECT * FROM ventas;
SELECT * FROM productos;
SELECT * FROM detalleDeVenta;

    
		
insert into usuario (nombre)values('leonardo');
insert into ventas (fecha,idClientel)values('2022-07-22 4:57:00',1);
insert into productos (producto, productoscol)values('cafe','5000');
insert into detalleDeVenta (idventa, detalleDeVentacol,cantidad,totalCompra)values(1,1,50,2500);


ALTER TABLE productos
	RENAME COLUMN productoscol TO precio;
    
alter table ventas 
	add column totalVenta bigint;

delimiter //

CREATE trigger Detalle_deCompra_usuario after insert on ventas 
for each row
begin
	insert  detalleDeVenta (idventa, detalleDeVentacol,cantidad,totalCompra)
		values(NEW.idventa,NEW.detalleDeVEntacol,NEW.cantidad,NEW.totalCompra);
end//
delimiter;
