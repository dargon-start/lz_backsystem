const connection = require("../app/database");

class moment {
  async create(userId, content) {
    const statement = `INSERT INTO moment (content,user_id) VALUES (?,?);`;

    const [result] = await connection.execute(statement, [content, userId]);

    return result;
  }

  async getMoment(momentId) {
    // const statement = `SELECT m.id momentId ,m.content content , m.creatat createTime,m.updateat updateTime,JSON_OBJECT('id',u.id,'name',u.name) author FROM moment m LEFT JOIN users u on m.user_id=u.id WHERE m.id=?;`;
    //同时获取该动态的评论信息
    const statement = `
    SELECT 
      m.id momentId ,m.content content , m.creatat createTime,m.updateat updateTime,JSON_OBJECT("id",u.id,"name",u.name,'avatar',u.avatar_url) user ,
      IF(COUNT(c.id),JSON_ARRAYAGG(JSON_OBJECT('id',c.id,'content',c.content,'user',JSON_OBJECT('id',cu.id,'name',cu.name,"avatar",cu.avatar_url),'commentId',c.comment_id)),NULL) clist,
      (SELECT IF(COUNT(l.id),JSON_ARRAYAGG(JSON_OBJECT('id',l.id,'name',l.name)),NULL)  FROM moment_label ml LEFT JOIN label l ON ml.label_id = l.id WHERE ml.moment_id = m.id) labelList,
      (SELECT JSON_ARRAYAGG(CONCAT('http://localhost:8000/moment/images/',file.filename)) FROM file WHERE file.moment_id = m.id) imgs
      FROM moment m LEFT JOIN users u ON m.user_id = u.id
      LEFT JOIN comment c ON c.moment_id= m.id 
      LEFT JOIN users cu ON cu.id = c.user_id 
      WHERE m.id =? GROUP BY m.id;`;
    const [result] = await connection.execute(statement, [momentId]);

    return result[0];
  }

  async getList(offset, size) {
    const statement = `SELECT m.id momentId ,m.content content , m.creatat createTime,m.updateat updateTime,JSON_OBJECT("id",u.id,"name",u.name) user 
    ,(SELECT COUNT(*) FROM comment c WHERE c.moment_id = m.id ) commentCount,
    (SELECT COUNT(*) FROM moment_label ml WHERE ml.moment_id =m.id) labelCount
     FROM moment m LEFT JOIN users u on m.user_id=u.id LIMIT ? ,?;`;

    const [result] = await connection.execute(statement, [offset, size]);

    return result;
  }

  async updateMoment(content, momentId) {
    const statement = `UPDATE moment SET content=? WHERE id = ?;`;

    const [result] = await connection.execute(statement, [content, momentId]);

    return result;
  }

  async removeMoment(momentId) {
    const statement = `DELETE FROM moment WHERE id = ?;`;

    const [result] = await connection.execute(statement, [momentId]);

    return result;
  }

  async hasLabel(momentId, lableId) {
    const statement = `SELECT * FROM moment_label WHERE moment_id = ? AND label_id =?;`;

    const [result] = await connection.execute(statement, [momentId, lableId]);
    return result[0] ? true : false;
  }

  async addLabel(momentId, labelId) {
    const statement = `INSERT INTO moment_label (moment_id,label_id) VALUES (?,?);`;

    const [result] = await connection.execute(statement, [momentId, labelId]);

    return result;
  }
}

module.exports = new moment();
