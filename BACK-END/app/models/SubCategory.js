const db = require ('../dbconnection');

const Quiz = require ('../models/Quiz');

module.exports = class SubCategory {

    id;
    title;
    created_at;
    updated_at;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.title) { this.title = params.title}
        if(params.created_at) { this.created_at = params.created_at}
        if(params.updated_at) { this.updated_at = params.updated_at}
    }

    /**Find all subcategories */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "subcategory"';
            const result = await db.query(query);
            if(result.rowCount < 1) {
                return { "message" : "Pas de résultats" };
            }
            return result.rows;

        }
        catch (error) {
            console.log(error);
            res.send(error)
        }
    }
    /**Find by pk */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "subcategory" WHERE id=$1';
            const values = [id];
            const result = await db.query(query,values);
            return result.rows[0];
            
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }
    
};