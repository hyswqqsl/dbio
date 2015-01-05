package org.mjava.dbio.dataBase.info;

import junit.framework.TestCase;
import org.mjava.dbio.dataBase.parse.XmlParse;
import junit.framework.Assert;
import jxl.read.biff.BiffException;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;

/**
 * 表信息测试.
 *
 *
 * Created: Fri Aug 23 17:12:33 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TableInfoTest extends TestCase 
{
  private static XmlParse xmlParse = null; 

  /**
   * Describe <code>setUp</code> method here.
   *
   * @exception Exception if an error occurs
   */
  @Override
  public final void setUp() throws Exception
  {
    if (xmlParse==null)
    {
      xmlParse = new XmlParse("/home/machine/workspace/jdee/dbio/src/dbio.xml");
      xmlParse.doImportParse();
    }
  }
  
  /**
   * Describe <code>testInit</code> method here.
   *
   */
  public void testInit() throws SQLException
  {
    TableInfo tableInfo = null;
    try {
      String driver_class = "com.mysql.jdbc.Driver";
      String connection_url = "jdbc:mysql://localhost:3306/cmall?useUnicode=true&characterEncoding=utf-8";
      String user_name = "root";
      String db_password = "8912737";

      Class.forName(driver_class);
      Connection conn = DriverManager.getConnection(connection_url, user_name,
                                                    db_password);
      conn.setAutoCommit(false);
      tableInfo = new TableInfo(conn, xmlParse.getTableDescriptions().get(0x00));
    } catch (Exception e) {
      e.printStackTrace();
    }
    Assert.assertNotNull(tableInfo.getRowInfosCount());
    Assert.assertNotNull(tableInfo.getRowInfos());    
  }
}
