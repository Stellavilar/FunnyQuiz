const Quiz = require('../models/Quiz');

module.exports = searchController = {

    subCategory: async (req,res) => {
        try {
            const search = req.query.q;
            const result = await Quiz.searchBySubcategory(search.toLowerCase());
            if(result){
                return res.send(result);
            }else{
                return res.send(false);
            }
        }
        catch (error) {
            console.log(error);
            return res.send(false);
        }
    },

};