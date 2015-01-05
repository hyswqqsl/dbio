package org.mjava.dbio.dataBase.parse;


import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.framework.Assert;
import java.io.File;
import org.mjava.dbio.dataBase.util.TableDescriptionUtil;
import java.util.List;
import org.mjava.dbio.dataBase.description.TableDescription;
import java.util.ArrayList;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * xml 解析类测试.
 *
 *
 * Created: Fri Aug 23 10:29:07 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class XmlParseTest extends TestCase
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
    if (xmlParse!=null)
      {
        return;
      }
    try {
      xmlParse = new XmlParse("/home/machine/workspace/jdee/dbio/src/dbio.xml");
    } catch (Exception e) {
      e.printStackTrace();
      Assert.fail("不应执行这里");
    }
  }
  
  /**
   * 测试解析
   *
   */
  public void testParseDbDescription()
  {
    xmlParse.doImportParse();
    Assert.assertNotNull(xmlParse.getDbName());
    Assert.assertNotNull(xmlParse.getDbPassword());
    Assert.assertNotNull(xmlParse.getDbPort());
    Assert.assertNotNull(xmlParse.getDbServer());
    Assert.assertNotNull(xmlParse.getDbUserName());
    Assert.assertNotNull(xmlParse.getIoPath());
    Assert.assertNotNull(xmlParse.getTableDescriptions());
  }

  /**
   * 测试构建xml
   *
   */
  public void testBuildXml() throws FileNotFoundException, IOException
  {
    String fileName = "/home/machine/workspace/jdee/dbio/src/im.xml";
    TableDescription tableDescription = TableDescriptionUtil.buildTableDescription("/home/machine/workspace/jdee/dbio/test/org/mjava/dbio/dataBase/parse/xx_shop.csv");
    List<TableDescription> tableDescriptions = new ArrayList<TableDescription>();
    tableDescriptions.add(tableDescription);
    xmlParse.buildXml(tableDescriptions, fileName);
    File file = new File(fileName);
    Assert.assertEquals(file.exists(), true);
  }
}
