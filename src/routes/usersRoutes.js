import { Router } from "express";
import { signUpSchema } from "../schemas/signUpSchema.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSignUp } from "../controllers/signUpControllers.js";


const signUpRouter = Router();

signUpRouter.post('/sign-up', validateSchema(signUpSchema), postSignUp);

export default signUpRouter;