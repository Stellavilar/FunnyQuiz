const Tag = require ('../models/Tag');

module.exports = tagController = {

    /**Find all tags */
    findAll: async (req,res) => {
        try {
            const tags = await Tag.findAll();
            if(tags) {
                return res.send(tags);
            }else{
                return res.status(403).send({ "error" : "Une erreur s'est produite "});
            }
        }
        catch (error){
            console.log(error);
            res.send(error);
        }
    },

    /**Find tag by id */
    findByPk: async (req,res) => {
        try {
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
            }
               const tag = await Tag.findByPk(id);
               if(tag == false) {
                return res.send({"error": "Pas de résultat trouvé"});
            }
            return res.send(tag);
        }
        catch (error){
            console.log(error);
            res.send(error);
        }

    }

};