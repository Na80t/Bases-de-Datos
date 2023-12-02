--Crear un disparador para asegurar que la restricción de especialización total
--con traslape de la relación persona
-- Nos verifica que solo sea de un tipo: Veterinario, Proveedor, Cuidador. Aunque además verifica
-- que si tenemos uno de los anteriores también pueda ser cliente. Se verifica que ningún tipo quede nulo o 
-- marcado como falso.
create or replace function check_tipo_persona() returns trigger
as
$$
begin
   if TG_OP = 'INSERT' or TG_OP = 'UPDATE' then
     if (NEW.esveterinario is null) and (new.esproveedor is null) and
        (new.escuidador is null) and (new.escliente is null) or  
        (NEW.esveterinario = false  and new.esproveedor = false  and
        new.escuidador = false  and new.escliente = false)  then

        RAISE EXCEPTION 'La persona % % % debe ser de al menos un tipo', new.nombre, new.materno, new.paterno
        using hint = 'Verifica que se de tipo Veterinario o Proveedor o Cuidador o Cliente. También puedes ser alguno de los tres primeros 
		y cliente a la vez';

      elsif (NEW.esveterinario = true  and new.esproveedor = false  and
        new.escuidador = false) or (NEW.esveterinario = false  and new.esproveedor = true  and
        new.escuidador = false) or (NEW.esveterinario = false  and new.esproveedor = false  and
        new.escuidador = true) then 
        
        return null;
      else
      	RAISE EXCEPTION 'La persona % % % debe ser a lo más 2 tipos, en donde no pude ser al mismo tiempo algun par de: esVeterinario,
		esCuidador, esProveedor ni los tres juntos', new.nombre, new.materno, new.paterno
        using hint = 'Verifica que sea solo de un tipo Veterinario o Proveedor o Cuidador. También puede ser alguno de los tres primeros 
		y cliente a la vez';
        
	 end if;
	end if;
   return null;
end;
$$
language plpgsql;

--Creamos el disparador;
create or replace trigger tipo_persona
after insert or update on persona
for each row
execute procedure check_tipo_persona();


-- Disparador para el descuento en los tickets
-- Nos verifica que el descuento este entre 0 y 100
-- Si no cumple con la condición, nos manda un error
CREATE OR REPLACE FUNCTION check_descuento_ticket() RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.descuento < 0 OR NEW.descuento > 100 THEN
        RAISE EXCEPTION 'El descuento en el ticket debe estar entre 0 y 100. Descuento actual: %', NEW.descuento;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

-- Creamos el disparador
CREATE TRIGGER descuento_ticket
BEFORE INSERT OR UPDATE ON ticket
FOR EACH ROW
EXECUTE FUNCTION check_descuento_ticket();