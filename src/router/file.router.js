const router = require("koa-router");
const {
  handleAvatar,
  handlePicture,
  pictureResize,
} = require("../middleware/file.middleware");
const {saveAvatar, savePicture} = require("../controller/file.control");
const {verfigAuth} = require("../middleware/auth.middleware");
const fileRouter = new router({prefix: "/upload"});

//上传头像
fileRouter.post("/avatar", verfigAuth, handleAvatar, saveAvatar);
fileRouter.post(
  "/picture",
  verfigAuth,
  handlePicture,
  pictureResize,
  savePicture
);
module.exports = fileRouter;
