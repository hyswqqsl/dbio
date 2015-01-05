package org.mjava.dbio.dataBase.util;

import org.mjava.dbio.dataBase.description.FieldDescription;
import org.mjava.dbio.dataBase.description.TableDescription;
import org.dom4j.Element;
import java.util.Iterator;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.csvreader.CsvReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import org.mjava.dbio.dataBase.info.BaseField;

/**
 * 表描述工具类.
 *
 *
 * Created: Fri Aug 30 11:04:07 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TableDescriptionUtil 
{

  // log
	protected static final Log logger = LogFactory.getLog(TableDescriptionUtil.class);  
  
  /**
   * 根据xml，构建表描述对象.
   *
   * @param element an <code>Element</code> value
   */
  public static TableDescription buildTableDescription(Element element, String ioPath)
  {
    Iterator iterator = element.elementIterator("field");
    Element fieldElement = null;
    String tableName = element.attribute("name").getValue();
    String dataFile = element.attribute("datafile").getValue();
    logger.debug(String.format("解析到表名：%s 对应数据文件名：%s", tableName, dataFile));
    String fieldName, fieldType;
    TableDescription tableDescription = new TableDescription(tableName, ioPath+dataFile);
    FieldDescription fieldDescription = null;
    while (iterator.hasNext())
    {
      fieldElement = (Element)iterator.next();
      fieldName = fieldElement.attribute("name").getValue();
      fieldType = fieldElement.attribute("type").getValue();
      fieldDescription = new FieldDescription(fieldName, fieldType);
      // logger.debug(String.format("解析到字段：%s 类型：%s", fieldName, fieldType));
      tableDescription.addField(fieldDescription);
    }
    return tableDescription;
  }

  /**
   * 根据csv模板，构建表描述对象.
   *
   * @param fileName a <code>String</code> value
   */
  public static TableDescription buildTableDescription(String fileName)
    throws FileNotFoundException, IOException
  {
    String tableName = FileUtil.getTableName(fileName);
    logger.debug(String.format("根据csv文件：%s，构建表%s描述", fileName, tableName));
    CsvReader csvReader = new CsvReader(fileName, '\t');
    csvReader.readHeaders();
    String fieldName, fieldType;
    TableDescription tableDescription = new TableDescription(tableName, fileName);
    FieldDescription fieldDescription = null;
    String[] strs = null;
    while (csvReader.readRecord())
    {
      strs = csvReader.getValues();      
      fieldName = strs[0x00];
      fieldType = getFieldType(fieldName, strs[0x01]);
      fieldDescription = new FieldDescription(fieldName, fieldType);
      logger.debug(String.format("解析到字段：%s 类型：%s", fieldName, fieldType));
      tableDescription.addField(fieldDescription);
    }
    csvReader.close();
    return tableDescription;
  }

  /**
   * 根据数据库字段类型得到，字段描述类型.
   *
   * @param type a <code>String</code> value
   * @return a <code>String</code> value
   */
  private static String getFieldType(String name, String type)
  {
    if (name.equalsIgnoreCase("password"))
    {
      return BaseField.ENCRYP_TYPE_NAME;
    }
    /*
    if (name.equalsIgnoreCase("introduction"))
    {
      return "richtext";
    }
    */
    if (type.equalsIgnoreCase("bit(1)"))
    {
      return BaseField.BOOL_TYPE_NAME;
    }
    if (type.contains("int") || type.contains("bit"))
    {
      return BaseField.NUM_TYPE_NAME;
    }
    if (type.contains("datetime"))
    {
      return BaseField.DATE_TYPE_NAME;
    }
    return BaseField.TEXT_TYPE_NAME;
  }

}
