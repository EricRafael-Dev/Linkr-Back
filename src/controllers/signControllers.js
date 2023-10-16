import bcrypt from 'bcrypt';
import { stripHtml } from "string-strip-html";
import { v4 as uuid } from 'uuid';
import { db } from '../database/databaseConnection.js';


export async function postSignIn(req, res) {

    const { email, password } = req.body;

    const sanitizedPassword = stripHtml(password).result.trim();


    try {
        //console.log(process.env.DATABASE_URL)
        const user = await db.query("SELECT * FROM users WHERE email = $1;", [email]);

        if (user.rowCount === 0) return res.status(401).send({message:"User not registered!"});

        const passwordIsCorrect = bcrypt.compareSync(sanitizedPassword, user.rows[0].password);
        if (!passwordIsCorrect) return res.status(401).send({message: "Incorrect password!"});

        const token = uuid();

        await db.query('INSERT INTO sessions (token, "userId") VALUES ($1, $2)', [token, user.rows[0].id]);

        return res.status(200).send({ userId: user.rows[0].id, token: token, username: user.rows[0].username, url: user.rows[0].pictureUrl });

    } catch (err) {
        res.status(500).send(err.message);
    }
}