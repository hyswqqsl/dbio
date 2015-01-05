package org.mjava.dbio.dataBase.info;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import java.io.Serializable;
import java.sql.PreparedStatement;
import org.mjava.dbio.dataBase.info.BaseField.Type;
import java.sql.SQLException;

/**
 * 字段基类
 *
 *
 * Created: Tue Aug 20 14:45:32 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public abstract class BaseField implements Serializable 
{

  /**
   * 行信息.
   */
  protected RowInfo rowInfo;

  /**
   * 列号.
   */
  protected int cod;

  // log
	protected final Log logger = LogFactory.getLog(getClass());

	/**
	 * 数值类型名，黙认是文本类型，用于配制文件比较
	 */
  // 文本
  public static final String TEXT_TYPE_NAME = "text";
  // 数值
  public static final String NUM_TYPE_NAME = "num";
  // bool
  public static final String BOOL_TYPE_NAME = "bool";
  // 富文本
  public static final String RICHTEXT_TYPE_NAME = "richtext";
  // 密码
  public static final String ENCRYP_TYPE_NAME = "encryp";
  // 日期
  public static final String DATE_TYPE_NAME = "date";

  public enum Type {
    // 文本， 数值， bool, 富文本, 密码, 日期，空
    text, num, bool, richtext, encryp, date, empty
  }

  /**
   * 字段类型
   */
  protected Type type;

  // 数值信息
  protected long numValue;

  // 文本信息
  protected String textValue;

  // 字段名
  protected String name;

  /**
   * 返回数值信息
   *
   * @return a <code>long</code> value
   */
  public long getNumValue() {
    return numValue;
  }
  
  /**
   * 返回文本信息
   *
   * @return a <code>Strng</code> value
   */
  public String getTextVlaue() {
    return textValue;
  }

  /**
   * 获取字段名
   *
   * @return a <code>String</code> value
   */
  public final String getName()
  {
    return name;
  }

  /**
   * Get the <code>RowInfo</code> value.
   *
   * @return a <code>RowInfo</code> value
   */
  public final RowInfo getRowInfo()
  {
    return rowInfo;
  }

  /**
   * Get the <code>Col</code> value.
   *
   * @return an <code>int</code> value
   */
  public final int getCol()
  {
    return cod;
  }

  /**
   * Get the <code>Type</code> value.
   *
   * @return a <code>Type</code> value
   */
  public final Type getType()
  {
    return type;
  }
  
  /**
   * 字段加入到预编译的sql语句
   *
   * @param ps a <code>PreparedStatement</code> value
   */
  public void putInPs(PreparedStatement ps) 
    throws SQLException
  {
    throw new SQLException();
  }
}
