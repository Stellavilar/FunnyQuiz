const Quiz = require ('../models/Quiz');

module.exports = quizController = {

    /*Find all quizzes*/
    findAll: async (req,res) => {
        try {
            const quizzes = await Quiz.findAll();
            if(quizzes) {
                return res.send(quizzes);
            }else{
                return res.status(403).send({ "error" : "Une erreur s'est produite "});
            }
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }
};