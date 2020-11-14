const Level = require ('../models/Level');

module.exports = levelController = {

    /**Find all levels */
    findAll: async (req,res) => {
        const levels = await Level.findAll();
        if(levels) {
            return res.send(levels);
        }else{
            return res.status(403).send({ "error" : "Une erreur s'est produite "});
        }
    },
    /**Find Level by id */
    findByPk: async (req,res) => {
        const id = req.params.id;
        if(!id) {
            return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
        }
           const levels = await Level.findByPk(id);
           if(levels == false) {
            return res.send({"error": "Pas de résultat trouvé"});
        }
        return res.send(levels);
    }
};