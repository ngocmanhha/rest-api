import express from 'express';

const app = express();
const host = "0.0.0.0";
const port = 3000;

app.get('/', (req, res) => {
    res.status(200);
    res.json({
        "Access": "OK",
        "Message": "Hello, Welcome"
    });
});

app.listen(port, host, () => {
    return console.log(`Server is listening on ${port}`);
});