package org.mjava.dbio.dataBase.info;

import java.sql.SQLException;
import java.sql.PreparedStatement;

/**
 * Describe class BoolField here.
 *
 *
 * Created: Wed Sep  4 16:34:03 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class BoolField extends BaseField 
{

  /**
   * 设置黙认构造函数不可用
   *
   */
  private BoolField()
  {
  }

  /**
   * Creates a new <code>BoolField</code> instance.
   *
   * @param rowInfo a <code>RowInfo</code> value
   * @param cod an <code>int</code> value
   * @param name a <code>String</code> value
   * @param value a <code>String</code> value
   * @exception NullPointerException if an error occurs
   */
  public BoolField(RowInfo rowInfo, int cod, String name, String value)
    throws NullPointerException
  {
    if (rowInfo==null) {
      throw new NullPointerException("构建字段出错，行信息为空！");
    }
    this.rowInfo = rowInfo;
    this.cod = cod;
    if (name==null || value==null) {
      throw new NullPointerException(String.format("构建表%s下第%d行第%d列bool型字段出错，字段名：%s，值：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow(), this.cod+0x01, name, value));
    }
    this.name = name;
    this.textValue = value;
    if (value.equals("") || value.equals("1")) 
    {
      this.numValue = 1;
    }
    else
    {
      this.numValue = 0;
    }
    this.type = Type.bool;
  }

  @Override
  public void putInPs(PreparedStatement ps) 
    throws SQLException
  {
    if (ps==null) {
      return;
    }
    ps.setLong(this.cod+0x01, numValue);
  }  

}
