# Proyecto de Base de Datos para Tienda de Cómics

Este proyecto implementa un diseño de bases de datos tanto para PostgreSQL como para MongoDB, mostrando su estructura, consultas, triggers y vistas, con datos de ejemplo.

## **1. Esquema de Bases de Datos**

### **PostgreSQL**
Incluye las siguientes tablas normalizadas:
- **Comics**: Información sobre los cómics.
- **Personajes**: Detalles de personajes relevantes.
- **Aldeanos_Y_Armas**: Información sobre aldeanos y armas.
- **Clientes**: Detalles de los clientes registrados.
- **Transacciones**: Registro de las compras realizadas por clientes.

Se incluyen relaciones adecuadas entre tablas mediante claves foráneas.

### **MongoDB**
Estructura basada en documentos optimizada para datos jerárquicos:
- Colección **Comics**.
- Colección **Personajes**.
- Colección **Aldeanos_Y_Armas**.
- Colección **Clientes**.
- Colección **Transacciones**.

## **2. Consultas y Triggers**

### **Consultas para PostgreSQL**
Se incluyen consultas fáciles, medias y avanzadas, como:
- Listar cómics con precio menor a $20.
- Clientes con más de 5 compras.
- Categoría más popular de cómics.

### **Consultas para MongoDB**
Consultas equivalentes a las de PostgreSQL en formato MongoDB Query Language (MQL).

### **Trigger**
Trigger en PostgreSQL que agrega automáticamente clientes a una tabla de ofertas especiales si compran un cómic específico.

## **3. Vistas**
- **Vista_Compras_Populares**: Muestra los cómics más populares.
- **Vista_Compras_Cacheada**: Vista materializada para calcular ingresos totales por cómic.

## **4. Instrucciones**
- Ejecuta el código SQL o JavaScript en las herramientas adecuadas (PostgreSQL o MongoDB).
- Usa datos de ejemplo proporcionados para probar las consultas.

## **Notas**
- Asegúrate de tener PostgreSQL y MongoDB configurados correctamente.
- Incluye datos de prueba en las bases de datos para verificar los resultados.

(Se le pidió ayuda a Chat para generar el Readme, por si acaso jaja)