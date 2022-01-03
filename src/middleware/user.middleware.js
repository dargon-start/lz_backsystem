const errorTypes = require("../constants/error-types");
const service = require("../service/user.service");
const md5password = require("../utils/handPwd");

async function verifyUser(ctx, next) {
  //1.获取用户名和密码
  const {name, password} = ctx.request.body;
  //判断用户名和密码是否为空
  if (!name || !password) {
    const error = new Error(errorTypes.NAME_OR_PASSWORD_IS_REQUIRED);
    return ctx.app.emit("error", error, ctx);
  }
  //用户名已经存在
  const result = await service.getUserbyName(name);
  if (result.length) {
    const error = new Error(errorTypes.USER_ALREADY_EXISTS);
    return ctx.app.emit("error", error, ctx);
  }
  await next();
}
//对密码进行加密
async function handPassword(ctx, next) {
  let {password} = ctx.request.body;
  //对传过来的密码转为字符串
  password = password.toString();
  ctx.request.body.password = md5password(password);

  await next();
}
module.exports = {
  verifyUser,
  handPassword,
};
