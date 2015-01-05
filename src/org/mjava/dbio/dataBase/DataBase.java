package org.mjava.dbio.dataBase;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.sql.SQLException;
import java.io.IOException;

/**
 * 数据层入口.
 * 单例模式.
 *
 * Created: Thu Aug 22 14:57:13 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class DataBase
{

  // log
	protected final Log logger = LogFactory.getLog(getClass());
  
  /**
   * 数据库导入/导出.
   *
   */ 
  private Executeable execute;

  /**
   * 单例.
   *
   */
  private static DataBase instance = null;
  public static String xmlFileName;
  public static String order;

  /**
   * 设置黙认构造函数不可用
   *
   */
  private DataBase() throws Exception
  {
    if (order==null)
    {
      execute = new DbImport(xmlFileName);
      return;
    }
    if (order.equalsIgnoreCase("export") ||
        order.equalsIgnoreCase("e"))
    {
      execute = new DbExport(xmlFileName);
    }
    else
    {
      execute = new DbImport(xmlFileName);
    }
  }

  /**
   * 单例.
   *
   * @return a <code>DataBase</code> value
   */
  public static DataBase getInstance() throws Exception
  {
    if (instance==null) {
      instance = new DataBase();
    }
    return instance;
  }

  /**
   * Describe <code>getExecute</code> method here.
   *
   * @return an <code>Executeable</code> value
   */
  public Executeable getExecute()
  {
    return this.execute;
  }
  
}
