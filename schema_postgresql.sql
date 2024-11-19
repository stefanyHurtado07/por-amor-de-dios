
CREATE TABLE Comics (
    id_comic SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50)
);


CREATE TABLE Personajes (
    id_personaje SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    poderes TEXT[],
    debilidades TEXT[],
    afiliaciones TEXT[]
);

-- Tabla de aldeanos y armas
CREATE TABLE Aldeanos_Y_Armas (
    id_articulo SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    disponibilidad BOOLEAN DEFAULT TRUE
);


CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    correo VARCHAR(255) UNIQUE NOT NULL,
    historial_compras TEXT[]
);

CREATE TABLE Transacciones (
    id_transaccion SERIAL PRIMARY KEY,
    id_comic INT REFERENCES Comics(id_comic),
    id_cliente INT REFERENCES Clientes(id_cliente),
    fecha_compra DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10, 2) NOT NULL
);


CREATE TABLE OfertasEspeciales (
    id_oferta SERIAL PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL,
    fecha_nacimiento_cliente DATE NOT NULL
);


CREATE OR REPLACE FUNCTION agregar_a_ofertas_especiales()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.id_comic = (SELECT id_comic FROM Comics WHERE titulo = 'Superman en Calzoncillos con Batman Asustado') THEN
        INSERT INTO OfertasEspeciales (nombre_cliente, fecha_nacimiento_cliente)
        SELECT nombre, fecha_nacimiento FROM Clientes WHERE id_cliente = NEW.id_cliente;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_ofertas_especiales
AFTER INSERT ON Transacciones
FOR EACH ROW
EXECUTE FUNCTION agregar_a_ofertas_especiales();


CREATE INDEX idx_cliente ON Transacciones(id_cliente);
