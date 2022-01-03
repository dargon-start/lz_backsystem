const router = require("koa-router");

const {create, list} = require("../controller/label.contrlol");
const {verfigAuth, verfigPermission} = require("../middleware/auth.middleware");

const labelRouter = new router({prefix: "/label"});

labelRouter.post("/", verfigAuth, create);
labelRouter.get("/", list);

module.exports = labelRouter;
