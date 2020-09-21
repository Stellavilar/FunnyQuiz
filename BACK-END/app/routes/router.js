const express = require ('express');

const router = express.Router();

/***Quizzes Routes */
const quizController = require ('../controllers/quizController');

router.get('/quizzes', quizController.findAll);
router.get('/quizzes/:id', quizController.findByPk);
router.get('/quizzes/tag/:id', quizController.findByTag);
router.get('/quizzes/level/:id', quizController.findByLevel);
router.get('/quizzes/subcategory/:id', quizController.findSubcategory);

/**Tags Routes */
const tagController = require ('../controllers/tagController');

router.get('/tags', tagController.findAll);
router.get('/tags/:id', tagController.findByPk);

/**LevelS Routes */
const levelController = require('../controllers/levelController');

router.get('/levels', levelController.findAll);
router.get('/levels/:id', levelController.findByPk);

/**Answers Routes */
const answerController = require ('../controllers/answerController');

router.get('/answers', answerController.findAll);
router.get('/answers/:id', answerController.findByPk);

/**Subcategories Routes */
const subCategoryController = require ('../controllers/subCategoryController');

router.get('/subcategories', subCategoryController.findAll);

module.exports = router;