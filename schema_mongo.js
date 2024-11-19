//MongoDB

db.Comics.insertMany([ 
    { titulo: "Superman en calzoncillos", descripcion: "Cómics divertidos", Precio: 19.99, categoria: "Superhéroe" }, 
    { titulo: "Batman Dark", descripcion: "Edición especial", precio: 24.99, categoria: "Acción" } 
]);


db.Clientes.insertMany([ 
    { nombre: "Juan Pérez", fecha_nacimiento: new Date("1990-05-12"), correo: "juan@example.com", historial_compras: [] },
    { nombre: "Ana López", fecha_nacimiento: new Date("1985-10-30"), correo: "ana@example.com", historial_compras: [] } 
]);

