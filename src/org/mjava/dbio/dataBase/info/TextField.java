package org.mjava.dbio.dataBase.info;

import org.mjava.dbio.dataBase.info.BaseField.Type;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 文本类型字段类
 *
 *
 * Created: Tue Aug 20 15:17:34 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TextField extends BaseField 
{
  /**
   * 设置黙认构造函数不可用
   */
  private TextField()
  {
  }

  /**
   * Creates a new <code>TextField</code> instance.
   *
   */
  public TextField(RowInfo rowInfo, int cod, String name, String value) 
    throws NullPointerException
  {
    if (rowInfo==null) {
      throw new NullPointerException("建立字段出错，行信息为空！");
    }
    // 行信息
    this.rowInfo = rowInfo;
    // 列号
    this.cod = cod;
    if (name==null || value==null) {
      throw new NullPointerException(String.format("建立表%s下第%d行第%d列文本型字段出错，字段名：%s，值：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow()+0x01, this.cod+0x01, name, value));
    }
    this.name = name;
    this.textValue = value;
    this.numValue = 0x00;
    this.type = Type.text;
  }

  @Override
  public void putInPs(PreparedStatement ps) 
    throws SQLException
  {
    if (ps==null) {
      return;
    }
    ps.setString(this.cod+0x01, textValue);
  }  

}
