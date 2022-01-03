const router = require("koa-router");

const {
  create,
  reply,
  remove,
  update,
  getCommentList,
} = require("../controller/comment.control");

const {verfigPermission} = require("../middleware/auth.middleware");
const {verfigAuth} = require("../middleware/auth.middleware");

const commentRouter = new router({prefix: "/comment"});

//评论要验证是否登录
commentRouter.post("/", verfigAuth, create);
//回复评论
commentRouter.post("/:commentId/reply", verfigAuth, reply);
//删除评论
commentRouter.delete("/:commentId", verfigAuth, verfigPermission, remove);
//修改评论
//需要验证是否有权限修改
commentRouter.patch("/:commentId", verfigAuth, verfigPermission, update);
//获取评论列表
commentRouter.get("/", getCommentList);

module.exports = commentRouter;
