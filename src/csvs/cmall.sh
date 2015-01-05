#! /bin/bash

# Copyright (c) 2013 irondide.
# description: Bash中操作MySQL数据库  
# license: LGPL  
# author: the machine of awareness <machine.of.awareness@gmail.com>  
# version: 1.0  
# date: 2013.08.29  

# MySQL中导入导出数据时，使用CSV格式时的命令行参数  
# CSV标准文档：RFC 4180  

SQLCOM="-uroot -p8912737 cmall"
IOPATH="/home/machine/workspace/jdee/dbio/src/csvs"
TABS="xx_shop 
      xx_merchant
      xx_merchant_category
      xx_product 
      xx_merchant_product 
      xx_system_product 
      xx_product_category 
      xx_product_display_category 
      xx_product_product_image 
      xx_area 
      xx_brand
      xx_company 
      xx_system_product_image
      xx_attribute
      xx_attribute_option
      xx_product_category_brand"

for table in $TABS; do
    echo "desc $table" | /usr/bin/mysql $SQLCOM > $IOPATH/$table.csv
    mysqldump $SQLCOM $table > $IOPATH/$table.txt
done
