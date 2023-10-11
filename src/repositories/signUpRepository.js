import { db } from "../database/databaseConnection.js";


export function findEmail(email) {
    const resultEmail = db.query(`SELECT email FROM users WHERE email = $1`, [email])

    return resultEmail;
}

export function insertUser(body, passwordHash) {
    const { email, username, photo } = body;

    const resultInsertUser = db.query(`INSERT INTO users (email, password, username, photo ) VALUES ($1, $2, $3, $4);`,
        [ email,  passwordHash, username, photo ]);

    return resultInsertUser;
}

