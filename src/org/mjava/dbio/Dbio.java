package org.mjava.dbio;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mjava.dbio.dataBase.DataBase;
import java.io.File;

/**
 * Describe class Dbio here.
 *
 *
 * Created: Tue Aug 27 09:16:24 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class Dbio 
{
  // log
	protected static Log logger = LogFactory.getLog(Dbio.class);
  
  /**
   * Describe <code>main</code> method here.
   *
   * @param args a <code>String</code> value
   */
  public static final void main(final String[] args) throws Exception
  {
    if (args.length!=0x02)
    {
      logger.info(String.format("参数数目错误：", args.length));      
      logger.info(String.format("参考：%s", "java -jar dbio.jar export /home/mahine/csvs/"));
      return;
    }
    Control control = new Control(args[0x00], args[0x01]);
    control.run();
  }
}

