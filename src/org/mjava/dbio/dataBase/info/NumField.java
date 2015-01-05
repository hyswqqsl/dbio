package org.mjava.dbio.dataBase.info;

import org.mjava.dbio.dataBase.info.BaseField.Type;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 数值类型字段类
 *
 *
 * Created: Tue Aug 20 15:56:04 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class NumField extends BaseField 
{
  /**
   * 设置黙认构造函数不可用
   */
  private NumField()
  {
  }
  
  /**
   * Creates a new <code>NumField</code> instance.
   *
   */
  public NumField(RowInfo rowInfo, int cod, String name, String value)
  {
    if (rowInfo==null) {
      throw new NullPointerException("构建字段出错，行信息为空！");
    }
    this.rowInfo = rowInfo;
    this.cod = cod;
    if (name==null || value==null) {
      throw new NullPointerException(String.format("构建表%s下第%d行第%d列数值型字段出错，字段名：%s，值：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow(), this.cod+0x01, name, value));
    }
    this.name = name;
    this.textValue = value;
    try {
      this.numValue = Long.valueOf(value);      
    } catch (NumberFormatException e) {
      String info = String.format("构建表%s下第%d行第%d列数值型字段出错，字段名：%s，值：%s", 
                                                    rowInfo.getTableName(), rowInfo.getRow(), this.cod+0x01, name, value);
      logger.info(info);
      throw new NumberFormatException(info);
    }
    this.type = Type.num;
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
