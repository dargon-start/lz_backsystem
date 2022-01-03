const service = require("../service/comment.service");

class commentControl {
  async create(ctx, next) {
    const {content, momentId} = ctx.request.body;
    const userId = ctx.user.id;
    //添加评论
    const result = await service.create(momentId, content, userId);
    ctx.body = result;
  }

  //回复评论
  async reply(ctx, next) {
    const {content, momentId} = ctx.request.body;
    const userId = ctx.user.id;
    const {commentId} = ctx.request.params;
    //添加评论
    const result = await service.reply(momentId, content, userId, commentId);
    ctx.body = result;
  }
  //修改评论
  async update(ctx, next) {
    const {commentId} = ctx.request.params;
    const {content} = ctx.request.body;
    const result = await service.update(content, commentId);
    ctx.body = result;
  }
  //删除评论
  async remove(ctx, next) {
    const {commentId} = ctx.request.params;
    const result = await service.remove(commentId);
    ctx.body = result;
  }
  //获取评论列表
  async getCommentList(ctx, next) {
    const {momentId} = ctx.request.query;
    const result = await service.getCommentList(momentId);
    ctx.body = result;
  }
}

module.exports = new commentControl();
