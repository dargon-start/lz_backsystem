const service = require("../service/file.service");
const {APP_HOST, APP_PORT} = require("../app/config");
const userService = require("../service/user.service");
class file {
  async saveAvatar(ctx, next) {
    //获取图片信息
    const {filename, mimetype, size} = ctx.req.file;
    const {id} = ctx.user;
    //将图片信息保存到数据库
    const result = await service.create(filename, mimetype, size, id);
    console.log(result);
    //将图片url保存到user表中
    const avatarUrl = `${APP_HOST}:${APP_PORT}/user/${id}/avatar`;
    const av = await userService.updateAvatarByid(avatarUrl, id);

    ctx.body = "上传头像成功";
  }
  async savePicture(ctx, next) {
    console.log("获取文件信息");
    //获取文件信息
    const files = ctx.req.files;
    const {id} = ctx.user;
    const {momentId} = ctx.query;
    for (let file of files) {
      const {filename, mimetype, size} = file;
      await service.createFile(filename, mimetype, size, id, momentId);
    }
    ctx.body = "动态图片上传成功";
  }
}

module.exports = new file();
