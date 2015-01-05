package org.mjava.dbio.dataBase;

import junit.framework.TestCase;
import junit.framework.Assert;

/**
 * Describe class DataBaseTest here.
 *
 *
 * Created: Mon Aug 26 15:56:34 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class DataBaseTest extends TestCase 
{

  public void testImportToDb() throws Exception
  {
    DataBase.xmlFileName = "/home/machine/workspace/jdee/dbio/src/dbio.xml";
    DataBase dataBase = DataBase.getInstance();
    Assert.assertNotNull(dataBase.getExecute());
  }
  
}
