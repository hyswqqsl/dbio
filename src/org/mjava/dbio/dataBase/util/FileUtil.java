package org.mjava.dbio.dataBase.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import com.csvreader.CsvReader;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import java.io.UnsupportedEncodingException;

/**
 * 文件操作工具类.
 *
 *
 * Created: Thu Aug 29 10:38:13 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class FileUtil
{

  // log
	protected static final Log logger = LogFactory.getLog(FileUtil.class);

  /**
   * 字符串写入文件.
   *
   * @param filename a <code>String</code> value
   * @param message a <code>String</code> value
   * @param isappend a <code>boolean</code> value
   * @param encode a <code>String</code> value
   */
  public static void write(String filename, String message, String encode)
    throws FileNotFoundException, UnsupportedEncodingException, IOException
  {
    FileOutputStream fos = new FileOutputStream(filename);
    OutputStreamWriter out = new OutputStreamWriter(fos, encode);
    out.write(message);
    out.close();
  }

  /**
   * 以字符串方式从文件读出内容.
   *
   * @param filename a <code>String</code> value
   * @param encode a <code>String</code> value
   * @return a <code>String</code> value
   */
  public static String read(String filename, String encode)
    throws FileNotFoundException, UnsupportedEncodingException, IOException
  {
    FileInputStream fis = new FileInputStream(filename);
    InputStreamReader in = new InputStreamReader(fis, encode);
    BufferedReader br = new BufferedReader(in);
    String str = br.readLine();
    StringBuffer sb = new StringBuffer();
    while (str!=null)
    {
      sb.append(str);
      sb.append("\r\n");
      str = br.readLine();
    }
    br.close();
    return sb.toString();
  }

  /**
   * Describe <code>isFileExists</code> method here.
   *
   * @param fileName a <code>String</code> value
   * @return a <code>boolean</code> value
   */
  public static boolean isExists(String fileName)
  {
    File file = new File(fileName);
    return file.exists();
  }

  /**
   * Describe <code>isCsvFile</code> method here.
   *
   * @param fileName a <code>String</code> value
   * @return a <code>boolean</code> value
   */
  public static boolean isCsvFile(String fileName)
  {
    File file = new File(fileName);
    String name = file.getName();
    String[] str = name.split("\\.");
    String type = str[str.length - 1];
    if (type.equals("csv"))
    {
      return true;
    }
    return false;
  }

  /**
   * Describe <code>isDbFile</code> method here.
   *
   * @param fileName a <code>String</code> value
   * @return a <code>boolean</code> value
   */
  public static boolean isDbFile(String fileName)
  {
    File file = new File(fileName);
    String name = file.getName();
    String[] str = name.split("\\.");
    String type = str[str.length - 1];
    if (type.equals("txt"))
    {
      return true;
    }
    return false;
  }

  /**
   * Describe <code>deleteFile</code> method here.
   *
   * @param fileName a <code>String</code> value
   * @return a <code>boolean</code> value
   */
  public static boolean deleteFile(String fileName)
  {
    File file = new File(fileName);
    return file.delete();
  }

  /**
   * Describe <code>getFiles</code> method here.
   *
   * @param dirName a <code>String</code> value
   * @return a <code>String[]</code> value
   */
  public static String[] getFiles(String dirName)
  {
    File file = new File(dirName);
    return file.list();
  }

  /**
   * Describe <code>getCsvFilesNum</code> method here.
   *
   * @param dirName a <code>String</code> value
   * @return an <code>int</code> value
   */
  public static int getCsvFilesNum(String dirName)
  {
    File file = new File(dirName);
    String[] fileNames = getFiles(dirName);    
    int num = 0;
    for (String fileName : fileNames)
    {
      if (isCsvFile(fileName))
      {
        num++;
      }
    }
    return num;
  }

  /**
   * 删除指定目录下所有导出的csv文件
   *
   * @param dirName a <code>string</code> value
   */
  public static void deleteCsvFiles(String dirName)
  {
    String[] fileNames = getFiles(dirName);
    logger.info(String.format("删除%s目录下所有导出的csv文件", dirName));
    if (fileNames==null)
    {
      return;
    }
    for (String fileName : fileNames)
    {
      if (isCsvFile(fileName))
      {
        logger.debug(String.format("删除%s目录下的%s文件", dirName, fileName));      
        deleteFile(dirName+fileName);
      }
    }
  }

  /**
   * 根据完整文件路径，获得表名.
   *
   * @param fileName a <code>String</code> value
   * @return a <code>String</code> value
   */
  public static String getTableName(String fileName)
  {
    logger.debug(String.format("根据完整文件路径%s取表名.", fileName));
    File file = new File(fileName);
    String tableName = file.getName();
    tableName = tableName.split("\\.")[0x00];
    logger.debug(String.format("获得表名 %s", tableName));
    return tableName;
  }

  /**
   * 根据表结构csv，构建csv数据模板
   *
   * @param fileName a <code>String</code> value
   */
  public static void buildCsvTemplate(String fileName)
    throws FileNotFoundException, IOException
  {
    CsvReader csvReader = new CsvReader(fileName, '\t');
    csvReader.readHeaders();
    String[] strs = null;
    StringBuffer sb = new StringBuffer();
    while (csvReader.readRecord())
    {
      strs = csvReader.getValues();
      // 用取第一列以‘，’间隔，这样excel就能打开
      sb.append(strs[0x00]);
      sb.append(',');
    }
    sb.deleteCharAt(sb.length()-0x01);
    csvReader.close();
    // csv在windos下编码是GBK
    write(fileName, sb.toString(), "GBK");
  }

  /**
   * 转换编码.
   *
   * @param fileName a <code>String</code> value
   * @param encode a <code>String</code> value
   * @exception FileNotFoundException if an error occurs
   * @exception UnsupportedEncodingException if an error occurs
   * @exception IOException if an error occurs
   */
  public static void changeEncode(String fileName, String encode)
    throws FileNotFoundException, UnsupportedEncodingException, IOException
  {
    // 获取系统默认编码
    String sencode = System.getProperty("file.encoding");
    logger.debug(String.format("系统默认编码：%s", sencode));
    if (sencode.equals(encode))
    {
      return;
    }
    // 用系统编码读出，用encode编码写入
    String str = read(fileName, sencode);
    write(fileName, str, encode);
  }
}
