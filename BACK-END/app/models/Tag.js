const db = require ('../dbconnection');

module.exports = class Tag {

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

    /**Find all Tags */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "tag"';
            const tag = await db.query(query);
            if(tag.rowCount < 1) {
                return { "message" : "Pas de résultats" };
            }
            return tag.rows;
        }
        catch (error){
            console.log(error);
            res.send(error)
        }
    }

}