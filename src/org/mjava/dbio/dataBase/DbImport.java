package org.mjava.dbio.dataBase;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mjava.dbio.dataBase.description.TableDescription;
import org.mjava.dbio.dataBase.info.TableInfo;
import org.mjava.dbio.dataBase.parse.XmlParse;
import org.mjava.dbio.dataBase.util.TableInfoUtil;
import org.mjava.dbio.dataBase.util.Wait;
import java.io.FileNotFoundException;
import jxl.read.biff.BiffException;

/**
 * 数据库导入类.
 *
 *
 * Created: Wed Aug 28 16:45:53 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class DbImport implements Executeable
{

  // log
	protected final Log logger = LogFactory.getLog(getClass());
  
  /**
   * 数据库连接.
   */
  private Connection conn;

  /**
   * xml解析.
   *
   */
  private XmlParse xmlParse;

  /**
   * 表信息.
   * 
   */
  private List<TableInfo> tables;
  
  /**
   * 设置黙认构造函数不可用
   *
   */
  private DbImport()
  {
  }
 
  /**
   * Creates a new <code>DbImport</code> instance.
   *
   * @param fileName a <code>String</code> value
   * @exception Exception if an error occurs
   */
  public DbImport(String fileName) throws Exception
  {
    if (fileName==null)
    {
      throw new NullPointerException("构建数据库导入出错：fileName为空");
    }
    xmlParse = new XmlParse(fileName);
    // 解析xml
    xmlParse.doImportParse();
    // 建立数据库连接
    makeConn();
    // 建立表信息
    makeTableInfos();
  }

  /**
   * Get the <code>Conn</code> value.
   *
   * @return a <code>Connection</code> value
   */
  private void makeConn()
  {
    Connection conn = null;
    try {
      String driver_class = "com.mysql.jdbc.Driver";
      String connection_url = "jdbc:mysql://" + xmlParse.getDbServer() + ":3306/" +
        xmlParse.getDbName()+"?useUnicode=true&characterEncoding=utf-8";
      logger.debug(String.format("数据库连接字符串：%s", connection_url));
      Class.forName(driver_class);
      conn = DriverManager.getConnection(connection_url, xmlParse.getDbUserName(),
                                         xmlParse.getDbPassword());
      conn.setAutoCommit(false);
      logger.debug("数据库连接成功");
    } catch (Exception e) {
      e.printStackTrace();
    }
    this.conn = conn;
  }

  /**
   * 获取数据库连接.
   *
   * @return a <code>Connection</code> value
   */
  public final Connection getConn()
  {
    return this.conn;
  }

  /**
   * 构建表信息.
   *
   */
  private void makeTableInfos() throws FileNotFoundException, IOException, BiffException
  {
    TableDescription tableDescription = null;
    TableInfo tableInfo = null;
    tables = new ArrayList<TableInfo>();
    logger.info(String.format("构建表信息开始")); 
    for (int i=0; i<xmlParse.getTableDescriptionCount(); i++)
    {
        tableDescription = xmlParse.getTableDescription(i);
        tableInfo = TableInfoUtil.buildTableInfo(conn, tableDescription);
        tables.add(tableInfo);
    }
    logger.info(String.format("构建表信息成功")); 
}

/**
 * 导入或导出执行.
 *
 * @param param a <code>String</code> value
 * @exception Exception if an error occurs
 */
  public void execute(String param) throws Exception
  {
    if (param.equalsIgnoreCase("create") || param.equalsIgnoreCase("c"))
    {
      initDb();
    }
    for (int i=0; i<tables.size(); i++)
    {
      tables.get(i).importToDb();
    }
    this.conn.close();
  }
  
  /**
   * 数据库初始化.
   *
   */
  public final void initDb() throws IOException, InterruptedException
  {
    String cmd = xmlParse.getIoPath() + xmlParse.getInitSh();
    logger.info("执行脚本："+cmd);
    Process process = Runtime.getRuntime().exec(cmd);
    Thread wait = new Wait();
    wait.start();
    process.waitFor();
    System.out.print("\n");
    wait.stop();
    logger.info("数据库初始化成功!");
  }

  /**
   * 获取xml解析
   *
   * @return a <code>XmlParse</code> value
   */
  public XmlParse getXmlParse()
  {
    return this.xmlParse;
  }

  /**
   * 获取表信息
   *
   */ 
  public List<TableInfo> getTableInfos()
  {
    return this.tables;
  }
}
