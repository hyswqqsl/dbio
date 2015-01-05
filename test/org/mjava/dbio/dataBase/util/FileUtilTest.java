package org.mjava.dbio.dataBase.util;

import junit.framework.Assert;
import junit.framework.TestCase;

/**
 * Describe class FileUtilTest here.
 *
 *
 * Created: Mon Sep  2 15:34:02 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class FileUtilTest extends TestCase
{

  public void testDeleteCsvFiles()
  {
    String dirName = "/home/machine/workspace/jdee/dbio/src/csvs/";
    FileUtil.deleteCsvFiles(dirName);
    Assert.assertEquals(FileUtil.getCsvFilesNum(dirName), 0);
  }

}
