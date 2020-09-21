require('dotenv').config();
const express = require ('express');
const router = require ('./app/routes/router');
const cors = require ('cors');
const app = express();



app.use(cors());
app.use(express.json());

app.use(router);
app.use((req,res) => {
    return res.send({ "404 ": "Not Found" });
});


const PORT = process.env.PORT || 1234;



app.listen(PORT, () => {
    console.log(`Listening on port ${PORT}`);
});