const express = require ('express');

const router = express.Router();

/***Quizzes Routes */
const quizController = require ('../controllers/quizController');

router.get('/quizzes', quizController.findAll);
router.get('/quizzes/:id', quizController.findByPk);
router.get('/quizzes/tag/:id', quizController.findByTag);
router.get('/quizzes/level/:id', quizController.findByLevel);
router.get('/quizzes/subcategory/:id', quizController.findSubcategory);
router.get('/tags/:tagId/levels/:levelId', quizController.findByTagAndLevel);

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

/**Users Routes */
const userController = require ('../controllers/userController');
const { Router } = require('express');

router.post('/add', userController.add);
router.get('/users', userController.findAll);
router.get('/users/:id', userController.findByPk);
router.patch('/edit/:id', userController.edit);
router.delete('/delete/:id', userController.delete);

/**Login and Logout routes */
const loginController = require ('../controllers/loginController');

router.post('/api/login', loginController.login);
router.get('/api/logout', loginController.logout);

/**Search routes */
const searchController = require ('../controllers/searchController');

router.get('/quiz/subcategory', searchController.subCategory);

module.exports = router;