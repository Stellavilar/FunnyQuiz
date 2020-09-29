const bcrypt = require ('bcrypt');
const validateEmail = require ('../utils/mail.utils');
const validatePassword = require ('../utils/password.utils');
const rounds = 10;

const User = require ('../models/User');

module.exports = {

    /**Add user */
    add: async (req,res) => {
        try {
            const { username, mail, score, password } = req.body;
            //Check if all params are existing
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
                score,
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
                return res.status(403).send({ 'Error' : 'Une erreur s\'est produite'});
            }

        }
        catch (error) {
            console.log(error);
            return res.status(403).send(error)
        }
    },

};