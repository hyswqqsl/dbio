package org.mjava.dbio.dataBase.info;

import org.mjava.dbio.dataBase.info.BaseField.Type;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 空类型字段类
 *
 *
 * Created: Tue Aug 20 16:10:41 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class NullField extends BaseField 
{
  /**
   * 设置黙认构造函数不可用
   */
  private NullField()
  {
  }

  /**
   * Creates a new <code>NullField</code> instance.
   *
   */
  public NullField(RowInfo rowInfo, int cod, String name)
    throws NullPointerException 
  {
    if (rowInfo==null) {
      throw new NullPointerException("建立字段出错，行信息为空！");
    }
    this.rowInfo = rowInfo;
    this.cod = cod;    
    if (name==null) {
      throw new NullPointerException(String.format("建立表%s下第%d行第%d列空字段出错，字段名：%s", 
                                     rowInfo.getTableName(), rowInfo.getRow()+0x01, this.cod=0x01, name));
    }
    this.name = name;    
    this.textValue = null;
    this.numValue = 0x00;
    this.type = Type.empty;
  }

  @Override
  public void putInPs(PreparedStatement ps) 
    throws SQLException
  {
    if (ps==null) {
      return;
    }
    // 第二个参数是java.sql.Types
    ps.setNull(this.cod+0x01, 0x00);
  }  

}
