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
    },
    /**Find quiz by Id */
   findByPk: async (req,res) => {
       try {
           const id = req.params.id;
           if(!id) {
            return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
        }
           const quiz = await Quiz.findByPk(id);
           if(quiz == false) {
            return res.send({"error": "Pas de résultat trouvé"});
        }
        return res.send(quiz);
       }
       catch (error) {
           console.log (error);
           res.send(error);
       }
   },

   /**Find by tag */
   findByTag: async (req,res) => {
       try {
           const id = req.params.id;
           if(!id) {
            return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
           }
           const quiz = await Quiz.findByTag(id);
           if(quiz == false) {
            return res.send({"error": "Pas de résultat trouvé"});
        }
        return res.send(quiz);
       }
       catch (error) {
        console.log (error);
        res.send(error);
    }
   },

   /**Find by level */
   findByLevel: async (req,res) => {
    try {
        const id = req.params.id;
        if(!id) {
         return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
        }
        const quiz = await Quiz.findByLevel(id);
        if(quiz == false) {
         return res.send({"error": "Pas de résultat trouvé"});
        }
        return res.send(quiz);
        }
        catch (error) {
            console.log (error);
            res.send(error);
        }
    },

    /**Find by Tag and Level */
    findByTagAndLevel: async (req,res) => {
        try {
            const { tagId, levelId } = req.params;
            const quiz = await Quiz.findByTagAndLevel(tagId,levelId);
            if(quiz == false) {
                return res.send({"error": "Pas de résultat trouvé"});
               }
               return res.send(quiz);
        }
        catch (error) {
            console.log (error);
            res.send(error);
        }
        
    },

    /**Find subcategory */
    findSubcategory: async (req,res) => {
        try {
            const id = req.params.id;
        if(!id) {
         return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
        }
        const quizzes = await Quiz.findSubcategory(id);
        if(quizzes == false) {
            return res.send({"error": "Pas de résultat trouvé"});
        }
         return res.send(quizzes);
        }
        catch (error) {
         console.log (error);
         res.send(error);
        }

    },



};