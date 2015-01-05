package org.mjava.dbio.dataBase.util;


/**
 * Describe class Wait here.
 *
 *
 * Created: Tue Sep  3 09:13:56 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class Wait extends Thread 
{
  @Override
  public final void run() 
  {
    while (true)
    {
      try 
      {
        sleep(1000);
        System.out.print(".");
      }
      catch (InterruptedException e)
      {
        e.printStackTrace();
      }
    }
  }

}
