const db = require('../dbconnection');

const Answer = require ('./Answers');
const Tag = require ('./Tag');
const User = require ('./User');
const Level = require ('./Level');

module.exports = class Quiz {

    id;
    langue;
    theme;
    question;
    prop1;
    prop2;
    prop3;
    prop4;
    niveau;
    anecdote;
    wiki;
    tag_id;
    level_id;
    created_at;
    updated_at;

    constructor (params) {
        if(params.id) { this.id = params.id}
        if(params.langue) { this.langue = params.langue}
        if(params.theme) { this.theme = params.theme}
        if(params.question) { this.question = params.question}
        if(params.prop1) { this.prop1 = params.prop1}
        if(params.prop2) { this.prop2 = params.prop2}
        if(params.prop3) { this.prop3 = params.prop3}
        if(params.prop4) { this.prop4 = params.prop4}
        if(params.niveau) { this.niveau = params.niveau}
        if(params.anecdote) { this.anecdote = params.anecdote}
        if(params.wiki) { this.wiki = params.wiki}
        if(params.tag_id) { this.tag_id = params.tag_id}
        if(params.level_id) { this.level_id = params.level_id}
        if(params.created_at) { this.created_at = params.created_at}
        if(params.updated_at) { this.updated_at = params.updated_at}
    }

    /**Find All quizzes */
    static async findAll() {
        try {
            const query = 'SELECT * FROM "quiz"';
            const result = await db.query(query);

            for(let i = 0; i < result.rowCount; i++) {
                const answer = await Answer.findByPk(result.rows[i].answer_id);
                result.rows[i].answer = answer;
            }
            if(result.rowCount < 1) {
                return { "message" : "Pas de résultats" };
            }
            return result.rows;
        } catch (error) {
            console.log(error);
            res.send(error);
        }
    }

    /**Find Quiz by id */
    static async findByPk(id) {
        try {
            const query = 'SELECT * FROM "quiz" WHERE id=$1';
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

    /**Find Quiz by tag */
    static async findByTag(id) {
        try {
            const query = `SELECT * FROM "quiz" WHERE tag_id=$1`;
            const values = [id];
            const result = await db.query(query,values);
            if(result.rowCount == 0) {
                return {"message": "Pas de résultats"};
            }
                return result.rows;
        }
        catch (error) {
            console.log(error);
            res.send(error)
        }
    }
    /**Find quiz by level */
    static async findByLevel(id) {
        try {
            const query = `SELECT * FROM "quiz" WHERE level_id=$1`;
            const values = [id];
            const result = await db.query(query,values);
            if(result.rowCount == 0) {
                return {"message": "Pas de résultats"};
            }
                return result.rows;
        }
        catch (error) {
            console.log(error);
            res.send(error)
        }
    }

    /**Find by Tag ans Level */
    static async findByTagAndLevel(tagId, levelId) {
        try {
            const query = 'SELECT * FROM "quiz" WHERE tag_id=$1 AND level_id=$2';
            const values = [tagId, levelId];
            const result = await db.query(query, values);
            for(let i = 0; i < result.rowCount; i++) {
                const answer = await Answer.findByPk(result.rows[i].answer_id);
                result.rows[i].answer = answer;
            }
            for(let i = 0; i < result.rowCount; i++) {
                const tag = await Tag.findByPk(result.rows[i].tag_id);
                result.rows[i].tag = tag;
            }
            for(let i = 0; i < result.rowCount; i++) {
                const user = await User.findByPk(result.rows[i].user_id);
                result.rows[i].user = user;
            }
            for(let i = 0; i < result.rowCount; i++) {
                const level = await Level.findByPk(result.rows[i].level_id);
                result.rows[i].level = level;
            }
            if(result.rowCount == 0) {
                return {"message": "Pas de résultats"};
            }
                return result.rows;
        }
        catch (error) {
            console.log(error);
            res.send(error)
        }
    }


    /**Join subcategory to quiz table */
    static async findSubcategory(id) {
        try {
            const query ='SELECT * FROM "quiz" INNER JOIN "quiz_has_subcategory" ON quiz.id=quiz_has_subcategory.quizzes_id WHERE subcategory_id=$1';
            const values = [id];
            const result = await db.query(query, values);

            for(let i = 0; i < result.rowCount; i++) {
            const quizzes = await Quiz.findByPk(result.rows[i].quizzes_id);
            result.rows[i].quizzes = quizzes
            }
            for(let i = 0; i < result.rowCount; i++) {
                const answer = await Answer.findByPk(result.rows[i].answer_id);
                result.rows[i].answer = answer;
            }
            for(let i = 0; i < result.rowCount; i++) {
                const user = await User.findByPk(result.rows[i].user_id);
                result.rows[i].user = user;
            }
            if(result.rowCount == 0) {
                return {"message": "Pas de résultats"};
            }
                return result.rows;
        }
        catch (error) {
            console.log(error);
            res.send(error);
        }
    }

    /**Search by subcategory */
    static async searchBySubcategory(search) {
        try {
            const query = 'SELECT * FROM "subcategory" WHERE "title" LIKE $1;';
            const values = ['%'+search+'%'];
            const result = await db.query(query, values);
            if(result.rowCount == 0){
                return [];
            }else{
                return result.rows;
            }
        }
        catch (error){
            console.log(error);
            return false
        }
    }
    

};