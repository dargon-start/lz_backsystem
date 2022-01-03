const koa = require("koa");
const bodyparse = require("koa-bodyparser");

const userRouter = require("../router/user.router");
const loginRouter = require("../router/login.router");
const errorHandler = require("./errorHandler");
const fileRoutes = require("../router/index");

const app = new koa();

app.fileRoutes = fileRoutes;
app.use(bodyparse());
app.fileRoutes();

//监听错误，处理错误
app.on("error", errorHandler);

module.exports = app;
