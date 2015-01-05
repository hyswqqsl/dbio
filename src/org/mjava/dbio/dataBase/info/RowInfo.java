package org.mjava.dbio.dataBase.info;

import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * 表的行信息类
 *
 *
 * Created: Wed Aug 21 15:07:48 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class RowInfo
{

  // log
	protected final Log logger = LogFactory.getLog(getClass());

  /**
   * 对应的表信息.
   */
  private TableInfo tableInfo;

  /**
   * 行号.
   */
  private int cod;

  /**
   * 字段list.
   */
  private List<BaseField> fields;

  /**
   * 设置黙认构造函数不可用
   *
   */
  private RowInfo()
  {
  }
  
  /**
   * 构造函数
   *
   * @param tableInfo a <code>TableInfo</code> value
   * @exception NullPointerException if an error occurs
   */
  public RowInfo(TableInfo tableInfo, int cod)
    throws NullPointerException
  {
    if (tableInfo==null) {
      throw new NullPointerException();
    }
    this.tableInfo = tableInfo;
    this.cod = cod;
    fields = new ArrayList<BaseField>();
  }

  /**
   * Get the <code>TableInfo</code> value.
   *
   * @return a <code>TableInfo</code> value
   */
  public final TableInfo getTableInfo()
  {
    return tableInfo;
  }

  /**
   * Get the <code>Fields</code> value.
   *
   * @return a <code>List<BaseField></code> value
   */
  public final List<BaseField> getFields()
  {
    return fields;
  }

  /**
   * 添加字字段.
   *
   * @param field a <code>BaseField</code> value
   */
  public void addField(BaseField field)
  {
    if (field==null)
      {
        return;
      }
    fields.add(field);
  }
  
  /**
   * 获得列数
   *
   * @return an <code>int</code> value
   */
  public int getColCount() 
  {
    return fields.size();
  }

  /**
   * Get the <code>Cod</code> value.
   *
   * @return an <code>int</code> value
   */
  public final int getRow()
  {
    return cod;
  }
  
  /**
   * 获得表名
   *
   * @return a <code>String</code> value
   */
  public String getTableName() 
  {
    return this.tableInfo.getTableName();
  }

	/**
   * 构建预编译的sql语句
   *
   * @return a <code>String</code> value
   */
  public void buildPreparedSatement(PreparedStatement ps)
    throws SQLException
  {
    if (ps==null) {
      throw new SQLException("传入的ps为空");
    }
    for (int i=0; i<fields.size(); i++) {
      fields.get(i).putInPs(ps);
    }
    logger.debug("构建预编译的sql语句："+ps);
    ps.addBatch();
  }
  
  /**
   * 构建sql串
   *
   * @return a <code>String</code> value
   */
  public String buildSql()
  {
		String colSql = "";
		String colValue = "";

    // 生成字段名
		for (int i = 0; i < fields.size(); i++) {
			colSql = colSql + "`" + fields.get(i).getName() + "`,";
			colValue = colValue + "" + "?,";
		}
    String result = "insert into " + this.tableInfo.getTableName() + " ("
				+ colSql.substring(0, colSql.lastIndexOf(",")) + ")values("
				+ colValue.substring(0, colValue.lastIndexOf(",")) + ")";
    logger.debug("生成sql串："+result);
    return result;
	}

}


