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
            const query = 'INSERT INTO "users" (username, mail, score, password) VALUES ($1, $2, $3, $4) RETURNING *;';
            const values = [this.username, this.mail, this.score, this.password];
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
};