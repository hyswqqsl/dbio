package org.mjava.dbio.dataBase.description;

import java.util.ArrayList;
import java.util.List;



/**
 * xml中表描述.
 *
 *
 * Created: Thu Aug 22 16:47:02 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TableDescription 
{

  /**
   * 表名.
   */
  private String tableName;

  /**
   * 对应data文件名.
   */
  private String dataFileName;

  /**
   * 字段描述list.
   */
  private List<FieldDescription> fields;

  /**
   * 设置黙认构造函数不可用     
   *
   */
  private TableDescription()
  {
  }
  
  /**
   * Creates a new <code>TableDescription</code> instance.
   *
   * @param tableName a <code>String</code> value
   * @param dataFileName a <code>String</code> value
   */
  public TableDescription(String tableName, String dataFileName)
    throws NullPointerException
  {
    if (tableName==null || dataFileName==null) {
      throw new NullPointerException(String.format("构建表描述对象出错，表名：%s csv文件名：%s", 
                                                   tableName, dataFileName));
    }
    this.tableName = tableName;
    this.dataFileName = dataFileName;
    fields = new ArrayList<FieldDescription>();
  }

  /**
   * Get the <code>TableName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getTableName()
  {
    return tableName;
  }

  /**
   * Get the <code>DataFileName</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getDataFileName()
  {
    return dataFileName;
  }

  /**
   * Get the <code>FieldDescriptions</code> value.
   *
   * @return a <code>List<FieldDescription></code> value
   */
  public final List<FieldDescription> getFieldDescriptions()
  {
    return fields;
  }
  
  /**
   * 添加字段描述.
   *
   * @param field a <code>FieldDescription</code> value
   */
  public void addField(FieldDescription field)
  {
    if (field==null) {
      return;
    }
    fields.add(field);
  }

  /**
   * 获得表中的字段数.
   *
   * @return an <code>int</code> value
   */
  public int getFieldsCount()
  {
    return fields.size();
  }

  /**
   * 获得字段描述.
   *
   * @param index an <code>int</code> value
   * @return a <code>Field</code> value
   */
  public FieldDescription getField(int index)
  {
    if (index>=fields.size())
    {
      return null;
    }
    return fields.get(index);
  }

}
