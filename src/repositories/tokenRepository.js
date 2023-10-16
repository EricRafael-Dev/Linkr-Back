import { db } from "../database/databaseConnection.js";

export function getToken(token) {
    const resultToken = db.query(`SELECT token FROM sessions WHERE token = $1;`, [token])

    return resultToken;
}

export function searchUser (session){
    const resultCompare = db.query(`SELECT "userId" FROM sessions WHERE token = $1;`, [session.rows[0].token])
    
    return resultCompare;
}

export function deleteToken(session) {
    const resultDelete = db.query(`DELETE FROM sessions WHERE token = $1;`, [session.rows[0].token])

    return resultDelete;
}