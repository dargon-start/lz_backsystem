const router = require("koa-router");

const {verifyUser, handPassword} = require("../middleware/user.middleware");
const {create, avatarInfo} = require("../controller/user.control");

const userRouter = new router({prefix: "/user"});
//verifyUse规范用户名
//handPassword对密码进行加密
userRouter.post("/", verifyUser, handPassword, create);
//获取头像
userRouter.get("/:userId/avatar", avatarInfo);


module.exports = userRouter;
