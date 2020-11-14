const SubCategory = require ('../models/SubCategory');

module.exports = subCategoryController = {

    findAll: async(req,res) => {
        try {
        const subCategories = await SubCategory.findAll();
        if(subCategories) {
            return res.send(subCategories);
        }else{
            return res.status(403).send({ "error" : "Une erreur s'est produite "});
        }
        }
        catch (error){
            console.log(error);
            res.send(error);
        }
    },
    findByPk: async(req, res) => {
        try {
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
            }
               const subCategory = await SubCategory.findByPk(id);
               if(subCategory == false) {
                return res.send({"error": "Pas de résultat trouvé"});
            }
            return res.send(subCategory);
        }
        catch (error){
            console.log(error);
            res.send(error);
        }
    }

};