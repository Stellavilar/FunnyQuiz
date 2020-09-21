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
        if(params.color) { this.color = params.color}
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
    /**Fin tag by id */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "tag" WHERE id=$1';
            const values = [id];
            const tag = await db.query(query, values);
            if(tag.rowCount == 1) {
                return tag.rows[0];
            }else{
                return {"message": "Pas de résultats"};
            }
        }
        catch (error){
            console.log(error);
            res.send(error)
        }
    }

}