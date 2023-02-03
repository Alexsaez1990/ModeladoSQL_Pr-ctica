select mo.nombre_modelo, ma.nombre_marca, g.nombre_grupo, v.fecha_compra, v.matricula, c.nombre_color, v.kilometros, a.nombre_aseguradora, v.poliza
from flota_1.vehiculos as v
join flota_1.modelos as mo on v.id_modelo = mo.id_modelo 
join flota_1.marcas as ma on mo.id_marca = ma.id_marca 
join flota_1.grupos as g on ma.id_grupo = g.id_grupo 
join flota_1.colores as c on v.id_color = c.id_color 
join flota_1.aseguradoras as a on v.id_aseguradora = a.id_aseguradora 
where v.fecha_baja = '4000/01/01';
