import { deleteToken } from "../repositories/tokenRepository.js";

export async function signOut(req, res) {
    const session = res.locals.session
    console.log(session.rows[0])

    try{
       await deleteToken(session)

        res.status(204)
     } catch (err) {
        res.status(500).send(err.message);
    }


}