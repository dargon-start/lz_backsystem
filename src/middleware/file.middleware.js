const multer = require("koa-multer");
const Jimp = require("jimp");

const {AVATAR_PATH, PICTURE_PATH} = require("../constants/file-path");
const path = require("path");

const storageA = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, AVATAR_PATH);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const storageP = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, PICTURE_PATH);
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname));
  },
});

const avatarUpload = multer({
  storage: storageA,
});
const pictureUpload = multer({
  storage: storageP,
});

const handleAvatar = avatarUpload.single("avatar");

const handlePicture = pictureUpload.array("picture", 9);

const pictureResize = async (ctx, next) => {
  const files = ctx.req.files;
  console.log(files);
  try {
    for (const file of files) {
      const destpath = path.join(file.destination, file.filename);
      Jimp.read(file.path).then((img) => {
        img.resize(1280, Jimp.AUTO).write(`${destpath}-large`);
        img.resize(640, Jimp.AUTO).write(`${destpath}-middle`);
        img.resize(320, Jimp.AUTO).write(`${destpath}-small`);
      });
    }
    await next();
  } catch (error) {
    console.log(error);
  }
};

module.exports = {
  handleAvatar,
  handlePicture,
  pictureResize,
};
