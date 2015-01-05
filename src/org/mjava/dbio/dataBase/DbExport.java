package org.mjava.dbio.dataBase;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mjava.dbio.dataBase.description.TableDescription;
import org.mjava.dbio.dataBase.parse.XmlParse;
import org.mjava.dbio.dataBase.util.FileUtil;
import org.mjava.dbio.dataBase.util.Wait;
import org.mjava.dbio.dataBase.util.TableDescriptionUtil;

/**
 * Describe class DbExport here.
 *
 *
 * Created: Wed Aug 28 17:14:53 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class DbExport implements Executeable
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
   * 设置黙认构造函数不可用.
   *
   */
  private DbExport()
  {
  }

  /**
   * Creates a new <code>DbExport</code> instance.
   *
   * @param xmlFileName a <code>String</code> value
   */
  public DbExport(String xmlFileName) throws Exception
  {
    if (xmlFileName==null)
    {
      throw new NullPointerException("构建数据库导入出错：xmlFileName为空");
    }
    xmlParse = new XmlParse(xmlFileName);
    // 解析xml
    xmlParse.doExportParse();
  }

  /**
   * 导出表.
   *
   */
  private void exportTable() throws IOException, UnsupportedEncodingException, InterruptedException
  {
    String cmd = xmlParse.getIoPath() + xmlParse.getExportSh();
    logger.info("执行脚本："+cmd);
    Process process = Runtime.getRuntime().exec(cmd);
    Thread wait = new Wait();
    wait.start();
    process.waitFor();
    System.out.print("\n");
    wait.stop();    
    logger.info("csv导出成功!");
  }

  /**
   * 处理导出文件，生成表描述.
   *
   */
  private void dealFile() throws FileNotFoundException, UnsupportedEncodingException, IOException
  {
    String dirName = xmlParse.getIoPath();
    if (FileUtil.isExists(dirName)==false)
    {
      throw new FileNotFoundException(String.format("导出目录不存在：%s.", dirName));
    }
    String[] files = FileUtil.getFiles(dirName);
    String fileName;
    List<TableDescription> tableDescriptions = new ArrayList<TableDescription>();
    logger.info("构建csv数据模板开始");
    for (int i=0; i<files.length; i++)
    {
      fileName = dirName+files[i];
      // csv文件
      if (FileUtil.isCsvFile(fileName)==true)
      {
        // 构建表描述
        tableDescriptions.add(TableDescriptionUtil.buildTableDescription(fileName));
        // 构建csv数据模板
        FileUtil.buildCsvTemplate(fileName);
      }
      // db文件
      if (FileUtil.isDbFile(fileName)==true)
      {
        // 转换编码
        FileUtil.changeEncode(fileName, "GBK");
      }
    }
    logger.info("构建csv数据模板成功");    
    xmlParse.buildXml(tableDescriptions, DataBase.xmlFileName);
  }

  /**
   * 导入或导出执行.
   *
   * @param param a <code>String</code> value
   * @exception Exception if an error occurs
   */
  public void execute(String param) throws Exception
  {
    // 删除指定目录下所有导出的csv文件
    FileUtil.deleteCsvFiles(xmlParse.getIoPath());
    // 导出表
    exportTable();
    // 处理导出文件
    dealFile();
  }
  
}
