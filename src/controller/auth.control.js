const jwt = require("jsonwebtoken");
const {PRIVATEKEY} = require("../app/config");

class authController {
  async login(ctx, next) {
    const {id, name} = ctx.user;
    //颁发token
    const token = jwt.sign({id, name}, PRIVATEKEY, {
      algorithm: "RS256",
      expiresIn: 60 * 60 * 24,
    });
    ctx.body = {
      id,
      name,
      token,
    };
  }

  async success(ctx, next) {
    ctx.body = "授权成功";
  }
}

module.exports = new authController();
