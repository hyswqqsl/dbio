package org.mjava.dbio.dataBase.info;

import org.mjava.dbio.dataBase.info.BaseField.Type;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormatterBuilder;
import org.joda.time.format.DateTimeParser;
import java.sql.SQLException;
import java.sql.PreparedStatement;


/**
 * Describe class DateField here.
 *
 *
 * Created: Mon Sep  9 15:54:52 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class DateField extends BaseField 
{

  private static DateTimeFormatter formatter;

  static {
    DateTimeParser[] parsers = {
      DateTimeFormat.forPattern("dd MM yyyy HH:mm:SS").getParser(),
      DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:SS").getParser(),
      DateTimeFormat.forPattern("yyyy-MM-dd HH:mm").getParser(),
      DateTimeFormat.forPattern("yyyy-MM-dd HH").getParser(),
      DateTimeFormat.forPattern("yyyy-MM-dd").getParser(),
      DateTimeFormat.forPattern("MM/dd/yy HH:mm").getParser(),
      DateTimeFormat.forPattern("yyyy-MM-dd HH-mm-SS").getParser() };
    // 可增加新的格式化字符串
    formatter = new DateTimeFormatterBuilder().append( null, parsers ).toFormatter();
  }  

  /**
   * 设置黙认构造函数不可用
   */
  private DateField()
  {
  }

  /**
   * Creates a new <code>DateField</code> instance.
   *
   * @param rowInfo a <code>RowInfo</code> value
   * @param cod an <code>int</code> value
   * @param name a <code>String</code> value
   * @param value a <code>String</code> value
   */
  public DateField(RowInfo rowInfo, int cod, String name, String value)
  {
    if (rowInfo==null) {
      throw new NullPointerException("构建字段出错，行信息为空！");
    }
    this.rowInfo = rowInfo;
    this.cod = cod;
    if (name==null || value==null) {
      throw new NullPointerException(String.format("构建表%s下第%d行第%d列日期型字段出错，字段名：%s，值：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow(), this.cod+0x01, name, value));
    }
    this.name = name;
    this.numValue = 0L;
    DateTime dateTime = null;
    dateTime = formatter.parseDateTime(value);
    this.textValue = dateTime.toDate().toLocaleString();
    this.type = Type.date;
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
