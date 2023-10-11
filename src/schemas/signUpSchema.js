import Joi from "joi";

export const signUpSchema = Joi.object({
    email: Joi.string().email().trim().required(),
    password: Joi.string().min(3).required(),
    username: Joi.string().required(),
    photo: Joi.string().uri().trim().required()
});