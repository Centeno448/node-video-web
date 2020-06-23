const reportController = require('../controllers/reportController');

const routes = [
  {
    method: 'GET',
    path: '/report/purchases',
    handler: reportController.totalInPurchasesByPerson
  }
];

exports.routes = routes;
