const db = require ('../dbconnection');
const bcrypt = require ('bcrypt');
const jwt = require ('../utils/jwt.utils');

module.exports = class User {

    id;
    username;
    mail;
    score_id;
    created_at;
    updated_at;
    password;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.username) { this.username = params.username}
        if(params.mail) { this.mail = params.mail}
        if(params.score_id) { this.score = params.score_id}
        if(params.created_at) { this.created_at = params.created_at}
        if(params.updated_at) { this.updated_at = params.updated_at}
        if(params.password) { this.password = params.password}
    }

    async save() {
        try {
            const query = 'INSERT INTO "users" (username, mail, password) VALUES ($1, $2, $3) RETURNING *;';
            const values = [this.username, this.mail, this.password];
            const result = await db.query(query, values);
            if((await result).rowCount != 1) {
                return false
            }
            this.id = result.rows[0].id;
            this.created_at = result.rows[0].created_at;

            return this
        }
        catch (error) {
            console.log(error);
            return error
        }
        
    }

    /**FindAll */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "users";';
            const result = await db.query(query);
            
            if(result.rowCount < 1){
                return false;
            }
            return result.rows;
        }
        catch (error) {
            console.log(error);
            return error;
        }
    }

    /**Find by id */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "users" WHERE id=$1';
            const values = [id];
            const result = await db.query(query, values);

            if(result.rowCount == 1) {
                return result.rows[0];
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error) {
            console.log(error);
            res.send(error)
        }
    }

    static async findByToken() {
        try {
            const query = 'SELECT * FROM "users" WHERE "token" LIKE $1;';
            const values = ['ey%'];
            const result = await db.query(query, values);
            if(result.rowCount < 1 ){
                return false;
            }
            return result.rows;
        }
        catch (error) {
            console.log(error);
            return error;
        }
    }

    /**Edit profil user */
    async edit() {
        try{
            const query = 'UPDATE "users" SET username=$1, mail=$2, password=$3 WHERE id=$4 RETURNING *;';
            const values = [this.username, this.mail, this.password, this.id];
            const result = await db.query(query, values);
            if(result.rowCount == 1){
                return result.rows[0];
            }else {
                return false;
            } 
        }
        catch (error) {
            console.log(error);
            return error;
        }
    }

    /**Delete user */
    static async delete(id) {
        try {
            const query = 'DELETE FROM "users" WHERE id=$1;';
            const values = [id];
            const result = await db.query(query, values);
            if(result.rowCount == 1) {
                return true;
            }else{
                return false;
            }
        }
        catch(error) {
            console.log(error);
            return error;
        }
    }

    static async login(username, password) {
        try {
            const query = 'SELECT * FROM "users" WHERE username=$1;';
            const values = [username];
            const result = await db.query(query, values);
            if(result.rowCount == 1 ) {
                const passwordDb = result.rows[0].password;
                if(await bcrypt.compare(password, passwordDb)) {
                    this.token = jwt.generateUserToken(result.rows[0]);
                    const queryAddToken = 'UPDATE "users" SET token=$1 WHERE username=$2 RETURNING *;';
                    const valuesAddToken = [this.token, username];
                    const resultAddToken = await db.query(queryAddToken, valuesAddToken)
                    return resultAddToken;
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }
        catch (error) {
            console.log(error);
            return error
        }

    }

    static async logout (userId) {
        try {
            const query = 'UPDATE "users" SET token=null WHERE id=$1;';
            const values = [userId];
            const result = await db.query(query, values);
            if(result.rowCount == 1) {
                return true;
            }else{
                return false;
            }
        }
        catch(error) {
            console.log(error);
            return false
        }
    }

    

};