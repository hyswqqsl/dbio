package org.mjava.dbio;

import org.mjava.dbio.dataBase.info.BaseField;
import org.mjava.dbio.dataBase.info.NullField;
import org.mjava.dbio.dataBase.info.NumField;
import org.mjava.dbio.dataBase.info.RowInfo;
import org.mjava.dbio.dataBase.info.TextField;
import org.mjava.dbio.dataBase.info.RichtextField;
import org.mjava.dbio.dataBase.info.BoolField;
import org.mjava.dbio.dataBase.info.DateField;
import org.mjava.dbio.dataBase.info.EncrypField;

/**
 * 类工厂.
 *
 *
 * Created: Mon Aug 26 11:19:30 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class Factory 
{

  /**
   * 构建字段信息对象.
   *
   * @param cell a <code>Cell</code> value
   * @return a <code>BaseField</code> value
   */
  public static BaseField getField(RowInfo rowInfo, int cod, String name, String type, String value)
  {
    BaseField field = null;
    try 
    {
      // 如果是空字段
      if (value.equalsIgnoreCase("null")==true)
      {
        field = new NullField(rowInfo, cod, name);            
      }
      // 如果是数值型
      else if (type.equals(BaseField.NUM_TYPE_NAME))
      {
        field = new NumField(rowInfo, cod, name, value);
      }
      // 如果是bool型
      else if (type.equals(BaseField.BOOL_TYPE_NAME))
      {
        field = new BoolField(rowInfo, cod, name, value);
      }
      // 如果是富文本型
      else if (type.equals(BaseField.RICHTEXT_TYPE_NAME))
      {
        field = new RichtextField(rowInfo, cod, name, value);
      }
      // 如果是日期型
      else if (type.equals(BaseField.DATE_TYPE_NAME))
      {
        field = new DateField(rowInfo, cod, name, value);
      }
      // 如果是密码型
      else if (type.equals(BaseField.ENCRYP_TYPE_NAME))
      {
        field = new EncrypField(rowInfo, cod, name, value);
      }
      // 如果是文本型
      else
      {
        field = new TextField(rowInfo, cod, name, value);            
      }
    }
    catch (Exception e)
    {
      return null;
    }
    return field;
  }

  
}
