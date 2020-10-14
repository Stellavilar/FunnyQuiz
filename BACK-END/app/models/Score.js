const db = require ('../dbconnection');
const User = require ('./User');

module.exports= class Score {

    id;
    number;
    created_at;
    updated_at;
    user_id;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.number) { this.number = params.number}
        if(params.created_at) { this.created_at = params.created_at}
        if(params.updated_at) { this.updated_at = params.updated_at}
        if(params.user_id) { this.user_id = params.user_id}
    };

    static async findAll() {
        try {
            const query = 'SELECT * FROM "score"';
            const result = await db.query(query);

            for(let i = 0; i < result.rowCount; i++) {
                const user = await User.findByPk(result.rows[i].user_id);
                result.rows[i].user = user;
            }
            if(result.rowCount < 1) {
                return { "message" : "Pas de résultats" };
            }
            return result.rows;

        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }

    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "score" WHERE id=$1';
            const values = [id];
            const result = await db.query(query,values);
            
            if(result.rowCount == 1) {
                return result.rows[0];
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }

    static async findByUser(id) {
        try {
            const query = 'SELECT * FROM "score" WHERE user_id=$1 ;';
            const values = [ id ];
            const result = await db.query(query,values);

            for(let i = 0; i < result.rowCount; i++) {
                const user = await User.findByPk(result.rows[i].user_id);
                result.rows[i].user = user;
            }

            if(result.rowCount > 0) {
                return result.rows;
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }

    }

    async save() {
        try {
            const query = 'INSERT INTO "score" (number, user_id) VALUES ($1,$2) RETURNING *;';
            const values = [ this.number, this.user_id ];
            const result = await db.query(query, values);
            if(result.rowCount != 1) {
                return false
            }
            this.id = result.rows[0].id;
            this.created_at = result.rows[0].created_at;

            return this
            
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }

};