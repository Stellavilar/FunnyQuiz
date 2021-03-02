const Score = require ('../models/Score');
const User = require ('../models/User');

module.exports = scoreController = {

    findAll: async (req,res) => {
        try {
            const scores = await Score.findAll();
            if(scores) {
                return res.send(scores);
            }else{
                return res.status(403).send({ "error" : "Une erreur s'est produite "});
            }
        }
        catch (error) {
            console.log(error);
            return res.status(403).send(error);
        }

    },

    findByPk: async (req,res) => {
        const id = req.params.id;
            if(!id) {
                return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
            }
               const scores = await Score.findByPk(id);
               if(scores == false) {
                return res.send({"error": "Pas de résultat trouvé"});
            }
            return res.send(scores);
    },

    findByUser: async (req,res) => {
        try {
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
            }
               const scores = await Score.findByUser(id);
            //    if(scores == false) {
            //     return res.send({"error": "Pas de résultat trouvé"});
            // }
            return res.send(scores);
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }

    },

    add: async (req,res) => {
        try {
            const user_id = req.params.id;
            const { number, tag_id, level_id, subcategory_id } = req.body;
            
            const user = await User.findByPk(user_id);
            if(user == false) {
                return res.send({"Error" : "Pas d'utilisateur trouvé"});
            }
            const score = new Score({
                number,
                user_id,
                tag_id,
                level_id,
                subcategory_id
            });
            //Save new score
            const result = await score.save();
            return res.send(result);
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }

    },

};