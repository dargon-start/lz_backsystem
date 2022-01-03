const service = require("../service/label.service");

class labelControl {
  async create(ctx, next) {
    const {name} = ctx.request.body;
    const result = await service.create(name);

    ctx.body = result;
  }

  async list(ctx, next) {
    const {limit, offset} = ctx.query;
    const result = await service.getLabels(offset, limit);
    ctx.body = result;
  }
}

module.exports = new labelControl();
