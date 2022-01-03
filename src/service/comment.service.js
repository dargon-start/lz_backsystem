const connection = require("../app/database");

class Comment {
  //评论
  async create(momentId, content, userId) {
    return await devide(content, momentId, userId);
  }
  //回复评论
  async reply(momentId, content, userId, commentId) {
    return await devide(content, momentId, userId, commentId);
  }
  //修改评论
  async update(content, commentId) {
    const statement = `UPDATE comment SET content = ? WHERE id = ?;`;
    const [result] = await connection.execute(statement, [content, commentId]);
    return result;
  }
  //删除评论
  async remove(commentId) {
    const statement = `DELETE FROM comment WHERE id = ?;`;
    const [result] = await connection.execute(statement, [commentId]);
    return result;
  }
  //获取一个动态下的所有评论
  async getCommentList(momentId) {
    const statement = `SELECT c.id,c.content, JSON_OBJECT('id',u.id,'name',u.name) user FROM comment c 
                      LEFT JOIN users u ON c.user_id = u.id
                      WHERE moment_id = ?;`;
    const [result] = await connection.execute(statement, [momentId]);
    return result;
  }
}

async function devide(...args) {
  let statement;
  if (args.length == 4) {
    statement = `INSERT INTO comment (content,moment_id,user_id,comment_id) VALUES (?,?,?,?);`;
  } else if (args.length == 3) {
    statement = `INSERT INTO comment (content,moment_id,user_id) VALUES (?,?,?);`;
  }
  const [result] = await connection.execute(statement, args);
  return result;
}

module.exports = new Comment();
