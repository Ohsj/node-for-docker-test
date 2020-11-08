const express = require('express')

const app = express();
const port = 3000;

app.get('/', (req, res) => {
   res.status(200).send(`NODE_ENV is ${process.env.NODE_ENV}`)
});

app.listen(port, () => {
   process.send('ready')
   console.log(`docker-test app listening at http://localhost:${port}`);
});