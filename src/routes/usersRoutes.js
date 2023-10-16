import { Router } from "express";
import { signUpSchema } from "../schemas/signUpSchema.js";
import { signInSchema } from "../schemas/signInSchema.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { postSignIn } from "../controllers/signControllers.js";
import { authValidate } from "../middlewares/authValidate.js";
import { signOut } from "../controllers/signOutControllers.js";
import { postSignUp } from "../controllers/signUpControllers.js";

const signRouter = Router();

signRouter.post('/sign-up', validateSchema(signUpSchema), postSignUp);
signRouter.post('/sign-in'  , validateSchema(signInSchema), postSignIn);
signRouter.delete('/sign-out'  , authValidate, signOut);

export default signRouter;