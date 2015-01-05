package org.mjava.dbio.dataBase.description;

/**
 * xml中字段描述.
 * 包括：字段名、字段类型
 *
 * Created: Thu Aug 22 15:56:11 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class FieldDescription
{

  /**
   * 字段名.
   */
  private String name;

  /**
   * 字段类型名.
   */
  private String type;

  /**
   * 设置黙认构造函数不可用
   *
   */
  private FieldDescription()
  {
  }

  /**
   * Creates a new <code>FieldDescription</code> instance.
   *
   * @param name a <code>String</code> value
   * @param type a <code>String</code> value
   * @exception NullPointerException if an error occurs
   */
  public FieldDescription(String name, String type)
    throws NullPointerException
  {
    if (name==null || type==null) {
      throw new NullPointerException();
    }
    this.name = name;
    this.type = type;
  }

  /**
   * Get the <code>Name</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getName()
  {
    return name;
  }

  /**
   * Get the <code>Type</code> value.
   *
   * @return a <code>String</code> value
   */
  public final String getType()
  {
    return type;
  }

}
