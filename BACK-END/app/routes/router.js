const express = require ('express');

const router = express.Router();

/***Quizzes Routes */
const quizController = require ('../controllers/quizController');

router.get('/quizzes', quizController.findAll);
router.get('/quizzes/:id', quizController.findByPk);
router.get('/quizzes/tag/:id', quizController.findByTag);
router.get('/quizzes/level/:id', quizController.findByLevel);

module.exports = router;