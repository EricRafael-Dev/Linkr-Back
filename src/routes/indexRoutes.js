import { Router } from "express";
import signUpRouter from "./usersRoutes.js";

const router = Router();

router.use(signUpRouter);

export default router;