import express, { Request, Response } from 'express';

const app = express();
const PORT = 3001;

app.use(express.json());

app.get('/', (req: Request, res: Response) => {
    res.send('Hello, Node.js Backend!');
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
