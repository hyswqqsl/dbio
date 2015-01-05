package org.mjava.dbio.dataBase.info;

import java.sql.SQLException;
import java.sql.PreparedStatement;

/**
 * Describe class RichtextField here.
 *
 *
 * Created: Wed Sep  4 17:11:59 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class RichtextField extends BaseField 
{

  /**
   * 设置黙认构造函数不可用
   *
   */
  private RichtextField()
  {
  }

  /**
   * Creates a new <code>RichtextField</code> instance.
   *
   * @param rowInfo a <code>RowInfo</code> value
   * @param cod an <code>int</code> value
   * @param name a <code>String</code> value
   * @param value a <code>String</code> value
   * @exception NullPointerException if an error occurs
   */
  public RichtextField(RowInfo rowInfo, int cod, String name, String value) 
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
      throw new NullPointerException(String.format("建立表%s下第%d行第%d列富文本型字段出错，字段名：%s，值：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow()+0x01, this.cod+0x01, name, value));
    }
    this.name = name;
    this.textValue = doRichtext(value);
    this.numValue = 0x00;
    this.type = Type.richtext;
  }

  /**
   * 将图片路径转换为富文本.
   *
   * @param value a <code>String</code> value
   */
  private String doRichtext(String value)
  {
    String[] strs = value.split(",");
    StringBuilder sb = new StringBuilder();
    for (String str : strs)
    {
      sb.append("<img src=\"");
      sb.append(str);
      sb.append("\" />");
      sb.append("\n");
    }
    return sb.toString();
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
