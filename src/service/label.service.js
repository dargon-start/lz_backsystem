const connection = require("../app/database");

class label {
  async create(name) {
    const statement = `INSERT INTO label (name) VALUES(?);`;
    const [result] = await connection.execute(statement, [name]);
    return result;
  }
  //搜索标签
  async select(name) {
    const statement = `SELECT * FROM label WHERE name=?;`;
    const [result] = await connection.execute(statement, [name]);
    return result[0];
  }

  //getLabels
  async getLabels(offset, limit) {
    const statement = `SELECT * FROM label LIMIT ?,?;`;
    const [result] = await connection.execute(statement, [offset, limit]);
    return result;
  }
}

module.exports = new label();
