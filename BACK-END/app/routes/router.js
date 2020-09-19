const express = require ('express');

const router = express.Router();

/***Quizzes Routes */
const quizController = require ('../controllers/quizController');

router.get('/quizzes', quizController.findAll);

module.exports = router;