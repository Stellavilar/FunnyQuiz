const Answer = require ('../models/Answers');

module.exports = answerController = {
    /**Find all answers */
    findAll: async (req,res) => {
        const answers = await Answer.findAll();
        if(answers) {
            return res.send(answers);
        }else{
            return res.status(403).send({ "error" : "Une erreur s'est produite "});
        }

    },
    /**Find answer by id */
    findByPk: async (req,res) => {
        const id = req.params.id;
        if(!id) {
            return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
        }
           const answers = await Answer.findByPk(id);
           if(answers == false) {
            return res.send({"error": "Pas de résultat trouvé"});
        }
        return res.send(answers);
    },

};