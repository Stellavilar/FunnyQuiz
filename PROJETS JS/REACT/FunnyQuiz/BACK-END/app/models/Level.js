const db = require ('../dbconnection');

module.exports = class Level {

    id;
    title;
    color;
    created_at;
    updated_at;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.title) { this.title = params.title}
        if(params.created_at) { this.created_at = params.created_at}
        if(params.updated_at) { this.updated_at = params.updated_at}
    }

    /**Find all Levels */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "levels"';
            const levels = await db.query(query);
            if(levels.rowCount < 1) {
                return { "message" : "Pas de résultats" };
            }
            return levels.rows;
        }
        catch (error){
            console.log(error);
            res.send(error)
        }
    }
    /**Find Level by id */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "levels" WHERE id=$1';
            const values = [id];
            const levels = await db.query(query, values);
            if(levels.rowCount == 1) {
                return levels.rows[0];
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error){
            console.log(error);
            res.send(error)
        }
    }

};