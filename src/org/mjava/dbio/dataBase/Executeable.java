package org.mjava.dbio.dataBase;

/**
 * 执行接口.
 *
 *
 * Created: Tue Sep  3 14:12:53 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public interface Executeable 
{
  
  /**
   * 导入或导出执行.
   *
   * @param param a <code>String</code> value
   * @exception Exception if an error occurs
   */
  public void execute(String param) throws Exception;
  
}
