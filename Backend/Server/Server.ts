import http from 'http';
import express, { Express } from 'express';
import EngineerClient from './routes/EngineerClient';

const route: Express = express();

/** Parse the request */
EngineerClient.use(express.urlencoded({ extended: false }));
/** Takes care of JSON data */
EngineerClient.use(express.json());

/** Routes */
route.use('/', EngineerClient);

/** Error handling */
route.use((req, res) => {
    const error = new Error('not found');
    return res.status(404).json({
        message: error.message
    });
});

/** Server */
const httpServer = http.createServer(route);
const PORT: any = 6060;
httpServer.listen(PORT, () => console.log(`The server is running on port ${PORT}`));