const service = require("../service/moment.service");
const fileservice = require("../service/file.service");
const {AVATAR_PATH, PICTURE_PATH} = require("../constants/file-path");
const fs = require("fs");
class createMoment {
  async create(ctx, next) {
    //1.获取用户id，要知道是那个用户发表动态
    const userId = ctx.user.id;
    //2.获取内容
    const content = ctx.request.body.content;
    //2.创建动态，保存到数据库
    const result = service.create(userId, content);

    ctx.body = result;
  }

  //获取单个动态
  async getMoment(ctx, next) {
    const momentId = ctx.request.params.momentId;
    const result = await service.getMoment(momentId);
    ctx.body = result;
  }
  //获取动态列表
  async getMonentList(ctx, next) {
    //获取偏移量和大小
    const {offset, size} = ctx.request.query;
    const result = await service.getList(offset, size);
    ctx.body = result;
  }
  //更新动态
  async update(ctx, next) {
    const {momentId} = ctx.request.params;
    const {content} = ctx.request.body;

    const result = await service.updateMoment(content, momentId);

    ctx.body = result;
  }
  //移除动态
  async remove(ctx, next) {
    const {momentId} = ctx.request.params;
    const result = await service.removeMoment(momentId);
    ctx.body = result;
  }

  //添加标签
  async addLabels(ctx, next) {
    const {labels} = ctx;
    const {momentId} = ctx.request.params;
    console.log(labels, momentId);
    for (const label of labels) {
      const isexist = await service.hasLabel(momentId, label.id);
      if (!isexist) {
        //不存在
        const result = await service.addLabel(momentId, label.id);
        console.log(result);
      }
    }
    //查看此动态是否有标签
    ctx.body = "添加标签成功";
  }

  //获取动态图片
  async fileInfo(ctx, next) {
    let {filename} = ctx.params;
    const {type} = ctx.query;
    const fileinfo = await fileservice.getFileByname(filename);
    const fileTypes = ["small", "middle", "large"];
    if (fileTypes.some((item) => item === type)) {
      filename = filename + "-" + type;
    }

    //设置相应类型
    ctx.response.set("content-type", fileinfo.mimetype);
    //返回一个流文件
    ctx.body = fs.createReadStream(`${PICTURE_PATH}/${filename}`);
  }
}

module.exports = new createMoment();
