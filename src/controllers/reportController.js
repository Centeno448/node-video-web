const Boom = require('@hapi/boom');
const db = require('../db/database');

// Obtiene todas las compras por cada persona
const totalInPurchasesByPerson = async (request, h) => {
  try {
    // Logica de obtencion de datos debería de estar en otra capa
    // por simplicidad del video se coloca todo aquí
    var query = {
      text: `select per.id, per.name, pur.amount from public.person per join public.purchase pur on per.id = pur.person_id`
    };

    const { rows } = await db.query(query);

    var res = [];

    rows.forEach((row) => {
      const user = res.find((person) => {
        return person.id == row.id;
      });

      const userExists = !!user;

      if (userExists) {
        user.amount += +row.amount;
      } else {
        res.push({
          id: +row.id,
          name: row.name,
          amount: +row.amount
        });
      }
    });

    return res;
  } catch (e) {
    // idealmente se loggearía a una base de datos
    console.log(e);
    throw Boom.internal();
  }
};

module.exports = {
  totalInPurchasesByPerson
};
