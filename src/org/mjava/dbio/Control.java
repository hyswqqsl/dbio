package org.mjava.dbio;

import org.mjava.dbio.dataBase.DataBase;
import java.io.File;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Describe class Control here.
 *
 *
 * Created: Wed Sep  4 10:10:06 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class Control
{

  // log
	protected Log logger = LogFactory.getLog(getClass());

  /**
   * Describe <code>validateArgs</code> method here.
   *
   * @return a <code>boolean</code> value
   */
  private boolean validateXmlFileNmae(String xmlFileName)
  {
    File file = new File(xmlFileName);
    if (file.exists()==false)
    {
      logger.info(String.format("xml文件不存在：%s", xmlFileName));
      return false;
    }
    return true;
  }

  /**
   * Describe <code>validateOrder</code> method here.
   *
   * @param order a <code>String</code> value
   * @return a <code>boolean</code> value
   */
  private boolean validateOrder(String order)
  {
    if (order.equalsIgnoreCase("e") || order.equalsIgnoreCase("export") ||
        order.equalsIgnoreCase("a") || order.equalsIgnoreCase("add") ||
        order.equalsIgnoreCase("c") || order.equalsIgnoreCase("create"))
    {
      return true;
    }
    logger.info(String.format("命令错误：%s", order));
    logger.info("命令(大小写均可)：e[export]导出 c[create]重建+导入数据 a[add]导入数据");
    return false;
  }

  /**
   * Creates a new <code>Control</code> instance.
   *
   */
  private Control()
  {
  }

  /**
   * Creates a new <code>Control</code> instance.
   *
   * @param order a <code>String</code> value
   * @param xmlFile a <code>String</code> value
   */
  public Control(String order, String xmlFileName)
  {
    if (validateOrder(order)==false)
    {
      return;
    }
    if (validateXmlFileNmae(xmlFileName)==false)
    {
      return;
    }
    DataBase.order = order;
    DataBase.xmlFileName = xmlFileName;
  }

  /**
   * 控制类运行.
   *
   */
  public void run() throws Exception
  {
    logger.debug("");
    logger.debug("");    
    logger.debug("===========开始执行dbio===========");
    logger.debug("");
    logger.debug("");        
    DataBase.getInstance().getExecute().execute(DataBase.order);
  }

}
