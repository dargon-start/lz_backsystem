const fs = require("fs");
const service = require("../service/user.service.js");
const fileservice = require("../service/file.service");
const {AVATAR_PATH} = require("../constants/file-path");
class UserController {
  async create(ctx, next) {
    //获取数据
    const user = ctx.request.body;

    //操作数据库
    const result = await service.create(user);

    //响应数据
    ctx.body = "用户创建成功！";
  }

  async avatarInfo(ctx, next) {
    const {userId} = ctx.params;
    const avatarinfo = await fileservice.getAvatarInfoById(userId);
    console.log(avatarinfo);

    ctx.response.set("content-type", avatarinfo.mimetype);
    ctx.body = fs.createReadStream(`${AVATAR_PATH}/${avatarinfo.filename}`);
  }
}

module.exports = new UserController();
