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

};