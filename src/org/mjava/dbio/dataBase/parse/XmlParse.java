package org.mjava.dbio.dataBase.parse;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.dom4j.tree.BaseElement;
import org.mjava.dbio.dataBase.description.FieldDescription;
import org.mjava.dbio.dataBase.description.TableDescription;
import org.mjava.dbio.dataBase.util.TableDescriptionUtil;

/**
 * XML 配置文件解析类.
 *
 *
 * Created: Thu Aug 22 16:12:09 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class XmlParse
{

  // log
	protected final Log logger = LogFactory.getLog(getClass());

  // database 信息名
  private String dbNames[] = {"username", "password", "server", "port", "name"};
  private String dbValues[] = {"",      "",          "",        "",       ""};

  /**
   * xml 根节点.
   *
   */
  private Element root;

  /**
   * 导入目录.
   */
  private String ioPath;

  /**
   * 导出脚本.
   */
  private String exportSh;

  /**
   * 初始化脚本.
   */
  private String initSh;

  /**
   * Describe tables here.
   */
  private List<TableDescription> tables;

  /**
   * 设置黙认构造函数不可用
   *
   */
  private XmlParse()
  {
  }

  /**
   * 传进xml文件名，建立xml解析对象.
   *
   * @param fileName a <code>String</code> value
   * @exception NullPointerException if an error occurs
   * @exception IOException if an error occurs
   * @exception DocumentException if an error occurs
   */
  public XmlParse(String fileName)
    throws NullPointerException, IOException, DocumentException
  {
    if (fileName==null)  {
      throw new NullPointerException("xml配置文件为空");
    }
    File xmlFile = new File(fileName);
    if (xmlFile.exists()==false) {
      throw new IOException(String.format("xml文件不存在,请检查xml文件：%s", fileName));
    }
    SAXReader reader = new SAXReader();
    try {
      logger.info("构建xml解析对象开始");
      Document document = reader.read(xmlFile);
      root = document.getRootElement();
      logger.info("构建xml解析对象成功");
    } catch (DocumentException e) {
      throw new DocumentException(String.format("构建xml解析出错，请检查xml文件：%s", fileName));
    }
    tables = new ArrayList<TableDescription>();
  }

  /**
   * Get the <code>DbUserName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDbUserName()
  {
    return dbValues[0x00];
  }

  /**
   * Get the <code>DbPassword</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDbPassword()
  {
    return dbValues[0x01];
  }

  /**
   * Get the <code>DbServer</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDbServer()
  {
    return dbValues[0x02];
  }

  /**
   * Get the <code>DbPort</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDbPort()
  {
    return dbValues[0x03];
  }

  /**
   * Get the <code>DbName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDbName()
  {
    return dbValues[0x04];
  }

  /**
   * Get the <code>IoPath</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getIoPath()
  {
    return ioPath;
  }

  /**
   * Get the <code>ExportSh</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getExportSh()
  {
    return exportSh;
  }

  /**
   * Get the <code>InitSh</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getInitSh()
  {
    return initSh;
  }

  /**
   * 获取表描述对象list.
   *
   * @return a <code>List<TableDescription></code> value
   */
  public final List<TableDescription> getTableDescriptions()
  {
    return tables;
  }

  /**
   * 获取表描述对象数目.
   *
   * @return an <code>int</code> value
   */
  public final int getTableDescriptionCount()
  {
    return this.tables.size();
  }

  /**
   * Describe <code>getTableDescription</code> method here.
   *
   * @return a <code>TableDescription</code> value
   */
  public TableDescription getTableDescription(int index)
  {
    if (index>=this.tables.size())
    {
      return null;
    }
    return this.tables.get(index);
  }

  /**
   * 设置表描述对象.
   *
   * @param table a <code>TableDescription</code> value
   */
  public void setTableDescriptions(List<TableDescription> tables)
  {
    if (tables==null)
    {
      return;
    }
    this.tables = tables;
  }

  /**
   * 解析数据库信息.
   *
   */
  private void parseDbDescription()
  {
    Element dbElemnet = (Element)root.elementIterator("database").next();
    logger.info("解析数据库信息开始");
    Attribute attribute = null;
    for (int i=0; i<dbNames.length; i++)
    {
      attribute = dbElemnet.attribute(dbNames[i]);
      if (attribute==null)
      {
        throw new NullPointerException(String.format("解析数据库信息%s出错", dbNames[i]));
      }
      dbValues[i] = attribute.getValue();
      logger.debug(String.format("解析到数据库%s：%s", dbNames[i], dbValues[i]));
    }
    logger.info("解析数据库信息成功");
  }

  /**
   * 解析导入目录.
   *
   */
  private void parsePathDescription()
  {
    Element pathElement = (Element)root.elementIterator("iopath").next();
    logger.info("解析导入/出目录开始");
    Attribute attribute = null;
    attribute = pathElement.attribute("name");
    if (attribute==null)
    {
      throw new NullPointerException(String.format("解析导入信息%s出错", "iopath"));
    }
    this.ioPath = attribute.getValue();
    logger.debug(String.format("解析到导入/出目录%s：", this.ioPath));
    logger.info("解析导入/出目录成功");
  }

  
  /**
   * 解析导入/出脚本.
   *
   */
  private void parseShDescription()
  {
    Element pathElement = (Element)root.elementIterator("sh").next();
    logger.info("解析导入/出脚本开始");
    Attribute attribute = null;
    attribute = pathElement.attribute("export");
    this.exportSh = attribute.getValue();
    logger.debug(String.format("解析到导出脚本%s：", this.exportSh));
    attribute = pathElement.attribute("init");
    this.initSh = attribute.getValue();
    logger.debug(String.format("解析到初始化脚本%s：", this.initSh));    
    logger.info("解析导入/出脚本成功");
  }

  /**
   * 解析表信息，构建表描述对象.
   *
   */
  private void parseTableDescription()
  {
    Iterator iterator = root.elementIterator("table");
    logger.info("构建表描述开始");
    Element tableElement = null;
    int index = 0x00;
    TableDescription tableDescription = null;
    while (iterator.hasNext())
    {
      tableElement = (Element)iterator.next();
      logger.debug(String.format("构建第%d个表描述开始", ++index));
      tableDescription = TableDescriptionUtil.buildTableDescription(tableElement, this.ioPath);
      tables.add(tableDescription);
      logger.debug(String.format("构建第%d个描述表成功", index));
    }
    logger.info("构建表描述成功");
  }

  /**
   * 导入过程解析xml，得到表描述.
   *
   */
  public void doImportParse()
  {
    // 解析数据库信息
    parseDbDescription();
    // 解析导入目录
    parsePathDescription();
    // 解析导入/出脚本
    parseShDescription();
    // 构建表描述对象
    parseTableDescription();
  }

  /**
   * 导出过程解析xml，得到描述信息.
   *
   */
  public void doExportParse()
  {
    // 解析数据库信息
    parseDbDescription();
    // 解析导入目录
    parsePathDescription();
    // 解析导入/出脚本
    parseShDescription();
  }

  /**
   * 根据表描述，重新构建xml.
   *
   * @param tableDescriptions a <code>TableDescription</code> value
   */
  public void buildXml(List<TableDescription> tableDescriptions, String fileName)
    throws IOException
  {
    logger.info("根据表描述，重新构建xml文件开始");
    // 创建文档   
    Document document = DocumentHelper.createDocument();
    //添加一个元素
    root = document.addElement("configuration");
    // 添加注释
    root.addComment("数据库信息");
    // 创建元素
    Element element = new BaseElement("database");
    // 添加属性
    element.addAttribute("username", getDbUserName());
    element.addAttribute("password", getDbPassword());
    element.addAttribute("server", getDbServer());
    element.addAttribute("port", getDbPort());
    element.addAttribute("name", getDbName());
    root.add(element);
    logger.info("构建xml文件数据库信息成功");        
    // 添加注释
    root.addComment("导入/出目录");
    // 创建元素
    element = new BaseElement("iopath");
    // 添加属性
    element.addAttribute("name", getIoPath());
    root.add(element);
    // 添加注释
    root.addComment("导入/出脚本");
    // 创建元素
    element = new BaseElement("sh");
    // 添加属性
    element.addAttribute("export", getExportSh());
    element.addAttribute("init", getInitSh());
    root.add(element);

    logger.info(String.format("构建xml文件%d个表信息开始", tableDescriptions.size()));
    for (TableDescription tableDescription : tableDescriptions)
    {
      buildTableXml(tableDescription);
    }
    logger.info(String.format("构建xml文件%d个表信息成功", tableDescriptions.size()));
    Writer fileWriter=new FileWriter(fileName);
    OutputFormat format = OutputFormat.createPrettyPrint();
    XMLWriter xmlWriter=new XMLWriter(fileWriter, format);
    // 写入文件中 
    xmlWriter.write(document);  
    xmlWriter.close();
    logger.info("根据表描述，重新构建xml文件成功");    
  }

  /**
   * Describe <code>buildTableXml</code> method here.
   *
   * @param tableDescription a <code>TableDescription</code> value
   */
  private void buildTableXml(TableDescription tableDescription)
  {
    logger.debug(tableDescription.getTableName()+"xml表信息构建开始");
    // 添加注释
    root.addComment(tableDescription.getTableName());
    // 创建元素
    Element element = new BaseElement("table");
    // 添加属性
    element.addAttribute("name", tableDescription.getTableName());
    element.addAttribute("datafile", tableDescription.getTableName()+".xls");
    // 添加字段
    Element fieldElement = null;
    for (FieldDescription field : tableDescription.getFieldDescriptions())
    {
      fieldElement = new BaseElement("field");
      fieldElement.addAttribute("name", field.getName());
      fieldElement.addAttribute("type", field.getType());
      element.add(fieldElement);
    }
    root.add(element);
    logger.debug(tableDescription.getTableName()+"xml表信息构建成功");
  }
}
