const db = require ('../dbconnection');
const bcrypt = require ('bcrypt');

module.exports = class User {

    id;
    username;
    mail;
    score;
    created_at;
    updated_at;
    password;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.username) { this.username = params.username}
        if(params.mail) { this.mail = params.mail}
        if(params.score) { this.score = params.score}
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
            const user = await db.query(query, values);
            if(user.rowCount == 1) {
                return user.rows[0];
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error) {
            console.log(error);
            res.send(error)
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

};