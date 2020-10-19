require('dotenv').config();
const express = require('express');
// const cors = require('cors');
// const bodyParser = require('body-parser');
// const session = require('express-session');

/**Initialize express */
const app = express();

const PORT = process.env.PORT || 3000;

app.listen(3000, () => {
    console.log(`Serveur started on http://localhost:${PORT}`);
});