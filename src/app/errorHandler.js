const errorTypes = require("../constants/error-types");

function errorHandler(err, ctx) {
  let message, status;
  switch (err.message) {
    case errorTypes.NAME_OR_PASSWORD_IS_REQUIRED:
      status = 400;
      message = "用户名或密码为空";
      break;
    case errorTypes.USER_ALREADY_EXISTS:
      status = 409;
      message = "账号已存在";
      break;
    case errorTypes.USER_DOES_NOT_EXISTS:
      status = 400;
      message = "用户名不存在";
      break;
    case errorTypes.PASSWORD_IS_INCORRENT:
      status = 400;
      message = "密码错误";
      break;
    case errorTypes.UNVERIFYOTOKEN:
      status = 401;
      message = "失效的token~";
      break;
    case errorTypes.UNPERMISSION:
      status = 401;
      message = "您没有权限~";
      break;
    default:
      status = 404;
      message = "Not found";
  }
  ctx.status = status;
  ctx.body = message;
}

module.exports = errorHandler;
