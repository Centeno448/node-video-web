const Hapi = require('@hapi/hapi');
const AppRoutes = require('./routes/appRoutes.js');

const start = async () => {
  // Usar alguna libreria como dotenv para settear las variables de entorno
  process.env.PGHOST = 'localhost';
  process.env.PGUSER = 'WebVideo';
  process.env.PGDATABASE = 'WebVideo';
  process.env.PGPASSWORD = 'WebVideo';
  process.env.PGPORT = 5432;

  const server = Hapi.server({
    host: 'localhost',
    port: 4000
  });

  // Asigna un prefijo a todas las rutas
  server.realm.modifiers.route.prefix = '/api';

  // Registra las rutas
  server.route(AppRoutes.routes);

  await server.start();

  console.log('server running at: ' + server.info.uri);
};

start();
