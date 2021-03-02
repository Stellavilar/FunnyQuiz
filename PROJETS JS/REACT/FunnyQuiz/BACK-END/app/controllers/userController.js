const bcrypt = require ('bcrypt');
const validateEmail = require ('../utils/mail.utils');
const validatePassword = require ('../utils/password.utils');
const rounds = 10;

const User = require ('../models/User');


module.exports = {

    /**Add user */
    add: async (req,res) => {
        try {
            const { username, mail, password } = req.body;
            // //Check if all params are existing
            if (!password || !username || !mail) {
                return res.send('Vous n\'avez pas renseigné tous les éléments nécessaires');
            }
            //Validate email throught Utils.js
            if (!validateEmail.validate(mail)) {
                return res.send ('Votre Adresse e-mail n\'est pas correcte');
            }
            //Validate password throught Utils.js
            if (!validatePassword.validate(password)) {
                return res.send ('Votre mot de passe doit contenir au minimum 8 caractères avec au moins un chiffre');
            }
            //Hash password
            const passwordHashed = await bcrypt.hash(password, rounds);

            //New instance or User
            const user = new User({
                username,
                mail,
                password: passwordHashed,
                
            });
            //Save new user
            const result = await user.save();
            return res.send(result);

        }
        catch (error) {
            console.log(error);
            return res.status(403).send(error);
        }

    },

    /**Find all users */
    findAll: async (req,res) => {
        try {
            const users = await User.findAll();
            if(users) {
                return res.send(users)
            }else{
                return res.status(403).send({ "Error" : "Une erreur s\'est produite"});
            }

        }
        catch (error) {
            console.log(error);
            return res.status(403).send(error);
        }
    },

    /**Find by token */
    findByToken: async (req,res) => {
        try {
            const users = await User.findByToken();
            if(users) {
                return res.send(users)
            }else{
                return res.status(403).send({ "Error" : "Une erreur s\'est produite"});
            }
        }
        catch (error) {
            console.log(error);
            return res.status(403).send(error);
        }
    },

    /**Find by id */
   
    findByPk: async (req,res) => {
        try {
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"erreur": "Il manque un paramètre pour effectuer la demande"});
            }
               const users = await User.findByPk(id);
               if(users == false) {
                return res.send({"error": "Pas de résultat trouvé"});
            }
            return res.send(users);
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    },

    /**Edit profil user */
    edit: async (req,res) => {
        try{
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"error": "Il vous manque un paramètre pour effectuer votre demande."});
            }
            const oldUser = await User.findByPk(id);
            if(oldUser == false) {
                return res.send({"Error" : "Pas d'utilisateur trouvé"});
            }
            let { username, mail, password } = req.body;

            if(!username){username = oldUser.username}
            if(!mail){mail = oldUser.mail}
            
            // Validate Password with utils.js
            if(password){ 
                if(!validatePassword.validate(password)){
                    return res.send({"error": "Votre mot de passe doit contenir au minimum 8 caractères avec au moins un chiffre"});
                }
            }
            // Validate email with Utils.js
            if(!validateEmail.validate(mail)){
                return res.send({"error": "Votre adresse mail n'est pas correcte."});
            }

            /**New instance for the new user */
            const user = new User({
                id, 
                username,
                mail,
                password,
            });
            if(password) {
                const passwordHashed = await bcrypt.hash(password, rounds);
                user.password = passwordHashed;
            }

            /**Edit user */
            const result = await user.edit();
            return res.send(result);

        }
        catch(error) {
            console.log(error);
            return res.status(403).send(error);
        }

    },

    /**Delete user */
    delete: async (req,res) => {
        try{
            const id = req.params.id;
            if(!id) {
                return res.status('403').send({"error": "Il vous manque un paramètre pour effectuer votre demande."});
            }
            const result = await User.delete(id);
            if(result) {
                res.send(true);
            }else{
                res.send(false)
            }
        }
        catch(error) {
            console.log(error);
            return res.status(403).send(error);
        }

    },


};