import { Router } from "express";
import { signUpSchema } from "../schemas/signUpSchema.js";
import { signInSchema } from "../schemas/signInSchema.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSignIn, postSignUp } from "../controllers/signControllers.js";

const signRouter = Router();

signRouter.post('/sign-up', validateSchema(signUpSchema), postSignUp);
signRouter.post('/sign-in'  , validateSchema(signInSchema), postSignIn);

export default signRouter;