import { Router } from "express";
import signRouter from "./usersRoutes.js";

const router = Router();

router.use(signRouter);

export default router;