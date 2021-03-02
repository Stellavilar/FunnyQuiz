const db = require ('../dbconnection');

module.exports = class Answer {

    id;
    title;
    quiz_id;
    created_at;

    constructor(params) {
        if(params.id) { this.id = params.id}
        if(params.title) { this.title = params.title}
        if(params.quiz_id) { this.quiz_id = params.quiz_id}
        if(params.created_at) { this.created_at = params.created_at}
    }

    /**Find all answers */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "answer";';
            const answers = await db.query(query);
            
            return answers.rows;
        }
        catch (error){
            console.log(error);
        }

    }
    /**Find answer by id */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "answer" WHERE id=$1';
            const values = [id];
            const result = await db.query(query,values);
            return result.rows[0];
        }
        catch (error){
            console.log(error);
        }
    }

};