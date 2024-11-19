
// consulta MongoDB

// Lista de cómics con precios inferiores a 20 dólares

db.Comics.find({ precio: { $lt: 20 } } ).sort({ titulo: 1 });


//Clientes que han comprado más de 5 veces
db.Transacciones.aggregate([
    { $group: { _id: "$id_cliente", total_compras: { $sum: 1 }, gasto_total: { $sum: "$total" } } },
    { $match: {compras_total_compras: { $gt: 5 } } }
]);

// Categorías de cómics más populares

db.Transacciones.aggregate([
    { $lookup: { from: "Comics", localField: "id_comic", foreignField: "_id", as: "datos_comic" } },
    { $unwind: "$datos_comic" },
    { $group: { _id: "$datos_comic.categoria",total_compras: { $sum: 1 } } },
    { $sort: {total_compras: -1 } },
    {$limit:1}
]);
