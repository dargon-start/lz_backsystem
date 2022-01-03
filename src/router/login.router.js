const router = require("koa-router");

const {login, success} = require("../controller/auth.control");
const {verifyLogin, verfigAuth} = require("../middleware/auth.middleware");

const loginRouter = new router({prefix: "/login"});

loginRouter.post("/", verifyLogin, login);

loginRouter.get("/test", verfigAuth, success);

module.exports = loginRouter;
