const User = require ('../models/User');
const jwt = require ('../utils/jwt.utils');

module.exports = loginController = {

    login: async (req,res) => {
        try {
            const { username, password } = req.body;
            if(!username || !password ) {
                return res.send({ "Error" : "Vous n'avez pas complété tous les champs"});
            }
            const result = await User.login(username, password);
            if(!result){
                return res.send({"Error" : "Une erreur s'est produite"});
            }
            req.session.token = result.token
            const token = result;
            const resultSend = {
                token : token,
            }
            return res.send(resultSend);

        }
        catch (error) {
            console.log(error);
            return res.send(error);
        }
    },

    logout: async (req,res) => {
        try {
            const headerAuth = req.headers.authorization;
            const userId = jwt.getUserId(headerAuth);

            if (userId < 0) {
                return res.status(400).json({
                    'error': 'wrong token'
                });
            }

            // Logout user
            const result = await User.logout(userId);
            if(result){
                // Delete session token
                delete req.session.token;
                return res.send(true);
            }else{
                return res.send(false);
            }
        }
        catch (error) {
            console.log(error);
            return res.send(error);
        }

    },

    

}