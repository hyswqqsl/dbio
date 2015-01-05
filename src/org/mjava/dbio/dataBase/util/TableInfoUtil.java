package org.mjava.dbio.dataBase.util;

import java.nio.charset.Charset;
import com.csvreader.CsvReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.sql.Connection;
import org.mjava.dbio.dataBase.info.*;
import org.mjava.dbio.dataBase.description.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mjava.dbio.Factory;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import java.io.FileInputStream;
import java.io.InputStream;
import jxl.read.biff.BiffException;

/**
 * 表信息工具类.
 *
 *
 * Created: Fri Aug 30 11:06:13 2013
 *
 * @author <a href="mailto:machine.of.awareness@gmail.com">the machine of awareness</a>
 * @version 1.0
 */
public class TableInfoUtil 
{

  // log
	protected static final Log logger = LogFactory.getLog(TableInfoUtil.class);  

  /**
   * 依据表描述，构建表信息.
   *
   * @param tableDescription a <code>TableDescription</code> value
   */
  public static TableInfo buildTableInfo(Connection conn, TableDescription tableDescription)
    throws FileNotFoundException, IOException, BiffException
  {
    TableInfo tableInfo = new TableInfo(conn, tableDescription);
    logger.debug(String.format("以%s构建表信息", tableInfo.getDataFileName()));
    // 创建输入
    InputStream inputStream = new FileInputStream(tableDescription.getDataFileName());
    jxl.Workbook workbook = Workbook.getWorkbook(inputStream);
    // 读取第一个sheet
    Sheet sheet = workbook.getSheet(0);
    // 判断sheet与表描述一致性
    if (sheet.getColumns()<tableDescription.getFieldsCount())
    {
      String info = String.format("表%s的xml描述的字段数与excel数据长度不一致，", tableDescription.getTableName());
      info += String.format("xml描述了%d个字段，excel文件中有%d字段数据", 
                            tableDescription.getFieldsCount(), sheet.getColumns());
      throw new IOException(info);
    }
    // 循环建立 RowInfo 对象
    RowInfo rowInfo = null;
    // 判断表头合法性
    if (validateSheetHead(sheet,tableDescription)==false)
    {
      throw new IOException(String.format("表%s的xml描述的字段名与excel表头名不一致，", tableDescription.getTableName()));
    }
    // 跳过表头
    for (int i=0x01; i<sheet.getRows(); i++)
    {
      rowInfo = buildRowInfo(tableInfo, sheet, i);
      if (rowInfo==null)
      {
        continue;
      }
      // RowInfo 加入 表信息
      tableInfo.addRowInfo(rowInfo);
    }
    return tableInfo;
  }

  /**
   * 判断表头合法性.
   *
   * @param sheet a <code>Sheet</code> value
   * @param tableDescription a <code>TableDescription</code> value
   * @return a <code>boolean</code> value
   */
  private static boolean validateSheetHead(Sheet sheet, TableDescription tableDescription)
  {
    String name = null, value = null;
    Cell cell = null;
    // 判断表头合法性
    for (int i=0x00; i<tableDescription.getFieldsCount(); i++)
    {
      cell = sheet.getCell(i, 0x00);
      name = tableDescription.getField(i).getName();
      value = cell.getContents().trim();
      if (name.equalsIgnoreCase(value)==false)
      {
        logger.debug(String.format("表%s的xml描述的第%d个字段名(%s)与excel表头名(%s)不一致", tableDescription.getTableName(),
                                   i+0x01, name, value));
        return false;
      }
    }
    return true;
  }

  /**
   * 分析数据，构建行信息.
   *
   * @param sheet a <code>Sheet</code> value
   * @param row an <code>int</code> value
   */
  private static RowInfo buildRowInfo(TableInfo tableInfo, Sheet sheet, int row)
  {
    TableDescription tableDescription = tableInfo.getTableDescription();
    String info = String.format("构建表%s的第%d行信息：", tableDescription.getTableName(), row);
    String name, type, value;
    BaseField field = null;
    Cell cell = null;
    // 循环建立 BaseField 对象，从 tableDescription 取得字段名，从 sheet 取得字段
    // 数据，并加入到 RowInfo对象
    RowInfo rowInfo = new RowInfo(tableInfo, row);
    for (int i=0x00; i<tableDescription.getFieldsCount(); i++)
    {
      cell = sheet.getCell(i, row);
      name = tableDescription.getField(i).getName();
      type = tableDescription.getField(i).getType();
      // 去掉两端空格
      value = cell.getContents().trim();
      field = Factory.getField(rowInfo, i, name, type, value);
      if (field==null)
      {
        logger.info(String.format("表%s的第%d行有错误，%s/%s/%s", tableDescription.getTableName(), row, name, type, value));
        return null;
      }
      info += String.format(" %s/%s/%s ", name, type, value);
      rowInfo.addField(field);
    }
    logger.debug(info);
    return rowInfo;
  }
}
