const router = require("koa-router");
const {
  create,
  getMoment,
  getMonentList,
  update,
  remove,
  addLabels,
  fileInfo,
} = require("../controller/moment.control.js");
const {verfigAuth, verfigPermission} = require("../middleware/auth.middleware");
const momentRouter = new router({prefix: "/moment"});
const {verfigisLabelExist} = require("../middleware/label.middleware");

momentRouter.post("/", verfigAuth, create);
//获取单条数据
momentRouter.get("/:momentId", getMoment);
//获取多条数据
momentRouter.get("/", getMonentList);
//修改动态
momentRouter.patch("/:momentId", verfigAuth, verfigPermission, update);
//删除动态
momentRouter.delete("/:momentId", verfigAuth, verfigPermission, remove);

//给动态添加标签
momentRouter.post(
  "/:momentId/labels",
  verfigAuth,
  verfigPermission,
  verfigisLabelExist,
  addLabels
);

//动态配图
momentRouter.get("/images/:filename", fileInfo);
module.exports = momentRouter;
