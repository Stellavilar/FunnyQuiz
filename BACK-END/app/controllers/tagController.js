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
    }

}