import bcrypt from 'bcrypt';
import { stripHtml } from "string-strip-html";
import { v4 as uuid } from 'uuid';
import { findEmail, insertUser } from '../repositories/signUpRepository.js';
import { db } from '../database/databaseConnection.js';


export async function postSignUp(req, res) {
    const { email, password } = req.body;
    const senha = password;

    const passwordHash = bcrypt.hashSync(senha, 10);

    try {

        const searchUser = await findEmail(email);

        if (searchUser.rowCount > 0) return res.status(409).send({ message: 'email já cadastrado' });

        await insertUser(req.body, passwordHash)

        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message)
    }
}

export async function postSignIn(req, res) {

    const { email, password } = req.body;

    const sanitizedEmail = stripHtml(email).result.trim();
    const sanitizedPassword = stripHtml(password).result.trim();


    try {
        console.log(process.env.DATABASE_URL)
        const user = await db.query("SELECT * FROM users WHERE email = $1;", (sanitizedEmail));

        if (user.rows.length === 0) return res.status(401).send("User not registered!");

        const passwordIsCorrect = bcrypt.compareSync(sanitizedPassword, user.rows[0].password);
        if (!passwordIsCorrect) return res.status(401).send("Incorrect password!");

        const token = uuid();

        await db.query('INSERT INTO sessions (token, "idUser") VALUES ($1, $2)', (token, user.rows[0].id));

        return res.status(200).send({ token: token, username: user.rows[0].username, url: user.rows[0].pictureUrl, id: user.rows[0].id });

    } catch (err) {
        res.status(500).send(err.message);
    }
}