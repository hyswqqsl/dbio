package org.mjava.dbio.dataBase.info;

import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.logging.Log;
import java.sql.SQLException;
import org.mjava.dbio.dataBase.description.TableDescription;
import java.io.IOException;
import java.io.FileNotFoundException;

/**
 * 表信息类
 *
 *
 * Created: Tue Aug 20 14:17:10 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TableInfo
{

  // log
	protected final Log logger = LogFactory.getLog(getClass());

  /**
   * 数据库连接.
   */
  private Connection conn;
  
  /**
   * 表描述.
   *
   */
  private TableDescription tableDescription;

  /**
   * 列信息list.
   */
  private List<RowInfo> rowInfos;

  /**
   * 设置黙认构造函数不可用
   */
  private TableInfo() 
  {
  }

  /**
   * Creates a new <code>TableInfo</code> instance.
   *
   */
  public TableInfo(Connection conn, TableDescription tableDescription)
    throws NullPointerException, FileNotFoundException, IOException
  {
    if (conn==null || tableDescription==null)
    {
      throw new NullPointerException(String.format("建立表信息出错，库连接：%s 表描述对象：%s", 
                                                   conn, tableDescription));
    }
    logger.debug(String.format("建立表信息成功，库连接：%s 表描述对象：%s", 
                               conn, tableDescription));
    this.conn = conn;
    this.tableDescription = tableDescription;
    logger.debug(String.format("从表描述对象中获取到 表名：%s data文件路径：%s", 
                               tableDescription.getTableName(), tableDescription.getDataFileName()));
    rowInfos = new ArrayList<RowInfo>();
  }

  /**
   * Get the <code>Conn</code> value.
   *
   * @return a <code>Connection</code> value
   */
  public final Connection getConn()
  {
    return this.conn;
  }

  public final TableDescription getTableDescription()
  {
    return this.tableDescription;
  }

  /**
   * Get the <code>TableName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getTableName()
  {
    return this.tableDescription.getTableName();
  }

  /**
   * Get the <code>ExeclName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDataFileName()
  {
    return this.tableDescription.getDataFileName();
  }

  /**
   * Get the <code>RowInfos</code> value.
   *
   * @return a <code>List<RowInfo></code> value
   */
  public final List<RowInfo> getRowInfos()
  {
    return rowInfos;
  }
  
  /**
   * 获得行数
   *
   * @return an <code>int</code> value
   */
  public int getRowInfosCount() 
  {
    return rowInfos.size();
  }

  /**
   * Describe <code>addRowInfo</code> method here.
   *
   * @param rowInfo a <code>RowInfo</code> value
   */
  public void addRowInfo(RowInfo rowInfo)
  {
    if (rowInfo==null)
    {
      return;
    }
    this.rowInfos.add(rowInfo);
  }

  /**
   * 导入到数据库
   */
  public void importToDb() throws SQLException
  {
    logger.info(String.format("表%s数据开始导入.....", tableDescription.getTableName()));
    if (rowInfos.size()<=0x00)
    {
      logger.info(String.format("表%s无数据，导入结束！", tableDescription.getTableName()));
      return;
    }
    // 构建sql串
    String sqlStr = rowInfos.get(0x00).buildSql();
    // 构建预编译的sql语句
    PreparedStatement ps = conn.prepareStatement(sqlStr);
    for (RowInfo rowInfo : rowInfos)
    {
      rowInfo.buildPreparedSatement(ps);
    }
    // 导入
    ps.executeBatch();
    conn.commit();
    logger.info(String.format("表%s，%d行数据导入成功", tableDescription.getTableName(), rowInfos.size()));
    // 关闭预编译的sql语句
    if (ps != null)
    {	
      ps.close();
    }
  }

}
