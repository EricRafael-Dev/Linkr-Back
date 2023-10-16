import bcrypt from 'bcrypt';
import { findEmail, insertUser } from '../repositories/signUpRepository.js';

export async function postSignUp(req, res) {
    const { email, password } = req.body;
    const senha = password;

    const passwordHash = bcrypt.hashSync(senha, 10);

    try {

        const searchUser = await findEmail(email);

        if (searchUser.rowCount > 0) return res.status(409).send({message: 'email já cadastrado'});

        await insertUser(req.body, passwordHash)

        res.sendStatus(201)

    } catch (err) {
        res.status(500).send(err.message)
    }
}