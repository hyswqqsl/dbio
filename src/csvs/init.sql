/*==============================================================*/
/* DBMS name:      cmall                                        */
/* authod:         machine 2013-09-09                           */
/*==============================================================*/

drop database if exists cmall;

create database cmall DEFAULT CHARSET=utf8;

use cmall;

/*==============================================================*/
/* Table: xx_ad                                                 */
/*==============================================================*/
create table xx_ad
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   begin_date           datetime,
   content              longtext,
   end_date             datetime,
   path                 national varchar(255),
   title                national varchar(255) not null,
   type                 int(11) not null,
   url                  national varchar(255),
   ad_position          bigint(20) not null,
   shop                 bigint(20) comment '对应门店',
   primary key (id)
);

/*==============================================================*/
/* Table: xx_ad_position                                        */
/*==============================================================*/
create table xx_ad_position
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   description          national varchar(255),
   height               int(11) not null,
   name                 national varchar(255) not null,
   template             longtext not null,
   width                int(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_admin                                              */
/*==============================================================*/
create table xx_admin
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   department           national varchar(255),
   email                national varchar(255) not null,
   is_enabled           bit(1) not null,
   is_locked            bit(1) not null,
   locked_date          datetime,
   login_date           datetime,
   login_failure_count  int(11) not null,
   login_ip             national varchar(255),
   name                 national varchar(255),
   password             national varchar(255) not null,
   username             national varchar(100) not null,
   primary key (id),
   key username (username)
);

/*==============================================================*/
/* Table: xx_admin_role                                         */
/*==============================================================*/
create table xx_admin_role
(
   admins               bigint(20) not null,
   roles                bigint(20) not null,
   primary key (admins, roles)
);

/*==============================================================*/
/* Table: xx_area                                               */
/*==============================================================*/
create table xx_area
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   full_name            longtext not null,
   name                 national varchar(100) not null,
   tree_path            national varchar(255) not null,
   parent               bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_article                                            */
/*==============================================================*/
create table xx_article
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   author               national varchar(255),
   content              longtext,
   hits                 bigint(20) not null,
   is_publication       bit(1) not null,
   is_top               bit(1) not null,
   seo_description      national varchar(255),
   seo_keywords         national varchar(255),
   seo_title            national varchar(255),
   title                national varchar(255) not null,
   article_category     bigint(20) not null,
   shop                 bigint(20) comment '对应门店',
   primary key (id)
);

/*==============================================================*/
/* Table: xx_article_category                                   */
/*==============================================================*/
create table xx_article_category
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   grade                int(11) not null,
   name                 national varchar(255) not null,
   seo_description      national varchar(255),
   seo_keywords         national varchar(255),
   seo_title            national varchar(255),
   tree_path            national varchar(255) not null,
   parent               bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_article_tag                                        */
/*==============================================================*/
create table xx_article_tag
(
   articles             bigint(20) not null,
   tags                 bigint(20) not null,
   primary key (articles, tags)
);

/*==============================================================*/
/* Table: xx_attribute                                          */
/*==============================================================*/
create table xx_attribute
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   name                 national varchar(255) not null,
   property_index       int(11) not null,
   product_category     bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_attribute_option                                   */
/*==============================================================*/
create table xx_attribute_option
(
   attribute            bigint(20) not null,
   options              national varchar(255)
);

/*==============================================================*/
/* Table: xx_brand                                              */
/*==============================================================*/
create table xx_brand
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   introduction         longtext,
   logo                 national varchar(255),
   name                 national varchar(255) not null,
   type                 int(11) not null,
   url                  national varchar(255),
   county               varchar(255) comment '所属国家',
   company              bigint comment '对应厂家',
   level                int(11) not null comment '级别',
   primary key (id)
);

alter table xx_brand comment '品牌';

/*==============================================================*/
/* Table: xx_cart                                               */
/*==============================================================*/
create table xx_cart
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   cart_key             national varchar(255) not null,
   member               bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_cart_item                                          */
/*==============================================================*/
create table xx_cart_item
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   quantity             int(11) not null,
   cart                 bigint(20) not null,
   product              bigint(20) not null,
   shop                 bigint comment '对应门店',
   primary key (id)
);

/*==============================================================*/
/* Table: xx_company                                            */
/*==============================================================*/
create table xx_company
(
   id                   bigint(20) not null auto_increment comment '序号',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   name                 varchar(255) not null comment '厂家名',
   url                  varchar(255) comment '网址',
   introduction         longtext comment '介绍',
   primary key (id)
);

alter table xx_company comment '厂家';

/*==============================================================*/
/* Table: xx_consultation                                       */
/*==============================================================*/
create table xx_consultation
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   content              national varchar(255) not null,
   ip                   national varchar(255) not null,
   is_show              bit(1) not null,
   for_consultation     bigint(20),
   member               bigint(20),
   product              bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_coupon                                             */
/*==============================================================*/
create table xx_coupon
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   begin_date           datetime,
   end_date             datetime,
   introduction         longtext,
   is_enabled           bit(1) not null,
   is_exchange          bit(1) not null,
   maximum_price        decimal(21,6),
   maximum_quantity     int(11),
   minimum_price        decimal(21,6),
   minimum_quantity     int(11),
   name                 national varchar(255) not null,
   point                bigint(20),
   prefix               national varchar(255) not null,
   price_expression     national varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_coupon_code                                        */
/*==============================================================*/
create table xx_coupon_code
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   code                 national varchar(100) not null,
   is_used              bit(1) not null,
   used_date            datetime,
   coupon               bigint(20) not null,
   member               bigint(20),
   primary key (id),
   key code (code)
);

/*==============================================================*/
/* Table: xx_delivery_area                                      */
/*==============================================================*/
create table xx_delivery_area
(
   shops                bigint not null comment '对应门店',
   areas                bigint not null comment '对应社区',
   primary key (shops, areas)
);

alter table xx_delivery_area comment '门店配送范围';

/*==============================================================*/
/* Table: xx_delivery_center                                    */
/*==============================================================*/
create table xx_delivery_center
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255) not null,
   area_name            national varchar(255) not null,
   contact              national varchar(255) not null,
   is_default           bit(1) not null,
   memo                 national varchar(255),
   mobile               national varchar(255),
   name                 national varchar(255) not null,
   phone                national varchar(255),
   zip_code             national varchar(255),
   area                 bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_delivery_corp                                      */
/*==============================================================*/
create table xx_delivery_corp
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   code                 national varchar(255),
   name                 national varchar(255) not null,
   url                  national varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_delivery_template                                  */
/*==============================================================*/
create table xx_delivery_template
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   background           national varchar(255),
   content              longtext not null,
   height               int(11) not null,
   is_default           bit(1) not null,
   memo                 national varchar(255),
   name                 national varchar(255) not null,
   offsetx              int(11) not null,
   offsety              int(11) not null,
   width                int(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_deposit                                            */
/*==============================================================*/
create table xx_deposit
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   balance              decimal(21,6) not null,
   credit               decimal(21,6) not null,
   debit                decimal(21,6) not null,
   memo                 national varchar(255),
   operator             national varchar(255),
   type                 int(11) not null,
   member               bigint(20) not null,
   orders               bigint(20),
   payment              bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_friend_link                                        */
/*==============================================================*/
create table xx_friend_link
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   logo                 national varchar(255),
   name                 national varchar(255) not null,
   type                 int(11) not null,
   url                  national varchar(255) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_gift_item                                          */
/*==============================================================*/
create table xx_gift_item
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   quantity             int(11) not null,
   gift                 bigint(20) not null,
   promotion            bigint(20) not null,
   primary key (id),
   key gift (gift, promotion)
);

/*==============================================================*/
/* Table: xx_goods                                              */
/*==============================================================*/
create table xx_goods
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_log                                                */
/*==============================================================*/
create table xx_log
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   content              longtext,
   ip                   national varchar(255) not null,
   operation            national varchar(255) not null,
   operator             national varchar(255),
   parameter            longtext,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_member                                             */
/*==============================================================*/
create table xx_member
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255),
   amount               decimal(27,12) not null,
   attribute_value0     national varchar(255),
   attribute_value1     national varchar(255),
   attribute_value2     national varchar(255),
   attribute_value3     national varchar(255),
   attribute_value4     national varchar(255),
   attribute_value5     national varchar(255),
   attribute_value6     national varchar(255),
   attribute_value7     national varchar(255),
   attribute_value8     national varchar(255),
   attribute_value9     national varchar(255),
   balance              decimal(27,12) not null,
   birth                datetime,
   email                national varchar(255) not null,
   gender               int(11),
   is_enabled           bit(1) not null,
   is_locked            bit(1) not null,
   locked_date          datetime,
   login_date           datetime,
   login_failure_count  int(11) not null,
   login_ip             national varchar(255),
   mobile               national varchar(255),
   name                 national varchar(255),
   password             national varchar(255) not null,
   phone                national varchar(255),
   point                bigint(20) not null,
   register_ip          national varchar(255) not null,
   safe_key_expire      datetime,
   safe_key_value       national varchar(255),
   username             national varchar(100) not null,
   zip_code             national varchar(255),
   area                 bigint(20),
   member_rank          bigint(20) not null,
   primary key (id),
   key username (username)
);

/*==============================================================*/
/* Table: xx_member_attribute                                   */
/*==============================================================*/
create table xx_member_attribute
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   is_enabled           bit(1) not null,
   is_required          bit(1) not null,
   name                 national varchar(255) not null,
   property_index       int(11),
   type                 int(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_member_attribute_option                            */
/*==============================================================*/
create table xx_member_attribute_option
(
   member_attribute     bigint(20) not null,
   options              national varchar(255)
);

/*==============================================================*/
/* Table: xx_member_favorite_product                            */
/*==============================================================*/
create table xx_member_favorite_product
(
   favorite_members     bigint(20) not null,
   favorite_products    bigint(20) not null,
   primary key (favorite_members, favorite_products)
);

/*==============================================================*/
/* Table: xx_member_favorite_shop                               */
/*==============================================================*/
create table xx_member_favorite_shop
(
   favorite_shops       bigint not null comment '关注的门店',
   favorite_members     bigint not null comment '关注的顾客',
   primary key (favorite_shops, favorite_members)
);

alter table xx_member_favorite_shop comment '顾客与门店关注关系';

/*==============================================================*/
/* Table: xx_member_rank                                        */
/*==============================================================*/
create table xx_member_rank
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   amount               decimal(21,6),
   is_default           bit(1) not null,
   is_special           bit(1) not null,
   name                 national varchar(100) not null,
   scale                double not null,
   primary key (id),
   key amount (amount),
   key name (name)
);

/*==============================================================*/
/* Table: xx_merchant                                           */
/*==============================================================*/
create table xx_merchant
(
   id                   bigint(20) not null auto_increment comment '序号',
   merchant_category    bigint comment '对应商户分类',
   name                 varchar(100) not null comment '商户名',
   ename                varchar(100) not null comment '英文名',
   registered_address   varchar(255) not null comment '注册地址',
   phone                varchar(255) not null comment '座机号',
   email                varchar(255) not null comment '邮箱',
   business_address     varchar(255) not null comment '经营地址',
   license_number       varchar(255) not null comment '营业执照号码',
   license_picture      varchar(255) not null comment '营业执照照片',
   organization_code    varchar(255) comment '组织机构代码',
   organization_code_picture varchar(255) comment '组织机构代码照片',
   mobile               national varchar(255) not null comment '手机号',
   is_enabled           bit(1) not null comment '是否启用',
   is_approved          bigint not null comment '是否审核通过',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   primary key (id)
);

alter table xx_merchant comment '商户';

/*==============================================================*/
/* Table: xx_merchant_admin                                     */
/*==============================================================*/
create table xx_merchant_admin
(
   id                   bigint(20) not null auto_increment comment '序号',
   merchant             bigint comment '对应商户',
   create_date          datetime not null comment '建立时间',
   modify_date          datetime not null comment '修改时间',
   username             national varchar(100) not null comment '用户名',
   password             national varchar(255) not null comment '密码',
   name                 national varchar(255) comment '姓名',
   login_ip             national varchar(255) comment '最后登录IP',
   login_failure_count  int(11) not null comment '连续登录失败次数',
   login_date           datetime comment '最后登录日期',
   locked_date          datetime comment '锁定日期',
   is_locked            bit(1) not null comment '是否锁定 ',
   is_enabled           bit(1) not null comment '是否启用',
   is_system            bit(1) not null comment '是否内置',
   email                national varchar(255) not null comment 'E-mail',
   department           national varchar(255) comment '部门',
   primary key (id)
);

alter table xx_merchant_admin comment '商户管理员';

/*==============================================================*/
/* Table: xx_merchant_admin_role                                */
/*==============================================================*/
create table xx_merchant_admin_role
(
   merchant_admins      bigint not null comment '对应商户管理员',
   merchant_roles       bigint not null comment '对应商户角色',
   primary key (merchant_roles, merchant_admins)
);

/*==============================================================*/
/* Table: xx_merchant_category                                  */
/*==============================================================*/
create table xx_merchant_category
(
   id                   bigint(20) not null auto_increment comment '序号',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   name                 varchar(255) not null comment '分类名',
   seo_description      national varchar(255) comment '页面描述',
   seo_keywords         national varchar(255) comment '页面关键词',
   seo_title            national varchar(255) comment '页面标题',
   type                 int(11) not null comment '类别',
   primary key (id)
);

alter table xx_merchant_category comment '商户分类';

/*==============================================================*/
/* Table: xx_merchant_product                                   */
/*==============================================================*/
create table xx_merchant_product
(
   id                   bigint(20) not null auto_increment comment '序号',
   system_product       bigint comment '对应系统商品',
   merchant             bigint comment '对应商户',
   name                 varchar(255) comment '名称',
   is_exist             bit(1) comment '是否存在',
   stock                bigint not null comment '库存',
   allocated_stock      bigint not null comment '已分配库存',
   price                decimal(21,6) not null comment '网上销售价',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   promotion_price      decimal(21,6) comment '促销价',
   sn                   varchar(255) comment '商户内部编号',
   introduction         longtext comment '介绍',
   market_price         decimal(21,6) comment '市场价',
   member_price         decimal(21,6) comment '会员价',
   image                varchar(255) comment '图片',
   primary key (id)
);

alter table xx_merchant_product comment '商户商品';

/*==============================================================*/
/* Table: xx_merchant_role                                      */
/*==============================================================*/
create table xx_merchant_role
(
   id                   bigint(20) not null auto_increment comment '序号',
   merchant             bigint comment '对应商户',
   name                 national varchar(255) not null comment '角色名',
   is_system            bit(1) not null comment '是否内置',
   description          national varchar(255) comment '描述',
   modify_date          datetime not null comment '修改日期',
   create_date          datetime not null comment '建立日期',
   primary key (id)
);

alter table xx_merchant_role comment '商户角色';

/*==============================================================*/
/* Table: xx_merchant_role_authority                            */
/*==============================================================*/
create table xx_merchant_role_authority
(
   merchant_role        bigint(20) not null comment '对应角色',
   authorities          national varchar(255) comment '权限'
);

alter table xx_merchant_role_authority comment '商户功能权限';

/*==============================================================*/
/* Table: xx_merchant_role_shop                                 */
/*==============================================================*/
create table xx_merchant_role_shop
(
   merchant_roles       bigint not null comment '对应商户角色',
   shops                bigint not null comment '对应门店',
   primary key (merchant_roles, shops)
);

alter table xx_merchant_role_shop comment '商户管理员数据权限';

/*==============================================================*/
/* Table: xx_message                                            */
/*==============================================================*/
create table xx_message
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   content              longtext not null,
   ip                   national varchar(255) not null,
   is_draft             bit(1) not null,
   receiver_delete      bit(1) not null,
   receiver_read        bit(1) not null,
   sender_delete        bit(1) not null,
   sender_read          bit(1) not null,
   title                national varchar(255) not null,
   for_message          bigint(20),
   receiver             bigint(20),
   sender               bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_navigation                                         */
/*==============================================================*/
create table xx_navigation
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   is_blank_target      bit(1) not null,
   name                 national varchar(255) not null,
   position             int(11) not null,
   url                  national varchar(255) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_order                                              */
/*==============================================================*/
create table xx_order
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255) not null,
   amount_paid          decimal(21,6) not null,
   area_name            national varchar(255) not null,
   consignee            national varchar(255) not null,
   coupon_discount      decimal(21,6) not null,
   expire               datetime,
   fee                  decimal(21,6) not null,
   freight              decimal(21,6) not null,
   invoice_title        national varchar(255),
   is_allocated_stock   bit(1) not null,
   is_invoice           bit(1) not null,
   lock_expire          datetime,
   memo                 national varchar(255),
   offset_amount        decimal(21,6) not null,
   order_status         int(11) not null,
   payment_method_name  national varchar(255) not null,
   payment_status       int(11) not null,
   phone                national varchar(255) not null,
   point                bigint(20) not null,
   promotion            national varchar(255),
   promotion_discount   decimal(21,6) not null,
   shipping_method_name national varchar(255) not null,
   shipping_status      int(11) not null,
   sn                   national varchar(100) not null,
   tax                  decimal(21,6) not null,
   zip_code             national varchar(255) not null,
   area                 bigint(20),
   coupon_code          bigint(20),
   member               bigint(20) not null,
   payment_method       bigint(20),
   shipping_method      bigint(20),
   shop                 bigint(20) comment '对应门店',
   operator             bigint(20) comment '对应商户管理员',
   primary key (id),
   key sn (sn)
);

/*==============================================================*/
/* Table: xx_order_coupon                                       */
/*==============================================================*/
create table xx_order_coupon
(
   orders               bigint(20) not null,
   coupons              bigint(20) not null
);

/*==============================================================*/
/* Table: xx_order_item                                         */
/*==============================================================*/
create table xx_order_item
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   full_name            national varchar(255) not null,
   is_gift              bit(1) not null,
   name                 national varchar(255) not null,
   price                decimal(21,6) not null,
   quantity             int(11) not null,
   return_quantity      int(11) not null,
   shipped_quantity     int(11) not null,
   sn                   national varchar(255) not null,
   thumbnail            national varchar(255),
   weight               int(11),
   orders               bigint(20) not null,
   product              bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_order_log                                          */
/*==============================================================*/
create table xx_order_log
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   content              national varchar(255),
   operator             national varchar(255),
   type                 int(11) not null,
   orders               bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_parameter                                          */
/*==============================================================*/
create table xx_parameter
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   name                 national varchar(255) not null,
   parameter_group      bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_parameter_group                                    */
/*==============================================================*/
create table xx_parameter_group
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   name                 national varchar(255) not null,
   product_category     bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_payment                                            */
/*==============================================================*/
create table xx_payment
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   account              national varchar(255),
   amount               decimal(21,6) not null,
   bank                 national varchar(255),
   expire               datetime,
   fee                  decimal(21,6) not null,
   memo                 national varchar(255),
   method               int(11) not null,
   operator             national varchar(255),
   payer                national varchar(255),
   payment_date         datetime,
   payment_method       national varchar(255),
   payment_plugin_id    national varchar(255),
   sn                   national varchar(100) not null,
   status               int(11) not null,
   type                 int(11) not null,
   member               bigint(20),
   orders               bigint(20),
   primary key (id),
   key sn (sn)
);

/*==============================================================*/
/* Table: xx_payment_method                                     */
/*==============================================================*/
create table xx_payment_method
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   content              longtext,
   description          national varchar(255),
   icon                 national varchar(255),
   method               int(11) not null,
   name                 national varchar(255) not null,
   timeout              int(11),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_payment_shipping_method                            */
/*==============================================================*/
create table xx_payment_shipping_method
(
   payment_methods      bigint(20) not null,
   shipping_methods     bigint(20) not null,
   primary key (shipping_methods, payment_methods)
);

/*==============================================================*/
/* Table: xx_plugin_config                                      */
/*==============================================================*/
create table xx_plugin_config
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   is_enabled           bit(1) not null,
   plugin_id            national varchar(100) not null,
   primary key (id),
   key plugin_id (plugin_id)
);

/*==============================================================*/
/* Table: xx_plugin_config_attribute                            */
/*==============================================================*/
create table xx_plugin_config_attribute
(
   plugin_config        bigint(20) not null,
   attributes           national varchar(255),
   name                 national varchar(100) not null,
   primary key (name, plugin_config)
);

/*==============================================================*/
/* Table: xx_product                                            */
/*==============================================================*/
create table xx_product
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   allocated_stock      int(11) not null,
   cost                 decimal(21,6),
   full_name            national varchar(255) not null,
   hits                 bigint(20) not null,
   image                national varchar(255),
   introduction         longtext,
   is_gift              bit(1) not null,
   is_list              bit(1) not null,
   is_marketable        bit(1) not null,
   is_top               bit(1) not null,
   keyword              national varchar(255),
   market_price         decimal(21,6) not null,
   memo                 national varchar(255),
   month_hits           bigint(20) not null,
   month_hits_date      datetime not null,
   month_sales          bigint(20) not null,
   month_sales_date     datetime not null,
   name                 national varchar(255) not null,
   point                bigint(20) not null,
   price                decimal(21,6) not null,
   sales                bigint(20) not null,
   score                float not null,
   score_count          bigint(20) not null,
   seo_description      national varchar(255),
   seo_keywords         national varchar(255),
   seo_title            national varchar(255),
   sn                   national varchar(100) not null,
   stock                int(11),
   stock_memo           national varchar(255),
   total_score          bigint(20) not null,
   unit                 national varchar(255),
   week_hits            bigint(20) not null,
   week_hits_date       datetime not null,
   week_sales           bigint(20) not null,
   week_sales_date      datetime not null,
   weight               int(11),
   shop                 bigint not null comment '对应门店',
   goods                bigint(20) not null,
   merchant_product     bigint not null comment '对应商户商品',
   primary key (id),
   key sn (sn)
);

alter table xx_product comment '门店商品';

/*==============================================================*/
/* Table: xx_product_category                                   */
/*==============================================================*/
create table xx_product_category
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   grade                int(11) not null,
   name                 national varchar(255) not null,
   seo_description      national varchar(255),
   seo_keywords         national varchar(255),
   seo_title            national varchar(255),
   tree_path            national varchar(255) not null,
   parent               bigint(20),
   primary key (id)
);

alter table xx_product_category comment '系统商品分类';

/*==============================================================*/
/* Table: xx_product_category_brand                             */
/*==============================================================*/
create table xx_product_category_brand
(
   product_categories   bigint(20) not null,
   brands               bigint(20) not null,
   primary key (brands, product_categories)
);

/*==============================================================*/
/* Table: xx_product_display_category                           */
/*==============================================================*/
create table xx_product_display_category
(
   id                   bigint(20) not null auto_increment comment '序号',
   product_category     bigint comment '对应商品分类',
   merchant_category    bigint comment '对应商户分类',
   create_date          datetime not null comment '建立时间',
   modify_date          datetime not null comment '修改时间',
   name                 national varchar(255) not null comment '分类名',
   seo_description      national varchar(255) comment '页面描述',
   seo_keywords         national varchar(255) comment '页面关键词',
   seo_title            national varchar(255) comment '页面标题',
   grade                int(11) not null comment '层级',
   tree_path            national varchar(255) not null comment '树路径',
   parent               bigint(20) comment '上级分类',
   is_leaf              bit(1) comment '是否为叶子',
   primary key (id)
);

alter table xx_product_display_category comment '商户商品显示分类';

/*==============================================================*/
/* Table: xx_product_member_price                               */
/*==============================================================*/
create table xx_product_member_price
(
   product              bigint(20) not null,
   member_price         decimal(19,2),
   member_price_key     bigint(20) not null,
   primary key (product, member_price_key)
);

/*==============================================================*/
/* Table: xx_product_notify                                     */
/*==============================================================*/
create table xx_product_notify
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   email                national varchar(255) not null,
   has_sent             bit(1) not null,
   member               bigint(20),
   product              bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_product_parameter_value                            */
/*==============================================================*/
create table xx_product_parameter_value
(
   product              bigint not null comment '对应门店商品(应该是系统商品，第一次迭代先不改)',
   parameter_value_key  bigint(20) not null,
   parameter_value      national varchar(255),
   primary key (product, parameter_value_key)
);

/*==============================================================*/
/* Table: xx_product_product_image                              */
/*==============================================================*/
create table xx_product_product_image
(
   product              bigint(20) not null,
   large                national varchar(255),
   medium               national varchar(255),
   orders               int(11),
   source               national varchar(255),
   thumbnail            national varchar(255),
   title                national varchar(255)
);

/*==============================================================*/
/* Table: xx_product_specification                              */
/*==============================================================*/
create table xx_product_specification
(
   products             bigint(20) not null,
   specifications       bigint(20) not null,
   primary key (products, specifications)
);

/*==============================================================*/
/* Table: xx_product_specification_value                        */
/*==============================================================*/
create table xx_product_specification_value
(
   products             bigint(20) not null,
   specification_values bigint(20) not null,
   primary key (products, specification_values)
);

/*==============================================================*/
/* Table: xx_product_tag                                        */
/*==============================================================*/
create table xx_product_tag
(
   products             bigint(20) not null,
   tags                 bigint(20) not null,
   primary key (products, tags)
);

/*==============================================================*/
/* Table: xx_promotion                                          */
/*==============================================================*/
create table xx_promotion
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   begin_date           datetime,
   end_date             datetime,
   introduction         longtext,
   is_coupon_allowed    bit(1) not null,
   is_free_shipping     bit(1) not null,
   maximum_price        decimal(21,6),
   maximum_quantity     int(11),
   minimum_price        decimal(21,6),
   minimum_quantity     int(11),
   name                 national varchar(255) not null,
   point_expression     national varchar(255),
   price_expression     national varchar(255),
   title                national varchar(255) not null,
   shop                 bigint comment '对应门店',
   primary key (id)
);

/*==============================================================*/
/* Table: xx_promotion_brand                                    */
/*==============================================================*/
create table xx_promotion_brand
(
   promotions           bigint(20) not null,
   brands               bigint(20) not null,
   primary key (promotions, brands)
);

/*==============================================================*/
/* Table: xx_promotion_coupon                                   */
/*==============================================================*/
create table xx_promotion_coupon
(
   promotions           bigint(20) not null,
   coupons              bigint(20) not null,
   primary key (promotions, coupons)
);

/*==============================================================*/
/* Table: xx_promotion_member_rank                              */
/*==============================================================*/
create table xx_promotion_member_rank
(
   promotions           bigint(20) not null,
   member_ranks         bigint(20) not null,
   primary key (promotions, member_ranks)
);

/*==============================================================*/
/* Table: xx_promotion_product                                  */
/*==============================================================*/
create table xx_promotion_product
(
   promotions           bigint(20) not null,
   products             bigint(20) not null,
   primary key (promotions, products)
);

/*==============================================================*/
/* Table: xx_promotion_product_category                         */
/*==============================================================*/
create table xx_promotion_product_category
(
   promotions           bigint(20) not null,
   product_categories   bigint(20) not null,
   primary key (promotions, product_categories)
);

/*==============================================================*/
/* Table: xx_receiver                                           */
/*==============================================================*/
create table xx_receiver
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255) not null,
   area_name            national varchar(255) not null,
   consignee            national varchar(255) not null,
   is_default           bit(1) not null,
   phone                national varchar(255) not null,
   zip_code             national varchar(255) not null,
   area                 bigint(20),
   member               bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_refunds                                            */
/*==============================================================*/
create table xx_refunds
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   account              national varchar(255),
   amount               decimal(21,6) not null,
   bank                 national varchar(255),
   memo                 national varchar(255),
   method               int(11) not null,
   operator             national varchar(255) not null,
   payee                national varchar(255),
   payment_method       national varchar(255),
   sn                   national varchar(100) not null,
   orders               bigint(20) not null,
   primary key (id),
   key sn (sn)
);

/*==============================================================*/
/* Table: xx_returns                                            */
/*==============================================================*/
create table xx_returns
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255) not null,
   area                 national varchar(255) not null,
   delivery_corp        national varchar(255),
   freight              decimal(21,6),
   memo                 national varchar(255),
   operator             national varchar(255) not null,
   phone                national varchar(255) not null,
   shipper              national varchar(255) not null,
   shipping_method      national varchar(255),
   sn                   national varchar(100) not null,
   tracking_no          national varchar(255),
   zip_code             national varchar(255) not null,
   orders               bigint(20) not null,
   primary key (id),
   key sn (sn)
);

/*==============================================================*/
/* Table: xx_returns_item                                       */
/*==============================================================*/
create table xx_returns_item
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   name                 national varchar(255) not null,
   quantity             int(11) not null,
   sn                   national varchar(255) not null,
   returns              bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_review                                             */
/*==============================================================*/
create table xx_review
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   content              national varchar(255) not null,
   ip                   national varchar(255) not null,
   is_show              bit(1) not null,
   score                int(11) not null,
   member               bigint(20),
   product              bigint(20) not null,
   shop                 bigint comment '对应门店',
   primary key (id)
);

/*==============================================================*/
/* Table: xx_role                                               */
/*==============================================================*/
create table xx_role
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   description          national varchar(255),
   is_system            bit(1) not null,
   name                 national varchar(255) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_role_authority                                     */
/*==============================================================*/
create table xx_role_authority
(
   role                 bigint(20) not null,
   authorities          national varchar(255)
);

/*==============================================================*/
/* Table: xx_seo                                                */
/*==============================================================*/
create table xx_seo
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   description          national varchar(255),
   keywords             national varchar(255),
   title                national varchar(255),
   type                 int(11) not null,
   primary key (id),
   key type (type)
);

/*==============================================================*/
/* Table: xx_shipping                                           */
/*==============================================================*/
create table xx_shipping
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   address              national varchar(255) not null,
   area                 national varchar(255) not null,
   consignee            national varchar(255) not null,
   delivery_corp        national varchar(255) not null,
   delivery_corp_code   national varchar(255),
   delivery_corp_url    national varchar(255),
   freight              decimal(21,6),
   memo                 national varchar(255),
   operator             national varchar(255) not null,
   phone                national varchar(255) not null,
   shipping_method      national varchar(255) not null,
   sn                   national varchar(100) not null,
   tracking_no          national varchar(255),
   zip_code             national varchar(255) not null,
   orders               bigint(20) not null,
   primary key (id),
   key sn (sn)
);

/*==============================================================*/
/* Table: xx_shipping_item                                      */
/*==============================================================*/
create table xx_shipping_item
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   name                 national varchar(255) not null,
   quantity             int(11) not null,
   sn                   national varchar(255) not null,
   shipping             bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_shipping_method                                    */
/*==============================================================*/
create table xx_shipping_method
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   continue_price       decimal(21,6) not null,
   continue_weight      int(11) not null,
   description          longtext,
   first_price          decimal(21,6) not null,
   first_weight         int(11) not null,
   icon                 national varchar(255),
   name                 national varchar(255) not null,
   default_delivery_corp bigint(20),
   primary key (id)
);

/*==============================================================*/
/* Table: xx_shop                                               */
/*==============================================================*/
create table xx_shop
(
   id                   bigint(20) not null auto_increment comment '序号',
   area                 bigint not null comment '对应社区',
   name                 varchar(255) not null comment '门店名',
   merchant             bigint not null comment '对应商户',
   address              varchar(255) not null comment '门店详细地址',
   phone                varchar(100) comment '联系固话',
   business_time        datetime comment '营业开始时间',
   completion_time      datetime comment '营业结束时间',
   is_enabled           bit(1) not null comment '是否启用',
   logo                 varchar(255) comment '门店logo',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   primary key (id)
);

alter table xx_shop comment '门店';

/*==============================================================*/
/* Table: xx_sn                                                 */
/*==============================================================*/
create table xx_sn
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   last_value           bigint(20) not null,
   type                 int(11) not null,
   primary key (id),
   key type (type)
);

/*==============================================================*/
/* Table: xx_specification                                      */
/*==============================================================*/
create table xx_specification
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   memo                 national varchar(255),
   name                 national varchar(255) not null,
   type                 int(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_specification_value                                */
/*==============================================================*/
create table xx_specification_value
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   image                national varchar(255),
   name                 national varchar(255) not null,
   specification        bigint(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: xx_system_product                                     */
/*==============================================================*/
create table xx_system_product
(
   id                   bigint(20) not null auto_increment comment '序列号',
   brand                bigint(20),
   product_category     bigint(20),
   name                 varchar(255) not null comment '名称',
   full_name            varchar(255) comment '全称',
   unit                 varchar(255) not null comment '单位',
   image                varchar(255) comment '图片',
   introduction         longtext not null comment '介绍',
   is_approved          bigint not null comment '是否审核通过',
   create_date          datetime not null comment '创建时间',
   modify_date          datetime not null comment '更新时间',
   barcode              varchar(255) comment '条形码',
   guarantee_date       datetime comment '保质期',
   market_date          datetime comment '上市日期',
   attribute_value0     national varchar(255),
   attribute_value1     national varchar(255),
   attribute_value10    national varchar(255),
   attribute_value11    national varchar(255),
   attribute_value12    national varchar(255),
   attribute_value13    national varchar(255),
   attribute_value14    national varchar(255),
   attribute_value15    national varchar(255),
   attribute_value16    national varchar(255),
   attribute_value17    national varchar(255),
   attribute_value18    national varchar(255),
   attribute_value19    national varchar(255),
   attribute_value2     national varchar(255),
   attribute_value3     national varchar(255),
   attribute_value4     national varchar(255),
   attribute_value5     national varchar(255),
   attribute_value6     national varchar(255),
   attribute_value7     national varchar(255),
   attribute_value8     national varchar(255),
   attribute_value9     national varchar(255),
   primary key (id)
);

alter table xx_system_product comment '系统商品';

/*==============================================================*/
/* Table: xx_system_product_image                               */
/*==============================================================*/
create table xx_system_product_image
(
   product              bigint(20) not null,
   large                national varchar(255),
   medium               national varchar(255),
   orders               int(11),
   source               national varchar(255),
   thumbnail            national varchar(255),
   title                national varchar(255)
);

/*==============================================================*/
/* Table: xx_tag                                                */
/*==============================================================*/
create table xx_tag
(
   id                   bigint(20) not null auto_increment,
   create_date          datetime not null,
   modify_date          datetime not null,
   orders               int(11),
   icon                 national varchar(255),
   memo                 national varchar(255),
   name                 national varchar(255) not null,
   type                 int(11) not null,
   primary key (id)
);

-- alter table xx_ad add constraint FK6D301C2E947C2F5 foreign key (ad_position)
--       references xx_ad_position (id);

-- alter table xx_ad add constraint FK_Reference_123 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_admin_role add constraint FKD291D6053FF548F7 foreign key (roles)
--       references xx_role (id);

-- alter table xx_admin_role add constraint FKD291D605A022690F foreign key (admins)
--       references xx_admin (id);

-- alter table xx_area add constraint FK9E19DA6CFE1E12FB foreign key (parent)
--       references xx_area (id);

-- alter table xx_article add constraint FK636982B7CA3B1F7 foreign key (article_category)
--       references xx_article_category (id);

-- alter table xx_article add constraint FK_Reference_124 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_article_category add constraint FK57108986F587647A foreign key (parent)
--       references xx_article_category (id);

-- alter table xx_article_tag add constraint FKB9183E1229F6DEEF foreign key (articles)
--       references xx_article (id);

-- alter table xx_article_tag add constraint FKB9183E12C842716F foreign key (tags)
--       references xx_tag (id);

-- alter table xx_attribute add constraint FKE81F41DD7629117 foreign key (product_category)
--       references xx_product_category (id);

-- alter table xx_attribute_option add constraint FK96E026D75E1B95F4 foreign key (attribute)
--       references xx_attribute (id);

-- alter table xx_brand add constraint FK_Reference_119 foreign key (company)
--       references xx_company (id) on delete restrict on update restrict;

-- alter table xx_cart add constraint FK9E1A84FF7C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_cart_item add constraint FK1A67F65339A23004 foreign key (cart)
--       references xx_cart (id);

-- alter table xx_cart_item add constraint FK1A67F65379F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_cart_item add constraint FK_Reference_117 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_consultation add constraint FK33228D68366B868C foreign key (for_consultation)
--       references xx_consultation (id);

-- alter table xx_consultation add constraint FK33228D6879F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_consultation add constraint FK33228D687C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_coupon_code add constraint FKEF53A3A75B638910 foreign key (coupon)
--       references xx_coupon (id);

-- alter table xx_coupon_code add constraint FKEF53A3A77C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_delivery_area add constraint FK_Reference_115 foreign key (shops)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_delivery_area add constraint FK_Reference_116 foreign key (areas)
--       references xx_area (id) on delete restrict on update restrict;

-- alter table xx_delivery_center add constraint FK18EB77C139A0DADE foreign key (area)
--       references xx_area (id);

-- alter table xx_deposit add constraint FKEBB7CC5F4115A3C8 foreign key (payment)
--       references xx_payment (id);

-- alter table xx_deposit add constraint FKEBB7CC5F7C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_deposit add constraint FKEBB7CC5FB992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_gift_item add constraint FK2FB852438C9B75DB foreign key (gift)
--       references xx_product (id);

-- alter table xx_gift_item add constraint FK2FB85243FD463A02 foreign key (promotion)
--       references xx_promotion (id);

-- alter table xx_member add constraint FK92D398B937884F5B foreign key (member_rank)
--       references xx_member_rank (id);

-- alter table xx_member add constraint FK92D398B939A0DADE foreign key (area)
--       references xx_area (id);

-- alter table xx_member_attribute_option add constraint FKC3DC263E8A8815 foreign key (member_attribute)
--       references xx_member_attribute (id);

-- alter table xx_member_favorite_product add constraint FK44DF1412830D5552 foreign key (favorite_products)
--       references xx_product (id);

-- alter table xx_member_favorite_product add constraint FK44DF1412A43B40D4 foreign key (favorite_members)
--       references xx_member (id);

-- alter table xx_member_favorite_shop add constraint FK_Reference_110 foreign key (favorite_shops)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_member_favorite_shop add constraint FK_Reference_111 foreign key (favorite_members)
--       references xx_member (id) on delete restrict on update restrict;

-- alter table xx_merchant add constraint FK_Reference_108 foreign key (merchant_category)
--       references xx_merchant_category (id) on delete restrict on update restrict;

-- alter table xx_merchant_admin add constraint FK_Reference_100 foreign key (merchant)
--       references xx_merchant (id) on delete restrict on update restrict;

-- alter table xx_merchant_admin_role add constraint FK_Reference_101 foreign key (merchant_admins)
--       references xx_merchant_admin (id) on delete restrict on update restrict;

-- alter table xx_merchant_admin_role add constraint FK_Reference_102 foreign key (merchant_roles)
--       references xx_merchant_role (id) on delete restrict on update restrict;

-- alter table xx_merchant_product add constraint FK_Reference_93 foreign key (system_product)
--       references xx_system_product (id) on delete restrict on update restrict;

-- alter table xx_merchant_product add constraint FK_Reference_97 foreign key (merchant)
--       references xx_merchant (id) on delete restrict on update restrict;

-- alter table xx_merchant_role add constraint FK_Reference_103 foreign key (merchant)
--       references xx_merchant (id) on delete restrict on update restrict;

-- alter table xx_merchant_role_authority add constraint FK_Reference_104 foreign key (merchant_role)
--       references xx_merchant_role (id) on delete restrict on update restrict;

-- alter table xx_merchant_role_shop add constraint FK_Reference_113 foreign key (merchant_roles)
--       references xx_merchant_role (id) on delete restrict on update restrict;

-- alter table xx_merchant_role_shop add constraint FK_Reference_114 foreign key (shops)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_message add constraint FKC7FBB5C886A07D93 foreign key (sender)
--       references xx_member (id);

-- alter table xx_message add constraint FKC7FBB5C88C6C4D4D foreign key (receiver)
--       references xx_member (id);

-- alter table xx_message add constraint FKC7FBB5C8E2B39A54 foreign key (for_message)
--       references xx_message (id);

-- alter table xx_order add constraint FK25E6B94F39A0DADE foreign key (area)
--       references xx_area (id);

-- alter table xx_order add constraint FK25E6B94F67F7C585 foreign key (shipping_method)
--       references xx_shipping_method (id);

-- alter table xx_order add constraint FK25E6B94F7C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_order add constraint FK25E6B94FC050045D foreign key (coupon_code)
--       references xx_coupon_code (id);

-- alter table xx_order add constraint FK25E6B94FD3A8BE7D foreign key (payment_method)
--       references xx_payment_method (id);

-- alter table xx_order add constraint FK_Reference_109 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_order add constraint FK_Reference_125 foreign key (operator)
--       references xx_merchant_admin (id) on delete restrict on update restrict;

-- alter table xx_order_coupon add constraint FKA3F6D516B992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_order_coupon add constraint FKA3F6D516E538DDF7 foreign key (coupons)
--       references xx_coupon (id);

-- alter table xx_order_item add constraint FKD69FF40379F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_order_item add constraint FKD69FF403B992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_order_log add constraint FKF6684C54B992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_parameter add constraint FK8238FD2A818BF383 foreign key (parameter_group)
--       references xx_parameter_group (id);

-- alter table xx_parameter_group add constraint FKD68A4F2AD7629117 foreign key (product_category)
--       references xx_product_category (id);

-- alter table xx_payment add constraint FK602CE7C77C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_payment add constraint FK602CE7C7B992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_payment_shipping_method add constraint FKC230A01A85883714 foreign key (shipping_methods)
--       references xx_shipping_method (id);

-- alter table xx_payment_shipping_method add constraint FKC230A01AA2ED13BC foreign key (payment_methods)
--       references xx_payment_method (id);

-- alter table xx_plugin_config_attribute add constraint FK42CB712CE174C3E7 foreign key (plugin_config)
--       references xx_plugin_config (id);

-- alter table xx_product add constraint FK7C9E82B0FB212D68 foreign key (goods)
--       references xx_goods (id);

-- alter table xx_product add constraint FK_Reference_112 foreign key (merchant_product)
--       references xx_merchant_product (id) on delete restrict on update restrict;

-- alter table xx_product add constraint FK_Reference_96 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_product_category add constraint FK1B7971ADFBDD5B73 foreign key (parent)
--       references xx_product_category (id);

-- alter table xx_product_category_brand add constraint FKE42D6A758C4C0635 foreign key (product_categories)
--       references xx_product_category (id);

-- alter table xx_product_category_brand add constraint FKE42D6A75A2AB700F foreign key (brands)
--       references xx_brand (id);

-- alter table xx_product_display_category add constraint FK_Reference_105 foreign key (parent)
--       references xx_product_display_category (id) on delete restrict on update restrict;

-- alter table xx_product_display_category add constraint FK_Reference_106 foreign key (merchant_category)
--       references xx_merchant_category (id) on delete restrict on update restrict;

-- alter table xx_product_display_category add constraint FK_Reference_107 foreign key (product_category)
--       references xx_product_category (id) on delete restrict on update restrict;

-- alter table xx_product_member_price add constraint FKDCCD88935CCD83AE foreign key (member_price_key)
--       references xx_member_rank (id);

-- alter table xx_product_member_price add constraint FKDCCD889379F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_product_notify add constraint FKDCB1ABB879F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_product_notify add constraint FKDCB1ABB87C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_product_parameter_value add constraint FK1B76FDCC79F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_product_parameter_value add constraint FK1B76FDCCEDA221E0 foreign key (parameter_value_key)
--       references xx_parameter (id);

-- alter table xx_product_product_image add constraint FK66470ABC79F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_product_specification add constraint FK622421B45096DE0F foreign key (products)
--       references xx_product (id);

-- alter table xx_product_specification add constraint FK622421B4840DA38F foreign key (specifications)
--       references xx_specification (id);

-- alter table xx_product_specification_value add constraint FKBF71FF265096DE0F foreign key (products)
--       references xx_product (id);

-- alter table xx_product_specification_value add constraint FKBF71FF2677BD1CD0 foreign key (specification_values)
--       references xx_specification_value (id);

-- alter table xx_product_tag add constraint FK2F6A998B5096DE0F foreign key (products)
--       references xx_product (id);

-- alter table xx_product_tag add constraint FK2F6A998BC842716F foreign key (tags)
--       references xx_tag (id);

-- alter table xx_promotion add constraint FK_Reference_121 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_promotion_brand add constraint FKBD21C9AC682BD58F foreign key (promotions)
--       references xx_promotion (id);

-- alter table xx_promotion_brand add constraint FKBD21C9ACA2AB700F foreign key (brands)
--       references xx_brand (id);

-- alter table xx_promotion_coupon add constraint FKE8AB1EA1682BD58F foreign key (promotions)
--       references xx_promotion (id);

-- alter table xx_promotion_coupon add constraint FKE8AB1EA1E538DDF7 foreign key (coupons)
--       references xx_coupon (id);

-- alter table xx_promotion_member_rank add constraint FKFF359916682BD58F foreign key (promotions)
--       references xx_promotion (id);

-- alter table xx_promotion_member_rank add constraint FKFF359916E24D908C foreign key (member_ranks)
--       references xx_member_rank (id);

-- alter table xx_promotion_product add constraint FKE12E55D45096DE0F foreign key (products)
--       references xx_product (id);

-- alter table xx_promotion_product add constraint FKE12E55D4682BD58F foreign key (promotions)
--       references xx_promotion (id);

-- alter table xx_promotion_product_category add constraint FK4A5AE709682BD58F foreign key (promotions)
--       references xx_promotion (id);

-- alter table xx_promotion_product_category add constraint FK4A5AE7098C4C0635 foreign key (product_categories)
--       references xx_product_category (id);

-- alter table xx_receiver add constraint FK22D1EC4E39A0DADE foreign key (area)
--       references xx_area (id);

-- alter table xx_receiver add constraint FK22D1EC4E7C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_refunds add constraint FKCFC4C5BCB992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_returns add constraint FKD08A1F04B992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_returns_item add constraint FKE830D76E21D01242 foreign key (returns)
--       references xx_returns (id);

-- alter table xx_review add constraint FK9B60057779F8D99A foreign key (product)
--       references xx_product (id);

-- alter table xx_review add constraint FK9B6005777C62EDF8 foreign key (member)
--       references xx_member (id);

-- alter table xx_review add constraint FK_Reference_122 foreign key (shop)
--       references xx_shop (id) on delete restrict on update restrict;

-- alter table xx_role_authority add constraint FKE06165D939B03AB0 foreign key (role)
--       references xx_role (id);

-- alter table xx_shipping add constraint FK3440E00DB992E8EF foreign key (orders)
--       references xx_order (id);

-- alter table xx_shipping_item add constraint FKCCE65405FF407320 foreign key (shipping)
--       references xx_shipping (id);

-- alter table xx_shipping_method add constraint FK32A8355346542319 foreign key (default_delivery_corp)
--       references xx_delivery_corp (id);

-- alter table xx_shop add constraint FK_Reference_94 foreign key (merchant)
--       references xx_merchant (id) on delete restrict on update restrict;

-- alter table xx_shop add constraint FK_Reference_95 foreign key (area)
--       references xx_area (id) on delete restrict on update restrict;

-- alter table xx_specification_value add constraint FK5E624376629A04C2 foreign key (specification)
--       references xx_specification (id);

-- alter table xx_system_product add constraint FK7C9E82B0D7629117 foreign key (product_category)
--       references xx_product_category (id);

-- alter table xx_system_product add constraint FK7C9E82B0FA9695CA foreign key (brand)
--       references xx_brand (id);

-- alter table xx_system_product_image add constraint FK_Reference_120 foreign key (product)
--       references xx_system_product (id) on delete restrict on update restrict;

-- 初始化DEMO数据 --

insert into `xx_role`(`id`,`create_date`,`modify_date`,`description`,`is_system`,`name`) values (1,'2013-06-24 00:02:44','2013-06-24 00:02:44','拥有管理后台最高权限',1,'超级管理员');

insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:product');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:productCategory');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:parameterGroup');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:attribute');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:specification');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:brand');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:productNotify');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:order');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:print');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:payment');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:refunds');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:shipping');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:returns');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:deliveryCenter');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:deliveryTemplate');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:member');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:memberRank');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:memberAttribute');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:review');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:consultation');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:navigation');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:article');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:articleCategory');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:tag');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:friendLink');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:adPosition');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:ad');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:template');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:cache');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:static');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:index');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:promotion');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:coupon');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:seo');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:sitemap');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:statistics');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:sales');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:salesRanking');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:purchaseRanking');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:deposit');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:setting');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:area');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:paymentMethod');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:shippingMethod');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:deliveryCorp');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:paymentPlugin');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:storagePlugin');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:admin');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:role');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:message');
insert into `xx_role_authority`(`role`,`authorities`) values (1,'admin:log')
, (1,"admin:merchant")
, (1,"admin:merchantCategory")
, (1,"admin:productDisplayCategory")
, (1,"admin:company")
, (1,"admin:systemProduct");

insert into `xx_admin`(`id`,`create_date`,`modify_date`,`department`,`email`,`is_enabled`,`is_locked`,`locked_date`,`login_date`,`login_failure_count`,`login_ip`,`name`,`password`,`username`) values (1,'2013-06-24 00:03:36','2013-06-24 15:27:06','技术部','admin@shopxx.net',1,0,null,'2013-06-24 15:27:06',0,null,'管理员','21232f297a57a5a743894a0e4a801fc3','admin');
insert into `xx_admin_role`(`admins`,`roles`) values (1,1);

insert into `xx_member_rank`(`id`,`create_date`,`modify_date`,`amount`,`is_default`,`is_special`,`name`,`scale`) values (1,'2013-06-24 00:03:38','2013-06-24 00:03:38',0.000000,1,0,'普通会员',1);
insert into `xx_member_rank`(`id`,`create_date`,`modify_date`,`amount`,`is_default`,`is_special`,`name`,`scale`) values (2,'2013-06-24 00:03:39','2013-06-24 00:03:39',1000.000000,0,0,'银牌会员',1);
insert into `xx_member_rank`(`id`,`create_date`,`modify_date`,`amount`,`is_default`,`is_special`,`name`,`scale`) values (3,'2013-06-24 00:03:40','2013-06-24 00:03:40',10000.000000,0,0,'金牌会员',1);
insert into `xx_member_rank`(`id`,`create_date`,`modify_date`,`amount`,`is_default`,`is_special`,`name`,`scale`) values (4,'2013-06-24 00:03:41','2013-06-24 00:03:41',100000.000000,0,0,'白金会员',0.99);
insert into `xx_member_rank`(`id`,`create_date`,`modify_date`,`amount`,`is_default`,`is_special`,`name`,`scale`) values (5,'2013-06-24 00:03:42','2013-06-24 00:03:42',null,0,1,'贵宾会员',0.95);

insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (1,'2013-06-24 00:03:43','2013-06-24 00:03:43',1,1,0,'姓名',null,0);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (2,'2013-06-24 00:03:44','2013-06-24 00:03:44',2,1,0,'性别',null,1);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (3,'2013-06-24 00:03:45','2013-06-24 00:03:45',3,1,0,'出生日期',null,2);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (4,'2013-06-24 00:03:46','2013-06-24 00:03:46',4,1,0,'地区',null,3);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (5,'2013-06-24 00:03:47','2013-06-24 00:03:47',5,1,0,'地址',null,4);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (6,'2013-06-24 00:03:48','2013-06-24 00:03:48',6,0,0,'邮编',null,5);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (7,'2013-06-24 00:03:49','2013-06-24 00:03:49',7,0,0,'电话',null,6);
insert into `xx_member_attribute`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`is_required`,`name`,`property_index`,`type`) values (8,'2013-06-24 00:03:50','2013-06-24 00:03:50',8,0,0,'手机',null,7);

insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (1,'2013-06-24 00:03:51','2013-06-24 00:03:51',null,'北京市','北京市',',',null)
, (2,'2013-06-24 00:03:52','2013-06-24 00:03:52',null,'北京市东城区','东城区',',1,',1)
, (3,'2013-06-24 00:03:53','2013-06-24 00:03:53',null,'北京市西城区','西城区',',1,',1)
, (4,'2013-06-24 00:03:54','2013-06-24 00:03:54',null,'北京市朝阳区','朝阳区',',1,',1)
, (5,'2013-06-24 00:03:55','2013-06-24 00:03:55',null,'北京市丰台区','丰台区',',1,',1)
, (6,'2013-06-24 00:03:56','2013-06-24 00:03:56',null,'北京市石景山区','石景山区',',1,',1)
, (7,'2013-06-24 00:03:57','2013-06-24 00:03:57',null,'北京市海淀区','海淀区',',1,',1)
, (8,'2013-06-24 00:03:58','2013-06-24 00:03:58',null,'北京市门头沟区','门头沟区',',1,',1)
, (9,'2013-06-24 00:03:59','2013-06-24 00:03:59',null,'北京市房山区','房山区',',1,',1)
, (10,'2013-06-24 00:04:00','2013-06-24 00:04:00',null,'北京市通州区','通州区',',1,',1)
, (11,'2013-06-24 00:04:01','2013-06-24 00:04:01',null,'北京市顺义区','顺义区',',1,',1)
, (12,'2013-06-24 00:04:02','2013-06-24 00:04:02',null,'北京市昌平区','昌平区',',1,',1)
, (13,'2013-06-24 00:04:03','2013-06-24 00:04:03',null,'北京市大兴区','大兴区',',1,',1)
, (14,'2013-06-24 00:04:04','2013-06-24 00:04:04',null,'北京市怀柔区','怀柔区',',1,',1)
, (15,'2013-06-24 00:04:05','2013-06-24 00:04:05',null,'北京市平谷区','平谷区',',1,',1)
, (16,'2013-06-24 00:04:06','2013-06-24 00:04:06',null,'北京市密云县','密云县',',1,',1)
, (17,'2013-06-24 00:04:07','2013-06-24 00:04:07',null,'北京市延庆县','延庆县',',1,',1)
, (18,'2013-06-24 00:04:08','2013-06-24 00:04:08',null,'天津市','天津市',',',null)
, (19,'2013-06-24 00:04:09','2013-06-24 00:04:09',null,'天津市和平区','和平区',',18,',18)
, (20,'2013-06-24 00:04:10','2013-06-24 00:04:10',null,'天津市河东区','河东区',',18,',18)
, (21,'2013-06-24 00:04:11','2013-06-24 00:04:11',null,'天津市河西区','河西区',',18,',18)
, (22,'2013-06-24 00:04:12','2013-06-24 00:04:12',null,'天津市南开区','南开区',',18,',18)
, (23,'2013-06-24 00:04:13','2013-06-24 00:04:13',null,'天津市河北区','河北区',',18,',18)
, (24,'2013-06-24 00:04:14','2013-06-24 00:04:14',null,'天津市红桥区','红桥区',',18,',18)
, (25,'2013-06-24 00:04:15','2013-06-24 00:04:15',null,'天津市东丽区','东丽区',',18,',18)
, (26,'2013-06-24 00:04:16','2013-06-24 00:04:16',null,'天津市西青区','西青区',',18,',18)
, (27,'2013-06-24 00:04:17','2013-06-24 00:04:17',null,'天津市津南区','津南区',',18,',18)
, (28,'2013-06-24 00:04:18','2013-06-24 00:04:18',null,'天津市北辰区','北辰区',',18,',18)
, (29,'2013-06-24 00:04:19','2013-06-24 00:04:19',null,'天津市武清区','武清区',',18,',18)
, (30,'2013-06-24 00:04:20','2013-06-24 00:04:20',null,'天津市宝坻区','宝坻区',',18,',18)
, (31,'2013-06-24 00:04:21','2013-06-24 00:04:21',null,'天津市滨海新区','滨海新区',',18,',18)
, (32,'2013-06-24 00:04:22','2013-06-24 00:04:22',null,'天津市宁河县','宁河县',',18,',18)
, (33,'2013-06-24 00:04:23','2013-06-24 00:04:23',null,'天津市静海县','静海县',',18,',18)
, (34,'2013-06-24 00:04:24','2013-06-24 00:04:24',null,'天津市蓟县','蓟县',',18,',18)
, (35,'2013-06-24 00:04:25','2013-06-24 00:04:25',null,'河北省','河北省',',',null)
, (36,'2013-06-24 00:04:26','2013-06-24 00:04:26',null,'河北省石家庄市','石家庄市',',35,',35)
, (37,'2013-06-24 00:04:27','2013-06-24 00:04:27',null,'河北省石家庄市长安区','长安区',',35,36,',36)
, (38,'2013-06-24 00:04:28','2013-06-24 00:04:28',null,'河北省石家庄市桥东区','桥东区',',35,36,',36)
, (39,'2013-06-24 00:04:29','2013-06-24 00:04:29',null,'河北省石家庄市桥西区','桥西区',',35,36,',36)
, (40,'2013-06-24 00:04:30','2013-06-24 00:04:30',null,'河北省石家庄市新华区','新华区',',35,36,',36)
, (41,'2013-06-24 00:04:31','2013-06-24 00:04:31',null,'河北省石家庄市井陉矿区','井陉矿区',',35,36,',36)
, (42,'2013-06-24 00:04:32','2013-06-24 00:04:32',null,'河北省石家庄市裕华区','裕华区',',35,36,',36)
, (43,'2013-06-24 00:04:33','2013-06-24 00:04:33',null,'河北省石家庄市井陉县','井陉县',',35,36,',36)
, (44,'2013-06-24 00:04:34','2013-06-24 00:04:34',null,'河北省石家庄市正定县','正定县',',35,36,',36)
, (45,'2013-06-24 00:04:35','2013-06-24 00:04:35',null,'河北省石家庄市栾城县','栾城县',',35,36,',36)
, (46,'2013-06-24 00:04:36','2013-06-24 00:04:36',null,'河北省石家庄市行唐县','行唐县',',35,36,',36)
, (47,'2013-06-24 00:04:37','2013-06-24 00:04:37',null,'河北省石家庄市灵寿县','灵寿县',',35,36,',36)
, (48,'2013-06-24 00:04:38','2013-06-24 00:04:38',null,'河北省石家庄市高邑县','高邑县',',35,36,',36)
, (49,'2013-06-24 00:04:39','2013-06-24 00:04:39',null,'河北省石家庄市深泽县','深泽县',',35,36,',36)
, (50,'2013-06-24 00:04:40','2013-06-24 00:04:40',null,'河北省石家庄市赞皇县','赞皇县',',35,36,',36)
, (51,'2013-06-24 00:04:41','2013-06-24 00:04:41',null,'河北省石家庄市无极县','无极县',',35,36,',36)
, (52,'2013-06-24 00:04:42','2013-06-24 00:04:42',null,'河北省石家庄市平山县','平山县',',35,36,',36)
, (53,'2013-06-24 00:04:43','2013-06-24 00:04:43',null,'河北省石家庄市元氏县','元氏县',',35,36,',36)
, (54,'2013-06-24 00:04:44','2013-06-24 00:04:44',null,'河北省石家庄市赵县','赵县',',35,36,',36)
, (55,'2013-06-24 00:04:45','2013-06-24 00:04:45',null,'河北省石家庄市辛集市','辛集市',',35,36,',36)
, (56,'2013-06-24 00:04:46','2013-06-24 00:04:46',null,'河北省石家庄市藁城市','藁城市',',35,36,',36)
, (57,'2013-06-24 00:04:47','2013-06-24 00:04:47',null,'河北省石家庄市晋州市','晋州市',',35,36,',36)
, (58,'2013-06-24 00:04:48','2013-06-24 00:04:48',null,'河北省石家庄市新乐市','新乐市',',35,36,',36)
, (59,'2013-06-24 00:04:49','2013-06-24 00:04:49',null,'河北省石家庄市鹿泉市','鹿泉市',',35,36,',36)
, (60,'2013-06-24 00:04:50','2013-06-24 00:04:50',null,'河北省唐山市','唐山市',',35,',35)
, (61,'2013-06-24 00:04:51','2013-06-24 00:04:51',null,'河北省唐山市路南区','路南区',',35,60,',60)
, (62,'2013-06-24 00:04:52','2013-06-24 00:04:52',null,'河北省唐山市路北区','路北区',',35,60,',60)
, (63,'2013-06-24 00:04:53','2013-06-24 00:04:53',null,'河北省唐山市古冶区','古冶区',',35,60,',60)
, (64,'2013-06-24 00:04:54','2013-06-24 00:04:54',null,'河北省唐山市开平区','开平区',',35,60,',60)
, (65,'2013-06-24 00:04:55','2013-06-24 00:04:55',null,'河北省唐山市丰南区','丰南区',',35,60,',60)
, (66,'2013-06-24 00:04:56','2013-06-24 00:04:56',null,'河北省唐山市丰润区','丰润区',',35,60,',60)
, (67,'2013-06-24 00:04:57','2013-06-24 00:04:57',null,'河北省唐山市曹妃甸区','曹妃甸区',',35,60,',60)
, (68,'2013-06-24 00:04:58','2013-06-24 00:04:58',null,'河北省唐山市滦县','滦县',',35,60,',60)
, (69,'2013-06-24 00:04:59','2013-06-24 00:04:59',null,'河北省唐山市滦南县','滦南县',',35,60,',60)
, (70,'2013-06-24 00:05:00','2013-06-24 00:05:00',null,'河北省唐山市乐亭县','乐亭县',',35,60,',60)
, (71,'2013-06-24 00:05:01','2013-06-24 00:05:01',null,'河北省唐山市迁西县','迁西县',',35,60,',60)
, (72,'2013-06-24 00:05:02','2013-06-24 00:05:02',null,'河北省唐山市玉田县','玉田县',',35,60,',60)
, (73,'2013-06-24 00:05:03','2013-06-24 00:05:03',null,'河北省唐山市遵化市','遵化市',',35,60,',60)
, (74,'2013-06-24 00:05:04','2013-06-24 00:05:04',null,'河北省唐山市迁安市','迁安市',',35,60,',60)
, (75,'2013-06-24 00:05:05','2013-06-24 00:05:05',null,'河北省秦皇岛市','秦皇岛市',',35,',35)
, (76,'2013-06-24 00:05:06','2013-06-24 00:05:06',null,'河北省秦皇岛市海港区','海港区',',35,75,',75)
, (77,'2013-06-24 00:05:07','2013-06-24 00:05:07',null,'河北省秦皇岛市山海关区','山海关区',',35,75,',75)
, (78,'2013-06-24 00:05:08','2013-06-24 00:05:08',null,'河北省秦皇岛市北戴河区','北戴河区',',35,75,',75)
, (79,'2013-06-24 00:05:09','2013-06-24 00:05:09',null,'河北省秦皇岛市青龙满族自治县','青龙满族自治县',',35,75,',75)
, (80,'2013-06-24 00:05:10','2013-06-24 00:05:10',null,'河北省秦皇岛市昌黎县','昌黎县',',35,75,',75)
, (81,'2013-06-24 00:05:11','2013-06-24 00:05:11',null,'河北省秦皇岛市抚宁县','抚宁县',',35,75,',75)
, (82,'2013-06-24 00:05:12','2013-06-24 00:05:12',null,'河北省秦皇岛市卢龙县','卢龙县',',35,75,',75)
, (83,'2013-06-24 00:05:13','2013-06-24 00:05:13',null,'河北省邯郸市','邯郸市',',35,',35)
, (84,'2013-06-24 00:05:14','2013-06-24 00:05:14',null,'河北省邯郸市邯山区','邯山区',',35,83,',83)
, (85,'2013-06-24 00:05:15','2013-06-24 00:05:15',null,'河北省邯郸市丛台区','丛台区',',35,83,',83)
, (86,'2013-06-24 00:05:16','2013-06-24 00:05:16',null,'河北省邯郸市复兴区','复兴区',',35,83,',83)
, (87,'2013-06-24 00:05:17','2013-06-24 00:05:17',null,'河北省邯郸市峰峰矿区','峰峰矿区',',35,83,',83)
, (88,'2013-06-24 00:05:18','2013-06-24 00:05:18',null,'河北省邯郸市邯郸县','邯郸县',',35,83,',83)
, (89,'2013-06-24 00:05:19','2013-06-24 00:05:19',null,'河北省邯郸市临漳县','临漳县',',35,83,',83)
, (90,'2013-06-24 00:05:20','2013-06-24 00:05:20',null,'河北省邯郸市成安县','成安县',',35,83,',83)
, (91,'2013-06-24 00:05:21','2013-06-24 00:05:21',null,'河北省邯郸市大名县','大名县',',35,83,',83)
, (92,'2013-06-24 00:05:22','2013-06-24 00:05:22',null,'河北省邯郸市涉县','涉县',',35,83,',83)
, (93,'2013-06-24 00:05:23','2013-06-24 00:05:23',null,'河北省邯郸市磁县','磁县',',35,83,',83)
, (94,'2013-06-24 00:05:24','2013-06-24 00:05:24',null,'河北省邯郸市肥乡县','肥乡县',',35,83,',83)
, (95,'2013-06-24 00:05:25','2013-06-24 00:05:25',null,'河北省邯郸市永年县','永年县',',35,83,',83)
, (96,'2013-06-24 00:05:26','2013-06-24 00:05:26',null,'河北省邯郸市邱县','邱县',',35,83,',83)
, (97,'2013-06-24 00:05:27','2013-06-24 00:05:27',null,'河北省邯郸市鸡泽县','鸡泽县',',35,83,',83)
, (98,'2013-06-24 00:05:28','2013-06-24 00:05:28',null,'河北省邯郸市广平县','广平县',',35,83,',83)
, (99,'2013-06-24 00:05:29','2013-06-24 00:05:29',null,'河北省邯郸市馆陶县','馆陶县',',35,83,',83)
, (100,'2013-06-24 00:05:30','2013-06-24 00:05:30',null,'河北省邯郸市魏县','魏县',',35,83,',83)
, (101,'2013-06-24 00:05:31','2013-06-24 00:05:31',null,'河北省邯郸市曲周县','曲周县',',35,83,',83)
, (102,'2013-06-24 00:05:32','2013-06-24 00:05:32',null,'河北省邯郸市武安市','武安市',',35,83,',83)
, (103,'2013-06-24 00:05:33','2013-06-24 00:05:33',null,'河北省邢台市','邢台市',',35,',35)
, (104,'2013-06-24 00:05:34','2013-06-24 00:05:34',null,'河北省邢台市桥东区','桥东区',',35,103,',103)
, (105,'2013-06-24 00:05:35','2013-06-24 00:05:35',null,'河北省邢台市桥西区','桥西区',',35,103,',103)
, (106,'2013-06-24 00:05:36','2013-06-24 00:05:36',null,'河北省邢台市邢台县','邢台县',',35,103,',103)
, (107,'2013-06-24 00:05:37','2013-06-24 00:05:37',null,'河北省邢台市临城县','临城县',',35,103,',103)
, (108,'2013-06-24 00:05:38','2013-06-24 00:05:38',null,'河北省邢台市内丘县','内丘县',',35,103,',103)
, (109,'2013-06-24 00:05:39','2013-06-24 00:05:39',null,'河北省邢台市柏乡县','柏乡县',',35,103,',103)
, (110,'2013-06-24 00:05:40','2013-06-24 00:05:40',null,'河北省邢台市隆尧县','隆尧县',',35,103,',103)
, (111,'2013-06-24 00:05:41','2013-06-24 00:05:41',null,'河北省邢台市任县','任县',',35,103,',103)
, (112,'2013-06-24 00:05:42','2013-06-24 00:05:42',null,'河北省邢台市南和县','南和县',',35,103,',103)
, (113,'2013-06-24 00:05:43','2013-06-24 00:05:43',null,'河北省邢台市宁晋县','宁晋县',',35,103,',103)
, (114,'2013-06-24 00:05:44','2013-06-24 00:05:44',null,'河北省邢台市巨鹿县','巨鹿县',',35,103,',103)
, (115,'2013-06-24 00:05:45','2013-06-24 00:05:45',null,'河北省邢台市新河县','新河县',',35,103,',103)
, (116,'2013-06-24 00:05:46','2013-06-24 00:05:46',null,'河北省邢台市广宗县','广宗县',',35,103,',103)
, (117,'2013-06-24 00:05:47','2013-06-24 00:05:47',null,'河北省邢台市平乡县','平乡县',',35,103,',103)
, (118,'2013-06-24 00:05:48','2013-06-24 00:05:48',null,'河北省邢台市威县','威县',',35,103,',103)
, (119,'2013-06-24 00:05:49','2013-06-24 00:05:49',null,'河北省邢台市清河县','清河县',',35,103,',103)
, (120,'2013-06-24 00:05:50','2013-06-24 00:05:50',null,'河北省邢台市临西县','临西县',',35,103,',103)
, (121,'2013-06-24 00:05:51','2013-06-24 00:05:51',null,'河北省邢台市南宫市','南宫市',',35,103,',103)
, (122,'2013-06-24 00:05:52','2013-06-24 00:05:52',null,'河北省邢台市沙河市','沙河市',',35,103,',103)
, (123,'2013-06-24 00:05:53','2013-06-24 00:05:53',null,'河北省保定市','保定市',',35,',35)
, (124,'2013-06-24 00:05:54','2013-06-24 00:05:54',null,'河北省保定市新市区','新市区',',35,123,',123)
, (125,'2013-06-24 00:05:55','2013-06-24 00:05:55',null,'河北省保定市北市区','北市区',',35,123,',123)
, (126,'2013-06-24 00:05:56','2013-06-24 00:05:56',null,'河北省保定市南市区','南市区',',35,123,',123)
, (127,'2013-06-24 00:05:57','2013-06-24 00:05:57',null,'河北省保定市满城县','满城县',',35,123,',123)
, (128,'2013-06-24 00:05:58','2013-06-24 00:05:58',null,'河北省保定市清苑县','清苑县',',35,123,',123)
, (129,'2013-06-24 00:05:59','2013-06-24 00:05:59',null,'河北省保定市涞水县','涞水县',',35,123,',123)
, (130,'2013-06-24 00:06:00','2013-06-24 00:06:00',null,'河北省保定市阜平县','阜平县',',35,123,',123)
, (131,'2013-06-24 00:06:01','2013-06-24 00:06:01',null,'河北省保定市徐水县','徐水县',',35,123,',123)
, (132,'2013-06-24 00:06:02','2013-06-24 00:06:02',null,'河北省保定市定兴县','定兴县',',35,123,',123)
, (133,'2013-06-24 00:06:03','2013-06-24 00:06:03',null,'河北省保定市唐县','唐县',',35,123,',123)
, (134,'2013-06-24 00:06:04','2013-06-24 00:06:04',null,'河北省保定市高阳县','高阳县',',35,123,',123)
, (135,'2013-06-24 00:06:05','2013-06-24 00:06:05',null,'河北省保定市容城县','容城县',',35,123,',123)
, (136,'2013-06-24 00:06:06','2013-06-24 00:06:06',null,'河北省保定市涞源县','涞源县',',35,123,',123)
, (137,'2013-06-24 00:06:07','2013-06-24 00:06:07',null,'河北省保定市望都县','望都县',',35,123,',123)
, (138,'2013-06-24 00:06:08','2013-06-24 00:06:08',null,'河北省保定市安新县','安新县',',35,123,',123)
, (139,'2013-06-24 00:06:09','2013-06-24 00:06:09',null,'河北省保定市易县','易县',',35,123,',123)
, (140,'2013-06-24 00:06:10','2013-06-24 00:06:10',null,'河北省保定市曲阳县','曲阳县',',35,123,',123)
, (141,'2013-06-24 00:06:11','2013-06-24 00:06:11',null,'河北省保定市蠡县','蠡县',',35,123,',123)
, (142,'2013-06-24 00:06:12','2013-06-24 00:06:12',null,'河北省保定市顺平县','顺平县',',35,123,',123)
, (143,'2013-06-24 00:06:13','2013-06-24 00:06:13',null,'河北省保定市博野县','博野县',',35,123,',123)
, (144,'2013-06-24 00:06:14','2013-06-24 00:06:14',null,'河北省保定市雄县','雄县',',35,123,',123)
, (145,'2013-06-24 00:06:15','2013-06-24 00:06:15',null,'河北省保定市涿州市','涿州市',',35,123,',123)
, (146,'2013-06-24 00:06:16','2013-06-24 00:06:16',null,'河北省保定市定州市','定州市',',35,123,',123)
, (147,'2013-06-24 00:06:17','2013-06-24 00:06:17',null,'河北省保定市安国市','安国市',',35,123,',123)
, (148,'2013-06-24 00:06:18','2013-06-24 00:06:18',null,'河北省保定市高碑店市','高碑店市',',35,123,',123)
, (149,'2013-06-24 00:06:19','2013-06-24 00:06:19',null,'河北省张家口市','张家口市',',35,',35)
, (150,'2013-06-24 00:06:20','2013-06-24 00:06:20',null,'河北省张家口市桥东区','桥东区',',35,149,',149)
, (151,'2013-06-24 00:06:21','2013-06-24 00:06:21',null,'河北省张家口市桥西区','桥西区',',35,149,',149)
, (152,'2013-06-24 00:06:22','2013-06-24 00:06:22',null,'河北省张家口市宣化区','宣化区',',35,149,',149)
, (153,'2013-06-24 00:06:23','2013-06-24 00:06:23',null,'河北省张家口市下花园区','下花园区',',35,149,',149)
, (154,'2013-06-24 00:06:24','2013-06-24 00:06:24',null,'河北省张家口市宣化县','宣化县',',35,149,',149)
, (155,'2013-06-24 00:06:25','2013-06-24 00:06:25',null,'河北省张家口市张北县','张北县',',35,149,',149)
, (156,'2013-06-24 00:06:26','2013-06-24 00:06:26',null,'河北省张家口市康保县','康保县',',35,149,',149)
, (157,'2013-06-24 00:06:27','2013-06-24 00:06:27',null,'河北省张家口市沽源县','沽源县',',35,149,',149)
, (158,'2013-06-24 00:06:28','2013-06-24 00:06:28',null,'河北省张家口市尚义县','尚义县',',35,149,',149)
, (159,'2013-06-24 00:06:29','2013-06-24 00:06:29',null,'河北省张家口市蔚县','蔚县',',35,149,',149)
, (160,'2013-06-24 00:06:30','2013-06-24 00:06:30',null,'河北省张家口市阳原县','阳原县',',35,149,',149)
, (161,'2013-06-24 00:06:31','2013-06-24 00:06:31',null,'河北省张家口市怀安县','怀安县',',35,149,',149)
, (162,'2013-06-24 00:06:32','2013-06-24 00:06:32',null,'河北省张家口市万全县','万全县',',35,149,',149)
, (163,'2013-06-24 00:06:33','2013-06-24 00:06:33',null,'河北省张家口市怀来县','怀来县',',35,149,',149)
, (164,'2013-06-24 00:06:34','2013-06-24 00:06:34',null,'河北省张家口市涿鹿县','涿鹿县',',35,149,',149)
, (165,'2013-06-24 00:06:35','2013-06-24 00:06:35',null,'河北省张家口市赤城县','赤城县',',35,149,',149)
, (166,'2013-06-24 00:06:36','2013-06-24 00:06:36',null,'河北省张家口市崇礼县','崇礼县',',35,149,',149)
, (167,'2013-06-24 00:06:37','2013-06-24 00:06:37',null,'河北省承德市','承德市',',35,',35)
, (168,'2013-06-24 00:06:38','2013-06-24 00:06:38',null,'河北省承德市双桥区','双桥区',',35,167,',167)
, (169,'2013-06-24 00:06:39','2013-06-24 00:06:39',null,'河北省承德市双滦区','双滦区',',35,167,',167)
, (170,'2013-06-24 00:06:40','2013-06-24 00:06:40',null,'河北省承德市鹰手营子矿区','鹰手营子矿区',',35,167,',167)
, (171,'2013-06-24 00:06:41','2013-06-24 00:06:41',null,'河北省承德市承德县','承德县',',35,167,',167)
, (172,'2013-06-24 00:06:42','2013-06-24 00:06:42',null,'河北省承德市兴隆县','兴隆县',',35,167,',167)
, (173,'2013-06-24 00:06:43','2013-06-24 00:06:43',null,'河北省承德市平泉县','平泉县',',35,167,',167)
, (174,'2013-06-24 00:06:44','2013-06-24 00:06:44',null,'河北省承德市滦平县','滦平县',',35,167,',167)
, (175,'2013-06-24 00:06:45','2013-06-24 00:06:45',null,'河北省承德市隆化县','隆化县',',35,167,',167)
, (176,'2013-06-24 00:06:46','2013-06-24 00:06:46',null,'河北省承德市丰宁满族自治县','丰宁满族自治县',',35,167,',167)
, (177,'2013-06-24 00:06:47','2013-06-24 00:06:47',null,'河北省承德市宽城满族自治县','宽城满族自治县',',35,167,',167)
, (178,'2013-06-24 00:06:48','2013-06-24 00:06:48',null,'河北省承德市围场满族蒙古族自治县','围场满族蒙古族自治县',',35,167,',167)
, (179,'2013-06-24 00:06:49','2013-06-24 00:06:49',null,'河北省沧州市','沧州市',',35,',35)
, (180,'2013-06-24 00:06:50','2013-06-24 00:06:50',null,'河北省沧州市新华区','新华区',',35,179,',179)
, (181,'2013-06-24 00:06:51','2013-06-24 00:06:51',null,'河北省沧州市运河区','运河区',',35,179,',179)
, (182,'2013-06-24 00:06:52','2013-06-24 00:06:52',null,'河北省沧州市沧县','沧县',',35,179,',179)
, (183,'2013-06-24 00:06:53','2013-06-24 00:06:53',null,'河北省沧州市青县','青县',',35,179,',179)
, (184,'2013-06-24 00:06:54','2013-06-24 00:06:54',null,'河北省沧州市东光县','东光县',',35,179,',179)
, (185,'2013-06-24 00:06:55','2013-06-24 00:06:55',null,'河北省沧州市海兴县','海兴县',',35,179,',179)
, (186,'2013-06-24 00:06:56','2013-06-24 00:06:56',null,'河北省沧州市盐山县','盐山县',',35,179,',179)
, (187,'2013-06-24 00:06:57','2013-06-24 00:06:57',null,'河北省沧州市肃宁县','肃宁县',',35,179,',179)
, (188,'2013-06-24 00:06:58','2013-06-24 00:06:58',null,'河北省沧州市南皮县','南皮县',',35,179,',179)
, (189,'2013-06-24 00:06:59','2013-06-24 00:06:59',null,'河北省沧州市吴桥县','吴桥县',',35,179,',179)
, (190,'2013-06-24 00:07:00','2013-06-24 00:07:00',null,'河北省沧州市献县','献县',',35,179,',179)
, (191,'2013-06-24 00:07:01','2013-06-24 00:07:01',null,'河北省沧州市孟村回族自治县','孟村回族自治县',',35,179,',179)
, (192,'2013-06-24 00:07:02','2013-06-24 00:07:02',null,'河北省沧州市泊头市','泊头市',',35,179,',179)
, (193,'2013-06-24 00:07:03','2013-06-24 00:07:03',null,'河北省沧州市任丘市','任丘市',',35,179,',179)
, (194,'2013-06-24 00:07:04','2013-06-24 00:07:04',null,'河北省沧州市黄骅市','黄骅市',',35,179,',179)
, (195,'2013-06-24 00:07:05','2013-06-24 00:07:05',null,'河北省沧州市河间市','河间市',',35,179,',179)
, (196,'2013-06-24 00:07:06','2013-06-24 00:07:06',null,'河北省廊坊市','廊坊市',',35,',35)
, (197,'2013-06-24 00:07:07','2013-06-24 00:07:07',null,'河北省廊坊市安次区','安次区',',35,196,',196)
, (198,'2013-06-24 00:07:08','2013-06-24 00:07:08',null,'河北省廊坊市广阳区','广阳区',',35,196,',196)
, (199,'2013-06-24 00:07:09','2013-06-24 00:07:09',null,'河北省廊坊市固安县','固安县',',35,196,',196)
, (200,'2013-06-24 00:07:10','2013-06-24 00:07:10',null,'河北省廊坊市永清县','永清县',',35,196,',196)
, (201,'2013-06-24 00:07:11','2013-06-24 00:07:11',null,'河北省廊坊市香河县','香河县',',35,196,',196)
, (202,'2013-06-24 00:07:12','2013-06-24 00:07:12',null,'河北省廊坊市大城县','大城县',',35,196,',196)
, (203,'2013-06-24 00:07:13','2013-06-24 00:07:13',null,'河北省廊坊市文安县','文安县',',35,196,',196)
, (204,'2013-06-24 00:07:14','2013-06-24 00:07:14',null,'河北省廊坊市大厂回族自治县','大厂回族自治县',',35,196,',196)
, (205,'2013-06-24 00:07:15','2013-06-24 00:07:15',null,'河北省廊坊市霸州市','霸州市',',35,196,',196)
, (206,'2013-06-24 00:07:16','2013-06-24 00:07:16',null,'河北省廊坊市三河市','三河市',',35,196,',196)
, (207,'2013-06-24 00:07:17','2013-06-24 00:07:17',null,'河北省衡水市','衡水市',',35,',35)
, (208,'2013-06-24 00:07:18','2013-06-24 00:07:18',null,'河北省衡水市桃城区','桃城区',',35,207,',207)
, (209,'2013-06-24 00:07:19','2013-06-24 00:07:19',null,'河北省衡水市枣强县','枣强县',',35,207,',207)
, (210,'2013-06-24 00:07:20','2013-06-24 00:07:20',null,'河北省衡水市武邑县','武邑县',',35,207,',207)
, (211,'2013-06-24 00:07:21','2013-06-24 00:07:21',null,'河北省衡水市武强县','武强县',',35,207,',207)
, (212,'2013-06-24 00:07:22','2013-06-24 00:07:22',null,'河北省衡水市饶阳县','饶阳县',',35,207,',207)
, (213,'2013-06-24 00:07:23','2013-06-24 00:07:23',null,'河北省衡水市安平县','安平县',',35,207,',207)
, (214,'2013-06-24 00:07:24','2013-06-24 00:07:24',null,'河北省衡水市故城县','故城县',',35,207,',207)
, (215,'2013-06-24 00:07:25','2013-06-24 00:07:25',null,'河北省衡水市景县','景县',',35,207,',207)
, (216,'2013-06-24 00:07:26','2013-06-24 00:07:26',null,'河北省衡水市阜城县','阜城县',',35,207,',207)
, (217,'2013-06-24 00:07:27','2013-06-24 00:07:27',null,'河北省衡水市冀州市','冀州市',',35,207,',207)
, (218,'2013-06-24 00:07:28','2013-06-24 00:07:28',null,'河北省衡水市深州市','深州市',',35,207,',207)
, (219,'2013-06-24 00:07:29','2013-06-24 00:07:29',null,'山西省','山西省',',',null)
, (220,'2013-06-24 00:07:30','2013-06-24 00:07:30',null,'山西省太原市','太原市',',219,',219)
, (221,'2013-06-24 00:07:31','2013-06-24 00:07:31',null,'山西省太原市小店区','小店区',',219,220,',220)
, (222,'2013-06-24 00:07:32','2013-06-24 00:07:32',null,'山西省太原市迎泽区','迎泽区',',219,220,',220)
, (223,'2013-06-24 00:07:33','2013-06-24 00:07:33',null,'山西省太原市杏花岭区','杏花岭区',',219,220,',220)
, (224,'2013-06-24 00:07:34','2013-06-24 00:07:34',null,'山西省太原市尖草坪区','尖草坪区',',219,220,',220)
, (225,'2013-06-24 00:07:35','2013-06-24 00:07:35',null,'山西省太原市万柏林区','万柏林区',',219,220,',220)
, (226,'2013-06-24 00:07:36','2013-06-24 00:07:36',null,'山西省太原市晋源区','晋源区',',219,220,',220)
, (227,'2013-06-24 00:07:37','2013-06-24 00:07:37',null,'山西省太原市清徐县','清徐县',',219,220,',220)
, (228,'2013-06-24 00:07:38','2013-06-24 00:07:38',null,'山西省太原市阳曲县','阳曲县',',219,220,',220)
, (229,'2013-06-24 00:07:39','2013-06-24 00:07:39',null,'山西省太原市娄烦县','娄烦县',',219,220,',220)
, (230,'2013-06-24 00:07:40','2013-06-24 00:07:40',null,'山西省太原市古交市','古交市',',219,220,',220)
, (231,'2013-06-24 00:07:41','2013-06-24 00:07:41',null,'山西省大同市','大同市',',219,',219)
, (232,'2013-06-24 00:07:42','2013-06-24 00:07:42',null,'山西省大同市城区','城区',',219,231,',231)
, (233,'2013-06-24 00:07:43','2013-06-24 00:07:43',null,'山西省大同市矿区','矿区',',219,231,',231)
, (234,'2013-06-24 00:07:44','2013-06-24 00:07:44',null,'山西省大同市南郊区','南郊区',',219,231,',231)
, (235,'2013-06-24 00:07:45','2013-06-24 00:07:45',null,'山西省大同市新荣区','新荣区',',219,231,',231)
, (236,'2013-06-24 00:07:46','2013-06-24 00:07:46',null,'山西省大同市阳高县','阳高县',',219,231,',231)
, (237,'2013-06-24 00:07:47','2013-06-24 00:07:47',null,'山西省大同市天镇县','天镇县',',219,231,',231)
, (238,'2013-06-24 00:07:48','2013-06-24 00:07:48',null,'山西省大同市广灵县','广灵县',',219,231,',231)
, (239,'2013-06-24 00:07:49','2013-06-24 00:07:49',null,'山西省大同市灵丘县','灵丘县',',219,231,',231)
, (240,'2013-06-24 00:07:50','2013-06-24 00:07:50',null,'山西省大同市浑源县','浑源县',',219,231,',231)
, (241,'2013-06-24 00:07:51','2013-06-24 00:07:51',null,'山西省大同市左云县','左云县',',219,231,',231)
, (242,'2013-06-24 00:07:52','2013-06-24 00:07:52',null,'山西省大同市大同县','大同县',',219,231,',231)
, (243,'2013-06-24 00:07:53','2013-06-24 00:07:53',null,'山西省阳泉市','阳泉市',',219,',219)
, (244,'2013-06-24 00:07:54','2013-06-24 00:07:54',null,'山西省阳泉市城区','城区',',219,243,',243)
, (245,'2013-06-24 00:07:55','2013-06-24 00:07:55',null,'山西省阳泉市矿区','矿区',',219,243,',243)
, (246,'2013-06-24 00:07:56','2013-06-24 00:07:56',null,'山西省阳泉市郊区','郊区',',219,243,',243)
, (247,'2013-06-24 00:07:57','2013-06-24 00:07:57',null,'山西省阳泉市平定县','平定县',',219,243,',243)
, (248,'2013-06-24 00:07:58','2013-06-24 00:07:58',null,'山西省阳泉市盂县','盂县',',219,243,',243)
, (249,'2013-06-24 00:07:59','2013-06-24 00:07:59',null,'山西省长治市','长治市',',219,',219)
, (250,'2013-06-24 00:08:00','2013-06-24 00:08:00',null,'山西省长治市城区','城区',',219,249,',249)
, (251,'2013-06-24 00:08:01','2013-06-24 00:08:01',null,'山西省长治市郊区','郊区',',219,249,',249)
, (252,'2013-06-24 00:08:02','2013-06-24 00:08:02',null,'山西省长治市长治县','长治县',',219,249,',249)
, (253,'2013-06-24 00:08:03','2013-06-24 00:08:03',null,'山西省长治市襄垣县','襄垣县',',219,249,',249)
, (254,'2013-06-24 00:08:04','2013-06-24 00:08:04',null,'山西省长治市屯留县','屯留县',',219,249,',249)
, (255,'2013-06-24 00:08:05','2013-06-24 00:08:05',null,'山西省长治市平顺县','平顺县',',219,249,',249)
, (256,'2013-06-24 00:08:06','2013-06-24 00:08:06',null,'山西省长治市黎城县','黎城县',',219,249,',249)
, (257,'2013-06-24 00:08:07','2013-06-24 00:08:07',null,'山西省长治市壶关县','壶关县',',219,249,',249)
, (258,'2013-06-24 00:08:08','2013-06-24 00:08:08',null,'山西省长治市长子县','长子县',',219,249,',249)
, (259,'2013-06-24 00:08:09','2013-06-24 00:08:09',null,'山西省长治市武乡县','武乡县',',219,249,',249)
, (260,'2013-06-24 00:08:10','2013-06-24 00:08:10',null,'山西省长治市沁县','沁县',',219,249,',249)
, (261,'2013-06-24 00:08:11','2013-06-24 00:08:11',null,'山西省长治市沁源县','沁源县',',219,249,',249)
, (262,'2013-06-24 00:08:12','2013-06-24 00:08:12',null,'山西省长治市潞城市','潞城市',',219,249,',249)
, (263,'2013-06-24 00:08:13','2013-06-24 00:08:13',null,'山西省晋城市','晋城市',',219,',219)
, (264,'2013-06-24 00:08:14','2013-06-24 00:08:14',null,'山西省晋城市晋城市市辖区','晋城市市辖区',',219,263,',263)
, (265,'2013-06-24 00:08:15','2013-06-24 00:08:15',null,'山西省晋城市城区','城区',',219,263,',263)
, (266,'2013-06-24 00:08:16','2013-06-24 00:08:16',null,'山西省晋城市沁水县','沁水县',',219,263,',263)
, (267,'2013-06-24 00:08:17','2013-06-24 00:08:17',null,'山西省晋城市阳城县','阳城县',',219,263,',263)
, (268,'2013-06-24 00:08:18','2013-06-24 00:08:18',null,'山西省晋城市陵川县','陵川县',',219,263,',263)
, (269,'2013-06-24 00:08:19','2013-06-24 00:08:19',null,'山西省晋城市泽州县','泽州县',',219,263,',263)
, (270,'2013-06-24 00:08:20','2013-06-24 00:08:20',null,'山西省晋城市高平市','高平市',',219,263,',263)
, (271,'2013-06-24 00:08:21','2013-06-24 00:08:21',null,'山西省朔州市','朔州市',',219,',219)
, (272,'2013-06-24 00:08:22','2013-06-24 00:08:22',null,'山西省朔州市朔城区','朔城区',',219,271,',271)
, (273,'2013-06-24 00:08:23','2013-06-24 00:08:23',null,'山西省朔州市平鲁区','平鲁区',',219,271,',271)
, (274,'2013-06-24 00:08:24','2013-06-24 00:08:24',null,'山西省朔州市山阴县','山阴县',',219,271,',271)
, (275,'2013-06-24 00:08:25','2013-06-24 00:08:25',null,'山西省朔州市应县','应县',',219,271,',271)
, (276,'2013-06-24 00:08:26','2013-06-24 00:08:26',null,'山西省朔州市右玉县','右玉县',',219,271,',271)
, (277,'2013-06-24 00:08:27','2013-06-24 00:08:27',null,'山西省朔州市怀仁县','怀仁县',',219,271,',271)
, (278,'2013-06-24 00:08:28','2013-06-24 00:08:28',null,'山西省晋中市','晋中市',',219,',219)
, (279,'2013-06-24 00:08:29','2013-06-24 00:08:29',null,'山西省晋中市榆次区','榆次区',',219,278,',278)
, (280,'2013-06-24 00:08:30','2013-06-24 00:08:30',null,'山西省晋中市榆社县','榆社县',',219,278,',278)
, (281,'2013-06-24 00:08:31','2013-06-24 00:08:31',null,'山西省晋中市左权县','左权县',',219,278,',278)
, (282,'2013-06-24 00:08:32','2013-06-24 00:08:32',null,'山西省晋中市和顺县','和顺县',',219,278,',278)
, (283,'2013-06-24 00:08:33','2013-06-24 00:08:33',null,'山西省晋中市昔阳县','昔阳县',',219,278,',278)
, (284,'2013-06-24 00:08:34','2013-06-24 00:08:34',null,'山西省晋中市寿阳县','寿阳县',',219,278,',278)
, (285,'2013-06-24 00:08:35','2013-06-24 00:08:35',null,'山西省晋中市太谷县','太谷县',',219,278,',278)
, (286,'2013-06-24 00:08:36','2013-06-24 00:08:36',null,'山西省晋中市祁县','祁县',',219,278,',278)
, (287,'2013-06-24 00:08:37','2013-06-24 00:08:37',null,'山西省晋中市平遥县','平遥县',',219,278,',278)
, (288,'2013-06-24 00:08:38','2013-06-24 00:08:38',null,'山西省晋中市灵石县','灵石县',',219,278,',278)
, (289,'2013-06-24 00:08:39','2013-06-24 00:08:39',null,'山西省晋中市介休市','介休市',',219,278,',278)
, (290,'2013-06-24 00:08:40','2013-06-24 00:08:40',null,'山西省运城市','运城市',',219,',219)
, (291,'2013-06-24 00:08:41','2013-06-24 00:08:41',null,'山西省运城市盐湖区','盐湖区',',219,290,',290)
, (292,'2013-06-24 00:08:42','2013-06-24 00:08:42',null,'山西省运城市临猗县','临猗县',',219,290,',290)
, (293,'2013-06-24 00:08:43','2013-06-24 00:08:43',null,'山西省运城市万荣县','万荣县',',219,290,',290)
, (294,'2013-06-24 00:08:44','2013-06-24 00:08:44',null,'山西省运城市闻喜县','闻喜县',',219,290,',290)
, (295,'2013-06-24 00:08:45','2013-06-24 00:08:45',null,'山西省运城市稷山县','稷山县',',219,290,',290)
, (296,'2013-06-24 00:08:46','2013-06-24 00:08:46',null,'山西省运城市新绛县','新绛县',',219,290,',290)
, (297,'2013-06-24 00:08:47','2013-06-24 00:08:47',null,'山西省运城市绛县','绛县',',219,290,',290)
, (298,'2013-06-24 00:08:48','2013-06-24 00:08:48',null,'山西省运城市垣曲县','垣曲县',',219,290,',290)
, (299,'2013-06-24 00:08:49','2013-06-24 00:08:49',null,'山西省运城市夏县','夏县',',219,290,',290)
, (300,'2013-06-24 00:08:50','2013-06-24 00:08:50',null,'山西省运城市平陆县','平陆县',',219,290,',290)
, (301,'2013-06-24 00:08:51','2013-06-24 00:08:51',null,'山西省运城市芮城县','芮城县',',219,290,',290)
, (302,'2013-06-24 00:08:52','2013-06-24 00:08:52',null,'山西省运城市永济市','永济市',',219,290,',290)
, (303,'2013-06-24 00:08:53','2013-06-24 00:08:53',null,'山西省运城市河津市','河津市',',219,290,',290)
, (304,'2013-06-24 00:08:54','2013-06-24 00:08:54',null,'山西省忻州市','忻州市',',219,',219)
, (305,'2013-06-24 00:08:55','2013-06-24 00:08:55',null,'山西省忻州市忻府区','忻府区',',219,304,',304)
, (306,'2013-06-24 00:08:56','2013-06-24 00:08:56',null,'山西省忻州市定襄县','定襄县',',219,304,',304)
, (307,'2013-06-24 00:08:57','2013-06-24 00:08:57',null,'山西省忻州市五台县','五台县',',219,304,',304)
, (308,'2013-06-24 00:08:58','2013-06-24 00:08:58',null,'山西省忻州市代县','代县',',219,304,',304)
, (309,'2013-06-24 00:08:59','2013-06-24 00:08:59',null,'山西省忻州市繁峙县','繁峙县',',219,304,',304)
, (310,'2013-06-24 00:09:00','2013-06-24 00:09:00',null,'山西省忻州市宁武县','宁武县',',219,304,',304)
, (311,'2013-06-24 00:09:01','2013-06-24 00:09:01',null,'山西省忻州市静乐县','静乐县',',219,304,',304)
, (312,'2013-06-24 00:09:02','2013-06-24 00:09:02',null,'山西省忻州市神池县','神池县',',219,304,',304)
, (313,'2013-06-24 00:09:03','2013-06-24 00:09:03',null,'山西省忻州市五寨县','五寨县',',219,304,',304)
, (314,'2013-06-24 00:09:04','2013-06-24 00:09:04',null,'山西省忻州市岢岚县','岢岚县',',219,304,',304)
, (315,'2013-06-24 00:09:05','2013-06-24 00:09:05',null,'山西省忻州市河曲县','河曲县',',219,304,',304)
, (316,'2013-06-24 00:09:06','2013-06-24 00:09:06',null,'山西省忻州市保德县','保德县',',219,304,',304)
, (317,'2013-06-24 00:09:07','2013-06-24 00:09:07',null,'山西省忻州市偏关县','偏关县',',219,304,',304)
, (318,'2013-06-24 00:09:08','2013-06-24 00:09:08',null,'山西省忻州市原平市','原平市',',219,304,',304)
, (319,'2013-06-24 00:09:09','2013-06-24 00:09:09',null,'山西省临汾市','临汾市',',219,',219)
, (320,'2013-06-24 00:09:10','2013-06-24 00:09:10',null,'山西省临汾市尧都区','尧都区',',219,319,',319)
, (321,'2013-06-24 00:09:11','2013-06-24 00:09:11',null,'山西省临汾市曲沃县','曲沃县',',219,319,',319)
, (322,'2013-06-24 00:09:12','2013-06-24 00:09:12',null,'山西省临汾市翼城县','翼城县',',219,319,',319)
, (323,'2013-06-24 00:09:13','2013-06-24 00:09:13',null,'山西省临汾市襄汾县','襄汾县',',219,319,',319)
, (324,'2013-06-24 00:09:14','2013-06-24 00:09:14',null,'山西省临汾市洪洞县','洪洞县',',219,319,',319)
, (325,'2013-06-24 00:09:15','2013-06-24 00:09:15',null,'山西省临汾市古县','古县',',219,319,',319)
, (326,'2013-06-24 00:09:16','2013-06-24 00:09:16',null,'山西省临汾市安泽县','安泽县',',219,319,',319)
, (327,'2013-06-24 00:09:17','2013-06-24 00:09:17',null,'山西省临汾市浮山县','浮山县',',219,319,',319)
, (328,'2013-06-24 00:09:18','2013-06-24 00:09:18',null,'山西省临汾市吉县','吉县',',219,319,',319)
, (329,'2013-06-24 00:09:19','2013-06-24 00:09:19',null,'山西省临汾市乡宁县','乡宁县',',219,319,',319)
, (330,'2013-06-24 00:09:20','2013-06-24 00:09:20',null,'山西省临汾市大宁县','大宁县',',219,319,',319)
, (331,'2013-06-24 00:09:21','2013-06-24 00:09:21',null,'山西省临汾市隰县','隰县',',219,319,',319)
, (332,'2013-06-24 00:09:22','2013-06-24 00:09:22',null,'山西省临汾市永和县','永和县',',219,319,',319)
, (333,'2013-06-24 00:09:23','2013-06-24 00:09:23',null,'山西省临汾市蒲县','蒲县',',219,319,',319)
, (334,'2013-06-24 00:09:24','2013-06-24 00:09:24',null,'山西省临汾市汾西县','汾西县',',219,319,',319)
, (335,'2013-06-24 00:09:25','2013-06-24 00:09:25',null,'山西省临汾市侯马市','侯马市',',219,319,',319)
, (336,'2013-06-24 00:09:26','2013-06-24 00:09:26',null,'山西省临汾市霍州市','霍州市',',219,319,',319)
, (337,'2013-06-24 00:09:27','2013-06-24 00:09:27',null,'山西省吕梁市','吕梁市',',219,',219)
, (338,'2013-06-24 00:09:28','2013-06-24 00:09:28',null,'山西省吕梁市离石区','离石区',',219,337,',337)
, (339,'2013-06-24 00:09:29','2013-06-24 00:09:29',null,'山西省吕梁市文水县','文水县',',219,337,',337)
, (340,'2013-06-24 00:09:30','2013-06-24 00:09:30',null,'山西省吕梁市交城县','交城县',',219,337,',337)
, (341,'2013-06-24 00:09:31','2013-06-24 00:09:31',null,'山西省吕梁市兴县','兴县',',219,337,',337)
, (342,'2013-06-24 00:09:32','2013-06-24 00:09:32',null,'山西省吕梁市临县','临县',',219,337,',337)
, (343,'2013-06-24 00:09:33','2013-06-24 00:09:33',null,'山西省吕梁市柳林县','柳林县',',219,337,',337)
, (344,'2013-06-24 00:09:34','2013-06-24 00:09:34',null,'山西省吕梁市石楼县','石楼县',',219,337,',337)
, (345,'2013-06-24 00:09:35','2013-06-24 00:09:35',null,'山西省吕梁市岚县','岚县',',219,337,',337)
, (346,'2013-06-24 00:09:36','2013-06-24 00:09:36',null,'山西省吕梁市方山县','方山县',',219,337,',337)
, (347,'2013-06-24 00:09:37','2013-06-24 00:09:37',null,'山西省吕梁市中阳县','中阳县',',219,337,',337)
, (348,'2013-06-24 00:09:38','2013-06-24 00:09:38',null,'山西省吕梁市交口县','交口县',',219,337,',337)
, (349,'2013-06-24 00:09:39','2013-06-24 00:09:39',null,'山西省吕梁市孝义市','孝义市',',219,337,',337)
, (350,'2013-06-24 00:09:40','2013-06-24 00:09:40',null,'山西省吕梁市汾阳市','汾阳市',',219,337,',337)
, (351,'2013-06-24 00:09:41','2013-06-24 00:09:41',null,'内蒙古自治区','内蒙古自治区',',',null)
, (352,'2013-06-24 00:09:42','2013-06-24 00:09:42',null,'内蒙古自治区呼和浩特市','呼和浩特市',',351,',351)
, (353,'2013-06-24 00:09:43','2013-06-24 00:09:43',null,'内蒙古自治区呼和浩特市新城区','新城区',',351,352,',352)
, (354,'2013-06-24 00:09:44','2013-06-24 00:09:44',null,'内蒙古自治区呼和浩特市回民区','回民区',',351,352,',352)
, (355,'2013-06-24 00:09:45','2013-06-24 00:09:45',null,'内蒙古自治区呼和浩特市玉泉区','玉泉区',',351,352,',352)
, (356,'2013-06-24 00:09:46','2013-06-24 00:09:46',null,'内蒙古自治区呼和浩特市赛罕区','赛罕区',',351,352,',352)
, (357,'2013-06-24 00:09:47','2013-06-24 00:09:47',null,'内蒙古自治区呼和浩特市土默特左旗','土默特左旗',',351,352,',352)
, (358,'2013-06-24 00:09:48','2013-06-24 00:09:48',null,'内蒙古自治区呼和浩特市托克托县','托克托县',',351,352,',352)
, (359,'2013-06-24 00:09:49','2013-06-24 00:09:49',null,'内蒙古自治区呼和浩特市和林格尔县','和林格尔县',',351,352,',352)
, (360,'2013-06-24 00:09:50','2013-06-24 00:09:50',null,'内蒙古自治区呼和浩特市清水河县','清水河县',',351,352,',352)
, (361,'2013-06-24 00:09:51','2013-06-24 00:09:51',null,'内蒙古自治区呼和浩特市武川县','武川县',',351,352,',352)
, (362,'2013-06-24 00:09:52','2013-06-24 00:09:52',null,'内蒙古自治区包头市','包头市',',351,',351)
, (363,'2013-06-24 00:09:53','2013-06-24 00:09:53',null,'内蒙古自治区包头市东河区','东河区',',351,362,',362)
, (364,'2013-06-24 00:09:54','2013-06-24 00:09:54',null,'内蒙古自治区包头市昆都仑区','昆都仑区',',351,362,',362)
, (365,'2013-06-24 00:09:55','2013-06-24 00:09:55',null,'内蒙古自治区包头市青山区','青山区',',351,362,',362)
, (366,'2013-06-24 00:09:56','2013-06-24 00:09:56',null,'内蒙古自治区包头市石拐区','石拐区',',351,362,',362)
, (367,'2013-06-24 00:09:57','2013-06-24 00:09:57',null,'内蒙古自治区包头市白云鄂博矿区','白云鄂博矿区',',351,362,',362)
, (368,'2013-06-24 00:09:58','2013-06-24 00:09:58',null,'内蒙古自治区包头市九原区','九原区',',351,362,',362)
, (369,'2013-06-24 00:09:59','2013-06-24 00:09:59',null,'内蒙古自治区包头市土默特右旗','土默特右旗',',351,362,',362)
, (370,'2013-06-24 00:10:00','2013-06-24 00:10:00',null,'内蒙古自治区包头市固阳县','固阳县',',351,362,',362)
, (371,'2013-06-24 00:10:01','2013-06-24 00:10:01',null,'内蒙古自治区包头市达尔罕茂明安联合旗','达尔罕茂明安联合旗',',351,362,',362)
, (372,'2013-06-24 00:10:02','2013-06-24 00:10:02',null,'内蒙古自治区乌海市','乌海市',',351,',351)
, (373,'2013-06-24 00:10:03','2013-06-24 00:10:03',null,'内蒙古自治区乌海市海勃湾区','海勃湾区',',351,372,',372)
, (374,'2013-06-24 00:10:04','2013-06-24 00:10:04',null,'内蒙古自治区乌海市海南区','海南区',',351,372,',372)
, (375,'2013-06-24 00:10:05','2013-06-24 00:10:05',null,'内蒙古自治区乌海市乌达区','乌达区',',351,372,',372)
, (376,'2013-06-24 00:10:06','2013-06-24 00:10:06',null,'内蒙古自治区赤峰市','赤峰市',',351,',351)
, (377,'2013-06-24 00:10:07','2013-06-24 00:10:07',null,'内蒙古自治区赤峰市红山区','红山区',',351,376,',376)
, (378,'2013-06-24 00:10:08','2013-06-24 00:10:08',null,'内蒙古自治区赤峰市元宝山区','元宝山区',',351,376,',376)
, (379,'2013-06-24 00:10:09','2013-06-24 00:10:09',null,'内蒙古自治区赤峰市松山区','松山区',',351,376,',376)
, (380,'2013-06-24 00:10:10','2013-06-24 00:10:10',null,'内蒙古自治区赤峰市阿鲁科尔沁旗','阿鲁科尔沁旗',',351,376,',376)
, (381,'2013-06-24 00:10:11','2013-06-24 00:10:11',null,'内蒙古自治区赤峰市巴林左旗','巴林左旗',',351,376,',376)
, (382,'2013-06-24 00:10:12','2013-06-24 00:10:12',null,'内蒙古自治区赤峰市巴林右旗','巴林右旗',',351,376,',376)
, (383,'2013-06-24 00:10:13','2013-06-24 00:10:13',null,'内蒙古自治区赤峰市林西县','林西县',',351,376,',376)
, (384,'2013-06-24 00:10:14','2013-06-24 00:10:14',null,'内蒙古自治区赤峰市克什克腾旗','克什克腾旗',',351,376,',376)
, (385,'2013-06-24 00:10:15','2013-06-24 00:10:15',null,'内蒙古自治区赤峰市翁牛特旗','翁牛特旗',',351,376,',376)
, (386,'2013-06-24 00:10:16','2013-06-24 00:10:16',null,'内蒙古自治区赤峰市喀喇沁旗','喀喇沁旗',',351,376,',376)
, (387,'2013-06-24 00:10:17','2013-06-24 00:10:17',null,'内蒙古自治区赤峰市宁城县','宁城县',',351,376,',376)
, (388,'2013-06-24 00:10:18','2013-06-24 00:10:18',null,'内蒙古自治区赤峰市敖汉旗','敖汉旗',',351,376,',376)
, (389,'2013-06-24 00:10:19','2013-06-24 00:10:19',null,'内蒙古自治区通辽市','通辽市',',351,',351)
, (390,'2013-06-24 00:10:20','2013-06-24 00:10:20',null,'内蒙古自治区通辽市科尔沁区','科尔沁区',',351,389,',389)
, (391,'2013-06-24 00:10:21','2013-06-24 00:10:21',null,'内蒙古自治区通辽市科尔沁左翼中旗','科尔沁左翼中旗',',351,389,',389)
, (392,'2013-06-24 00:10:22','2013-06-24 00:10:22',null,'内蒙古自治区通辽市科尔沁左翼后旗','科尔沁左翼后旗',',351,389,',389)
, (393,'2013-06-24 00:10:23','2013-06-24 00:10:23',null,'内蒙古自治区通辽市开鲁县','开鲁县',',351,389,',389)
, (394,'2013-06-24 00:10:24','2013-06-24 00:10:24',null,'内蒙古自治区通辽市库伦旗','库伦旗',',351,389,',389)
, (395,'2013-06-24 00:10:25','2013-06-24 00:10:25',null,'内蒙古自治区通辽市奈曼旗','奈曼旗',',351,389,',389)
, (396,'2013-06-24 00:10:26','2013-06-24 00:10:26',null,'内蒙古自治区通辽市扎鲁特旗','扎鲁特旗',',351,389,',389)
, (397,'2013-06-24 00:10:27','2013-06-24 00:10:27',null,'内蒙古自治区通辽市霍林郭勒市','霍林郭勒市',',351,389,',389)
, (398,'2013-06-24 00:10:28','2013-06-24 00:10:28',null,'内蒙古自治区鄂尔多斯市','鄂尔多斯市',',351,',351)
, (399,'2013-06-24 00:10:29','2013-06-24 00:10:29',null,'内蒙古自治区鄂尔多斯市东胜区','东胜区',',351,398,',398)
, (400,'2013-06-24 00:10:30','2013-06-24 00:10:30',null,'内蒙古自治区鄂尔多斯市达拉特旗','达拉特旗',',351,398,',398)
, (401,'2013-06-24 00:10:31','2013-06-24 00:10:31',null,'内蒙古自治区鄂尔多斯市准格尔旗','准格尔旗',',351,398,',398)
, (402,'2013-06-24 00:10:32','2013-06-24 00:10:32',null,'内蒙古自治区鄂尔多斯市鄂托克前旗','鄂托克前旗',',351,398,',398)
, (403,'2013-06-24 00:10:33','2013-06-24 00:10:33',null,'内蒙古自治区鄂尔多斯市鄂托克旗','鄂托克旗',',351,398,',398)
, (404,'2013-06-24 00:10:34','2013-06-24 00:10:34',null,'内蒙古自治区鄂尔多斯市杭锦旗','杭锦旗',',351,398,',398)
, (405,'2013-06-24 00:10:35','2013-06-24 00:10:35',null,'内蒙古自治区鄂尔多斯市乌审旗','乌审旗',',351,398,',398)
, (406,'2013-06-24 00:10:36','2013-06-24 00:10:36',null,'内蒙古自治区鄂尔多斯市伊金霍洛旗','伊金霍洛旗',',351,398,',398)
, (407,'2013-06-24 00:10:37','2013-06-24 00:10:37',null,'内蒙古自治区呼伦贝尔市','呼伦贝尔市',',351,',351)
, (408,'2013-06-24 00:10:38','2013-06-24 00:10:38',null,'内蒙古自治区呼伦贝尔市海拉尔区','海拉尔区',',351,407,',407)
, (409,'2013-06-24 00:10:39','2013-06-24 00:10:39',null,'内蒙古自治区呼伦贝尔市阿荣旗','阿荣旗',',351,407,',407)
, (410,'2013-06-24 00:10:40','2013-06-24 00:10:40',null,'内蒙古自治区呼伦贝尔市莫力达瓦达斡尔族自治旗','莫力达瓦达斡尔族自治旗',',351,407,',407)
, (411,'2013-06-24 00:10:41','2013-06-24 00:10:41',null,'内蒙古自治区呼伦贝尔市鄂伦春自治旗','鄂伦春自治旗',',351,407,',407)
, (412,'2013-06-24 00:10:42','2013-06-24 00:10:42',null,'内蒙古自治区呼伦贝尔市鄂温克族自治旗','鄂温克族自治旗',',351,407,',407)
, (413,'2013-06-24 00:10:43','2013-06-24 00:10:43',null,'内蒙古自治区呼伦贝尔市陈巴尔虎旗','陈巴尔虎旗',',351,407,',407)
, (414,'2013-06-24 00:10:44','2013-06-24 00:10:44',null,'内蒙古自治区呼伦贝尔市新巴尔虎左旗','新巴尔虎左旗',',351,407,',407)
, (415,'2013-06-24 00:10:45','2013-06-24 00:10:45',null,'内蒙古自治区呼伦贝尔市新巴尔虎右旗','新巴尔虎右旗',',351,407,',407)
, (416,'2013-06-24 00:10:46','2013-06-24 00:10:46',null,'内蒙古自治区呼伦贝尔市满洲里市','满洲里市',',351,407,',407)
, (417,'2013-06-24 00:10:47','2013-06-24 00:10:47',null,'内蒙古自治区呼伦贝尔市牙克石市','牙克石市',',351,407,',407)
, (418,'2013-06-24 00:10:48','2013-06-24 00:10:48',null,'内蒙古自治区呼伦贝尔市扎兰屯市','扎兰屯市',',351,407,',407)
, (419,'2013-06-24 00:10:49','2013-06-24 00:10:49',null,'内蒙古自治区呼伦贝尔市额尔古纳市','额尔古纳市',',351,407,',407)
, (420,'2013-06-24 00:10:50','2013-06-24 00:10:50',null,'内蒙古自治区呼伦贝尔市根河市','根河市',',351,407,',407)
, (421,'2013-06-24 00:10:51','2013-06-24 00:10:51',null,'内蒙古自治区巴彦淖尔市','巴彦淖尔市',',351,',351)
, (422,'2013-06-24 00:10:52','2013-06-24 00:10:52',null,'内蒙古自治区巴彦淖尔市临河区','临河区',',351,421,',421)
, (423,'2013-06-24 00:10:53','2013-06-24 00:10:53',null,'内蒙古自治区巴彦淖尔市五原县','五原县',',351,421,',421)
, (424,'2013-06-24 00:10:54','2013-06-24 00:10:54',null,'内蒙古自治区巴彦淖尔市磴口县','磴口县',',351,421,',421)
, (425,'2013-06-24 00:10:55','2013-06-24 00:10:55',null,'内蒙古自治区巴彦淖尔市乌拉特前旗','乌拉特前旗',',351,421,',421)
, (426,'2013-06-24 00:10:56','2013-06-24 00:10:56',null,'内蒙古自治区巴彦淖尔市乌拉特中旗','乌拉特中旗',',351,421,',421)
, (427,'2013-06-24 00:10:57','2013-06-24 00:10:57',null,'内蒙古自治区巴彦淖尔市乌拉特后旗','乌拉特后旗',',351,421,',421)
, (428,'2013-06-24 00:10:58','2013-06-24 00:10:58',null,'内蒙古自治区巴彦淖尔市杭锦后旗','杭锦后旗',',351,421,',421)
, (429,'2013-06-24 00:10:59','2013-06-24 00:10:59',null,'内蒙古自治区乌兰察布市','乌兰察布市',',351,',351)
, (430,'2013-06-24 00:11:00','2013-06-24 00:11:00',null,'内蒙古自治区乌兰察布市集宁区','集宁区',',351,429,',429)
, (431,'2013-06-24 00:11:01','2013-06-24 00:11:01',null,'内蒙古自治区乌兰察布市卓资县','卓资县',',351,429,',429)
, (432,'2013-06-24 00:11:02','2013-06-24 00:11:02',null,'内蒙古自治区乌兰察布市化德县','化德县',',351,429,',429)
, (433,'2013-06-24 00:11:03','2013-06-24 00:11:03',null,'内蒙古自治区乌兰察布市商都县','商都县',',351,429,',429)
, (434,'2013-06-24 00:11:04','2013-06-24 00:11:04',null,'内蒙古自治区乌兰察布市兴和县','兴和县',',351,429,',429)
, (435,'2013-06-24 00:11:05','2013-06-24 00:11:05',null,'内蒙古自治区乌兰察布市凉城县','凉城县',',351,429,',429)
, (436,'2013-06-24 00:11:06','2013-06-24 00:11:06',null,'内蒙古自治区乌兰察布市察哈尔右翼前旗','察哈尔右翼前旗',',351,429,',429)
, (437,'2013-06-24 00:11:07','2013-06-24 00:11:07',null,'内蒙古自治区乌兰察布市察哈尔右翼中旗','察哈尔右翼中旗',',351,429,',429)
, (438,'2013-06-24 00:11:08','2013-06-24 00:11:08',null,'内蒙古自治区乌兰察布市察哈尔右翼后旗','察哈尔右翼后旗',',351,429,',429)
, (439,'2013-06-24 00:11:09','2013-06-24 00:11:09',null,'内蒙古自治区乌兰察布市四子王旗','四子王旗',',351,429,',429)
, (440,'2013-06-24 00:11:10','2013-06-24 00:11:10',null,'内蒙古自治区乌兰察布市丰镇市','丰镇市',',351,429,',429)
, (441,'2013-06-24 00:11:11','2013-06-24 00:11:11',null,'内蒙古自治区兴安盟','兴安盟',',351,',351)
, (442,'2013-06-24 00:11:12','2013-06-24 00:11:12',null,'内蒙古自治区兴安盟乌兰浩特市','乌兰浩特市',',351,441,',441)
, (443,'2013-06-24 00:11:13','2013-06-24 00:11:13',null,'内蒙古自治区兴安盟阿尔山市','阿尔山市',',351,441,',441)
, (444,'2013-06-24 00:11:14','2013-06-24 00:11:14',null,'内蒙古自治区兴安盟科尔沁右翼前旗','科尔沁右翼前旗',',351,441,',441)
, (445,'2013-06-24 00:11:15','2013-06-24 00:11:15',null,'内蒙古自治区兴安盟科尔沁右翼中旗','科尔沁右翼中旗',',351,441,',441)
, (446,'2013-06-24 00:11:16','2013-06-24 00:11:16',null,'内蒙古自治区兴安盟扎赉特旗','扎赉特旗',',351,441,',441)
, (447,'2013-06-24 00:11:17','2013-06-24 00:11:17',null,'内蒙古自治区兴安盟突泉县','突泉县',',351,441,',441)
, (448,'2013-06-24 00:11:18','2013-06-24 00:11:18',null,'内蒙古自治区锡林郭勒盟','锡林郭勒盟',',351,',351)
, (449,'2013-06-24 00:11:19','2013-06-24 00:11:19',null,'内蒙古自治区锡林郭勒盟二连浩特市','二连浩特市',',351,448,',448)
, (450,'2013-06-24 00:11:20','2013-06-24 00:11:20',null,'内蒙古自治区锡林郭勒盟锡林浩特市','锡林浩特市',',351,448,',448)
, (451,'2013-06-24 00:11:21','2013-06-24 00:11:21',null,'内蒙古自治区锡林郭勒盟阿巴嘎旗','阿巴嘎旗',',351,448,',448)
, (452,'2013-06-24 00:11:22','2013-06-24 00:11:22',null,'内蒙古自治区锡林郭勒盟苏尼特左旗','苏尼特左旗',',351,448,',448)
, (453,'2013-06-24 00:11:23','2013-06-24 00:11:23',null,'内蒙古自治区锡林郭勒盟苏尼特右旗','苏尼特右旗',',351,448,',448)
, (454,'2013-06-24 00:11:24','2013-06-24 00:11:24',null,'内蒙古自治区锡林郭勒盟东乌珠穆沁旗','东乌珠穆沁旗',',351,448,',448)
, (455,'2013-06-24 00:11:25','2013-06-24 00:11:25',null,'内蒙古自治区锡林郭勒盟西乌珠穆沁旗','西乌珠穆沁旗',',351,448,',448)
, (456,'2013-06-24 00:11:26','2013-06-24 00:11:26',null,'内蒙古自治区锡林郭勒盟太仆寺旗','太仆寺旗',',351,448,',448)
, (457,'2013-06-24 00:11:27','2013-06-24 00:11:27',null,'内蒙古自治区锡林郭勒盟镶黄旗','镶黄旗',',351,448,',448)
, (458,'2013-06-24 00:11:28','2013-06-24 00:11:28',null,'内蒙古自治区锡林郭勒盟正镶白旗','正镶白旗',',351,448,',448)
, (459,'2013-06-24 00:11:29','2013-06-24 00:11:29',null,'内蒙古自治区锡林郭勒盟正蓝旗','正蓝旗',',351,448,',448)
, (460,'2013-06-24 00:11:30','2013-06-24 00:11:30',null,'内蒙古自治区锡林郭勒盟多伦县','多伦县',',351,448,',448)
, (461,'2013-06-24 00:11:31','2013-06-24 00:11:31',null,'内蒙古自治区阿拉善盟','阿拉善盟',',351,',351)
, (462,'2013-06-24 00:11:32','2013-06-24 00:11:32',null,'内蒙古自治区阿拉善盟阿拉善左旗','阿拉善左旗',',351,461,',461)
, (463,'2013-06-24 00:11:33','2013-06-24 00:11:33',null,'内蒙古自治区阿拉善盟阿拉善右旗','阿拉善右旗',',351,461,',461)
, (464,'2013-06-24 00:11:34','2013-06-24 00:11:34',null,'内蒙古自治区阿拉善盟额济纳旗','额济纳旗',',351,461,',461)
, (465,'2013-06-24 00:11:35','2013-06-24 00:11:35',null,'辽宁省','辽宁省',',',null)
, (466,'2013-06-24 00:11:36','2013-06-24 00:11:36',null,'辽宁省沈阳市','沈阳市',',465,',465)
, (467,'2013-06-24 00:11:37','2013-06-24 00:11:37',null,'辽宁省沈阳市和平区','和平区',',465,466,',466)
, (468,'2013-06-24 00:11:38','2013-06-24 00:11:38',null,'辽宁省沈阳市沈河区','沈河区',',465,466,',466)
, (469,'2013-06-24 00:11:39','2013-06-24 00:11:39',null,'辽宁省沈阳市大东区','大东区',',465,466,',466)
, (470,'2013-06-24 00:11:40','2013-06-24 00:11:40',null,'辽宁省沈阳市皇姑区','皇姑区',',465,466,',466)
, (471,'2013-06-24 00:11:41','2013-06-24 00:11:41',null,'辽宁省沈阳市铁西区','铁西区',',465,466,',466)
, (472,'2013-06-24 00:11:42','2013-06-24 00:11:42',null,'辽宁省沈阳市苏家屯区','苏家屯区',',465,466,',466)
, (473,'2013-06-24 00:11:43','2013-06-24 00:11:43',null,'辽宁省沈阳市东陵区','东陵区',',465,466,',466)
, (474,'2013-06-24 00:11:44','2013-06-24 00:11:44',null,'辽宁省沈阳市沈北新区','沈北新区',',465,466,',466)
, (475,'2013-06-24 00:11:45','2013-06-24 00:11:45',null,'辽宁省沈阳市于洪区','于洪区',',465,466,',466)
, (476,'2013-06-24 00:11:46','2013-06-24 00:11:46',null,'辽宁省沈阳市辽中县','辽中县',',465,466,',466)
, (477,'2013-06-24 00:11:47','2013-06-24 00:11:47',null,'辽宁省沈阳市康平县','康平县',',465,466,',466)
, (478,'2013-06-24 00:11:48','2013-06-24 00:11:48',null,'辽宁省沈阳市法库县','法库县',',465,466,',466)
, (479,'2013-06-24 00:11:49','2013-06-24 00:11:49',null,'辽宁省沈阳市新民市','新民市',',465,466,',466)
, (480,'2013-06-24 00:11:50','2013-06-24 00:11:50',null,'辽宁省大连市','大连市',',465,',465)
, (481,'2013-06-24 00:11:51','2013-06-24 00:11:51',null,'辽宁省大连市中山区','中山区',',465,480,',480)
, (482,'2013-06-24 00:11:52','2013-06-24 00:11:52',null,'辽宁省大连市西岗区','西岗区',',465,480,',480)
, (483,'2013-06-24 00:11:53','2013-06-24 00:11:53',null,'辽宁省大连市沙河口区','沙河口区',',465,480,',480)
, (484,'2013-06-24 00:11:54','2013-06-24 00:11:54',null,'辽宁省大连市甘井子区','甘井子区',',465,480,',480)
, (485,'2013-06-24 00:11:55','2013-06-24 00:11:55',null,'辽宁省大连市旅顺口区','旅顺口区',',465,480,',480)
, (486,'2013-06-24 00:11:56','2013-06-24 00:11:56',null,'辽宁省大连市金州区','金州区',',465,480,',480)
, (487,'2013-06-24 00:11:57','2013-06-24 00:11:57',null,'辽宁省大连市长海县','长海县',',465,480,',480)
, (488,'2013-06-24 00:11:58','2013-06-24 00:11:58',null,'辽宁省大连市瓦房店市','瓦房店市',',465,480,',480)
, (489,'2013-06-24 00:11:59','2013-06-24 00:11:59',null,'辽宁省大连市普兰店市','普兰店市',',465,480,',480)
, (490,'2013-06-24 00:12:00','2013-06-24 00:12:00',null,'辽宁省大连市庄河市','庄河市',',465,480,',480)
, (491,'2013-06-24 00:12:01','2013-06-24 00:12:01',null,'辽宁省鞍山市','鞍山市',',465,',465)
, (492,'2013-06-24 00:12:02','2013-06-24 00:12:02',null,'辽宁省鞍山市铁东区','铁东区',',465,491,',491)
, (493,'2013-06-24 00:12:03','2013-06-24 00:12:03',null,'辽宁省鞍山市铁西区','铁西区',',465,491,',491)
, (494,'2013-06-24 00:12:04','2013-06-24 00:12:04',null,'辽宁省鞍山市立山区','立山区',',465,491,',491)
, (495,'2013-06-24 00:12:05','2013-06-24 00:12:05',null,'辽宁省鞍山市千山区','千山区',',465,491,',491)
, (496,'2013-06-24 00:12:06','2013-06-24 00:12:06',null,'辽宁省鞍山市台安县','台安县',',465,491,',491)
, (497,'2013-06-24 00:12:07','2013-06-24 00:12:07',null,'辽宁省鞍山市岫岩满族自治县','岫岩满族自治县',',465,491,',491)
, (498,'2013-06-24 00:12:08','2013-06-24 00:12:08',null,'辽宁省鞍山市海城市','海城市',',465,491,',491)
, (499,'2013-06-24 00:12:09','2013-06-24 00:12:09',null,'辽宁省抚顺市','抚顺市',',465,',465)
, (500,'2013-06-24 00:12:10','2013-06-24 00:12:10',null,'辽宁省抚顺市新抚区','新抚区',',465,499,',499);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (501,'2013-06-24 00:12:11','2013-06-24 00:12:11',null,'辽宁省抚顺市东洲区','东洲区',',465,499,',499)
, (502,'2013-06-24 00:12:12','2013-06-24 00:12:12',null,'辽宁省抚顺市望花区','望花区',',465,499,',499)
, (503,'2013-06-24 00:12:13','2013-06-24 00:12:13',null,'辽宁省抚顺市顺城区','顺城区',',465,499,',499)
, (504,'2013-06-24 00:12:14','2013-06-24 00:12:14',null,'辽宁省抚顺市抚顺县','抚顺县',',465,499,',499)
, (505,'2013-06-24 00:12:15','2013-06-24 00:12:15',null,'辽宁省抚顺市新宾满族自治县','新宾满族自治县',',465,499,',499)
, (506,'2013-06-24 00:12:16','2013-06-24 00:12:16',null,'辽宁省抚顺市清原满族自治县','清原满族自治县',',465,499,',499)
, (507,'2013-06-24 00:12:17','2013-06-24 00:12:17',null,'辽宁省本溪市','本溪市',',465,',465)
, (508,'2013-06-24 00:12:18','2013-06-24 00:12:18',null,'辽宁省本溪市平山区','平山区',',465,507,',507)
, (509,'2013-06-24 00:12:19','2013-06-24 00:12:19',null,'辽宁省本溪市溪湖区','溪湖区',',465,507,',507)
, (510,'2013-06-24 00:12:20','2013-06-24 00:12:20',null,'辽宁省本溪市明山区','明山区',',465,507,',507)
, (511,'2013-06-24 00:12:21','2013-06-24 00:12:21',null,'辽宁省本溪市南芬区','南芬区',',465,507,',507)
, (512,'2013-06-24 00:12:22','2013-06-24 00:12:22',null,'辽宁省本溪市本溪满族自治县','本溪满族自治县',',465,507,',507)
, (513,'2013-06-24 00:12:23','2013-06-24 00:12:23',null,'辽宁省本溪市桓仁满族自治县','桓仁满族自治县',',465,507,',507)
, (514,'2013-06-24 00:12:24','2013-06-24 00:12:24',null,'辽宁省丹东市','丹东市',',465,',465)
, (515,'2013-06-24 00:12:25','2013-06-24 00:12:25',null,'辽宁省丹东市元宝区','元宝区',',465,514,',514)
, (516,'2013-06-24 00:12:26','2013-06-24 00:12:26',null,'辽宁省丹东市振兴区','振兴区',',465,514,',514)
, (517,'2013-06-24 00:12:27','2013-06-24 00:12:27',null,'辽宁省丹东市振安区','振安区',',465,514,',514)
, (518,'2013-06-24 00:12:28','2013-06-24 00:12:28',null,'辽宁省丹东市宽甸满族自治县','宽甸满族自治县',',465,514,',514)
, (519,'2013-06-24 00:12:29','2013-06-24 00:12:29',null,'辽宁省丹东市东港市','东港市',',465,514,',514)
, (520,'2013-06-24 00:12:30','2013-06-24 00:12:30',null,'辽宁省丹东市凤城市','凤城市',',465,514,',514)
, (521,'2013-06-24 00:12:31','2013-06-24 00:12:31',null,'辽宁省锦州市','锦州市',',465,',465)
, (522,'2013-06-24 00:12:32','2013-06-24 00:12:32',null,'辽宁省锦州市古塔区','古塔区',',465,521,',521)
, (523,'2013-06-24 00:12:33','2013-06-24 00:12:33',null,'辽宁省锦州市凌河区','凌河区',',465,521,',521)
, (524,'2013-06-24 00:12:34','2013-06-24 00:12:34',null,'辽宁省锦州市太和区','太和区',',465,521,',521)
, (525,'2013-06-24 00:12:35','2013-06-24 00:12:35',null,'辽宁省锦州市黑山县','黑山县',',465,521,',521)
, (526,'2013-06-24 00:12:36','2013-06-24 00:12:36',null,'辽宁省锦州市义县','义县',',465,521,',521)
, (527,'2013-06-24 00:12:37','2013-06-24 00:12:37',null,'辽宁省锦州市凌海市','凌海市',',465,521,',521)
, (528,'2013-06-24 00:12:38','2013-06-24 00:12:38',null,'辽宁省锦州市北镇市','北镇市',',465,521,',521)
, (529,'2013-06-24 00:12:39','2013-06-24 00:12:39',null,'辽宁省营口市','营口市',',465,',465)
, (530,'2013-06-24 00:12:40','2013-06-24 00:12:40',null,'辽宁省营口市站前区','站前区',',465,529,',529)
, (531,'2013-06-24 00:12:41','2013-06-24 00:12:41',null,'辽宁省营口市西市区','西市区',',465,529,',529)
, (532,'2013-06-24 00:12:42','2013-06-24 00:12:42',null,'辽宁省营口市鲅鱼圈区','鲅鱼圈区',',465,529,',529)
, (533,'2013-06-24 00:12:43','2013-06-24 00:12:43',null,'辽宁省营口市老边区','老边区',',465,529,',529)
, (534,'2013-06-24 00:12:44','2013-06-24 00:12:44',null,'辽宁省营口市盖州市','盖州市',',465,529,',529)
, (535,'2013-06-24 00:12:45','2013-06-24 00:12:45',null,'辽宁省营口市大石桥市','大石桥市',',465,529,',529)
, (536,'2013-06-24 00:12:46','2013-06-24 00:12:46',null,'辽宁省阜新市','阜新市',',465,',465)
, (537,'2013-06-24 00:12:47','2013-06-24 00:12:47',null,'辽宁省阜新市海州区','海州区',',465,536,',536)
, (538,'2013-06-24 00:12:48','2013-06-24 00:12:48',null,'辽宁省阜新市新邱区','新邱区',',465,536,',536)
, (539,'2013-06-24 00:12:49','2013-06-24 00:12:49',null,'辽宁省阜新市太平区','太平区',',465,536,',536)
, (540,'2013-06-24 00:12:50','2013-06-24 00:12:50',null,'辽宁省阜新市清河门区','清河门区',',465,536,',536)
, (541,'2013-06-24 00:12:51','2013-06-24 00:12:51',null,'辽宁省阜新市细河区','细河区',',465,536,',536)
, (542,'2013-06-24 00:12:52','2013-06-24 00:12:52',null,'辽宁省阜新市阜新蒙古族自治县','阜新蒙古族自治县',',465,536,',536)
, (543,'2013-06-24 00:12:53','2013-06-24 00:12:53',null,'辽宁省阜新市彰武县','彰武县',',465,536,',536)
, (544,'2013-06-24 00:12:54','2013-06-24 00:12:54',null,'辽宁省辽阳市','辽阳市',',465,',465)
, (545,'2013-06-24 00:12:55','2013-06-24 00:12:55',null,'辽宁省辽阳市白塔区','白塔区',',465,544,',544)
, (546,'2013-06-24 00:12:56','2013-06-24 00:12:56',null,'辽宁省辽阳市文圣区','文圣区',',465,544,',544)
, (547,'2013-06-24 00:12:57','2013-06-24 00:12:57',null,'辽宁省辽阳市宏伟区','宏伟区',',465,544,',544)
, (548,'2013-06-24 00:12:58','2013-06-24 00:12:58',null,'辽宁省辽阳市弓长岭区','弓长岭区',',465,544,',544)
, (549,'2013-06-24 00:12:59','2013-06-24 00:12:59',null,'辽宁省辽阳市太子河区','太子河区',',465,544,',544)
, (550,'2013-06-24 00:13:00','2013-06-24 00:13:00',null,'辽宁省辽阳市辽阳县','辽阳县',',465,544,',544)
, (551,'2013-06-24 00:13:01','2013-06-24 00:13:01',null,'辽宁省辽阳市灯塔市','灯塔市',',465,544,',544)
, (552,'2013-06-24 00:13:02','2013-06-24 00:13:02',null,'辽宁省盘锦市','盘锦市',',465,',465)
, (553,'2013-06-24 00:13:03','2013-06-24 00:13:03',null,'辽宁省盘锦市双台子区','双台子区',',465,552,',552)
, (554,'2013-06-24 00:13:04','2013-06-24 00:13:04',null,'辽宁省盘锦市兴隆台区','兴隆台区',',465,552,',552)
, (555,'2013-06-24 00:13:05','2013-06-24 00:13:05',null,'辽宁省盘锦市大洼县','大洼县',',465,552,',552)
, (556,'2013-06-24 00:13:06','2013-06-24 00:13:06',null,'辽宁省盘锦市盘山县','盘山县',',465,552,',552)
, (557,'2013-06-24 00:13:07','2013-06-24 00:13:07',null,'辽宁省铁岭市','铁岭市',',465,',465)
, (558,'2013-06-24 00:13:08','2013-06-24 00:13:08',null,'辽宁省铁岭市银州区','银州区',',465,557,',557)
, (559,'2013-06-24 00:13:09','2013-06-24 00:13:09',null,'辽宁省铁岭市清河区','清河区',',465,557,',557)
, (560,'2013-06-24 00:13:10','2013-06-24 00:13:10',null,'辽宁省铁岭市铁岭县','铁岭县',',465,557,',557)
, (561,'2013-06-24 00:13:11','2013-06-24 00:13:11',null,'辽宁省铁岭市西丰县','西丰县',',465,557,',557)
, (562,'2013-06-24 00:13:12','2013-06-24 00:13:12',null,'辽宁省铁岭市昌图县','昌图县',',465,557,',557)
, (563,'2013-06-24 00:13:13','2013-06-24 00:13:13',null,'辽宁省铁岭市调兵山市','调兵山市',',465,557,',557)
, (564,'2013-06-24 00:13:14','2013-06-24 00:13:14',null,'辽宁省铁岭市开原市','开原市',',465,557,',557)
, (565,'2013-06-24 00:13:15','2013-06-24 00:13:15',null,'辽宁省朝阳市','朝阳市',',465,',465)
, (566,'2013-06-24 00:13:16','2013-06-24 00:13:16',null,'辽宁省朝阳市双塔区','双塔区',',465,565,',565)
, (567,'2013-06-24 00:13:17','2013-06-24 00:13:17',null,'辽宁省朝阳市龙城区','龙城区',',465,565,',565)
, (568,'2013-06-24 00:13:18','2013-06-24 00:13:18',null,'辽宁省朝阳市朝阳县','朝阳县',',465,565,',565)
, (569,'2013-06-24 00:13:19','2013-06-24 00:13:19',null,'辽宁省朝阳市建平县','建平县',',465,565,',565)
, (570,'2013-06-24 00:13:20','2013-06-24 00:13:20',null,'辽宁省朝阳市喀喇沁左翼蒙古族自治县','喀喇沁左翼蒙古族自治县',',465,565,',565)
, (571,'2013-06-24 00:13:21','2013-06-24 00:13:21',null,'辽宁省朝阳市北票市','北票市',',465,565,',565)
, (572,'2013-06-24 00:13:22','2013-06-24 00:13:22',null,'辽宁省朝阳市凌源市','凌源市',',465,565,',565)
, (573,'2013-06-24 00:13:23','2013-06-24 00:13:23',null,'辽宁省葫芦岛市','葫芦岛市',',465,',465)
, (574,'2013-06-24 00:13:24','2013-06-24 00:13:24',null,'辽宁省葫芦岛市连山区','连山区',',465,573,',573)
, (575,'2013-06-24 00:13:25','2013-06-24 00:13:25',null,'辽宁省葫芦岛市龙港区','龙港区',',465,573,',573)
, (576,'2013-06-24 00:13:26','2013-06-24 00:13:26',null,'辽宁省葫芦岛市南票区','南票区',',465,573,',573)
, (577,'2013-06-24 00:13:27','2013-06-24 00:13:27',null,'辽宁省葫芦岛市绥中县','绥中县',',465,573,',573)
, (578,'2013-06-24 00:13:28','2013-06-24 00:13:28',null,'辽宁省葫芦岛市建昌县','建昌县',',465,573,',573)
, (579,'2013-06-24 00:13:29','2013-06-24 00:13:29',null,'辽宁省葫芦岛市兴城市','兴城市',',465,573,',573)
, (580,'2013-06-24 00:13:30','2013-06-24 00:13:30',null,'吉林省','吉林省',',',null)
, (581,'2013-06-24 00:13:31','2013-06-24 00:13:31',null,'吉林省长春市','长春市',',580,',580)
, (582,'2013-06-24 00:13:32','2013-06-24 00:13:32',null,'吉林省长春市南关区','南关区',',580,581,',581)
, (583,'2013-06-24 00:13:33','2013-06-24 00:13:33',null,'吉林省长春市宽城区','宽城区',',580,581,',581)
, (584,'2013-06-24 00:13:34','2013-06-24 00:13:34',null,'吉林省长春市朝阳区','朝阳区',',580,581,',581)
, (585,'2013-06-24 00:13:35','2013-06-24 00:13:35',null,'吉林省长春市二道区','二道区',',580,581,',581)
, (586,'2013-06-24 00:13:36','2013-06-24 00:13:36',null,'吉林省长春市绿园区','绿园区',',580,581,',581)
, (587,'2013-06-24 00:13:37','2013-06-24 00:13:37',null,'吉林省长春市双阳区','双阳区',',580,581,',581)
, (588,'2013-06-24 00:13:38','2013-06-24 00:13:38',null,'吉林省长春市农安县','农安县',',580,581,',581)
, (589,'2013-06-24 00:13:39','2013-06-24 00:13:39',null,'吉林省长春市九台市','九台市',',580,581,',581)
, (590,'2013-06-24 00:13:40','2013-06-24 00:13:40',null,'吉林省长春市榆树市','榆树市',',580,581,',581)
, (591,'2013-06-24 00:13:41','2013-06-24 00:13:41',null,'吉林省长春市德惠市','德惠市',',580,581,',581)
, (592,'2013-06-24 00:13:42','2013-06-24 00:13:42',null,'吉林省吉林市','吉林市',',580,',580)
, (593,'2013-06-24 00:13:43','2013-06-24 00:13:43',null,'吉林省吉林市昌邑区','昌邑区',',580,592,',592)
, (594,'2013-06-24 00:13:44','2013-06-24 00:13:44',null,'吉林省吉林市龙潭区','龙潭区',',580,592,',592)
, (595,'2013-06-24 00:13:45','2013-06-24 00:13:45',null,'吉林省吉林市船营区','船营区',',580,592,',592)
, (596,'2013-06-24 00:13:46','2013-06-24 00:13:46',null,'吉林省吉林市丰满区','丰满区',',580,592,',592)
, (597,'2013-06-24 00:13:47','2013-06-24 00:13:47',null,'吉林省吉林市永吉县','永吉县',',580,592,',592)
, (598,'2013-06-24 00:13:48','2013-06-24 00:13:48',null,'吉林省吉林市蛟河市','蛟河市',',580,592,',592)
, (599,'2013-06-24 00:13:49','2013-06-24 00:13:49',null,'吉林省吉林市桦甸市','桦甸市',',580,592,',592)
, (600,'2013-06-24 00:13:50','2013-06-24 00:13:50',null,'吉林省吉林市舒兰市','舒兰市',',580,592,',592)
, (601,'2013-06-24 00:13:51','2013-06-24 00:13:51',null,'吉林省吉林市磐石市','磐石市',',580,592,',592)
, (602,'2013-06-24 00:13:52','2013-06-24 00:13:52',null,'吉林省四平市','四平市',',580,',580)
, (603,'2013-06-24 00:13:53','2013-06-24 00:13:53',null,'吉林省四平市铁西区','铁西区',',580,602,',602)
, (604,'2013-06-24 00:13:54','2013-06-24 00:13:54',null,'吉林省四平市铁东区','铁东区',',580,602,',602)
, (605,'2013-06-24 00:13:55','2013-06-24 00:13:55',null,'吉林省四平市梨树县','梨树县',',580,602,',602)
, (606,'2013-06-24 00:13:56','2013-06-24 00:13:56',null,'吉林省四平市伊通满族自治县','伊通满族自治县',',580,602,',602)
, (607,'2013-06-24 00:13:57','2013-06-24 00:13:57',null,'吉林省四平市公主岭市','公主岭市',',580,602,',602)
, (608,'2013-06-24 00:13:58','2013-06-24 00:13:58',null,'吉林省四平市双辽市','双辽市',',580,602,',602)
, (609,'2013-06-24 00:13:59','2013-06-24 00:13:59',null,'吉林省辽源市','辽源市',',580,',580)
, (610,'2013-06-24 00:14:00','2013-06-24 00:14:00',null,'吉林省辽源市龙山区','龙山区',',580,609,',609)
, (611,'2013-06-24 00:14:01','2013-06-24 00:14:01',null,'吉林省辽源市西安区','西安区',',580,609,',609)
, (612,'2013-06-24 00:14:02','2013-06-24 00:14:02',null,'吉林省辽源市东丰县','东丰县',',580,609,',609)
, (613,'2013-06-24 00:14:03','2013-06-24 00:14:03',null,'吉林省辽源市东辽县','东辽县',',580,609,',609)
, (614,'2013-06-24 00:14:04','2013-06-24 00:14:04',null,'吉林省通化市','通化市',',580,',580)
, (615,'2013-06-24 00:14:05','2013-06-24 00:14:05',null,'吉林省通化市东昌区','东昌区',',580,614,',614)
, (616,'2013-06-24 00:14:06','2013-06-24 00:14:06',null,'吉林省通化市二道江区','二道江区',',580,614,',614)
, (617,'2013-06-24 00:14:07','2013-06-24 00:14:07',null,'吉林省通化市通化县','通化县',',580,614,',614)
, (618,'2013-06-24 00:14:08','2013-06-24 00:14:08',null,'吉林省通化市辉南县','辉南县',',580,614,',614)
, (619,'2013-06-24 00:14:09','2013-06-24 00:14:09',null,'吉林省通化市柳河县','柳河县',',580,614,',614)
, (620,'2013-06-24 00:14:10','2013-06-24 00:14:10',null,'吉林省通化市梅河口市','梅河口市',',580,614,',614)
, (621,'2013-06-24 00:14:11','2013-06-24 00:14:11',null,'吉林省通化市集安市','集安市',',580,614,',614)
, (622,'2013-06-24 00:14:12','2013-06-24 00:14:12',null,'吉林省白山市','白山市',',580,',580)
, (623,'2013-06-24 00:14:13','2013-06-24 00:14:13',null,'吉林省白山市浑江区','浑江区',',580,622,',622)
, (624,'2013-06-24 00:14:14','2013-06-24 00:14:14',null,'吉林省白山市江源区','江源区',',580,622,',622)
, (625,'2013-06-24 00:14:15','2013-06-24 00:14:15',null,'吉林省白山市抚松县','抚松县',',580,622,',622)
, (626,'2013-06-24 00:14:16','2013-06-24 00:14:16',null,'吉林省白山市靖宇县','靖宇县',',580,622,',622)
, (627,'2013-06-24 00:14:17','2013-06-24 00:14:17',null,'吉林省白山市长白朝鲜族自治县','长白朝鲜族自治县',',580,622,',622)
, (628,'2013-06-24 00:14:18','2013-06-24 00:14:18',null,'吉林省白山市临江市','临江市',',580,622,',622)
, (629,'2013-06-24 00:14:19','2013-06-24 00:14:19',null,'吉林省松原市','松原市',',580,',580)
, (630,'2013-06-24 00:14:20','2013-06-24 00:14:20',null,'吉林省松原市宁江区','宁江区',',580,629,',629)
, (631,'2013-06-24 00:14:21','2013-06-24 00:14:21',null,'吉林省松原市前郭尔罗斯蒙古族自治县','前郭尔罗斯蒙古族自治县',',580,629,',629)
, (632,'2013-06-24 00:14:22','2013-06-24 00:14:22',null,'吉林省松原市长岭县','长岭县',',580,629,',629)
, (633,'2013-06-24 00:14:23','2013-06-24 00:14:23',null,'吉林省松原市乾安县','乾安县',',580,629,',629)
, (634,'2013-06-24 00:14:24','2013-06-24 00:14:24',null,'吉林省松原市扶余县','扶余县',',580,629,',629)
, (635,'2013-06-24 00:14:25','2013-06-24 00:14:25',null,'吉林省白城市','白城市',',580,',580)
, (636,'2013-06-24 00:14:26','2013-06-24 00:14:26',null,'吉林省白城市洮北区','洮北区',',580,635,',635)
, (637,'2013-06-24 00:14:27','2013-06-24 00:14:27',null,'吉林省白城市镇赉县','镇赉县',',580,635,',635)
, (638,'2013-06-24 00:14:28','2013-06-24 00:14:28',null,'吉林省白城市通榆县','通榆县',',580,635,',635)
, (639,'2013-06-24 00:14:29','2013-06-24 00:14:29',null,'吉林省白城市洮南市','洮南市',',580,635,',635)
, (640,'2013-06-24 00:14:30','2013-06-24 00:14:30',null,'吉林省白城市大安市','大安市',',580,635,',635)
, (641,'2013-06-24 00:14:31','2013-06-24 00:14:31',null,'吉林省延边朝鲜族自治州','延边朝鲜族自治州',',580,',580)
, (642,'2013-06-24 00:14:32','2013-06-24 00:14:32',null,'吉林省延边朝鲜族自治州延吉市','延吉市',',580,641,',641)
, (643,'2013-06-24 00:14:33','2013-06-24 00:14:33',null,'吉林省延边朝鲜族自治州图们市','图们市',',580,641,',641)
, (644,'2013-06-24 00:14:34','2013-06-24 00:14:34',null,'吉林省延边朝鲜族自治州敦化市','敦化市',',580,641,',641)
, (645,'2013-06-24 00:14:35','2013-06-24 00:14:35',null,'吉林省延边朝鲜族自治州珲春市','珲春市',',580,641,',641)
, (646,'2013-06-24 00:14:36','2013-06-24 00:14:36',null,'吉林省延边朝鲜族自治州龙井市','龙井市',',580,641,',641)
, (647,'2013-06-24 00:14:37','2013-06-24 00:14:37',null,'吉林省延边朝鲜族自治州和龙市','和龙市',',580,641,',641)
, (648,'2013-06-24 00:14:38','2013-06-24 00:14:38',null,'吉林省延边朝鲜族自治州汪清县','汪清县',',580,641,',641)
, (649,'2013-06-24 00:14:39','2013-06-24 00:14:39',null,'吉林省延边朝鲜族自治州安图县','安图县',',580,641,',641)
, (650,'2013-06-24 00:14:40','2013-06-24 00:14:40',null,'黑龙江省','黑龙江省',',',null)
, (651,'2013-06-24 00:14:41','2013-06-24 00:14:41',null,'黑龙江省哈尔滨市','哈尔滨市',',650,',650)
, (652,'2013-06-24 00:14:42','2013-06-24 00:14:42',null,'黑龙江省哈尔滨市道里区','道里区',',650,651,',651)
, (653,'2013-06-24 00:14:43','2013-06-24 00:14:43',null,'黑龙江省哈尔滨市南岗区','南岗区',',650,651,',651)
, (654,'2013-06-24 00:14:44','2013-06-24 00:14:44',null,'黑龙江省哈尔滨市道外区','道外区',',650,651,',651)
, (655,'2013-06-24 00:14:45','2013-06-24 00:14:45',null,'黑龙江省哈尔滨市平房区','平房区',',650,651,',651)
, (656,'2013-06-24 00:14:46','2013-06-24 00:14:46',null,'黑龙江省哈尔滨市松北区','松北区',',650,651,',651)
, (657,'2013-06-24 00:14:47','2013-06-24 00:14:47',null,'黑龙江省哈尔滨市香坊区','香坊区',',650,651,',651)
, (658,'2013-06-24 00:14:48','2013-06-24 00:14:48',null,'黑龙江省哈尔滨市呼兰区','呼兰区',',650,651,',651)
, (659,'2013-06-24 00:14:49','2013-06-24 00:14:49',null,'黑龙江省哈尔滨市阿城区','阿城区',',650,651,',651)
, (660,'2013-06-24 00:14:50','2013-06-24 00:14:50',null,'黑龙江省哈尔滨市依兰县','依兰县',',650,651,',651)
, (661,'2013-06-24 00:14:51','2013-06-24 00:14:51',null,'黑龙江省哈尔滨市方正县','方正县',',650,651,',651)
, (662,'2013-06-24 00:14:52','2013-06-24 00:14:52',null,'黑龙江省哈尔滨市宾县','宾县',',650,651,',651)
, (663,'2013-06-24 00:14:53','2013-06-24 00:14:53',null,'黑龙江省哈尔滨市巴彦县','巴彦县',',650,651,',651)
, (664,'2013-06-24 00:14:54','2013-06-24 00:14:54',null,'黑龙江省哈尔滨市木兰县','木兰县',',650,651,',651)
, (665,'2013-06-24 00:14:55','2013-06-24 00:14:55',null,'黑龙江省哈尔滨市通河县','通河县',',650,651,',651)
, (666,'2013-06-24 00:14:56','2013-06-24 00:14:56',null,'黑龙江省哈尔滨市延寿县','延寿县',',650,651,',651)
, (667,'2013-06-24 00:14:57','2013-06-24 00:14:57',null,'黑龙江省哈尔滨市双城市','双城市',',650,651,',651)
, (668,'2013-06-24 00:14:58','2013-06-24 00:14:58',null,'黑龙江省哈尔滨市尚志市','尚志市',',650,651,',651)
, (669,'2013-06-24 00:14:59','2013-06-24 00:14:59',null,'黑龙江省哈尔滨市五常市','五常市',',650,651,',651)
, (670,'2013-06-24 00:15:00','2013-06-24 00:15:00',null,'黑龙江省齐齐哈尔市','齐齐哈尔市',',650,',650)
, (671,'2013-06-24 00:15:01','2013-06-24 00:15:01',null,'黑龙江省齐齐哈尔市龙沙区','龙沙区',',650,670,',670)
, (672,'2013-06-24 00:15:02','2013-06-24 00:15:02',null,'黑龙江省齐齐哈尔市建华区','建华区',',650,670,',670)
, (673,'2013-06-24 00:15:03','2013-06-24 00:15:03',null,'黑龙江省齐齐哈尔市铁锋区','铁锋区',',650,670,',670)
, (674,'2013-06-24 00:15:04','2013-06-24 00:15:04',null,'黑龙江省齐齐哈尔市昂昂溪区','昂昂溪区',',650,670,',670)
, (675,'2013-06-24 00:15:05','2013-06-24 00:15:05',null,'黑龙江省齐齐哈尔市富拉尔基区','富拉尔基区',',650,670,',670)
, (676,'2013-06-24 00:15:06','2013-06-24 00:15:06',null,'黑龙江省齐齐哈尔市碾子山区','碾子山区',',650,670,',670)
, (677,'2013-06-24 00:15:07','2013-06-24 00:15:07',null,'黑龙江省齐齐哈尔市梅里斯达斡尔族区','梅里斯达斡尔族区',',650,670,',670)
, (678,'2013-06-24 00:15:08','2013-06-24 00:15:08',null,'黑龙江省齐齐哈尔市龙江县','龙江县',',650,670,',670)
, (679,'2013-06-24 00:15:09','2013-06-24 00:15:09',null,'黑龙江省齐齐哈尔市依安县','依安县',',650,670,',670)
, (680,'2013-06-24 00:15:10','2013-06-24 00:15:10',null,'黑龙江省齐齐哈尔市泰来县','泰来县',',650,670,',670)
, (681,'2013-06-24 00:15:11','2013-06-24 00:15:11',null,'黑龙江省齐齐哈尔市甘南县','甘南县',',650,670,',670)
, (682,'2013-06-24 00:15:12','2013-06-24 00:15:12',null,'黑龙江省齐齐哈尔市富裕县','富裕县',',650,670,',670)
, (683,'2013-06-24 00:15:13','2013-06-24 00:15:13',null,'黑龙江省齐齐哈尔市克山县','克山县',',650,670,',670)
, (684,'2013-06-24 00:15:14','2013-06-24 00:15:14',null,'黑龙江省齐齐哈尔市克东县','克东县',',650,670,',670)
, (685,'2013-06-24 00:15:15','2013-06-24 00:15:15',null,'黑龙江省齐齐哈尔市拜泉县','拜泉县',',650,670,',670)
, (686,'2013-06-24 00:15:16','2013-06-24 00:15:16',null,'黑龙江省齐齐哈尔市讷河市','讷河市',',650,670,',670)
, (687,'2013-06-24 00:15:17','2013-06-24 00:15:17',null,'黑龙江省鸡西市','鸡西市',',650,',650)
, (688,'2013-06-24 00:15:18','2013-06-24 00:15:18',null,'黑龙江省鸡西市鸡冠区','鸡冠区',',650,687,',687)
, (689,'2013-06-24 00:15:19','2013-06-24 00:15:19',null,'黑龙江省鸡西市恒山区','恒山区',',650,687,',687)
, (690,'2013-06-24 00:15:20','2013-06-24 00:15:20',null,'黑龙江省鸡西市滴道区','滴道区',',650,687,',687)
, (691,'2013-06-24 00:15:21','2013-06-24 00:15:21',null,'黑龙江省鸡西市梨树区','梨树区',',650,687,',687)
, (692,'2013-06-24 00:15:22','2013-06-24 00:15:22',null,'黑龙江省鸡西市城子河区','城子河区',',650,687,',687)
, (693,'2013-06-24 00:15:23','2013-06-24 00:15:23',null,'黑龙江省鸡西市麻山区','麻山区',',650,687,',687)
, (694,'2013-06-24 00:15:24','2013-06-24 00:15:24',null,'黑龙江省鸡西市鸡东县','鸡东县',',650,687,',687)
, (695,'2013-06-24 00:15:25','2013-06-24 00:15:25',null,'黑龙江省鸡西市虎林市','虎林市',',650,687,',687)
, (696,'2013-06-24 00:15:26','2013-06-24 00:15:26',null,'黑龙江省鸡西市密山市','密山市',',650,687,',687)
, (697,'2013-06-24 00:15:27','2013-06-24 00:15:27',null,'黑龙江省鹤岗市','鹤岗市',',650,',650)
, (698,'2013-06-24 00:15:28','2013-06-24 00:15:28',null,'黑龙江省鹤岗市向阳区','向阳区',',650,697,',697)
, (699,'2013-06-24 00:15:29','2013-06-24 00:15:29',null,'黑龙江省鹤岗市工农区','工农区',',650,697,',697)
, (700,'2013-06-24 00:15:30','2013-06-24 00:15:30',null,'黑龙江省鹤岗市南山区','南山区',',650,697,',697)
, (701,'2013-06-24 00:15:31','2013-06-24 00:15:31',null,'黑龙江省鹤岗市兴安区','兴安区',',650,697,',697)
, (702,'2013-06-24 00:15:32','2013-06-24 00:15:32',null,'黑龙江省鹤岗市东山区','东山区',',650,697,',697)
, (703,'2013-06-24 00:15:33','2013-06-24 00:15:33',null,'黑龙江省鹤岗市兴山区','兴山区',',650,697,',697)
, (704,'2013-06-24 00:15:34','2013-06-24 00:15:34',null,'黑龙江省鹤岗市萝北县','萝北县',',650,697,',697)
, (705,'2013-06-24 00:15:35','2013-06-24 00:15:35',null,'黑龙江省鹤岗市绥滨县','绥滨县',',650,697,',697)
, (706,'2013-06-24 00:15:36','2013-06-24 00:15:36',null,'黑龙江省双鸭山市','双鸭山市',',650,',650)
, (707,'2013-06-24 00:15:37','2013-06-24 00:15:37',null,'黑龙江省双鸭山市尖山区','尖山区',',650,706,',706)
, (708,'2013-06-24 00:15:38','2013-06-24 00:15:38',null,'黑龙江省双鸭山市岭东区','岭东区',',650,706,',706)
, (709,'2013-06-24 00:15:39','2013-06-24 00:15:39',null,'黑龙江省双鸭山市四方台区','四方台区',',650,706,',706)
, (710,'2013-06-24 00:15:40','2013-06-24 00:15:40',null,'黑龙江省双鸭山市宝山区','宝山区',',650,706,',706)
, (711,'2013-06-24 00:15:41','2013-06-24 00:15:41',null,'黑龙江省双鸭山市集贤县','集贤县',',650,706,',706)
, (712,'2013-06-24 00:15:42','2013-06-24 00:15:42',null,'黑龙江省双鸭山市友谊县','友谊县',',650,706,',706)
, (713,'2013-06-24 00:15:43','2013-06-24 00:15:43',null,'黑龙江省双鸭山市宝清县','宝清县',',650,706,',706)
, (714,'2013-06-24 00:15:44','2013-06-24 00:15:44',null,'黑龙江省双鸭山市饶河县','饶河县',',650,706,',706)
, (715,'2013-06-24 00:15:45','2013-06-24 00:15:45',null,'黑龙江省大庆市','大庆市',',650,',650)
, (716,'2013-06-24 00:15:46','2013-06-24 00:15:46',null,'黑龙江省大庆市萨尔图区','萨尔图区',',650,715,',715)
, (717,'2013-06-24 00:15:47','2013-06-24 00:15:47',null,'黑龙江省大庆市龙凤区','龙凤区',',650,715,',715)
, (718,'2013-06-24 00:15:48','2013-06-24 00:15:48',null,'黑龙江省大庆市让胡路区','让胡路区',',650,715,',715)
, (719,'2013-06-24 00:15:49','2013-06-24 00:15:49',null,'黑龙江省大庆市红岗区','红岗区',',650,715,',715)
, (720,'2013-06-24 00:15:50','2013-06-24 00:15:50',null,'黑龙江省大庆市大同区','大同区',',650,715,',715)
, (721,'2013-06-24 00:15:51','2013-06-24 00:15:51',null,'黑龙江省大庆市肇州县','肇州县',',650,715,',715)
, (722,'2013-06-24 00:15:52','2013-06-24 00:15:52',null,'黑龙江省大庆市肇源县','肇源县',',650,715,',715)
, (723,'2013-06-24 00:15:53','2013-06-24 00:15:53',null,'黑龙江省大庆市林甸县','林甸县',',650,715,',715)
, (724,'2013-06-24 00:15:54','2013-06-24 00:15:54',null,'黑龙江省大庆市杜尔伯特蒙古族自治县','杜尔伯特蒙古族自治县',',650,715,',715)
, (725,'2013-06-24 00:15:55','2013-06-24 00:15:55',null,'黑龙江省伊春市','伊春市',',650,',650)
, (726,'2013-06-24 00:15:56','2013-06-24 00:15:56',null,'黑龙江省伊春市伊春区','伊春区',',650,725,',725)
, (727,'2013-06-24 00:15:57','2013-06-24 00:15:57',null,'黑龙江省伊春市南岔区','南岔区',',650,725,',725)
, (728,'2013-06-24 00:15:58','2013-06-24 00:15:58',null,'黑龙江省伊春市友好区','友好区',',650,725,',725)
, (729,'2013-06-24 00:15:59','2013-06-24 00:15:59',null,'黑龙江省伊春市西林区','西林区',',650,725,',725)
, (730,'2013-06-24 00:16:00','2013-06-24 00:16:00',null,'黑龙江省伊春市翠峦区','翠峦区',',650,725,',725)
, (731,'2013-06-24 00:16:01','2013-06-24 00:16:01',null,'黑龙江省伊春市新青区','新青区',',650,725,',725)
, (732,'2013-06-24 00:16:02','2013-06-24 00:16:02',null,'黑龙江省伊春市美溪区','美溪区',',650,725,',725)
, (733,'2013-06-24 00:16:03','2013-06-24 00:16:03',null,'黑龙江省伊春市金山屯区','金山屯区',',650,725,',725)
, (734,'2013-06-24 00:16:04','2013-06-24 00:16:04',null,'黑龙江省伊春市五营区','五营区',',650,725,',725)
, (735,'2013-06-24 00:16:05','2013-06-24 00:16:05',null,'黑龙江省伊春市乌马河区','乌马河区',',650,725,',725)
, (736,'2013-06-24 00:16:06','2013-06-24 00:16:06',null,'黑龙江省伊春市汤旺河区','汤旺河区',',650,725,',725)
, (737,'2013-06-24 00:16:07','2013-06-24 00:16:07',null,'黑龙江省伊春市带岭区','带岭区',',650,725,',725)
, (738,'2013-06-24 00:16:08','2013-06-24 00:16:08',null,'黑龙江省伊春市乌伊岭区','乌伊岭区',',650,725,',725)
, (739,'2013-06-24 00:16:09','2013-06-24 00:16:09',null,'黑龙江省伊春市红星区','红星区',',650,725,',725)
, (740,'2013-06-24 00:16:10','2013-06-24 00:16:10',null,'黑龙江省伊春市上甘岭区','上甘岭区',',650,725,',725)
, (741,'2013-06-24 00:16:11','2013-06-24 00:16:11',null,'黑龙江省伊春市嘉荫县','嘉荫县',',650,725,',725)
, (742,'2013-06-24 00:16:12','2013-06-24 00:16:12',null,'黑龙江省伊春市铁力市','铁力市',',650,725,',725)
, (743,'2013-06-24 00:16:13','2013-06-24 00:16:13',null,'黑龙江省佳木斯市','佳木斯市',',650,',650)
, (744,'2013-06-24 00:16:14','2013-06-24 00:16:14',null,'黑龙江省佳木斯市向阳区','向阳区',',650,743,',743)
, (745,'2013-06-24 00:16:15','2013-06-24 00:16:15',null,'黑龙江省佳木斯市前进区','前进区',',650,743,',743)
, (746,'2013-06-24 00:16:16','2013-06-24 00:16:16',null,'黑龙江省佳木斯市东风区','东风区',',650,743,',743)
, (747,'2013-06-24 00:16:17','2013-06-24 00:16:17',null,'黑龙江省佳木斯市郊区','郊区',',650,743,',743)
, (748,'2013-06-24 00:16:18','2013-06-24 00:16:18',null,'黑龙江省佳木斯市桦南县','桦南县',',650,743,',743)
, (749,'2013-06-24 00:16:19','2013-06-24 00:16:19',null,'黑龙江省佳木斯市桦川县','桦川县',',650,743,',743)
, (750,'2013-06-24 00:16:20','2013-06-24 00:16:20',null,'黑龙江省佳木斯市汤原县','汤原县',',650,743,',743)
, (751,'2013-06-24 00:16:21','2013-06-24 00:16:21',null,'黑龙江省佳木斯市抚远县','抚远县',',650,743,',743)
, (752,'2013-06-24 00:16:22','2013-06-24 00:16:22',null,'黑龙江省佳木斯市同江市','同江市',',650,743,',743)
, (753,'2013-06-24 00:16:23','2013-06-24 00:16:23',null,'黑龙江省佳木斯市富锦市','富锦市',',650,743,',743)
, (754,'2013-06-24 00:16:24','2013-06-24 00:16:24',null,'黑龙江省七台河市','七台河市',',650,',650)
, (755,'2013-06-24 00:16:25','2013-06-24 00:16:25',null,'黑龙江省七台河市新兴区','新兴区',',650,754,',754)
, (756,'2013-06-24 00:16:26','2013-06-24 00:16:26',null,'黑龙江省七台河市桃山区','桃山区',',650,754,',754)
, (757,'2013-06-24 00:16:27','2013-06-24 00:16:27',null,'黑龙江省七台河市茄子河区','茄子河区',',650,754,',754)
, (758,'2013-06-24 00:16:28','2013-06-24 00:16:28',null,'黑龙江省七台河市勃利县','勃利县',',650,754,',754)
, (759,'2013-06-24 00:16:29','2013-06-24 00:16:29',null,'黑龙江省牡丹江市','牡丹江市',',650,',650)
, (760,'2013-06-24 00:16:30','2013-06-24 00:16:30',null,'黑龙江省牡丹江市东安区','东安区',',650,759,',759)
, (761,'2013-06-24 00:16:31','2013-06-24 00:16:31',null,'黑龙江省牡丹江市阳明区','阳明区',',650,759,',759)
, (762,'2013-06-24 00:16:32','2013-06-24 00:16:32',null,'黑龙江省牡丹江市爱民区','爱民区',',650,759,',759)
, (763,'2013-06-24 00:16:33','2013-06-24 00:16:33',null,'黑龙江省牡丹江市西安区','西安区',',650,759,',759)
, (764,'2013-06-24 00:16:34','2013-06-24 00:16:34',null,'黑龙江省牡丹江市东宁县','东宁县',',650,759,',759)
, (765,'2013-06-24 00:16:35','2013-06-24 00:16:35',null,'黑龙江省牡丹江市林口县','林口县',',650,759,',759)
, (766,'2013-06-24 00:16:36','2013-06-24 00:16:36',null,'黑龙江省牡丹江市绥芬河市','绥芬河市',',650,759,',759)
, (767,'2013-06-24 00:16:37','2013-06-24 00:16:37',null,'黑龙江省牡丹江市海林市','海林市',',650,759,',759)
, (768,'2013-06-24 00:16:38','2013-06-24 00:16:38',null,'黑龙江省牡丹江市宁安市','宁安市',',650,759,',759)
, (769,'2013-06-24 00:16:39','2013-06-24 00:16:39',null,'黑龙江省牡丹江市穆棱市','穆棱市',',650,759,',759)
, (770,'2013-06-24 00:16:40','2013-06-24 00:16:40',null,'黑龙江省黑河市','黑河市',',650,',650)
, (771,'2013-06-24 00:16:41','2013-06-24 00:16:41',null,'黑龙江省黑河市爱辉区','爱辉区',',650,770,',770)
, (772,'2013-06-24 00:16:42','2013-06-24 00:16:42',null,'黑龙江省黑河市嫩江县','嫩江县',',650,770,',770)
, (773,'2013-06-24 00:16:43','2013-06-24 00:16:43',null,'黑龙江省黑河市逊克县','逊克县',',650,770,',770)
, (774,'2013-06-24 00:16:44','2013-06-24 00:16:44',null,'黑龙江省黑河市孙吴县','孙吴县',',650,770,',770)
, (775,'2013-06-24 00:16:45','2013-06-24 00:16:45',null,'黑龙江省黑河市北安市','北安市',',650,770,',770)
, (776,'2013-06-24 00:16:46','2013-06-24 00:16:46',null,'黑龙江省黑河市五大连池市','五大连池市',',650,770,',770)
, (777,'2013-06-24 00:16:47','2013-06-24 00:16:47',null,'黑龙江省绥化市','绥化市',',650,',650)
, (778,'2013-06-24 00:16:48','2013-06-24 00:16:48',null,'黑龙江省绥化市北林区','北林区',',650,777,',777)
, (779,'2013-06-24 00:16:49','2013-06-24 00:16:49',null,'黑龙江省绥化市望奎县','望奎县',',650,777,',777)
, (780,'2013-06-24 00:16:50','2013-06-24 00:16:50',null,'黑龙江省绥化市兰西县','兰西县',',650,777,',777)
, (781,'2013-06-24 00:16:51','2013-06-24 00:16:51',null,'黑龙江省绥化市青冈县','青冈县',',650,777,',777)
, (782,'2013-06-24 00:16:52','2013-06-24 00:16:52',null,'黑龙江省绥化市庆安县','庆安县',',650,777,',777)
, (783,'2013-06-24 00:16:53','2013-06-24 00:16:53',null,'黑龙江省绥化市明水县','明水县',',650,777,',777)
, (784,'2013-06-24 00:16:54','2013-06-24 00:16:54',null,'黑龙江省绥化市绥棱县','绥棱县',',650,777,',777)
, (785,'2013-06-24 00:16:55','2013-06-24 00:16:55',null,'黑龙江省绥化市安达市','安达市',',650,777,',777)
, (786,'2013-06-24 00:16:56','2013-06-24 00:16:56',null,'黑龙江省绥化市肇东市','肇东市',',650,777,',777)
, (787,'2013-06-24 00:16:57','2013-06-24 00:16:57',null,'黑龙江省绥化市海伦市','海伦市',',650,777,',777)
, (788,'2013-06-24 00:16:58','2013-06-24 00:16:58',null,'黑龙江省大兴安岭地区','大兴安岭地区',',650,',650)
, (789,'2013-06-24 00:16:59','2013-06-24 00:16:59',null,'黑龙江省大兴安岭地区呼玛县','呼玛县',',650,788,',788)
, (790,'2013-06-24 00:17:00','2013-06-24 00:17:00',null,'黑龙江省大兴安岭地区塔河县','塔河县',',650,788,',788)
, (791,'2013-06-24 00:17:01','2013-06-24 00:17:01',null,'黑龙江省大兴安岭地区漠河县','漠河县',',650,788,',788)
, (792,'2013-06-24 00:17:02','2013-06-24 00:17:02',null,'上海市','上海市',',',null)
, (793,'2013-06-24 00:17:03','2013-06-24 00:17:03',null,'上海市黄浦区','黄浦区',',792,',792)
, (794,'2013-06-24 00:17:04','2013-06-24 00:17:04',null,'上海市徐汇区','徐汇区',',792,',792)
, (795,'2013-06-24 00:17:05','2013-06-24 00:17:05',null,'上海市长宁区','长宁区',',792,',792)
, (796,'2013-06-24 00:17:06','2013-06-24 00:17:06',null,'上海市静安区','静安区',',792,',792)
, (797,'2013-06-24 00:17:07','2013-06-24 00:17:07',null,'上海市普陀区','普陀区',',792,',792)
, (798,'2013-06-24 00:17:08','2013-06-24 00:17:08',null,'上海市闸北区','闸北区',',792,',792)
, (799,'2013-06-24 00:17:09','2013-06-24 00:17:09',null,'上海市虹口区','虹口区',',792,',792)
, (800,'2013-06-24 00:17:10','2013-06-24 00:17:10',null,'上海市杨浦区','杨浦区',',792,',792)
, (801,'2013-06-24 00:17:11','2013-06-24 00:17:11',null,'上海市闵行区','闵行区',',792,',792)
, (802,'2013-06-24 00:17:12','2013-06-24 00:17:12',null,'上海市宝山区','宝山区',',792,',792)
, (803,'2013-06-24 00:17:13','2013-06-24 00:17:13',null,'上海市嘉定区','嘉定区',',792,',792)
, (804,'2013-06-24 00:17:14','2013-06-24 00:17:14',null,'上海市浦东新区','浦东新区',',792,',792)
, (805,'2013-06-24 00:17:15','2013-06-24 00:17:15',null,'上海市金山区','金山区',',792,',792)
, (806,'2013-06-24 00:17:16','2013-06-24 00:17:16',null,'上海市松江区','松江区',',792,',792)
, (807,'2013-06-24 00:17:17','2013-06-24 00:17:17',null,'上海市青浦区','青浦区',',792,',792)
, (808,'2013-06-24 00:17:18','2013-06-24 00:17:18',null,'上海市奉贤区','奉贤区',',792,',792)
, (809,'2013-06-24 00:17:19','2013-06-24 00:17:19',null,'上海市崇明县','崇明县',',792,',792)
, (810,'2013-06-24 00:17:20','2013-06-24 00:17:20',null,'江苏省','江苏省',',',null)
, (811,'2013-06-24 00:17:21','2013-06-24 00:17:21',null,'江苏省南京市','南京市',',810,',810)
, (812,'2013-06-24 00:17:22','2013-06-24 00:17:22',null,'江苏省南京市玄武区','玄武区',',810,811,',811)
, (813,'2013-06-24 00:17:23','2013-06-24 00:17:23',null,'江苏省南京市白下区','白下区',',810,811,',811)
, (814,'2013-06-24 00:17:24','2013-06-24 00:17:24',null,'江苏省南京市秦淮区','秦淮区',',810,811,',811)
, (815,'2013-06-24 00:17:25','2013-06-24 00:17:25',null,'江苏省南京市建邺区','建邺区',',810,811,',811)
, (816,'2013-06-24 00:17:26','2013-06-24 00:17:26',null,'江苏省南京市鼓楼区','鼓楼区',',810,811,',811)
, (817,'2013-06-24 00:17:27','2013-06-24 00:17:27',null,'江苏省南京市下关区','下关区',',810,811,',811)
, (818,'2013-06-24 00:17:28','2013-06-24 00:17:28',null,'江苏省南京市浦口区','浦口区',',810,811,',811)
, (819,'2013-06-24 00:17:29','2013-06-24 00:17:29',null,'江苏省南京市栖霞区','栖霞区',',810,811,',811)
, (820,'2013-06-24 00:17:30','2013-06-24 00:17:30',null,'江苏省南京市雨花台区','雨花台区',',810,811,',811)
, (821,'2013-06-24 00:17:31','2013-06-24 00:17:31',null,'江苏省南京市江宁区','江宁区',',810,811,',811)
, (822,'2013-06-24 00:17:32','2013-06-24 00:17:32',null,'江苏省南京市六合区','六合区',',810,811,',811)
, (823,'2013-06-24 00:17:33','2013-06-24 00:17:33',null,'江苏省南京市溧水县','溧水县',',810,811,',811)
, (824,'2013-06-24 00:17:34','2013-06-24 00:17:34',null,'江苏省南京市高淳县','高淳县',',810,811,',811)
, (825,'2013-06-24 00:17:35','2013-06-24 00:17:35',null,'江苏省无锡市','无锡市',',810,',810)
, (826,'2013-06-24 00:17:36','2013-06-24 00:17:36',null,'江苏省无锡市崇安区','崇安区',',810,825,',825)
, (827,'2013-06-24 00:17:37','2013-06-24 00:17:37',null,'江苏省无锡市南长区','南长区',',810,825,',825)
, (828,'2013-06-24 00:17:38','2013-06-24 00:17:38',null,'江苏省无锡市北塘区','北塘区',',810,825,',825)
, (829,'2013-06-24 00:17:39','2013-06-24 00:17:39',null,'江苏省无锡市锡山区','锡山区',',810,825,',825)
, (830,'2013-06-24 00:17:40','2013-06-24 00:17:40',null,'江苏省无锡市惠山区','惠山区',',810,825,',825)
, (831,'2013-06-24 00:17:41','2013-06-24 00:17:41',null,'江苏省无锡市滨湖区','滨湖区',',810,825,',825)
, (832,'2013-06-24 00:17:42','2013-06-24 00:17:42',null,'江苏省无锡市江阴市','江阴市',',810,825,',825)
, (833,'2013-06-24 00:17:43','2013-06-24 00:17:43',null,'江苏省无锡市宜兴市','宜兴市',',810,825,',825)
, (834,'2013-06-24 00:17:44','2013-06-24 00:17:44',null,'江苏省徐州市','徐州市',',810,',810)
, (835,'2013-06-24 00:17:45','2013-06-24 00:17:45',null,'江苏省徐州市鼓楼区','鼓楼区',',810,834,',834)
, (836,'2013-06-24 00:17:46','2013-06-24 00:17:46',null,'江苏省徐州市云龙区','云龙区',',810,834,',834)
, (837,'2013-06-24 00:17:47','2013-06-24 00:17:47',null,'江苏省徐州市贾汪区','贾汪区',',810,834,',834)
, (838,'2013-06-24 00:17:48','2013-06-24 00:17:48',null,'江苏省徐州市泉山区','泉山区',',810,834,',834)
, (839,'2013-06-24 00:17:49','2013-06-24 00:17:49',null,'江苏省徐州市铜山区','铜山区',',810,834,',834)
, (840,'2013-06-24 00:17:50','2013-06-24 00:17:50',null,'江苏省徐州市丰县','丰县',',810,834,',834)
, (841,'2013-06-24 00:17:51','2013-06-24 00:17:51',null,'江苏省徐州市沛县','沛县',',810,834,',834)
, (842,'2013-06-24 00:17:52','2013-06-24 00:17:52',null,'江苏省徐州市睢宁县','睢宁县',',810,834,',834)
, (843,'2013-06-24 00:17:53','2013-06-24 00:17:53',null,'江苏省徐州市新沂市','新沂市',',810,834,',834)
, (844,'2013-06-24 00:17:54','2013-06-24 00:17:54',null,'江苏省徐州市邳州市','邳州市',',810,834,',834)
, (845,'2013-06-24 00:17:55','2013-06-24 00:17:55',null,'江苏省常州市','常州市',',810,',810)
, (846,'2013-06-24 00:17:56','2013-06-24 00:17:56',null,'江苏省常州市天宁区','天宁区',',810,845,',845)
, (847,'2013-06-24 00:17:57','2013-06-24 00:17:57',null,'江苏省常州市钟楼区','钟楼区',',810,845,',845)
, (848,'2013-06-24 00:17:58','2013-06-24 00:17:58',null,'江苏省常州市戚墅堰区','戚墅堰区',',810,845,',845)
, (849,'2013-06-24 00:17:59','2013-06-24 00:17:59',null,'江苏省常州市新北区','新北区',',810,845,',845)
, (850,'2013-06-24 00:18:00','2013-06-24 00:18:00',null,'江苏省常州市武进区','武进区',',810,845,',845)
, (851,'2013-06-24 00:18:01','2013-06-24 00:18:01',null,'江苏省常州市溧阳市','溧阳市',',810,845,',845)
, (852,'2013-06-24 00:18:02','2013-06-24 00:18:02',null,'江苏省常州市金坛市','金坛市',',810,845,',845)
, (853,'2013-06-24 00:18:03','2013-06-24 00:18:03',null,'江苏省苏州市','苏州市',',810,',810)
, (854,'2013-06-24 00:18:04','2013-06-24 00:18:04',null,'江苏省苏州市虎丘区','虎丘区',',810,853,',853)
, (855,'2013-06-24 00:18:05','2013-06-24 00:18:05',null,'江苏省苏州市吴中区','吴中区',',810,853,',853)
, (856,'2013-06-24 00:18:06','2013-06-24 00:18:06',null,'江苏省苏州市相城区','相城区',',810,853,',853)
, (857,'2013-06-24 00:18:07','2013-06-24 00:18:07',null,'江苏省苏州市姑苏区','姑苏区',',810,853,',853)
, (858,'2013-06-24 00:18:08','2013-06-24 00:18:08',null,'江苏省苏州市吴江区','吴江区',',810,853,',853)
, (859,'2013-06-24 00:18:09','2013-06-24 00:18:09',null,'江苏省苏州市常熟市','常熟市',',810,853,',853)
, (860,'2013-06-24 00:18:10','2013-06-24 00:18:10',null,'江苏省苏州市张家港市','张家港市',',810,853,',853)
, (861,'2013-06-24 00:18:11','2013-06-24 00:18:11',null,'江苏省苏州市昆山市','昆山市',',810,853,',853)
, (862,'2013-06-24 00:18:12','2013-06-24 00:18:12',null,'江苏省苏州市太仓市','太仓市',',810,853,',853)
, (863,'2013-06-24 00:18:13','2013-06-24 00:18:13',null,'江苏省南通市','南通市',',810,',810)
, (864,'2013-06-24 00:18:14','2013-06-24 00:18:14',null,'江苏省南通市崇川区','崇川区',',810,863,',863)
, (865,'2013-06-24 00:18:15','2013-06-24 00:18:15',null,'江苏省南通市港闸区','港闸区',',810,863,',863)
, (866,'2013-06-24 00:18:16','2013-06-24 00:18:16',null,'江苏省南通市通州区','通州区',',810,863,',863)
, (867,'2013-06-24 00:18:17','2013-06-24 00:18:17',null,'江苏省南通市海安县','海安县',',810,863,',863)
, (868,'2013-06-24 00:18:18','2013-06-24 00:18:18',null,'江苏省南通市如东县','如东县',',810,863,',863)
, (869,'2013-06-24 00:18:19','2013-06-24 00:18:19',null,'江苏省南通市启东市','启东市',',810,863,',863)
, (870,'2013-06-24 00:18:20','2013-06-24 00:18:20',null,'江苏省南通市如皋市','如皋市',',810,863,',863)
, (871,'2013-06-24 00:18:21','2013-06-24 00:18:21',null,'江苏省南通市海门市','海门市',',810,863,',863)
, (872,'2013-06-24 00:18:22','2013-06-24 00:18:22',null,'江苏省连云港市','连云港市',',810,',810)
, (873,'2013-06-24 00:18:23','2013-06-24 00:18:23',null,'江苏省连云港市连云区','连云区',',810,872,',872)
, (874,'2013-06-24 00:18:24','2013-06-24 00:18:24',null,'江苏省连云港市新浦区','新浦区',',810,872,',872)
, (875,'2013-06-24 00:18:25','2013-06-24 00:18:25',null,'江苏省连云港市海州区','海州区',',810,872,',872)
, (876,'2013-06-24 00:18:26','2013-06-24 00:18:26',null,'江苏省连云港市赣榆县','赣榆县',',810,872,',872)
, (877,'2013-06-24 00:18:27','2013-06-24 00:18:27',null,'江苏省连云港市东海县','东海县',',810,872,',872)
, (878,'2013-06-24 00:18:28','2013-06-24 00:18:28',null,'江苏省连云港市灌云县','灌云县',',810,872,',872)
, (879,'2013-06-24 00:18:29','2013-06-24 00:18:29',null,'江苏省连云港市灌南县','灌南县',',810,872,',872)
, (880,'2013-06-24 00:18:30','2013-06-24 00:18:30',null,'江苏省淮安市','淮安市',',810,',810)
, (881,'2013-06-24 00:18:31','2013-06-24 00:18:31',null,'江苏省淮安市清河区','清河区',',810,880,',880)
, (882,'2013-06-24 00:18:32','2013-06-24 00:18:32',null,'江苏省淮安市淮安区','淮安区',',810,880,',880)
, (883,'2013-06-24 00:18:33','2013-06-24 00:18:33',null,'江苏省淮安市淮阴区','淮阴区',',810,880,',880)
, (884,'2013-06-24 00:18:34','2013-06-24 00:18:34',null,'江苏省淮安市清浦区','清浦区',',810,880,',880)
, (885,'2013-06-24 00:18:35','2013-06-24 00:18:35',null,'江苏省淮安市涟水县','涟水县',',810,880,',880)
, (886,'2013-06-24 00:18:36','2013-06-24 00:18:36',null,'江苏省淮安市洪泽县','洪泽县',',810,880,',880)
, (887,'2013-06-24 00:18:37','2013-06-24 00:18:37',null,'江苏省淮安市盱眙县','盱眙县',',810,880,',880)
, (888,'2013-06-24 00:18:38','2013-06-24 00:18:38',null,'江苏省淮安市金湖县','金湖县',',810,880,',880)
, (889,'2013-06-24 00:18:39','2013-06-24 00:18:39',null,'江苏省盐城市','盐城市',',810,',810)
, (890,'2013-06-24 00:18:40','2013-06-24 00:18:40',null,'江苏省盐城市亭湖区','亭湖区',',810,889,',889)
, (891,'2013-06-24 00:18:41','2013-06-24 00:18:41',null,'江苏省盐城市盐都区','盐都区',',810,889,',889)
, (892,'2013-06-24 00:18:42','2013-06-24 00:18:42',null,'江苏省盐城市响水县','响水县',',810,889,',889)
, (893,'2013-06-24 00:18:43','2013-06-24 00:18:43',null,'江苏省盐城市滨海县','滨海县',',810,889,',889)
, (894,'2013-06-24 00:18:44','2013-06-24 00:18:44',null,'江苏省盐城市阜宁县','阜宁县',',810,889,',889)
, (895,'2013-06-24 00:18:45','2013-06-24 00:18:45',null,'江苏省盐城市射阳县','射阳县',',810,889,',889)
, (896,'2013-06-24 00:18:46','2013-06-24 00:18:46',null,'江苏省盐城市建湖县','建湖县',',810,889,',889)
, (897,'2013-06-24 00:18:47','2013-06-24 00:18:47',null,'江苏省盐城市东台市','东台市',',810,889,',889)
, (898,'2013-06-24 00:18:48','2013-06-24 00:18:48',null,'江苏省盐城市大丰市','大丰市',',810,889,',889)
, (899,'2013-06-24 00:18:49','2013-06-24 00:18:49',null,'江苏省扬州市','扬州市',',810,',810)
, (900,'2013-06-24 00:18:50','2013-06-24 00:18:50',null,'江苏省扬州市广陵区','广陵区',',810,899,',899)
, (901,'2013-06-24 00:18:51','2013-06-24 00:18:51',null,'江苏省扬州市邗江区','邗江区',',810,899,',899)
, (902,'2013-06-24 00:18:52','2013-06-24 00:18:52',null,'江苏省扬州市江都区','江都区',',810,899,',899)
, (903,'2013-06-24 00:18:53','2013-06-24 00:18:53',null,'江苏省扬州市宝应县','宝应县',',810,899,',899)
, (904,'2013-06-24 00:18:54','2013-06-24 00:18:54',null,'江苏省扬州市仪征市','仪征市',',810,899,',899)
, (905,'2013-06-24 00:18:55','2013-06-24 00:18:55',null,'江苏省扬州市高邮市','高邮市',',810,899,',899)
, (906,'2013-06-24 00:18:56','2013-06-24 00:18:56',null,'江苏省镇江市','镇江市',',810,',810)
, (907,'2013-06-24 00:18:57','2013-06-24 00:18:57',null,'江苏省镇江市京口区','京口区',',810,906,',906)
, (908,'2013-06-24 00:18:58','2013-06-24 00:18:58',null,'江苏省镇江市润州区','润州区',',810,906,',906)
, (909,'2013-06-24 00:18:59','2013-06-24 00:18:59',null,'江苏省镇江市丹徒区','丹徒区',',810,906,',906)
, (910,'2013-06-24 00:19:00','2013-06-24 00:19:00',null,'江苏省镇江市丹阳市','丹阳市',',810,906,',906)
, (911,'2013-06-24 00:19:01','2013-06-24 00:19:01',null,'江苏省镇江市扬中市','扬中市',',810,906,',906)
, (912,'2013-06-24 00:19:02','2013-06-24 00:19:02',null,'江苏省镇江市句容市','句容市',',810,906,',906)
, (913,'2013-06-24 00:19:03','2013-06-24 00:19:03',null,'江苏省泰州市','泰州市',',810,',810)
, (914,'2013-06-24 00:19:04','2013-06-24 00:19:04',null,'江苏省泰州市海陵区','海陵区',',810,913,',913)
, (915,'2013-06-24 00:19:05','2013-06-24 00:19:05',null,'江苏省泰州市高港区','高港区',',810,913,',913)
, (916,'2013-06-24 00:19:06','2013-06-24 00:19:06',null,'江苏省泰州市兴化市','兴化市',',810,913,',913)
, (917,'2013-06-24 00:19:07','2013-06-24 00:19:07',null,'江苏省泰州市靖江市','靖江市',',810,913,',913)
, (918,'2013-06-24 00:19:08','2013-06-24 00:19:08',null,'江苏省泰州市泰兴市','泰兴市',',810,913,',913)
, (919,'2013-06-24 00:19:09','2013-06-24 00:19:09',null,'江苏省泰州市姜堰市','姜堰市',',810,913,',913)
, (920,'2013-06-24 00:19:10','2013-06-24 00:19:10',null,'江苏省宿迁市','宿迁市',',810,',810)
, (921,'2013-06-24 00:19:11','2013-06-24 00:19:11',null,'江苏省宿迁市宿城区','宿城区',',810,920,',920)
, (922,'2013-06-24 00:19:12','2013-06-24 00:19:12',null,'江苏省宿迁市宿豫区','宿豫区',',810,920,',920)
, (923,'2013-06-24 00:19:13','2013-06-24 00:19:13',null,'江苏省宿迁市沭阳县','沭阳县',',810,920,',920)
, (924,'2013-06-24 00:19:14','2013-06-24 00:19:14',null,'江苏省宿迁市泗阳县','泗阳县',',810,920,',920)
, (925,'2013-06-24 00:19:15','2013-06-24 00:19:15',null,'江苏省宿迁市泗洪县','泗洪县',',810,920,',920)
, (926,'2013-06-24 00:19:16','2013-06-24 00:19:16',null,'浙江省','浙江省',',',null)
, (927,'2013-06-24 00:19:17','2013-06-24 00:19:17',null,'浙江省杭州市','杭州市',',926,',926)
, (928,'2013-06-24 00:19:18','2013-06-24 00:19:18',null,'浙江省杭州市上城区','上城区',',926,927,',927)
, (929,'2013-06-24 00:19:19','2013-06-24 00:19:19',null,'浙江省杭州市下城区','下城区',',926,927,',927)
, (930,'2013-06-24 00:19:20','2013-06-24 00:19:20',null,'浙江省杭州市江干区','江干区',',926,927,',927)
, (931,'2013-06-24 00:19:21','2013-06-24 00:19:21',null,'浙江省杭州市拱墅区','拱墅区',',926,927,',927)
, (932,'2013-06-24 00:19:22','2013-06-24 00:19:22',null,'浙江省杭州市西湖区','西湖区',',926,927,',927)
, (933,'2013-06-24 00:19:23','2013-06-24 00:19:23',null,'浙江省杭州市滨江区','滨江区',',926,927,',927)
, (934,'2013-06-24 00:19:24','2013-06-24 00:19:24',null,'浙江省杭州市萧山区','萧山区',',926,927,',927)
, (935,'2013-06-24 00:19:25','2013-06-24 00:19:25',null,'浙江省杭州市余杭区','余杭区',',926,927,',927)
, (936,'2013-06-24 00:19:26','2013-06-24 00:19:26',null,'浙江省杭州市桐庐县','桐庐县',',926,927,',927)
, (937,'2013-06-24 00:19:27','2013-06-24 00:19:27',null,'浙江省杭州市淳安县','淳安县',',926,927,',927)
, (938,'2013-06-24 00:19:28','2013-06-24 00:19:28',null,'浙江省杭州市建德市','建德市',',926,927,',927)
, (939,'2013-06-24 00:19:29','2013-06-24 00:19:29',null,'浙江省杭州市富阳市','富阳市',',926,927,',927)
, (940,'2013-06-24 00:19:30','2013-06-24 00:19:30',null,'浙江省杭州市临安市','临安市',',926,927,',927)
, (941,'2013-06-24 00:19:31','2013-06-24 00:19:31',null,'浙江省宁波市','宁波市',',926,',926)
, (942,'2013-06-24 00:19:32','2013-06-24 00:19:32',null,'浙江省宁波市海曙区','海曙区',',926,941,',941)
, (943,'2013-06-24 00:19:33','2013-06-24 00:19:33',null,'浙江省宁波市江东区','江东区',',926,941,',941)
, (944,'2013-06-24 00:19:34','2013-06-24 00:19:34',null,'浙江省宁波市江北区','江北区',',926,941,',941)
, (945,'2013-06-24 00:19:35','2013-06-24 00:19:35',null,'浙江省宁波市北仑区','北仑区',',926,941,',941)
, (946,'2013-06-24 00:19:36','2013-06-24 00:19:36',null,'浙江省宁波市镇海区','镇海区',',926,941,',941)
, (947,'2013-06-24 00:19:37','2013-06-24 00:19:37',null,'浙江省宁波市鄞州区','鄞州区',',926,941,',941)
, (948,'2013-06-24 00:19:38','2013-06-24 00:19:38',null,'浙江省宁波市象山县','象山县',',926,941,',941)
, (949,'2013-06-24 00:19:39','2013-06-24 00:19:39',null,'浙江省宁波市宁海县','宁海县',',926,941,',941)
, (950,'2013-06-24 00:19:40','2013-06-24 00:19:40',null,'浙江省宁波市余姚市','余姚市',',926,941,',941)
, (951,'2013-06-24 00:19:41','2013-06-24 00:19:41',null,'浙江省宁波市慈溪市','慈溪市',',926,941,',941)
, (952,'2013-06-24 00:19:42','2013-06-24 00:19:42',null,'浙江省宁波市奉化市','奉化市',',926,941,',941)
, (953,'2013-06-24 00:19:43','2013-06-24 00:19:43',null,'浙江省温州市','温州市',',926,',926)
, (954,'2013-06-24 00:19:44','2013-06-24 00:19:44',null,'浙江省温州市鹿城区','鹿城区',',926,953,',953)
, (955,'2013-06-24 00:19:45','2013-06-24 00:19:45',null,'浙江省温州市龙湾区','龙湾区',',926,953,',953)
, (956,'2013-06-24 00:19:46','2013-06-24 00:19:46',null,'浙江省温州市瓯海区','瓯海区',',926,953,',953)
, (957,'2013-06-24 00:19:47','2013-06-24 00:19:47',null,'浙江省温州市洞头县','洞头县',',926,953,',953)
, (958,'2013-06-24 00:19:48','2013-06-24 00:19:48',null,'浙江省温州市永嘉县','永嘉县',',926,953,',953)
, (959,'2013-06-24 00:19:49','2013-06-24 00:19:49',null,'浙江省温州市平阳县','平阳县',',926,953,',953)
, (960,'2013-06-24 00:19:50','2013-06-24 00:19:50',null,'浙江省温州市苍南县','苍南县',',926,953,',953)
, (961,'2013-06-24 00:19:51','2013-06-24 00:19:51',null,'浙江省温州市文成县','文成县',',926,953,',953)
, (962,'2013-06-24 00:19:52','2013-06-24 00:19:52',null,'浙江省温州市泰顺县','泰顺县',',926,953,',953)
, (963,'2013-06-24 00:19:53','2013-06-24 00:19:53',null,'浙江省温州市瑞安市','瑞安市',',926,953,',953)
, (964,'2013-06-24 00:19:54','2013-06-24 00:19:54',null,'浙江省温州市乐清市','乐清市',',926,953,',953)
, (965,'2013-06-24 00:19:55','2013-06-24 00:19:55',null,'浙江省嘉兴市','嘉兴市',',926,',926)
, (966,'2013-06-24 00:19:56','2013-06-24 00:19:56',null,'浙江省嘉兴市南湖区','南湖区',',926,965,',965)
, (967,'2013-06-24 00:19:57','2013-06-24 00:19:57',null,'浙江省嘉兴市秀洲区','秀洲区',',926,965,',965)
, (968,'2013-06-24 00:19:58','2013-06-24 00:19:58',null,'浙江省嘉兴市嘉善县','嘉善县',',926,965,',965)
, (969,'2013-06-24 00:19:59','2013-06-24 00:19:59',null,'浙江省嘉兴市海盐县','海盐县',',926,965,',965)
, (970,'2013-06-24 00:20:00','2013-06-24 00:20:00',null,'浙江省嘉兴市海宁市','海宁市',',926,965,',965)
, (971,'2013-06-24 00:20:01','2013-06-24 00:20:01',null,'浙江省嘉兴市平湖市','平湖市',',926,965,',965)
, (972,'2013-06-24 00:20:02','2013-06-24 00:20:02',null,'浙江省嘉兴市桐乡市','桐乡市',',926,965,',965)
, (973,'2013-06-24 00:20:03','2013-06-24 00:20:03',null,'浙江省湖州市','湖州市',',926,',926)
, (974,'2013-06-24 00:20:04','2013-06-24 00:20:04',null,'浙江省湖州市吴兴区','吴兴区',',926,973,',973)
, (975,'2013-06-24 00:20:05','2013-06-24 00:20:05',null,'浙江省湖州市南浔区','南浔区',',926,973,',973)
, (976,'2013-06-24 00:20:06','2013-06-24 00:20:06',null,'浙江省湖州市德清县','德清县',',926,973,',973)
, (977,'2013-06-24 00:20:07','2013-06-24 00:20:07',null,'浙江省湖州市长兴县','长兴县',',926,973,',973)
, (978,'2013-06-24 00:20:08','2013-06-24 00:20:08',null,'浙江省湖州市安吉县','安吉县',',926,973,',973)
, (979,'2013-06-24 00:20:09','2013-06-24 00:20:09',null,'浙江省绍兴市','绍兴市',',926,',926)
, (980,'2013-06-24 00:20:10','2013-06-24 00:20:10',null,'浙江省绍兴市越城区','越城区',',926,979,',979)
, (981,'2013-06-24 00:20:11','2013-06-24 00:20:11',null,'浙江省绍兴市绍兴县','绍兴县',',926,979,',979)
, (982,'2013-06-24 00:20:12','2013-06-24 00:20:12',null,'浙江省绍兴市新昌县','新昌县',',926,979,',979)
, (983,'2013-06-24 00:20:13','2013-06-24 00:20:13',null,'浙江省绍兴市诸暨市','诸暨市',',926,979,',979)
, (984,'2013-06-24 00:20:14','2013-06-24 00:20:14',null,'浙江省绍兴市上虞市','上虞市',',926,979,',979)
, (985,'2013-06-24 00:20:15','2013-06-24 00:20:15',null,'浙江省绍兴市嵊州市','嵊州市',',926,979,',979)
, (986,'2013-06-24 00:20:16','2013-06-24 00:20:16',null,'浙江省金华市','金华市',',926,',926)
, (987,'2013-06-24 00:20:17','2013-06-24 00:20:17',null,'浙江省金华市婺城区','婺城区',',926,986,',986)
, (988,'2013-06-24 00:20:18','2013-06-24 00:20:18',null,'浙江省金华市金东区','金东区',',926,986,',986)
, (989,'2013-06-24 00:20:19','2013-06-24 00:20:19',null,'浙江省金华市武义县','武义县',',926,986,',986)
, (990,'2013-06-24 00:20:20','2013-06-24 00:20:20',null,'浙江省金华市浦江县','浦江县',',926,986,',986)
, (991,'2013-06-24 00:20:21','2013-06-24 00:20:21',null,'浙江省金华市磐安县','磐安县',',926,986,',986)
, (992,'2013-06-24 00:20:22','2013-06-24 00:20:22',null,'浙江省金华市兰溪市','兰溪市',',926,986,',986)
, (993,'2013-06-24 00:20:23','2013-06-24 00:20:23',null,'浙江省金华市义乌市','义乌市',',926,986,',986)
, (994,'2013-06-24 00:20:24','2013-06-24 00:20:24',null,'浙江省金华市东阳市','东阳市',',926,986,',986)
, (995,'2013-06-24 00:20:25','2013-06-24 00:20:25',null,'浙江省金华市永康市','永康市',',926,986,',986)
, (996,'2013-06-24 00:20:26','2013-06-24 00:20:26',null,'浙江省衢州市','衢州市',',926,',926)
, (997,'2013-06-24 00:20:27','2013-06-24 00:20:27',null,'浙江省衢州市柯城区','柯城区',',926,996,',996)
, (998,'2013-06-24 00:20:28','2013-06-24 00:20:28',null,'浙江省衢州市衢江区','衢江区',',926,996,',996)
, (999,'2013-06-24 00:20:29','2013-06-24 00:20:29',null,'浙江省衢州市常山县','常山县',',926,996,',996)
, (1000,'2013-06-24 00:20:30','2013-06-24 00:20:30',null,'浙江省衢州市开化县','开化县',',926,996,',996);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (1001,'2013-06-24 00:20:31','2013-06-24 00:20:31',null,'浙江省衢州市龙游县','龙游县',',926,996,',996)
, (1002,'2013-06-24 00:20:32','2013-06-24 00:20:32',null,'浙江省衢州市江山市','江山市',',926,996,',996)
, (1003,'2013-06-24 00:20:33','2013-06-24 00:20:33',null,'浙江省舟山市','舟山市',',926,',926)
, (1004,'2013-06-24 00:20:34','2013-06-24 00:20:34',null,'浙江省舟山市定海区','定海区',',926,1003,',1003)
, (1005,'2013-06-24 00:20:35','2013-06-24 00:20:35',null,'浙江省舟山市普陀区','普陀区',',926,1003,',1003)
, (1006,'2013-06-24 00:20:36','2013-06-24 00:20:36',null,'浙江省舟山市岱山县','岱山县',',926,1003,',1003)
, (1007,'2013-06-24 00:20:37','2013-06-24 00:20:37',null,'浙江省舟山市嵊泗县','嵊泗县',',926,1003,',1003)
, (1008,'2013-06-24 00:20:38','2013-06-24 00:20:38',null,'浙江省台州市','台州市',',926,',926)
, (1009,'2013-06-24 00:20:39','2013-06-24 00:20:39',null,'浙江省台州市椒江区','椒江区',',926,1008,',1008)
, (1010,'2013-06-24 00:20:40','2013-06-24 00:20:40',null,'浙江省台州市黄岩区','黄岩区',',926,1008,',1008)
, (1011,'2013-06-24 00:20:41','2013-06-24 00:20:41',null,'浙江省台州市路桥区','路桥区',',926,1008,',1008)
, (1012,'2013-06-24 00:20:42','2013-06-24 00:20:42',null,'浙江省台州市玉环县','玉环县',',926,1008,',1008)
, (1013,'2013-06-24 00:20:43','2013-06-24 00:20:43',null,'浙江省台州市三门县','三门县',',926,1008,',1008)
, (1014,'2013-06-24 00:20:44','2013-06-24 00:20:44',null,'浙江省台州市天台县','天台县',',926,1008,',1008)
, (1015,'2013-06-24 00:20:45','2013-06-24 00:20:45',null,'浙江省台州市仙居县','仙居县',',926,1008,',1008)
, (1016,'2013-06-24 00:20:46','2013-06-24 00:20:46',null,'浙江省台州市温岭市','温岭市',',926,1008,',1008)
, (1017,'2013-06-24 00:20:47','2013-06-24 00:20:47',null,'浙江省台州市临海市','临海市',',926,1008,',1008)
, (1018,'2013-06-24 00:20:48','2013-06-24 00:20:48',null,'浙江省丽水市','丽水市',',926,',926)
, (1019,'2013-06-24 00:20:49','2013-06-24 00:20:49',null,'浙江省丽水市莲都区','莲都区',',926,1018,',1018)
, (1020,'2013-06-24 00:20:50','2013-06-24 00:20:50',null,'浙江省丽水市青田县','青田县',',926,1018,',1018)
, (1021,'2013-06-24 00:20:51','2013-06-24 00:20:51',null,'浙江省丽水市缙云县','缙云县',',926,1018,',1018)
, (1022,'2013-06-24 00:20:52','2013-06-24 00:20:52',null,'浙江省丽水市遂昌县','遂昌县',',926,1018,',1018)
, (1023,'2013-06-24 00:20:53','2013-06-24 00:20:53',null,'浙江省丽水市松阳县','松阳县',',926,1018,',1018)
, (1024,'2013-06-24 00:20:54','2013-06-24 00:20:54',null,'浙江省丽水市云和县','云和县',',926,1018,',1018)
, (1025,'2013-06-24 00:20:55','2013-06-24 00:20:55',null,'浙江省丽水市庆元县','庆元县',',926,1018,',1018)
, (1026,'2013-06-24 00:20:56','2013-06-24 00:20:56',null,'浙江省丽水市景宁畲族自治县','景宁畲族自治县',',926,1018,',1018)
, (1027,'2013-06-24 00:20:57','2013-06-24 00:20:57',null,'浙江省丽水市龙泉市','龙泉市',',926,1018,',1018)
, (1028,'2013-06-24 00:20:58','2013-06-24 00:20:58',null,'安徽省','安徽省',',',null)
, (1029,'2013-06-24 00:20:59','2013-06-24 00:20:59',null,'安徽省合肥市','合肥市',',1028,',1028)
, (1030,'2013-06-24 00:21:00','2013-06-24 00:21:00',null,'安徽省合肥市瑶海区','瑶海区',',1028,1029,',1029)
, (1031,'2013-06-24 00:21:01','2013-06-24 00:21:01',null,'安徽省合肥市庐阳区','庐阳区',',1028,1029,',1029)
, (1032,'2013-06-24 00:21:02','2013-06-24 00:21:02',null,'安徽省合肥市蜀山区','蜀山区',',1028,1029,',1029)
, (1033,'2013-06-24 00:21:03','2013-06-24 00:21:03',null,'安徽省合肥市包河区','包河区',',1028,1029,',1029)
, (1034,'2013-06-24 00:21:04','2013-06-24 00:21:04',null,'安徽省合肥市长丰县','长丰县',',1028,1029,',1029)
, (1035,'2013-06-24 00:21:05','2013-06-24 00:21:05',null,'安徽省合肥市肥东县','肥东县',',1028,1029,',1029)
, (1036,'2013-06-24 00:21:06','2013-06-24 00:21:06',null,'安徽省合肥市肥西县','肥西县',',1028,1029,',1029)
, (1037,'2013-06-24 00:21:07','2013-06-24 00:21:07',null,'安徽省合肥市庐江县','庐江县',',1028,1029,',1029)
, (1038,'2013-06-24 00:21:08','2013-06-24 00:21:08',null,'安徽省合肥市巢湖市','巢湖市',',1028,1029,',1029)
, (1039,'2013-06-24 00:21:09','2013-06-24 00:21:09',null,'安徽省芜湖市','芜湖市',',1028,',1028)
, (1040,'2013-06-24 00:21:10','2013-06-24 00:21:10',null,'安徽省芜湖市镜湖区','镜湖区',',1028,1039,',1039)
, (1041,'2013-06-24 00:21:11','2013-06-24 00:21:11',null,'安徽省芜湖市弋江区','弋江区',',1028,1039,',1039)
, (1042,'2013-06-24 00:21:12','2013-06-24 00:21:12',null,'安徽省芜湖市鸠江区','鸠江区',',1028,1039,',1039)
, (1043,'2013-06-24 00:21:13','2013-06-24 00:21:13',null,'安徽省芜湖市三山区','三山区',',1028,1039,',1039)
, (1044,'2013-06-24 00:21:14','2013-06-24 00:21:14',null,'安徽省芜湖市芜湖县','芜湖县',',1028,1039,',1039)
, (1045,'2013-06-24 00:21:15','2013-06-24 00:21:15',null,'安徽省芜湖市繁昌县','繁昌县',',1028,1039,',1039)
, (1046,'2013-06-24 00:21:16','2013-06-24 00:21:16',null,'安徽省芜湖市南陵县','南陵县',',1028,1039,',1039)
, (1047,'2013-06-24 00:21:17','2013-06-24 00:21:17',null,'安徽省芜湖市无为县','无为县',',1028,1039,',1039)
, (1048,'2013-06-24 00:21:18','2013-06-24 00:21:18',null,'安徽省蚌埠市','蚌埠市',',1028,',1028)
, (1049,'2013-06-24 00:21:19','2013-06-24 00:21:19',null,'安徽省蚌埠市龙子湖区','龙子湖区',',1028,1048,',1048)
, (1050,'2013-06-24 00:21:20','2013-06-24 00:21:20',null,'安徽省蚌埠市蚌山区','蚌山区',',1028,1048,',1048)
, (1051,'2013-06-24 00:21:21','2013-06-24 00:21:21',null,'安徽省蚌埠市禹会区','禹会区',',1028,1048,',1048)
, (1052,'2013-06-24 00:21:22','2013-06-24 00:21:22',null,'安徽省蚌埠市淮上区','淮上区',',1028,1048,',1048)
, (1053,'2013-06-24 00:21:23','2013-06-24 00:21:23',null,'安徽省蚌埠市怀远县','怀远县',',1028,1048,',1048)
, (1054,'2013-06-24 00:21:24','2013-06-24 00:21:24',null,'安徽省蚌埠市五河县','五河县',',1028,1048,',1048)
, (1055,'2013-06-24 00:21:25','2013-06-24 00:21:25',null,'安徽省蚌埠市固镇县','固镇县',',1028,1048,',1048)
, (1056,'2013-06-24 00:21:26','2013-06-24 00:21:26',null,'安徽省淮南市','淮南市',',1028,',1028)
, (1057,'2013-06-24 00:21:27','2013-06-24 00:21:27',null,'安徽省淮南市大通区','大通区',',1028,1056,',1056)
, (1058,'2013-06-24 00:21:28','2013-06-24 00:21:28',null,'安徽省淮南市田家庵区','田家庵区',',1028,1056,',1056)
, (1059,'2013-06-24 00:21:29','2013-06-24 00:21:29',null,'安徽省淮南市谢家集区','谢家集区',',1028,1056,',1056)
, (1060,'2013-06-24 00:21:30','2013-06-24 00:21:30',null,'安徽省淮南市八公山区','八公山区',',1028,1056,',1056)
, (1061,'2013-06-24 00:21:31','2013-06-24 00:21:31',null,'安徽省淮南市潘集区','潘集区',',1028,1056,',1056)
, (1062,'2013-06-24 00:21:32','2013-06-24 00:21:32',null,'安徽省淮南市凤台县','凤台县',',1028,1056,',1056)
, (1063,'2013-06-24 00:21:33','2013-06-24 00:21:33',null,'安徽省马鞍山市','马鞍山市',',1028,',1028)
, (1064,'2013-06-24 00:21:34','2013-06-24 00:21:34',null,'安徽省马鞍山市花山区','花山区',',1028,1063,',1063)
, (1065,'2013-06-24 00:21:35','2013-06-24 00:21:35',null,'安徽省马鞍山市雨山区','雨山区',',1028,1063,',1063)
, (1066,'2013-06-24 00:21:36','2013-06-24 00:21:36',null,'安徽省马鞍山市博望区','博望区',',1028,1063,',1063)
, (1067,'2013-06-24 00:21:37','2013-06-24 00:21:37',null,'安徽省马鞍山市当涂县','当涂县',',1028,1063,',1063)
, (1068,'2013-06-24 00:21:38','2013-06-24 00:21:38',null,'安徽省马鞍山市含山县','含山县',',1028,1063,',1063)
, (1069,'2013-06-24 00:21:39','2013-06-24 00:21:39',null,'安徽省马鞍山市和县','和县',',1028,1063,',1063)
, (1070,'2013-06-24 00:21:40','2013-06-24 00:21:40',null,'安徽省淮北市','淮北市',',1028,',1028)
, (1071,'2013-06-24 00:21:41','2013-06-24 00:21:41',null,'安徽省淮北市杜集区','杜集区',',1028,1070,',1070)
, (1072,'2013-06-24 00:21:42','2013-06-24 00:21:42',null,'安徽省淮北市相山区','相山区',',1028,1070,',1070)
, (1073,'2013-06-24 00:21:43','2013-06-24 00:21:43',null,'安徽省淮北市烈山区','烈山区',',1028,1070,',1070)
, (1074,'2013-06-24 00:21:44','2013-06-24 00:21:44',null,'安徽省淮北市濉溪县','濉溪县',',1028,1070,',1070)
, (1075,'2013-06-24 00:21:45','2013-06-24 00:21:45',null,'安徽省铜陵市','铜陵市',',1028,',1028)
, (1076,'2013-06-24 00:21:46','2013-06-24 00:21:46',null,'安徽省铜陵市铜官山区','铜官山区',',1028,1075,',1075)
, (1077,'2013-06-24 00:21:47','2013-06-24 00:21:47',null,'安徽省铜陵市狮子山区','狮子山区',',1028,1075,',1075)
, (1078,'2013-06-24 00:21:48','2013-06-24 00:21:48',null,'安徽省铜陵市郊区','郊区',',1028,1075,',1075)
, (1079,'2013-06-24 00:21:49','2013-06-24 00:21:49',null,'安徽省铜陵市铜陵县','铜陵县',',1028,1075,',1075)
, (1080,'2013-06-24 00:21:50','2013-06-24 00:21:50',null,'安徽省安庆市','安庆市',',1028,',1028)
, (1081,'2013-06-24 00:21:51','2013-06-24 00:21:51',null,'安徽省安庆市迎江区','迎江区',',1028,1080,',1080)
, (1082,'2013-06-24 00:21:52','2013-06-24 00:21:52',null,'安徽省安庆市大观区','大观区',',1028,1080,',1080)
, (1083,'2013-06-24 00:21:53','2013-06-24 00:21:53',null,'安徽省安庆市宜秀区','宜秀区',',1028,1080,',1080)
, (1084,'2013-06-24 00:21:54','2013-06-24 00:21:54',null,'安徽省安庆市怀宁县','怀宁县',',1028,1080,',1080)
, (1085,'2013-06-24 00:21:55','2013-06-24 00:21:55',null,'安徽省安庆市枞阳县','枞阳县',',1028,1080,',1080)
, (1086,'2013-06-24 00:21:56','2013-06-24 00:21:56',null,'安徽省安庆市潜山县','潜山县',',1028,1080,',1080)
, (1087,'2013-06-24 00:21:57','2013-06-24 00:21:57',null,'安徽省安庆市太湖县','太湖县',',1028,1080,',1080)
, (1088,'2013-06-24 00:21:58','2013-06-24 00:21:58',null,'安徽省安庆市宿松县','宿松县',',1028,1080,',1080)
, (1089,'2013-06-24 00:21:59','2013-06-24 00:21:59',null,'安徽省安庆市望江县','望江县',',1028,1080,',1080)
, (1090,'2013-06-24 00:22:00','2013-06-24 00:22:00',null,'安徽省安庆市岳西县','岳西县',',1028,1080,',1080)
, (1091,'2013-06-24 00:22:01','2013-06-24 00:22:01',null,'安徽省安庆市桐城市','桐城市',',1028,1080,',1080)
, (1092,'2013-06-24 00:22:02','2013-06-24 00:22:02',null,'安徽省黄山市','黄山市',',1028,',1028)
, (1093,'2013-06-24 00:22:03','2013-06-24 00:22:03',null,'安徽省黄山市屯溪区','屯溪区',',1028,1092,',1092)
, (1094,'2013-06-24 00:22:04','2013-06-24 00:22:04',null,'安徽省黄山市黄山区','黄山区',',1028,1092,',1092)
, (1095,'2013-06-24 00:22:05','2013-06-24 00:22:05',null,'安徽省黄山市徽州区','徽州区',',1028,1092,',1092)
, (1096,'2013-06-24 00:22:06','2013-06-24 00:22:06',null,'安徽省黄山市歙县','歙县',',1028,1092,',1092)
, (1097,'2013-06-24 00:22:07','2013-06-24 00:22:07',null,'安徽省黄山市休宁县','休宁县',',1028,1092,',1092)
, (1098,'2013-06-24 00:22:08','2013-06-24 00:22:08',null,'安徽省黄山市黟县','黟县',',1028,1092,',1092)
, (1099,'2013-06-24 00:22:09','2013-06-24 00:22:09',null,'安徽省黄山市祁门县','祁门县',',1028,1092,',1092)
, (1100,'2013-06-24 00:22:10','2013-06-24 00:22:10',null,'安徽省滁州市','滁州市',',1028,',1028)
, (1101,'2013-06-24 00:22:11','2013-06-24 00:22:11',null,'安徽省滁州市琅琊区','琅琊区',',1028,1100,',1100)
, (1102,'2013-06-24 00:22:12','2013-06-24 00:22:12',null,'安徽省滁州市南谯区','南谯区',',1028,1100,',1100)
, (1103,'2013-06-24 00:22:13','2013-06-24 00:22:13',null,'安徽省滁州市来安县','来安县',',1028,1100,',1100)
, (1104,'2013-06-24 00:22:14','2013-06-24 00:22:14',null,'安徽省滁州市全椒县','全椒县',',1028,1100,',1100)
, (1105,'2013-06-24 00:22:15','2013-06-24 00:22:15',null,'安徽省滁州市定远县','定远县',',1028,1100,',1100)
, (1106,'2013-06-24 00:22:16','2013-06-24 00:22:16',null,'安徽省滁州市凤阳县','凤阳县',',1028,1100,',1100)
, (1107,'2013-06-24 00:22:17','2013-06-24 00:22:17',null,'安徽省滁州市天长市','天长市',',1028,1100,',1100)
, (1108,'2013-06-24 00:22:18','2013-06-24 00:22:18',null,'安徽省滁州市明光市','明光市',',1028,1100,',1100)
, (1109,'2013-06-24 00:22:19','2013-06-24 00:22:19',null,'安徽省阜阳市','阜阳市',',1028,',1028)
, (1110,'2013-06-24 00:22:20','2013-06-24 00:22:20',null,'安徽省阜阳市颍州区','颍州区',',1028,1109,',1109)
, (1111,'2013-06-24 00:22:21','2013-06-24 00:22:21',null,'安徽省阜阳市颍东区','颍东区',',1028,1109,',1109)
, (1112,'2013-06-24 00:22:22','2013-06-24 00:22:22',null,'安徽省阜阳市颍泉区','颍泉区',',1028,1109,',1109)
, (1113,'2013-06-24 00:22:23','2013-06-24 00:22:23',null,'安徽省阜阳市临泉县','临泉县',',1028,1109,',1109)
, (1114,'2013-06-24 00:22:24','2013-06-24 00:22:24',null,'安徽省阜阳市太和县','太和县',',1028,1109,',1109)
, (1115,'2013-06-24 00:22:25','2013-06-24 00:22:25',null,'安徽省阜阳市阜南县','阜南县',',1028,1109,',1109)
, (1116,'2013-06-24 00:22:26','2013-06-24 00:22:26',null,'安徽省阜阳市颍上县','颍上县',',1028,1109,',1109)
, (1117,'2013-06-24 00:22:27','2013-06-24 00:22:27',null,'安徽省阜阳市界首市','界首市',',1028,1109,',1109)
, (1118,'2013-06-24 00:22:28','2013-06-24 00:22:28',null,'安徽省宿州市','宿州市',',1028,',1028)
, (1119,'2013-06-24 00:22:29','2013-06-24 00:22:29',null,'安徽省宿州市埇桥区','埇桥区',',1028,1118,',1118)
, (1120,'2013-06-24 00:22:30','2013-06-24 00:22:30',null,'安徽省宿州市砀山县','砀山县',',1028,1118,',1118)
, (1121,'2013-06-24 00:22:31','2013-06-24 00:22:31',null,'安徽省宿州市萧县','萧县',',1028,1118,',1118)
, (1122,'2013-06-24 00:22:32','2013-06-24 00:22:32',null,'安徽省宿州市灵璧县','灵璧县',',1028,1118,',1118)
, (1123,'2013-06-24 00:22:33','2013-06-24 00:22:33',null,'安徽省宿州市泗县','泗县',',1028,1118,',1118)
, (1124,'2013-06-24 00:22:34','2013-06-24 00:22:34',null,'安徽省六安市','六安市',',1028,',1028)
, (1125,'2013-06-24 00:22:35','2013-06-24 00:22:35',null,'安徽省六安市金安区','金安区',',1028,1124,',1124)
, (1126,'2013-06-24 00:22:36','2013-06-24 00:22:36',null,'安徽省六安市裕安区','裕安区',',1028,1124,',1124)
, (1127,'2013-06-24 00:22:37','2013-06-24 00:22:37',null,'安徽省六安市寿县','寿县',',1028,1124,',1124)
, (1128,'2013-06-24 00:22:38','2013-06-24 00:22:38',null,'安徽省六安市霍邱县','霍邱县',',1028,1124,',1124)
, (1129,'2013-06-24 00:22:39','2013-06-24 00:22:39',null,'安徽省六安市舒城县','舒城县',',1028,1124,',1124)
, (1130,'2013-06-24 00:22:40','2013-06-24 00:22:40',null,'安徽省六安市金寨县','金寨县',',1028,1124,',1124)
, (1131,'2013-06-24 00:22:41','2013-06-24 00:22:41',null,'安徽省六安市霍山县','霍山县',',1028,1124,',1124)
, (1132,'2013-06-24 00:22:42','2013-06-24 00:22:42',null,'安徽省亳州市','亳州市',',1028,',1028)
, (1133,'2013-06-24 00:22:43','2013-06-24 00:22:43',null,'安徽省亳州市谯城区','谯城区',',1028,1132,',1132)
, (1134,'2013-06-24 00:22:44','2013-06-24 00:22:44',null,'安徽省亳州市涡阳县','涡阳县',',1028,1132,',1132)
, (1135,'2013-06-24 00:22:45','2013-06-24 00:22:45',null,'安徽省亳州市蒙城县','蒙城县',',1028,1132,',1132)
, (1136,'2013-06-24 00:22:46','2013-06-24 00:22:46',null,'安徽省亳州市利辛县','利辛县',',1028,1132,',1132)
, (1137,'2013-06-24 00:22:47','2013-06-24 00:22:47',null,'安徽省池州市','池州市',',1028,',1028)
, (1138,'2013-06-24 00:22:48','2013-06-24 00:22:48',null,'安徽省池州市贵池区','贵池区',',1028,1137,',1137)
, (1139,'2013-06-24 00:22:49','2013-06-24 00:22:49',null,'安徽省池州市东至县','东至县',',1028,1137,',1137)
, (1140,'2013-06-24 00:22:50','2013-06-24 00:22:50',null,'安徽省池州市石台县','石台县',',1028,1137,',1137)
, (1141,'2013-06-24 00:22:51','2013-06-24 00:22:51',null,'安徽省池州市青阳县','青阳县',',1028,1137,',1137)
, (1142,'2013-06-24 00:22:52','2013-06-24 00:22:52',null,'安徽省宣城市','宣城市',',1028,',1028)
, (1143,'2013-06-24 00:22:53','2013-06-24 00:22:53',null,'安徽省宣城市宣州区','宣州区',',1028,1142,',1142)
, (1144,'2013-06-24 00:22:54','2013-06-24 00:22:54',null,'安徽省宣城市郎溪县','郎溪县',',1028,1142,',1142)
, (1145,'2013-06-24 00:22:55','2013-06-24 00:22:55',null,'安徽省宣城市广德县','广德县',',1028,1142,',1142)
, (1146,'2013-06-24 00:22:56','2013-06-24 00:22:56',null,'安徽省宣城市泾县','泾县',',1028,1142,',1142)
, (1147,'2013-06-24 00:22:57','2013-06-24 00:22:57',null,'安徽省宣城市绩溪县','绩溪县',',1028,1142,',1142)
, (1148,'2013-06-24 00:22:58','2013-06-24 00:22:58',null,'安徽省宣城市旌德县','旌德县',',1028,1142,',1142)
, (1149,'2013-06-24 00:22:59','2013-06-24 00:22:59',null,'安徽省宣城市宁国市','宁国市',',1028,1142,',1142)
, (1150,'2013-06-24 00:23:00','2013-06-24 00:23:00',null,'福建省','福建省',',',null)
, (1151,'2013-06-24 00:23:01','2013-06-24 00:23:01',null,'福建省福州市','福州市',',1150,',1150)
, (1152,'2013-06-24 00:23:02','2013-06-24 00:23:02',null,'福建省福州市鼓楼区','鼓楼区',',1150,1151,',1151)
, (1153,'2013-06-24 00:23:03','2013-06-24 00:23:03',null,'福建省福州市台江区','台江区',',1150,1151,',1151)
, (1154,'2013-06-24 00:23:04','2013-06-24 00:23:04',null,'福建省福州市仓山区','仓山区',',1150,1151,',1151)
, (1155,'2013-06-24 00:23:05','2013-06-24 00:23:05',null,'福建省福州市马尾区','马尾区',',1150,1151,',1151)
, (1156,'2013-06-24 00:23:06','2013-06-24 00:23:06',null,'福建省福州市晋安区','晋安区',',1150,1151,',1151)
, (1157,'2013-06-24 00:23:07','2013-06-24 00:23:07',null,'福建省福州市闽侯县','闽侯县',',1150,1151,',1151)
, (1158,'2013-06-24 00:23:08','2013-06-24 00:23:08',null,'福建省福州市连江县','连江县',',1150,1151,',1151)
, (1159,'2013-06-24 00:23:09','2013-06-24 00:23:09',null,'福建省福州市罗源县','罗源县',',1150,1151,',1151)
, (1160,'2013-06-24 00:23:10','2013-06-24 00:23:10',null,'福建省福州市闽清县','闽清县',',1150,1151,',1151)
, (1161,'2013-06-24 00:23:11','2013-06-24 00:23:11',null,'福建省福州市永泰县','永泰县',',1150,1151,',1151)
, (1162,'2013-06-24 00:23:12','2013-06-24 00:23:12',null,'福建省福州市平潭县','平潭县',',1150,1151,',1151)
, (1163,'2013-06-24 00:23:13','2013-06-24 00:23:13',null,'福建省福州市福清市','福清市',',1150,1151,',1151)
, (1164,'2013-06-24 00:23:14','2013-06-24 00:23:14',null,'福建省福州市长乐市','长乐市',',1150,1151,',1151)
, (1165,'2013-06-24 00:23:15','2013-06-24 00:23:15',null,'福建省厦门市','厦门市',',1150,',1150)
, (1166,'2013-06-24 00:23:16','2013-06-24 00:23:16',null,'福建省厦门市思明区','思明区',',1150,1165,',1165)
, (1167,'2013-06-24 00:23:17','2013-06-24 00:23:17',null,'福建省厦门市海沧区','海沧区',',1150,1165,',1165)
, (1168,'2013-06-24 00:23:18','2013-06-24 00:23:18',null,'福建省厦门市湖里区','湖里区',',1150,1165,',1165)
, (1169,'2013-06-24 00:23:19','2013-06-24 00:23:19',null,'福建省厦门市集美区','集美区',',1150,1165,',1165)
, (1170,'2013-06-24 00:23:20','2013-06-24 00:23:20',null,'福建省厦门市同安区','同安区',',1150,1165,',1165)
, (1171,'2013-06-24 00:23:21','2013-06-24 00:23:21',null,'福建省厦门市翔安区','翔安区',',1150,1165,',1165)
, (1172,'2013-06-24 00:23:22','2013-06-24 00:23:22',null,'福建省莆田市','莆田市',',1150,',1150)
, (1173,'2013-06-24 00:23:23','2013-06-24 00:23:23',null,'福建省莆田市城厢区','城厢区',',1150,1172,',1172)
, (1174,'2013-06-24 00:23:24','2013-06-24 00:23:24',null,'福建省莆田市涵江区','涵江区',',1150,1172,',1172)
, (1175,'2013-06-24 00:23:25','2013-06-24 00:23:25',null,'福建省莆田市荔城区','荔城区',',1150,1172,',1172)
, (1176,'2013-06-24 00:23:26','2013-06-24 00:23:26',null,'福建省莆田市秀屿区','秀屿区',',1150,1172,',1172)
, (1177,'2013-06-24 00:23:27','2013-06-24 00:23:27',null,'福建省莆田市仙游县','仙游县',',1150,1172,',1172)
, (1178,'2013-06-24 00:23:28','2013-06-24 00:23:28',null,'福建省三明市','三明市',',1150,',1150)
, (1179,'2013-06-24 00:23:29','2013-06-24 00:23:29',null,'福建省三明市梅列区','梅列区',',1150,1178,',1178)
, (1180,'2013-06-24 00:23:30','2013-06-24 00:23:30',null,'福建省三明市三元区','三元区',',1150,1178,',1178)
, (1181,'2013-06-24 00:23:31','2013-06-24 00:23:31',null,'福建省三明市明溪县','明溪县',',1150,1178,',1178)
, (1182,'2013-06-24 00:23:32','2013-06-24 00:23:32',null,'福建省三明市清流县','清流县',',1150,1178,',1178)
, (1183,'2013-06-24 00:23:33','2013-06-24 00:23:33',null,'福建省三明市宁化县','宁化县',',1150,1178,',1178)
, (1184,'2013-06-24 00:23:34','2013-06-24 00:23:34',null,'福建省三明市大田县','大田县',',1150,1178,',1178)
, (1185,'2013-06-24 00:23:35','2013-06-24 00:23:35',null,'福建省三明市尤溪县','尤溪县',',1150,1178,',1178)
, (1186,'2013-06-24 00:23:36','2013-06-24 00:23:36',null,'福建省三明市沙县','沙县',',1150,1178,',1178)
, (1187,'2013-06-24 00:23:37','2013-06-24 00:23:37',null,'福建省三明市将乐县','将乐县',',1150,1178,',1178)
, (1188,'2013-06-24 00:23:38','2013-06-24 00:23:38',null,'福建省三明市泰宁县','泰宁县',',1150,1178,',1178)
, (1189,'2013-06-24 00:23:39','2013-06-24 00:23:39',null,'福建省三明市建宁县','建宁县',',1150,1178,',1178)
, (1190,'2013-06-24 00:23:40','2013-06-24 00:23:40',null,'福建省三明市永安市','永安市',',1150,1178,',1178)
, (1191,'2013-06-24 00:23:41','2013-06-24 00:23:41',null,'福建省泉州市','泉州市',',1150,',1150)
, (1192,'2013-06-24 00:23:42','2013-06-24 00:23:42',null,'福建省泉州市鲤城区','鲤城区',',1150,1191,',1191)
, (1193,'2013-06-24 00:23:43','2013-06-24 00:23:43',null,'福建省泉州市丰泽区','丰泽区',',1150,1191,',1191)
, (1194,'2013-06-24 00:23:44','2013-06-24 00:23:44',null,'福建省泉州市洛江区','洛江区',',1150,1191,',1191)
, (1195,'2013-06-24 00:23:45','2013-06-24 00:23:45',null,'福建省泉州市泉港区','泉港区',',1150,1191,',1191)
, (1196,'2013-06-24 00:23:46','2013-06-24 00:23:46',null,'福建省泉州市惠安县','惠安县',',1150,1191,',1191)
, (1197,'2013-06-24 00:23:47','2013-06-24 00:23:47',null,'福建省泉州市安溪县','安溪县',',1150,1191,',1191)
, (1198,'2013-06-24 00:23:48','2013-06-24 00:23:48',null,'福建省泉州市永春县','永春县',',1150,1191,',1191)
, (1199,'2013-06-24 00:23:49','2013-06-24 00:23:49',null,'福建省泉州市德化县','德化县',',1150,1191,',1191)
, (1200,'2013-06-24 00:23:50','2013-06-24 00:23:50',null,'福建省泉州市金门县','金门县',',1150,1191,',1191)
, (1201,'2013-06-24 00:23:51','2013-06-24 00:23:51',null,'福建省泉州市石狮市','石狮市',',1150,1191,',1191)
, (1202,'2013-06-24 00:23:52','2013-06-24 00:23:52',null,'福建省泉州市晋江市','晋江市',',1150,1191,',1191)
, (1203,'2013-06-24 00:23:53','2013-06-24 00:23:53',null,'福建省泉州市南安市','南安市',',1150,1191,',1191)
, (1204,'2013-06-24 00:23:54','2013-06-24 00:23:54',null,'福建省漳州市','漳州市',',1150,',1150)
, (1205,'2013-06-24 00:23:55','2013-06-24 00:23:55',null,'福建省漳州市芗城区','芗城区',',1150,1204,',1204)
, (1206,'2013-06-24 00:23:56','2013-06-24 00:23:56',null,'福建省漳州市龙文区','龙文区',',1150,1204,',1204)
, (1207,'2013-06-24 00:23:57','2013-06-24 00:23:57',null,'福建省漳州市云霄县','云霄县',',1150,1204,',1204)
, (1208,'2013-06-24 00:23:58','2013-06-24 00:23:58',null,'福建省漳州市漳浦县','漳浦县',',1150,1204,',1204)
, (1209,'2013-06-24 00:23:59','2013-06-24 00:23:59',null,'福建省漳州市诏安县','诏安县',',1150,1204,',1204)
, (1210,'2013-06-24 00:24:00','2013-06-24 00:24:00',null,'福建省漳州市长泰县','长泰县',',1150,1204,',1204)
, (1211,'2013-06-24 00:24:01','2013-06-24 00:24:01',null,'福建省漳州市东山县','东山县',',1150,1204,',1204)
, (1212,'2013-06-24 00:24:02','2013-06-24 00:24:02',null,'福建省漳州市南靖县','南靖县',',1150,1204,',1204)
, (1213,'2013-06-24 00:24:03','2013-06-24 00:24:03',null,'福建省漳州市平和县','平和县',',1150,1204,',1204)
, (1214,'2013-06-24 00:24:04','2013-06-24 00:24:04',null,'福建省漳州市华安县','华安县',',1150,1204,',1204)
, (1215,'2013-06-24 00:24:05','2013-06-24 00:24:05',null,'福建省漳州市龙海市','龙海市',',1150,1204,',1204)
, (1216,'2013-06-24 00:24:06','2013-06-24 00:24:06',null,'福建省南平市','南平市',',1150,',1150)
, (1217,'2013-06-24 00:24:07','2013-06-24 00:24:07',null,'福建省南平市延平区','延平区',',1150,1216,',1216)
, (1218,'2013-06-24 00:24:08','2013-06-24 00:24:08',null,'福建省南平市顺昌县','顺昌县',',1150,1216,',1216)
, (1219,'2013-06-24 00:24:09','2013-06-24 00:24:09',null,'福建省南平市浦城县','浦城县',',1150,1216,',1216)
, (1220,'2013-06-24 00:24:10','2013-06-24 00:24:10',null,'福建省南平市光泽县','光泽县',',1150,1216,',1216)
, (1221,'2013-06-24 00:24:11','2013-06-24 00:24:11',null,'福建省南平市松溪县','松溪县',',1150,1216,',1216)
, (1222,'2013-06-24 00:24:12','2013-06-24 00:24:12',null,'福建省南平市政和县','政和县',',1150,1216,',1216)
, (1223,'2013-06-24 00:24:13','2013-06-24 00:24:13',null,'福建省南平市邵武市','邵武市',',1150,1216,',1216)
, (1224,'2013-06-24 00:24:14','2013-06-24 00:24:14',null,'福建省南平市武夷山市','武夷山市',',1150,1216,',1216)
, (1225,'2013-06-24 00:24:15','2013-06-24 00:24:15',null,'福建省南平市建瓯市','建瓯市',',1150,1216,',1216)
, (1226,'2013-06-24 00:24:16','2013-06-24 00:24:16',null,'福建省南平市建阳市','建阳市',',1150,1216,',1216)
, (1227,'2013-06-24 00:24:17','2013-06-24 00:24:17',null,'福建省龙岩市','龙岩市',',1150,',1150)
, (1228,'2013-06-24 00:24:18','2013-06-24 00:24:18',null,'福建省龙岩市新罗区','新罗区',',1150,1227,',1227)
, (1229,'2013-06-24 00:24:19','2013-06-24 00:24:19',null,'福建省龙岩市长汀县','长汀县',',1150,1227,',1227)
, (1230,'2013-06-24 00:24:20','2013-06-24 00:24:20',null,'福建省龙岩市永定县','永定县',',1150,1227,',1227)
, (1231,'2013-06-24 00:24:21','2013-06-24 00:24:21',null,'福建省龙岩市上杭县','上杭县',',1150,1227,',1227)
, (1232,'2013-06-24 00:24:22','2013-06-24 00:24:22',null,'福建省龙岩市武平县','武平县',',1150,1227,',1227)
, (1233,'2013-06-24 00:24:23','2013-06-24 00:24:23',null,'福建省龙岩市连城县','连城县',',1150,1227,',1227)
, (1234,'2013-06-24 00:24:24','2013-06-24 00:24:24',null,'福建省龙岩市漳平市','漳平市',',1150,1227,',1227)
, (1235,'2013-06-24 00:24:25','2013-06-24 00:24:25',null,'福建省宁德市','宁德市',',1150,',1150)
, (1236,'2013-06-24 00:24:26','2013-06-24 00:24:26',null,'福建省宁德市蕉城区','蕉城区',',1150,1235,',1235)
, (1237,'2013-06-24 00:24:27','2013-06-24 00:24:27',null,'福建省宁德市霞浦县','霞浦县',',1150,1235,',1235)
, (1238,'2013-06-24 00:24:28','2013-06-24 00:24:28',null,'福建省宁德市古田县','古田县',',1150,1235,',1235)
, (1239,'2013-06-24 00:24:29','2013-06-24 00:24:29',null,'福建省宁德市屏南县','屏南县',',1150,1235,',1235)
, (1240,'2013-06-24 00:24:30','2013-06-24 00:24:30',null,'福建省宁德市寿宁县','寿宁县',',1150,1235,',1235)
, (1241,'2013-06-24 00:24:31','2013-06-24 00:24:31',null,'福建省宁德市周宁县','周宁县',',1150,1235,',1235)
, (1242,'2013-06-24 00:24:32','2013-06-24 00:24:32',null,'福建省宁德市柘荣县','柘荣县',',1150,1235,',1235)
, (1243,'2013-06-24 00:24:33','2013-06-24 00:24:33',null,'福建省宁德市福安市','福安市',',1150,1235,',1235)
, (1244,'2013-06-24 00:24:34','2013-06-24 00:24:34',null,'福建省宁德市福鼎市','福鼎市',',1150,1235,',1235)
, (1245,'2013-06-24 00:24:35','2013-06-24 00:24:35',null,'江西省','江西省',',',null)
, (1246,'2013-06-24 00:24:36','2013-06-24 00:24:36',null,'江西省南昌市','南昌市',',1245,',1245)
, (1247,'2013-06-24 00:24:37','2013-06-24 00:24:37',null,'江西省南昌市东湖区','东湖区',',1245,1246,',1246)
, (1248,'2013-06-24 00:24:38','2013-06-24 00:24:38',null,'江西省南昌市西湖区','西湖区',',1245,1246,',1246)
, (1249,'2013-06-24 00:24:39','2013-06-24 00:24:39',null,'江西省南昌市青云谱区','青云谱区',',1245,1246,',1246)
, (1250,'2013-06-24 00:24:40','2013-06-24 00:24:40',null,'江西省南昌市湾里区','湾里区',',1245,1246,',1246)
, (1251,'2013-06-24 00:24:41','2013-06-24 00:24:41',null,'江西省南昌市青山湖区','青山湖区',',1245,1246,',1246)
, (1252,'2013-06-24 00:24:42','2013-06-24 00:24:42',null,'江西省南昌市南昌县','南昌县',',1245,1246,',1246)
, (1253,'2013-06-24 00:24:43','2013-06-24 00:24:43',null,'江西省南昌市新建县','新建县',',1245,1246,',1246)
, (1254,'2013-06-24 00:24:44','2013-06-24 00:24:44',null,'江西省南昌市安义县','安义县',',1245,1246,',1246)
, (1255,'2013-06-24 00:24:45','2013-06-24 00:24:45',null,'江西省南昌市进贤县','进贤县',',1245,1246,',1246)
, (1256,'2013-06-24 00:24:46','2013-06-24 00:24:46',null,'江西省景德镇市','景德镇市',',1245,',1245)
, (1257,'2013-06-24 00:24:47','2013-06-24 00:24:47',null,'江西省景德镇市昌江区','昌江区',',1245,1256,',1256)
, (1258,'2013-06-24 00:24:48','2013-06-24 00:24:48',null,'江西省景德镇市珠山区','珠山区',',1245,1256,',1256)
, (1259,'2013-06-24 00:24:49','2013-06-24 00:24:49',null,'江西省景德镇市浮梁县','浮梁县',',1245,1256,',1256)
, (1260,'2013-06-24 00:24:50','2013-06-24 00:24:50',null,'江西省景德镇市乐平市','乐平市',',1245,1256,',1256)
, (1261,'2013-06-24 00:24:51','2013-06-24 00:24:51',null,'江西省萍乡市','萍乡市',',1245,',1245)
, (1262,'2013-06-24 00:24:52','2013-06-24 00:24:52',null,'江西省萍乡市安源区','安源区',',1245,1261,',1261)
, (1263,'2013-06-24 00:24:53','2013-06-24 00:24:53',null,'江西省萍乡市湘东区','湘东区',',1245,1261,',1261)
, (1264,'2013-06-24 00:24:54','2013-06-24 00:24:54',null,'江西省萍乡市莲花县','莲花县',',1245,1261,',1261)
, (1265,'2013-06-24 00:24:55','2013-06-24 00:24:55',null,'江西省萍乡市上栗县','上栗县',',1245,1261,',1261)
, (1266,'2013-06-24 00:24:56','2013-06-24 00:24:56',null,'江西省萍乡市芦溪县','芦溪县',',1245,1261,',1261)
, (1267,'2013-06-24 00:24:57','2013-06-24 00:24:57',null,'江西省九江市','九江市',',1245,',1245)
, (1268,'2013-06-24 00:24:58','2013-06-24 00:24:58',null,'江西省九江市庐山区','庐山区',',1245,1267,',1267)
, (1269,'2013-06-24 00:24:59','2013-06-24 00:24:59',null,'江西省九江市浔阳区','浔阳区',',1245,1267,',1267)
, (1270,'2013-06-24 00:25:00','2013-06-24 00:25:00',null,'江西省九江市九江县','九江县',',1245,1267,',1267)
, (1271,'2013-06-24 00:25:01','2013-06-24 00:25:01',null,'江西省九江市武宁县','武宁县',',1245,1267,',1267)
, (1272,'2013-06-24 00:25:02','2013-06-24 00:25:02',null,'江西省九江市修水县','修水县',',1245,1267,',1267)
, (1273,'2013-06-24 00:25:03','2013-06-24 00:25:03',null,'江西省九江市永修县','永修县',',1245,1267,',1267)
, (1274,'2013-06-24 00:25:04','2013-06-24 00:25:04',null,'江西省九江市德安县','德安县',',1245,1267,',1267)
, (1275,'2013-06-24 00:25:05','2013-06-24 00:25:05',null,'江西省九江市星子县','星子县',',1245,1267,',1267)
, (1276,'2013-06-24 00:25:06','2013-06-24 00:25:06',null,'江西省九江市都昌县','都昌县',',1245,1267,',1267)
, (1277,'2013-06-24 00:25:07','2013-06-24 00:25:07',null,'江西省九江市湖口县','湖口县',',1245,1267,',1267)
, (1278,'2013-06-24 00:25:08','2013-06-24 00:25:08',null,'江西省九江市彭泽县','彭泽县',',1245,1267,',1267)
, (1279,'2013-06-24 00:25:09','2013-06-24 00:25:09',null,'江西省九江市瑞昌市','瑞昌市',',1245,1267,',1267)
, (1280,'2013-06-24 00:25:10','2013-06-24 00:25:10',null,'江西省九江市共青城市','共青城市',',1245,1267,',1267)
, (1281,'2013-06-24 00:25:11','2013-06-24 00:25:11',null,'江西省新余市','新余市',',1245,',1245)
, (1282,'2013-06-24 00:25:12','2013-06-24 00:25:12',null,'江西省新余市渝水区','渝水区',',1245,1281,',1281)
, (1283,'2013-06-24 00:25:13','2013-06-24 00:25:13',null,'江西省新余市分宜县','分宜县',',1245,1281,',1281)
, (1284,'2013-06-24 00:25:14','2013-06-24 00:25:14',null,'江西省鹰潭市','鹰潭市',',1245,',1245)
, (1285,'2013-06-24 00:25:15','2013-06-24 00:25:15',null,'江西省鹰潭市月湖区','月湖区',',1245,1284,',1284)
, (1286,'2013-06-24 00:25:16','2013-06-24 00:25:16',null,'江西省鹰潭市余江县','余江县',',1245,1284,',1284)
, (1287,'2013-06-24 00:25:17','2013-06-24 00:25:17',null,'江西省鹰潭市贵溪市','贵溪市',',1245,1284,',1284)
, (1288,'2013-06-24 00:25:18','2013-06-24 00:25:18',null,'江西省赣州市','赣州市',',1245,',1245)
, (1289,'2013-06-24 00:25:19','2013-06-24 00:25:19',null,'江西省赣州市章贡区','章贡区',',1245,1288,',1288)
, (1290,'2013-06-24 00:25:20','2013-06-24 00:25:20',null,'江西省赣州市赣县','赣县',',1245,1288,',1288)
, (1291,'2013-06-24 00:25:21','2013-06-24 00:25:21',null,'江西省赣州市信丰县','信丰县',',1245,1288,',1288)
, (1292,'2013-06-24 00:25:22','2013-06-24 00:25:22',null,'江西省赣州市大余县','大余县',',1245,1288,',1288)
, (1293,'2013-06-24 00:25:23','2013-06-24 00:25:23',null,'江西省赣州市上犹县','上犹县',',1245,1288,',1288)
, (1294,'2013-06-24 00:25:24','2013-06-24 00:25:24',null,'江西省赣州市崇义县','崇义县',',1245,1288,',1288)
, (1295,'2013-06-24 00:25:25','2013-06-24 00:25:25',null,'江西省赣州市安远县','安远县',',1245,1288,',1288)
, (1296,'2013-06-24 00:25:26','2013-06-24 00:25:26',null,'江西省赣州市龙南县','龙南县',',1245,1288,',1288)
, (1297,'2013-06-24 00:25:27','2013-06-24 00:25:27',null,'江西省赣州市定南县','定南县',',1245,1288,',1288)
, (1298,'2013-06-24 00:25:28','2013-06-24 00:25:28',null,'江西省赣州市全南县','全南县',',1245,1288,',1288)
, (1299,'2013-06-24 00:25:29','2013-06-24 00:25:29',null,'江西省赣州市宁都县','宁都县',',1245,1288,',1288)
, (1300,'2013-06-24 00:25:30','2013-06-24 00:25:30',null,'江西省赣州市于都县','于都县',',1245,1288,',1288)
, (1301,'2013-06-24 00:25:31','2013-06-24 00:25:31',null,'江西省赣州市兴国县','兴国县',',1245,1288,',1288)
, (1302,'2013-06-24 00:25:32','2013-06-24 00:25:32',null,'江西省赣州市会昌县','会昌县',',1245,1288,',1288)
, (1303,'2013-06-24 00:25:33','2013-06-24 00:25:33',null,'江西省赣州市寻乌县','寻乌县',',1245,1288,',1288)
, (1304,'2013-06-24 00:25:34','2013-06-24 00:25:34',null,'江西省赣州市石城县','石城县',',1245,1288,',1288)
, (1305,'2013-06-24 00:25:35','2013-06-24 00:25:35',null,'江西省赣州市瑞金市','瑞金市',',1245,1288,',1288)
, (1306,'2013-06-24 00:25:36','2013-06-24 00:25:36',null,'江西省赣州市南康市','南康市',',1245,1288,',1288)
, (1307,'2013-06-24 00:25:37','2013-06-24 00:25:37',null,'江西省吉安市','吉安市',',1245,',1245)
, (1308,'2013-06-24 00:25:38','2013-06-24 00:25:38',null,'江西省吉安市吉州区','吉州区',',1245,1307,',1307)
, (1309,'2013-06-24 00:25:39','2013-06-24 00:25:39',null,'江西省吉安市青原区','青原区',',1245,1307,',1307)
, (1310,'2013-06-24 00:25:40','2013-06-24 00:25:40',null,'江西省吉安市吉安县','吉安县',',1245,1307,',1307)
, (1311,'2013-06-24 00:25:41','2013-06-24 00:25:41',null,'江西省吉安市吉水县','吉水县',',1245,1307,',1307)
, (1312,'2013-06-24 00:25:42','2013-06-24 00:25:42',null,'江西省吉安市峡江县','峡江县',',1245,1307,',1307)
, (1313,'2013-06-24 00:25:43','2013-06-24 00:25:43',null,'江西省吉安市新干县','新干县',',1245,1307,',1307)
, (1314,'2013-06-24 00:25:44','2013-06-24 00:25:44',null,'江西省吉安市永丰县','永丰县',',1245,1307,',1307)
, (1315,'2013-06-24 00:25:45','2013-06-24 00:25:45',null,'江西省吉安市泰和县','泰和县',',1245,1307,',1307)
, (1316,'2013-06-24 00:25:46','2013-06-24 00:25:46',null,'江西省吉安市遂川县','遂川县',',1245,1307,',1307)
, (1317,'2013-06-24 00:25:47','2013-06-24 00:25:47',null,'江西省吉安市万安县','万安县',',1245,1307,',1307)
, (1318,'2013-06-24 00:25:48','2013-06-24 00:25:48',null,'江西省吉安市安福县','安福县',',1245,1307,',1307)
, (1319,'2013-06-24 00:25:49','2013-06-24 00:25:49',null,'江西省吉安市永新县','永新县',',1245,1307,',1307)
, (1320,'2013-06-24 00:25:50','2013-06-24 00:25:50',null,'江西省吉安市井冈山市','井冈山市',',1245,1307,',1307)
, (1321,'2013-06-24 00:25:51','2013-06-24 00:25:51',null,'江西省宜春市','宜春市',',1245,',1245)
, (1322,'2013-06-24 00:25:52','2013-06-24 00:25:52',null,'江西省宜春市袁州区','袁州区',',1245,1321,',1321)
, (1323,'2013-06-24 00:25:53','2013-06-24 00:25:53',null,'江西省宜春市奉新县','奉新县',',1245,1321,',1321)
, (1324,'2013-06-24 00:25:54','2013-06-24 00:25:54',null,'江西省宜春市万载县','万载县',',1245,1321,',1321)
, (1325,'2013-06-24 00:25:55','2013-06-24 00:25:55',null,'江西省宜春市上高县','上高县',',1245,1321,',1321)
, (1326,'2013-06-24 00:25:56','2013-06-24 00:25:56',null,'江西省宜春市宜丰县','宜丰县',',1245,1321,',1321)
, (1327,'2013-06-24 00:25:57','2013-06-24 00:25:57',null,'江西省宜春市靖安县','靖安县',',1245,1321,',1321)
, (1328,'2013-06-24 00:25:58','2013-06-24 00:25:58',null,'江西省宜春市铜鼓县','铜鼓县',',1245,1321,',1321)
, (1329,'2013-06-24 00:25:59','2013-06-24 00:25:59',null,'江西省宜春市丰城市','丰城市',',1245,1321,',1321)
, (1330,'2013-06-24 00:26:00','2013-06-24 00:26:00',null,'江西省宜春市樟树市','樟树市',',1245,1321,',1321)
, (1331,'2013-06-24 00:26:01','2013-06-24 00:26:01',null,'江西省宜春市高安市','高安市',',1245,1321,',1321)
, (1332,'2013-06-24 00:26:02','2013-06-24 00:26:02',null,'江西省抚州市','抚州市',',1245,',1245)
, (1333,'2013-06-24 00:26:03','2013-06-24 00:26:03',null,'江西省抚州市临川区','临川区',',1245,1332,',1332)
, (1334,'2013-06-24 00:26:04','2013-06-24 00:26:04',null,'江西省抚州市南城县','南城县',',1245,1332,',1332)
, (1335,'2013-06-24 00:26:05','2013-06-24 00:26:05',null,'江西省抚州市黎川县','黎川县',',1245,1332,',1332)
, (1336,'2013-06-24 00:26:06','2013-06-24 00:26:06',null,'江西省抚州市南丰县','南丰县',',1245,1332,',1332)
, (1337,'2013-06-24 00:26:07','2013-06-24 00:26:07',null,'江西省抚州市崇仁县','崇仁县',',1245,1332,',1332)
, (1338,'2013-06-24 00:26:08','2013-06-24 00:26:08',null,'江西省抚州市乐安县','乐安县',',1245,1332,',1332)
, (1339,'2013-06-24 00:26:09','2013-06-24 00:26:09',null,'江西省抚州市宜黄县','宜黄县',',1245,1332,',1332)
, (1340,'2013-06-24 00:26:10','2013-06-24 00:26:10',null,'江西省抚州市金溪县','金溪县',',1245,1332,',1332)
, (1341,'2013-06-24 00:26:11','2013-06-24 00:26:11',null,'江西省抚州市资溪县','资溪县',',1245,1332,',1332)
, (1342,'2013-06-24 00:26:12','2013-06-24 00:26:12',null,'江西省抚州市东乡县','东乡县',',1245,1332,',1332)
, (1343,'2013-06-24 00:26:13','2013-06-24 00:26:13',null,'江西省抚州市广昌县','广昌县',',1245,1332,',1332)
, (1344,'2013-06-24 00:26:14','2013-06-24 00:26:14',null,'江西省上饶市','上饶市',',1245,',1245)
, (1345,'2013-06-24 00:26:15','2013-06-24 00:26:15',null,'江西省上饶市信州区','信州区',',1245,1344,',1344)
, (1346,'2013-06-24 00:26:16','2013-06-24 00:26:16',null,'江西省上饶市上饶县','上饶县',',1245,1344,',1344)
, (1347,'2013-06-24 00:26:17','2013-06-24 00:26:17',null,'江西省上饶市广丰县','广丰县',',1245,1344,',1344)
, (1348,'2013-06-24 00:26:18','2013-06-24 00:26:18',null,'江西省上饶市玉山县','玉山县',',1245,1344,',1344)
, (1349,'2013-06-24 00:26:19','2013-06-24 00:26:19',null,'江西省上饶市铅山县','铅山县',',1245,1344,',1344)
, (1350,'2013-06-24 00:26:20','2013-06-24 00:26:20',null,'江西省上饶市横峰县','横峰县',',1245,1344,',1344)
, (1351,'2013-06-24 00:26:21','2013-06-24 00:26:21',null,'江西省上饶市弋阳县','弋阳县',',1245,1344,',1344)
, (1352,'2013-06-24 00:26:22','2013-06-24 00:26:22',null,'江西省上饶市余干县','余干县',',1245,1344,',1344)
, (1353,'2013-06-24 00:26:23','2013-06-24 00:26:23',null,'江西省上饶市鄱阳县','鄱阳县',',1245,1344,',1344)
, (1354,'2013-06-24 00:26:24','2013-06-24 00:26:24',null,'江西省上饶市万年县','万年县',',1245,1344,',1344)
, (1355,'2013-06-24 00:26:25','2013-06-24 00:26:25',null,'江西省上饶市婺源县','婺源县',',1245,1344,',1344)
, (1356,'2013-06-24 00:26:26','2013-06-24 00:26:26',null,'江西省上饶市德兴市','德兴市',',1245,1344,',1344)
, (1357,'2013-06-24 00:26:27','2013-06-24 00:26:27',null,'山东省','山东省',',',null)
, (1358,'2013-06-24 00:26:28','2013-06-24 00:26:28',null,'山东省济南市','济南市',',1357,',1357)
, (1359,'2013-06-24 00:26:29','2013-06-24 00:26:29',null,'山东省济南市历下区','历下区',',1357,1358,',1358)
, (1360,'2013-06-24 00:26:30','2013-06-24 00:26:30',null,'山东省济南市市中区','市中区',',1357,1358,',1358)
, (1361,'2013-06-24 00:26:31','2013-06-24 00:26:31',null,'山东省济南市槐荫区','槐荫区',',1357,1358,',1358)
, (1362,'2013-06-24 00:26:32','2013-06-24 00:26:32',null,'山东省济南市天桥区','天桥区',',1357,1358,',1358)
, (1363,'2013-06-24 00:26:33','2013-06-24 00:26:33',null,'山东省济南市历城区','历城区',',1357,1358,',1358)
, (1364,'2013-06-24 00:26:34','2013-06-24 00:26:34',null,'山东省济南市长清区','长清区',',1357,1358,',1358)
, (1365,'2013-06-24 00:26:35','2013-06-24 00:26:35',null,'山东省济南市平阴县','平阴县',',1357,1358,',1358)
, (1366,'2013-06-24 00:26:36','2013-06-24 00:26:36',null,'山东省济南市济阳县','济阳县',',1357,1358,',1358)
, (1367,'2013-06-24 00:26:37','2013-06-24 00:26:37',null,'山东省济南市商河县','商河县',',1357,1358,',1358)
, (1368,'2013-06-24 00:26:38','2013-06-24 00:26:38',null,'山东省济南市章丘市','章丘市',',1357,1358,',1358)
, (1369,'2013-06-24 00:26:39','2013-06-24 00:26:39',null,'山东省青岛市','青岛市',',1357,',1357)
, (1370,'2013-06-24 00:26:40','2013-06-24 00:26:40',null,'山东省青岛市市南区','市南区',',1357,1369,',1369)
, (1371,'2013-06-24 00:26:41','2013-06-24 00:26:41',null,'山东省青岛市市北区','市北区',',1357,1369,',1369)
, (1372,'2013-06-24 00:26:42','2013-06-24 00:26:42',null,'山东省青岛市四方区','四方区',',1357,1369,',1369)
, (1373,'2013-06-24 00:26:43','2013-06-24 00:26:43',null,'山东省青岛市黄岛区','黄岛区',',1357,1369,',1369)
, (1374,'2013-06-24 00:26:44','2013-06-24 00:26:44',null,'山东省青岛市崂山区','崂山区',',1357,1369,',1369)
, (1375,'2013-06-24 00:26:45','2013-06-24 00:26:45',null,'山东省青岛市李沧区','李沧区',',1357,1369,',1369)
, (1376,'2013-06-24 00:26:46','2013-06-24 00:26:46',null,'山东省青岛市城阳区','城阳区',',1357,1369,',1369)
, (1377,'2013-06-24 00:26:47','2013-06-24 00:26:47',null,'山东省青岛市胶州市','胶州市',',1357,1369,',1369)
, (1378,'2013-06-24 00:26:48','2013-06-24 00:26:48',null,'山东省青岛市即墨市','即墨市',',1357,1369,',1369)
, (1379,'2013-06-24 00:26:49','2013-06-24 00:26:49',null,'山东省青岛市平度市','平度市',',1357,1369,',1369)
, (1380,'2013-06-24 00:26:50','2013-06-24 00:26:50',null,'山东省青岛市胶南市','胶南市',',1357,1369,',1369)
, (1381,'2013-06-24 00:26:51','2013-06-24 00:26:51',null,'山东省青岛市莱西市','莱西市',',1357,1369,',1369)
, (1382,'2013-06-24 00:26:52','2013-06-24 00:26:52',null,'山东省淄博市','淄博市',',1357,',1357)
, (1383,'2013-06-24 00:26:53','2013-06-24 00:26:53',null,'山东省淄博市淄川区','淄川区',',1357,1382,',1382)
, (1384,'2013-06-24 00:26:54','2013-06-24 00:26:54',null,'山东省淄博市张店区','张店区',',1357,1382,',1382)
, (1385,'2013-06-24 00:26:55','2013-06-24 00:26:55',null,'山东省淄博市博山区','博山区',',1357,1382,',1382)
, (1386,'2013-06-24 00:26:56','2013-06-24 00:26:56',null,'山东省淄博市临淄区','临淄区',',1357,1382,',1382)
, (1387,'2013-06-24 00:26:57','2013-06-24 00:26:57',null,'山东省淄博市周村区','周村区',',1357,1382,',1382)
, (1388,'2013-06-24 00:26:58','2013-06-24 00:26:58',null,'山东省淄博市桓台县','桓台县',',1357,1382,',1382)
, (1389,'2013-06-24 00:26:59','2013-06-24 00:26:59',null,'山东省淄博市高青县','高青县',',1357,1382,',1382)
, (1390,'2013-06-24 00:27:00','2013-06-24 00:27:00',null,'山东省淄博市沂源县','沂源县',',1357,1382,',1382)
, (1391,'2013-06-24 00:27:01','2013-06-24 00:27:01',null,'山东省枣庄市','枣庄市',',1357,',1357)
, (1392,'2013-06-24 00:27:02','2013-06-24 00:27:02',null,'山东省枣庄市市中区','市中区',',1357,1391,',1391)
, (1393,'2013-06-24 00:27:03','2013-06-24 00:27:03',null,'山东省枣庄市薛城区','薛城区',',1357,1391,',1391)
, (1394,'2013-06-24 00:27:04','2013-06-24 00:27:04',null,'山东省枣庄市峄城区','峄城区',',1357,1391,',1391)
, (1395,'2013-06-24 00:27:05','2013-06-24 00:27:05',null,'山东省枣庄市台儿庄区','台儿庄区',',1357,1391,',1391)
, (1396,'2013-06-24 00:27:06','2013-06-24 00:27:06',null,'山东省枣庄市山亭区','山亭区',',1357,1391,',1391)
, (1397,'2013-06-24 00:27:07','2013-06-24 00:27:07',null,'山东省枣庄市滕州市','滕州市',',1357,1391,',1391)
, (1398,'2013-06-24 00:27:08','2013-06-24 00:27:08',null,'山东省东营市','东营市',',1357,',1357)
, (1399,'2013-06-24 00:27:09','2013-06-24 00:27:09',null,'山东省东营市东营区','东营区',',1357,1398,',1398)
, (1400,'2013-06-24 00:27:10','2013-06-24 00:27:10',null,'山东省东营市河口区','河口区',',1357,1398,',1398)
, (1401,'2013-06-24 00:27:11','2013-06-24 00:27:11',null,'山东省东营市垦利县','垦利县',',1357,1398,',1398)
, (1402,'2013-06-24 00:27:12','2013-06-24 00:27:12',null,'山东省东营市利津县','利津县',',1357,1398,',1398)
, (1403,'2013-06-24 00:27:13','2013-06-24 00:27:13',null,'山东省东营市广饶县','广饶县',',1357,1398,',1398)
, (1404,'2013-06-24 00:27:14','2013-06-24 00:27:14',null,'山东省烟台市','烟台市',',1357,',1357)
, (1405,'2013-06-24 00:27:15','2013-06-24 00:27:15',null,'山东省烟台市芝罘区','芝罘区',',1357,1404,',1404)
, (1406,'2013-06-24 00:27:16','2013-06-24 00:27:16',null,'山东省烟台市福山区','福山区',',1357,1404,',1404)
, (1407,'2013-06-24 00:27:17','2013-06-24 00:27:17',null,'山东省烟台市牟平区','牟平区',',1357,1404,',1404)
, (1408,'2013-06-24 00:27:18','2013-06-24 00:27:18',null,'山东省烟台市莱山区','莱山区',',1357,1404,',1404)
, (1409,'2013-06-24 00:27:19','2013-06-24 00:27:19',null,'山东省烟台市长岛县','长岛县',',1357,1404,',1404)
, (1410,'2013-06-24 00:27:20','2013-06-24 00:27:20',null,'山东省烟台市龙口市','龙口市',',1357,1404,',1404)
, (1411,'2013-06-24 00:27:21','2013-06-24 00:27:21',null,'山东省烟台市莱阳市','莱阳市',',1357,1404,',1404)
, (1412,'2013-06-24 00:27:22','2013-06-24 00:27:22',null,'山东省烟台市莱州市','莱州市',',1357,1404,',1404)
, (1413,'2013-06-24 00:27:23','2013-06-24 00:27:23',null,'山东省烟台市蓬莱市','蓬莱市',',1357,1404,',1404)
, (1414,'2013-06-24 00:27:24','2013-06-24 00:27:24',null,'山东省烟台市招远市','招远市',',1357,1404,',1404)
, (1415,'2013-06-24 00:27:25','2013-06-24 00:27:25',null,'山东省烟台市栖霞市','栖霞市',',1357,1404,',1404)
, (1416,'2013-06-24 00:27:26','2013-06-24 00:27:26',null,'山东省烟台市海阳市','海阳市',',1357,1404,',1404)
, (1417,'2013-06-24 00:27:27','2013-06-24 00:27:27',null,'山东省潍坊市','潍坊市',',1357,',1357)
, (1418,'2013-06-24 00:27:28','2013-06-24 00:27:28',null,'山东省潍坊市潍城区','潍城区',',1357,1417,',1417)
, (1419,'2013-06-24 00:27:29','2013-06-24 00:27:29',null,'山东省潍坊市寒亭区','寒亭区',',1357,1417,',1417)
, (1420,'2013-06-24 00:27:30','2013-06-24 00:27:30',null,'山东省潍坊市坊子区','坊子区',',1357,1417,',1417)
, (1421,'2013-06-24 00:27:31','2013-06-24 00:27:31',null,'山东省潍坊市奎文区','奎文区',',1357,1417,',1417)
, (1422,'2013-06-24 00:27:32','2013-06-24 00:27:32',null,'山东省潍坊市临朐县','临朐县',',1357,1417,',1417)
, (1423,'2013-06-24 00:27:33','2013-06-24 00:27:33',null,'山东省潍坊市昌乐县','昌乐县',',1357,1417,',1417)
, (1424,'2013-06-24 00:27:34','2013-06-24 00:27:34',null,'山东省潍坊市青州市','青州市',',1357,1417,',1417)
, (1425,'2013-06-24 00:27:35','2013-06-24 00:27:35',null,'山东省潍坊市诸城市','诸城市',',1357,1417,',1417)
, (1426,'2013-06-24 00:27:36','2013-06-24 00:27:36',null,'山东省潍坊市寿光市','寿光市',',1357,1417,',1417)
, (1427,'2013-06-24 00:27:37','2013-06-24 00:27:37',null,'山东省潍坊市安丘市','安丘市',',1357,1417,',1417)
, (1428,'2013-06-24 00:27:38','2013-06-24 00:27:38',null,'山东省潍坊市高密市','高密市',',1357,1417,',1417)
, (1429,'2013-06-24 00:27:39','2013-06-24 00:27:39',null,'山东省潍坊市昌邑市','昌邑市',',1357,1417,',1417)
, (1430,'2013-06-24 00:27:40','2013-06-24 00:27:40',null,'山东省济宁市','济宁市',',1357,',1357)
, (1431,'2013-06-24 00:27:41','2013-06-24 00:27:41',null,'山东省济宁市市中区','市中区',',1357,1430,',1430)
, (1432,'2013-06-24 00:27:42','2013-06-24 00:27:42',null,'山东省济宁市任城区','任城区',',1357,1430,',1430)
, (1433,'2013-06-24 00:27:43','2013-06-24 00:27:43',null,'山东省济宁市微山县','微山县',',1357,1430,',1430)
, (1434,'2013-06-24 00:27:44','2013-06-24 00:27:44',null,'山东省济宁市鱼台县','鱼台县',',1357,1430,',1430)
, (1435,'2013-06-24 00:27:45','2013-06-24 00:27:45',null,'山东省济宁市金乡县','金乡县',',1357,1430,',1430)
, (1436,'2013-06-24 00:27:46','2013-06-24 00:27:46',null,'山东省济宁市嘉祥县','嘉祥县',',1357,1430,',1430)
, (1437,'2013-06-24 00:27:47','2013-06-24 00:27:47',null,'山东省济宁市汶上县','汶上县',',1357,1430,',1430)
, (1438,'2013-06-24 00:27:48','2013-06-24 00:27:48',null,'山东省济宁市泗水县','泗水县',',1357,1430,',1430)
, (1439,'2013-06-24 00:27:49','2013-06-24 00:27:49',null,'山东省济宁市梁山县','梁山县',',1357,1430,',1430)
, (1440,'2013-06-24 00:27:50','2013-06-24 00:27:50',null,'山东省济宁市曲阜市','曲阜市',',1357,1430,',1430)
, (1441,'2013-06-24 00:27:51','2013-06-24 00:27:51',null,'山东省济宁市兖州市','兖州市',',1357,1430,',1430)
, (1442,'2013-06-24 00:27:52','2013-06-24 00:27:52',null,'山东省济宁市邹城市','邹城市',',1357,1430,',1430)
, (1443,'2013-06-24 00:27:53','2013-06-24 00:27:53',null,'山东省泰安市','泰安市',',1357,',1357)
, (1444,'2013-06-24 00:27:54','2013-06-24 00:27:54',null,'山东省泰安市泰山区','泰山区',',1357,1443,',1443)
, (1445,'2013-06-24 00:27:55','2013-06-24 00:27:55',null,'山东省泰安市岱岳区','岱岳区',',1357,1443,',1443)
, (1446,'2013-06-24 00:27:56','2013-06-24 00:27:56',null,'山东省泰安市宁阳县','宁阳县',',1357,1443,',1443)
, (1447,'2013-06-24 00:27:57','2013-06-24 00:27:57',null,'山东省泰安市东平县','东平县',',1357,1443,',1443)
, (1448,'2013-06-24 00:27:58','2013-06-24 00:27:58',null,'山东省泰安市新泰市','新泰市',',1357,1443,',1443)
, (1449,'2013-06-24 00:27:59','2013-06-24 00:27:59',null,'山东省泰安市肥城市','肥城市',',1357,1443,',1443)
, (1450,'2013-06-24 00:28:00','2013-06-24 00:28:00',null,'山东省威海市','威海市',',1357,',1357)
, (1451,'2013-06-24 00:28:01','2013-06-24 00:28:01',null,'山东省威海市环翠区','环翠区',',1357,1450,',1450)
, (1452,'2013-06-24 00:28:02','2013-06-24 00:28:02',null,'山东省威海市文登市','文登市',',1357,1450,',1450)
, (1453,'2013-06-24 00:28:03','2013-06-24 00:28:03',null,'山东省威海市荣成市','荣成市',',1357,1450,',1450)
, (1454,'2013-06-24 00:28:04','2013-06-24 00:28:04',null,'山东省威海市乳山市','乳山市',',1357,1450,',1450)
, (1455,'2013-06-24 00:28:05','2013-06-24 00:28:05',null,'山东省日照市','日照市',',1357,',1357)
, (1456,'2013-06-24 00:28:06','2013-06-24 00:28:06',null,'山东省日照市东港区','东港区',',1357,1455,',1455)
, (1457,'2013-06-24 00:28:07','2013-06-24 00:28:07',null,'山东省日照市岚山区','岚山区',',1357,1455,',1455)
, (1458,'2013-06-24 00:28:08','2013-06-24 00:28:08',null,'山东省日照市五莲县','五莲县',',1357,1455,',1455)
, (1459,'2013-06-24 00:28:09','2013-06-24 00:28:09',null,'山东省日照市莒县','莒县',',1357,1455,',1455)
, (1460,'2013-06-24 00:28:10','2013-06-24 00:28:10',null,'山东省莱芜市','莱芜市',',1357,',1357)
, (1461,'2013-06-24 00:28:11','2013-06-24 00:28:11',null,'山东省莱芜市莱城区','莱城区',',1357,1460,',1460)
, (1462,'2013-06-24 00:28:12','2013-06-24 00:28:12',null,'山东省莱芜市钢城区','钢城区',',1357,1460,',1460)
, (1463,'2013-06-24 00:28:13','2013-06-24 00:28:13',null,'山东省临沂市','临沂市',',1357,',1357)
, (1464,'2013-06-24 00:28:14','2013-06-24 00:28:14',null,'山东省临沂市兰山区','兰山区',',1357,1463,',1463)
, (1465,'2013-06-24 00:28:15','2013-06-24 00:28:15',null,'山东省临沂市罗庄区','罗庄区',',1357,1463,',1463)
, (1466,'2013-06-24 00:28:16','2013-06-24 00:28:16',null,'山东省临沂市河东区','河东区',',1357,1463,',1463)
, (1467,'2013-06-24 00:28:17','2013-06-24 00:28:17',null,'山东省临沂市沂南县','沂南县',',1357,1463,',1463)
, (1468,'2013-06-24 00:28:18','2013-06-24 00:28:18',null,'山东省临沂市郯城县','郯城县',',1357,1463,',1463)
, (1469,'2013-06-24 00:28:19','2013-06-24 00:28:19',null,'山东省临沂市沂水县','沂水县',',1357,1463,',1463)
, (1470,'2013-06-24 00:28:20','2013-06-24 00:28:20',null,'山东省临沂市苍山县','苍山县',',1357,1463,',1463)
, (1471,'2013-06-24 00:28:21','2013-06-24 00:28:21',null,'山东省临沂市费县','费县',',1357,1463,',1463)
, (1472,'2013-06-24 00:28:22','2013-06-24 00:28:22',null,'山东省临沂市平邑县','平邑县',',1357,1463,',1463)
, (1473,'2013-06-24 00:28:23','2013-06-24 00:28:23',null,'山东省临沂市莒南县','莒南县',',1357,1463,',1463)
, (1474,'2013-06-24 00:28:24','2013-06-24 00:28:24',null,'山东省临沂市蒙阴县','蒙阴县',',1357,1463,',1463)
, (1475,'2013-06-24 00:28:25','2013-06-24 00:28:25',null,'山东省临沂市临沭县','临沭县',',1357,1463,',1463)
, (1476,'2013-06-24 00:28:26','2013-06-24 00:28:26',null,'山东省德州市','德州市',',1357,',1357)
, (1477,'2013-06-24 00:28:27','2013-06-24 00:28:27',null,'山东省德州市德城区','德城区',',1357,1476,',1476)
, (1478,'2013-06-24 00:28:28','2013-06-24 00:28:28',null,'山东省德州市陵县','陵县',',1357,1476,',1476)
, (1479,'2013-06-24 00:28:29','2013-06-24 00:28:29',null,'山东省德州市宁津县','宁津县',',1357,1476,',1476)
, (1480,'2013-06-24 00:28:30','2013-06-24 00:28:30',null,'山东省德州市庆云县','庆云县',',1357,1476,',1476)
, (1481,'2013-06-24 00:28:31','2013-06-24 00:28:31',null,'山东省德州市临邑县','临邑县',',1357,1476,',1476)
, (1482,'2013-06-24 00:28:32','2013-06-24 00:28:32',null,'山东省德州市齐河县','齐河县',',1357,1476,',1476)
, (1483,'2013-06-24 00:28:33','2013-06-24 00:28:33',null,'山东省德州市平原县','平原县',',1357,1476,',1476)
, (1484,'2013-06-24 00:28:34','2013-06-24 00:28:34',null,'山东省德州市夏津县','夏津县',',1357,1476,',1476)
, (1485,'2013-06-24 00:28:35','2013-06-24 00:28:35',null,'山东省德州市武城县','武城县',',1357,1476,',1476)
, (1486,'2013-06-24 00:28:36','2013-06-24 00:28:36',null,'山东省德州市乐陵市','乐陵市',',1357,1476,',1476)
, (1487,'2013-06-24 00:28:37','2013-06-24 00:28:37',null,'山东省德州市禹城市','禹城市',',1357,1476,',1476)
, (1488,'2013-06-24 00:28:38','2013-06-24 00:28:38',null,'山东省聊城市','聊城市',',1357,',1357)
, (1489,'2013-06-24 00:28:39','2013-06-24 00:28:39',null,'山东省聊城市东昌府区','东昌府区',',1357,1488,',1488)
, (1490,'2013-06-24 00:28:40','2013-06-24 00:28:40',null,'山东省聊城市阳谷县','阳谷县',',1357,1488,',1488)
, (1491,'2013-06-24 00:28:41','2013-06-24 00:28:41',null,'山东省聊城市莘县','莘县',',1357,1488,',1488)
, (1492,'2013-06-24 00:28:42','2013-06-24 00:28:42',null,'山东省聊城市茌平县','茌平县',',1357,1488,',1488)
, (1493,'2013-06-24 00:28:43','2013-06-24 00:28:43',null,'山东省聊城市东阿县','东阿县',',1357,1488,',1488)
, (1494,'2013-06-24 00:28:44','2013-06-24 00:28:44',null,'山东省聊城市冠县','冠县',',1357,1488,',1488)
, (1495,'2013-06-24 00:28:45','2013-06-24 00:28:45',null,'山东省聊城市高唐县','高唐县',',1357,1488,',1488)
, (1496,'2013-06-24 00:28:46','2013-06-24 00:28:46',null,'山东省聊城市临清市','临清市',',1357,1488,',1488)
, (1497,'2013-06-24 00:28:47','2013-06-24 00:28:47',null,'山东省滨州市','滨州市',',1357,',1357)
, (1498,'2013-06-24 00:28:48','2013-06-24 00:28:48',null,'山东省滨州市滨城区','滨城区',',1357,1497,',1497)
, (1499,'2013-06-24 00:28:49','2013-06-24 00:28:49',null,'山东省滨州市惠民县','惠民县',',1357,1497,',1497)
, (1500,'2013-06-24 00:28:50','2013-06-24 00:28:50',null,'山东省滨州市阳信县','阳信县',',1357,1497,',1497);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (1501,'2013-06-24 00:28:51','2013-06-24 00:28:51',null,'山东省滨州市无棣县','无棣县',',1357,1497,',1497)
, (1502,'2013-06-24 00:28:52','2013-06-24 00:28:52',null,'山东省滨州市沾化县','沾化县',',1357,1497,',1497)
, (1503,'2013-06-24 00:28:53','2013-06-24 00:28:53',null,'山东省滨州市博兴县','博兴县',',1357,1497,',1497)
, (1504,'2013-06-24 00:28:54','2013-06-24 00:28:54',null,'山东省滨州市邹平县','邹平县',',1357,1497,',1497)
, (1505,'2013-06-24 00:28:55','2013-06-24 00:28:55',null,'山东省菏泽市','菏泽市',',1357,',1357)
, (1506,'2013-06-24 00:28:56','2013-06-24 00:28:56',null,'山东省菏泽市牡丹区','牡丹区',',1357,1505,',1505)
, (1507,'2013-06-24 00:28:57','2013-06-24 00:28:57',null,'山东省菏泽市曹县','曹县',',1357,1505,',1505)
, (1508,'2013-06-24 00:28:58','2013-06-24 00:28:58',null,'山东省菏泽市单县','单县',',1357,1505,',1505)
, (1509,'2013-06-24 00:28:59','2013-06-24 00:28:59',null,'山东省菏泽市成武县','成武县',',1357,1505,',1505)
, (1510,'2013-06-24 00:29:00','2013-06-24 00:29:00',null,'山东省菏泽市巨野县','巨野县',',1357,1505,',1505)
, (1511,'2013-06-24 00:29:01','2013-06-24 00:29:01',null,'山东省菏泽市郓城县','郓城县',',1357,1505,',1505)
, (1512,'2013-06-24 00:29:02','2013-06-24 00:29:02',null,'山东省菏泽市鄄城县','鄄城县',',1357,1505,',1505)
, (1513,'2013-06-24 00:29:03','2013-06-24 00:29:03',null,'山东省菏泽市定陶县','定陶县',',1357,1505,',1505)
, (1514,'2013-06-24 00:29:04','2013-06-24 00:29:04',null,'山东省菏泽市东明县','东明县',',1357,1505,',1505)
, (1515,'2013-06-24 00:29:05','2013-06-24 00:29:05',null,'河南省','河南省',',',null)
, (1516,'2013-06-24 00:29:06','2013-06-24 00:29:06',null,'河南省郑州市','郑州市',',1515,',1515)
, (1517,'2013-06-24 00:29:07','2013-06-24 00:29:07',null,'河南省郑州市中原区','中原区',',1515,1516,',1516)
, (1518,'2013-06-24 00:29:08','2013-06-24 00:29:08',null,'河南省郑州市二七区','二七区',',1515,1516,',1516)
, (1519,'2013-06-24 00:29:09','2013-06-24 00:29:09',null,'河南省郑州市管城回族区','管城回族区',',1515,1516,',1516)
, (1520,'2013-06-24 00:29:10','2013-06-24 00:29:10',null,'河南省郑州市金水区','金水区',',1515,1516,',1516)
, (1521,'2013-06-24 00:29:11','2013-06-24 00:29:11',null,'河南省郑州市上街区','上街区',',1515,1516,',1516)
, (1522,'2013-06-24 00:29:12','2013-06-24 00:29:12',null,'河南省郑州市惠济区','惠济区',',1515,1516,',1516)
, (1523,'2013-06-24 00:29:13','2013-06-24 00:29:13',null,'河南省郑州市中牟县','中牟县',',1515,1516,',1516)
, (1524,'2013-06-24 00:29:14','2013-06-24 00:29:14',null,'河南省郑州市巩义市','巩义市',',1515,1516,',1516)
, (1525,'2013-06-24 00:29:15','2013-06-24 00:29:15',null,'河南省郑州市荥阳市','荥阳市',',1515,1516,',1516)
, (1526,'2013-06-24 00:29:16','2013-06-24 00:29:16',null,'河南省郑州市新密市','新密市',',1515,1516,',1516)
, (1527,'2013-06-24 00:29:17','2013-06-24 00:29:17',null,'河南省郑州市新郑市','新郑市',',1515,1516,',1516)
, (1528,'2013-06-24 00:29:18','2013-06-24 00:29:18',null,'河南省郑州市登封市','登封市',',1515,1516,',1516)
, (1529,'2013-06-24 00:29:19','2013-06-24 00:29:19',null,'河南省开封市','开封市',',1515,',1515)
, (1530,'2013-06-24 00:29:20','2013-06-24 00:29:20',null,'河南省开封市龙亭区','龙亭区',',1515,1529,',1529)
, (1531,'2013-06-24 00:29:21','2013-06-24 00:29:21',null,'河南省开封市顺河回族区','顺河回族区',',1515,1529,',1529)
, (1532,'2013-06-24 00:29:22','2013-06-24 00:29:22',null,'河南省开封市鼓楼区','鼓楼区',',1515,1529,',1529)
, (1533,'2013-06-24 00:29:23','2013-06-24 00:29:23',null,'河南省开封市禹王台区','禹王台区',',1515,1529,',1529)
, (1534,'2013-06-24 00:29:24','2013-06-24 00:29:24',null,'河南省开封市金明区','金明区',',1515,1529,',1529)
, (1535,'2013-06-24 00:29:25','2013-06-24 00:29:25',null,'河南省开封市杞县','杞县',',1515,1529,',1529)
, (1536,'2013-06-24 00:29:26','2013-06-24 00:29:26',null,'河南省开封市通许县','通许县',',1515,1529,',1529)
, (1537,'2013-06-24 00:29:27','2013-06-24 00:29:27',null,'河南省开封市尉氏县','尉氏县',',1515,1529,',1529)
, (1538,'2013-06-24 00:29:28','2013-06-24 00:29:28',null,'河南省开封市开封县','开封县',',1515,1529,',1529)
, (1539,'2013-06-24 00:29:29','2013-06-24 00:29:29',null,'河南省开封市兰考县','兰考县',',1515,1529,',1529)
, (1540,'2013-06-24 00:29:30','2013-06-24 00:29:30',null,'河南省洛阳市','洛阳市',',1515,',1515)
, (1541,'2013-06-24 00:29:31','2013-06-24 00:29:31',null,'河南省洛阳市老城区','老城区',',1515,1540,',1540)
, (1542,'2013-06-24 00:29:32','2013-06-24 00:29:32',null,'河南省洛阳市西工区','西工区',',1515,1540,',1540)
, (1543,'2013-06-24 00:29:33','2013-06-24 00:29:33',null,'河南省洛阳市瀍河回族区','瀍河回族区',',1515,1540,',1540)
, (1544,'2013-06-24 00:29:34','2013-06-24 00:29:34',null,'河南省洛阳市涧西区','涧西区',',1515,1540,',1540)
, (1545,'2013-06-24 00:29:35','2013-06-24 00:29:35',null,'河南省洛阳市吉利区','吉利区',',1515,1540,',1540)
, (1546,'2013-06-24 00:29:36','2013-06-24 00:29:36',null,'河南省洛阳市洛龙区','洛龙区',',1515,1540,',1540)
, (1547,'2013-06-24 00:29:37','2013-06-24 00:29:37',null,'河南省洛阳市孟津县','孟津县',',1515,1540,',1540)
, (1548,'2013-06-24 00:29:38','2013-06-24 00:29:38',null,'河南省洛阳市新安县','新安县',',1515,1540,',1540)
, (1549,'2013-06-24 00:29:39','2013-06-24 00:29:39',null,'河南省洛阳市栾川县','栾川县',',1515,1540,',1540)
, (1550,'2013-06-24 00:29:40','2013-06-24 00:29:40',null,'河南省洛阳市嵩县','嵩县',',1515,1540,',1540)
, (1551,'2013-06-24 00:29:41','2013-06-24 00:29:41',null,'河南省洛阳市汝阳县','汝阳县',',1515,1540,',1540)
, (1552,'2013-06-24 00:29:42','2013-06-24 00:29:42',null,'河南省洛阳市宜阳县','宜阳县',',1515,1540,',1540)
, (1553,'2013-06-24 00:29:43','2013-06-24 00:29:43',null,'河南省洛阳市洛宁县','洛宁县',',1515,1540,',1540)
, (1554,'2013-06-24 00:29:44','2013-06-24 00:29:44',null,'河南省洛阳市伊川县','伊川县',',1515,1540,',1540)
, (1555,'2013-06-24 00:29:45','2013-06-24 00:29:45',null,'河南省洛阳市偃师市','偃师市',',1515,1540,',1540)
, (1556,'2013-06-24 00:29:46','2013-06-24 00:29:46',null,'河南省平顶山市','平顶山市',',1515,',1515)
, (1557,'2013-06-24 00:29:47','2013-06-24 00:29:47',null,'河南省平顶山市新华区','新华区',',1515,1556,',1556)
, (1558,'2013-06-24 00:29:48','2013-06-24 00:29:48',null,'河南省平顶山市卫东区','卫东区',',1515,1556,',1556)
, (1559,'2013-06-24 00:29:49','2013-06-24 00:29:49',null,'河南省平顶山市石龙区','石龙区',',1515,1556,',1556)
, (1560,'2013-06-24 00:29:50','2013-06-24 00:29:50',null,'河南省平顶山市湛河区','湛河区',',1515,1556,',1556)
, (1561,'2013-06-24 00:29:51','2013-06-24 00:29:51',null,'河南省平顶山市宝丰县','宝丰县',',1515,1556,',1556)
, (1562,'2013-06-24 00:29:52','2013-06-24 00:29:52',null,'河南省平顶山市叶县','叶县',',1515,1556,',1556)
, (1563,'2013-06-24 00:29:53','2013-06-24 00:29:53',null,'河南省平顶山市鲁山县','鲁山县',',1515,1556,',1556)
, (1564,'2013-06-24 00:29:54','2013-06-24 00:29:54',null,'河南省平顶山市郏县','郏县',',1515,1556,',1556)
, (1565,'2013-06-24 00:29:55','2013-06-24 00:29:55',null,'河南省平顶山市舞钢市','舞钢市',',1515,1556,',1556)
, (1566,'2013-06-24 00:29:56','2013-06-24 00:29:56',null,'河南省平顶山市汝州市','汝州市',',1515,1556,',1556)
, (1567,'2013-06-24 00:29:57','2013-06-24 00:29:57',null,'河南省安阳市','安阳市',',1515,',1515)
, (1568,'2013-06-24 00:29:58','2013-06-24 00:29:58',null,'河南省安阳市文峰区','文峰区',',1515,1567,',1567)
, (1569,'2013-06-24 00:29:59','2013-06-24 00:29:59',null,'河南省安阳市北关区','北关区',',1515,1567,',1567)
, (1570,'2013-06-24 00:30:00','2013-06-24 00:30:00',null,'河南省安阳市殷都区','殷都区',',1515,1567,',1567)
, (1571,'2013-06-24 00:30:01','2013-06-24 00:30:01',null,'河南省安阳市龙安区','龙安区',',1515,1567,',1567)
, (1572,'2013-06-24 00:30:02','2013-06-24 00:30:02',null,'河南省安阳市安阳县','安阳县',',1515,1567,',1567)
, (1573,'2013-06-24 00:30:03','2013-06-24 00:30:03',null,'河南省安阳市汤阴县','汤阴县',',1515,1567,',1567)
, (1574,'2013-06-24 00:30:04','2013-06-24 00:30:04',null,'河南省安阳市滑县','滑县',',1515,1567,',1567)
, (1575,'2013-06-24 00:30:05','2013-06-24 00:30:05',null,'河南省安阳市内黄县','内黄县',',1515,1567,',1567)
, (1576,'2013-06-24 00:30:06','2013-06-24 00:30:06',null,'河南省安阳市林州市','林州市',',1515,1567,',1567)
, (1577,'2013-06-24 00:30:07','2013-06-24 00:30:07',null,'河南省鹤壁市','鹤壁市',',1515,',1515)
, (1578,'2013-06-24 00:30:08','2013-06-24 00:30:08',null,'河南省鹤壁市鹤山区','鹤山区',',1515,1577,',1577)
, (1579,'2013-06-24 00:30:09','2013-06-24 00:30:09',null,'河南省鹤壁市山城区','山城区',',1515,1577,',1577)
, (1580,'2013-06-24 00:30:10','2013-06-24 00:30:10',null,'河南省鹤壁市淇滨区','淇滨区',',1515,1577,',1577)
, (1581,'2013-06-24 00:30:11','2013-06-24 00:30:11',null,'河南省鹤壁市浚县','浚县',',1515,1577,',1577)
, (1582,'2013-06-24 00:30:12','2013-06-24 00:30:12',null,'河南省鹤壁市淇县','淇县',',1515,1577,',1577)
, (1583,'2013-06-24 00:30:13','2013-06-24 00:30:13',null,'河南省新乡市','新乡市',',1515,',1515)
, (1584,'2013-06-24 00:30:14','2013-06-24 00:30:14',null,'河南省新乡市红旗区','红旗区',',1515,1583,',1583)
, (1585,'2013-06-24 00:30:15','2013-06-24 00:30:15',null,'河南省新乡市卫滨区','卫滨区',',1515,1583,',1583)
, (1586,'2013-06-24 00:30:16','2013-06-24 00:30:16',null,'河南省新乡市凤泉区','凤泉区',',1515,1583,',1583)
, (1587,'2013-06-24 00:30:17','2013-06-24 00:30:17',null,'河南省新乡市牧野区','牧野区',',1515,1583,',1583)
, (1588,'2013-06-24 00:30:18','2013-06-24 00:30:18',null,'河南省新乡市新乡县','新乡县',',1515,1583,',1583)
, (1589,'2013-06-24 00:30:19','2013-06-24 00:30:19',null,'河南省新乡市获嘉县','获嘉县',',1515,1583,',1583)
, (1590,'2013-06-24 00:30:20','2013-06-24 00:30:20',null,'河南省新乡市原阳县','原阳县',',1515,1583,',1583)
, (1591,'2013-06-24 00:30:21','2013-06-24 00:30:21',null,'河南省新乡市延津县','延津县',',1515,1583,',1583)
, (1592,'2013-06-24 00:30:22','2013-06-24 00:30:22',null,'河南省新乡市封丘县','封丘县',',1515,1583,',1583)
, (1593,'2013-06-24 00:30:23','2013-06-24 00:30:23',null,'河南省新乡市长垣县','长垣县',',1515,1583,',1583)
, (1594,'2013-06-24 00:30:24','2013-06-24 00:30:24',null,'河南省新乡市卫辉市','卫辉市',',1515,1583,',1583)
, (1595,'2013-06-24 00:30:25','2013-06-24 00:30:25',null,'河南省新乡市辉县市','辉县市',',1515,1583,',1583)
, (1596,'2013-06-24 00:30:26','2013-06-24 00:30:26',null,'河南省焦作市','焦作市',',1515,',1515)
, (1597,'2013-06-24 00:30:27','2013-06-24 00:30:27',null,'河南省焦作市解放区','解放区',',1515,1596,',1596)
, (1598,'2013-06-24 00:30:28','2013-06-24 00:30:28',null,'河南省焦作市中站区','中站区',',1515,1596,',1596)
, (1599,'2013-06-24 00:30:29','2013-06-24 00:30:29',null,'河南省焦作市马村区','马村区',',1515,1596,',1596)
, (1600,'2013-06-24 00:30:30','2013-06-24 00:30:30',null,'河南省焦作市山阳区','山阳区',',1515,1596,',1596)
, (1601,'2013-06-24 00:30:31','2013-06-24 00:30:31',null,'河南省焦作市修武县','修武县',',1515,1596,',1596)
, (1602,'2013-06-24 00:30:32','2013-06-24 00:30:32',null,'河南省焦作市博爱县','博爱县',',1515,1596,',1596)
, (1603,'2013-06-24 00:30:33','2013-06-24 00:30:33',null,'河南省焦作市武陟县','武陟县',',1515,1596,',1596)
, (1604,'2013-06-24 00:30:34','2013-06-24 00:30:34',null,'河南省焦作市温县','温县',',1515,1596,',1596)
, (1605,'2013-06-24 00:30:35','2013-06-24 00:30:35',null,'河南省焦作市沁阳市','沁阳市',',1515,1596,',1596)
, (1606,'2013-06-24 00:30:36','2013-06-24 00:30:36',null,'河南省焦作市孟州市','孟州市',',1515,1596,',1596)
, (1607,'2013-06-24 00:30:37','2013-06-24 00:30:37',null,'河南省濮阳市','濮阳市',',1515,',1515)
, (1608,'2013-06-24 00:30:38','2013-06-24 00:30:38',null,'河南省濮阳市华龙区','华龙区',',1515,1607,',1607)
, (1609,'2013-06-24 00:30:39','2013-06-24 00:30:39',null,'河南省濮阳市清丰县','清丰县',',1515,1607,',1607)
, (1610,'2013-06-24 00:30:40','2013-06-24 00:30:40',null,'河南省濮阳市南乐县','南乐县',',1515,1607,',1607)
, (1611,'2013-06-24 00:30:41','2013-06-24 00:30:41',null,'河南省濮阳市范县','范县',',1515,1607,',1607)
, (1612,'2013-06-24 00:30:42','2013-06-24 00:30:42',null,'河南省濮阳市台前县','台前县',',1515,1607,',1607)
, (1613,'2013-06-24 00:30:43','2013-06-24 00:30:43',null,'河南省濮阳市濮阳县','濮阳县',',1515,1607,',1607)
, (1614,'2013-06-24 00:30:44','2013-06-24 00:30:44',null,'河南省许昌市','许昌市',',1515,',1515)
, (1615,'2013-06-24 00:30:45','2013-06-24 00:30:45',null,'河南省许昌市魏都区','魏都区',',1515,1614,',1614)
, (1616,'2013-06-24 00:30:46','2013-06-24 00:30:46',null,'河南省许昌市许昌县','许昌县',',1515,1614,',1614)
, (1617,'2013-06-24 00:30:47','2013-06-24 00:30:47',null,'河南省许昌市鄢陵县','鄢陵县',',1515,1614,',1614)
, (1618,'2013-06-24 00:30:48','2013-06-24 00:30:48',null,'河南省许昌市襄城县','襄城县',',1515,1614,',1614)
, (1619,'2013-06-24 00:30:49','2013-06-24 00:30:49',null,'河南省许昌市禹州市','禹州市',',1515,1614,',1614)
, (1620,'2013-06-24 00:30:50','2013-06-24 00:30:50',null,'河南省许昌市长葛市','长葛市',',1515,1614,',1614)
, (1621,'2013-06-24 00:30:51','2013-06-24 00:30:51',null,'河南省漯河市','漯河市',',1515,',1515)
, (1622,'2013-06-24 00:30:52','2013-06-24 00:30:52',null,'河南省漯河市源汇区','源汇区',',1515,1621,',1621)
, (1623,'2013-06-24 00:30:53','2013-06-24 00:30:53',null,'河南省漯河市郾城区','郾城区',',1515,1621,',1621)
, (1624,'2013-06-24 00:30:54','2013-06-24 00:30:54',null,'河南省漯河市召陵区','召陵区',',1515,1621,',1621)
, (1625,'2013-06-24 00:30:55','2013-06-24 00:30:55',null,'河南省漯河市舞阳县','舞阳县',',1515,1621,',1621)
, (1626,'2013-06-24 00:30:56','2013-06-24 00:30:56',null,'河南省漯河市临颍县','临颍县',',1515,1621,',1621)
, (1627,'2013-06-24 00:30:57','2013-06-24 00:30:57',null,'河南省三门峡市','三门峡市',',1515,',1515)
, (1628,'2013-06-24 00:30:58','2013-06-24 00:30:58',null,'河南省三门峡市湖滨区','湖滨区',',1515,1627,',1627)
, (1629,'2013-06-24 00:30:59','2013-06-24 00:30:59',null,'河南省三门峡市渑池县','渑池县',',1515,1627,',1627)
, (1630,'2013-06-24 00:31:00','2013-06-24 00:31:00',null,'河南省三门峡市陕县','陕县',',1515,1627,',1627)
, (1631,'2013-06-24 00:31:01','2013-06-24 00:31:01',null,'河南省三门峡市卢氏县','卢氏县',',1515,1627,',1627)
, (1632,'2013-06-24 00:31:02','2013-06-24 00:31:02',null,'河南省三门峡市义马市','义马市',',1515,1627,',1627)
, (1633,'2013-06-24 00:31:03','2013-06-24 00:31:03',null,'河南省三门峡市灵宝市','灵宝市',',1515,1627,',1627)
, (1634,'2013-06-24 00:31:04','2013-06-24 00:31:04',null,'河南省南阳市','南阳市',',1515,',1515)
, (1635,'2013-06-24 00:31:05','2013-06-24 00:31:05',null,'河南省南阳市宛城区','宛城区',',1515,1634,',1634)
, (1636,'2013-06-24 00:31:06','2013-06-24 00:31:06',null,'河南省南阳市卧龙区','卧龙区',',1515,1634,',1634)
, (1637,'2013-06-24 00:31:07','2013-06-24 00:31:07',null,'河南省南阳市南召县','南召县',',1515,1634,',1634)
, (1638,'2013-06-24 00:31:08','2013-06-24 00:31:08',null,'河南省南阳市方城县','方城县',',1515,1634,',1634)
, (1639,'2013-06-24 00:31:09','2013-06-24 00:31:09',null,'河南省南阳市西峡县','西峡县',',1515,1634,',1634)
, (1640,'2013-06-24 00:31:10','2013-06-24 00:31:10',null,'河南省南阳市镇平县','镇平县',',1515,1634,',1634)
, (1641,'2013-06-24 00:31:11','2013-06-24 00:31:11',null,'河南省南阳市内乡县','内乡县',',1515,1634,',1634)
, (1642,'2013-06-24 00:31:12','2013-06-24 00:31:12',null,'河南省南阳市淅川县','淅川县',',1515,1634,',1634)
, (1643,'2013-06-24 00:31:13','2013-06-24 00:31:13',null,'河南省南阳市社旗县','社旗县',',1515,1634,',1634)
, (1644,'2013-06-24 00:31:14','2013-06-24 00:31:14',null,'河南省南阳市唐河县','唐河县',',1515,1634,',1634)
, (1645,'2013-06-24 00:31:15','2013-06-24 00:31:15',null,'河南省南阳市新野县','新野县',',1515,1634,',1634)
, (1646,'2013-06-24 00:31:16','2013-06-24 00:31:16',null,'河南省南阳市桐柏县','桐柏县',',1515,1634,',1634)
, (1647,'2013-06-24 00:31:17','2013-06-24 00:31:17',null,'河南省南阳市邓州市','邓州市',',1515,1634,',1634)
, (1648,'2013-06-24 00:31:18','2013-06-24 00:31:18',null,'河南省商丘市','商丘市',',1515,',1515)
, (1649,'2013-06-24 00:31:19','2013-06-24 00:31:19',null,'河南省商丘市梁园区','梁园区',',1515,1648,',1648)
, (1650,'2013-06-24 00:31:20','2013-06-24 00:31:20',null,'河南省商丘市睢阳区','睢阳区',',1515,1648,',1648)
, (1651,'2013-06-24 00:31:21','2013-06-24 00:31:21',null,'河南省商丘市民权县','民权县',',1515,1648,',1648)
, (1652,'2013-06-24 00:31:22','2013-06-24 00:31:22',null,'河南省商丘市睢县','睢县',',1515,1648,',1648)
, (1653,'2013-06-24 00:31:23','2013-06-24 00:31:23',null,'河南省商丘市宁陵县','宁陵县',',1515,1648,',1648)
, (1654,'2013-06-24 00:31:24','2013-06-24 00:31:24',null,'河南省商丘市柘城县','柘城县',',1515,1648,',1648)
, (1655,'2013-06-24 00:31:25','2013-06-24 00:31:25',null,'河南省商丘市虞城县','虞城县',',1515,1648,',1648)
, (1656,'2013-06-24 00:31:26','2013-06-24 00:31:26',null,'河南省商丘市夏邑县','夏邑县',',1515,1648,',1648)
, (1657,'2013-06-24 00:31:27','2013-06-24 00:31:27',null,'河南省商丘市永城市','永城市',',1515,1648,',1648)
, (1658,'2013-06-24 00:31:28','2013-06-24 00:31:28',null,'河南省信阳市','信阳市',',1515,',1515)
, (1659,'2013-06-24 00:31:29','2013-06-24 00:31:29',null,'河南省信阳市浉河区','浉河区',',1515,1658,',1658)
, (1660,'2013-06-24 00:31:30','2013-06-24 00:31:30',null,'河南省信阳市平桥区','平桥区',',1515,1658,',1658)
, (1661,'2013-06-24 00:31:31','2013-06-24 00:31:31',null,'河南省信阳市罗山县','罗山县',',1515,1658,',1658)
, (1662,'2013-06-24 00:31:32','2013-06-24 00:31:32',null,'河南省信阳市光山县','光山县',',1515,1658,',1658)
, (1663,'2013-06-24 00:31:33','2013-06-24 00:31:33',null,'河南省信阳市新县','新县',',1515,1658,',1658)
, (1664,'2013-06-24 00:31:34','2013-06-24 00:31:34',null,'河南省信阳市商城县','商城县',',1515,1658,',1658)
, (1665,'2013-06-24 00:31:35','2013-06-24 00:31:35',null,'河南省信阳市固始县','固始县',',1515,1658,',1658)
, (1666,'2013-06-24 00:31:36','2013-06-24 00:31:36',null,'河南省信阳市潢川县','潢川县',',1515,1658,',1658)
, (1667,'2013-06-24 00:31:37','2013-06-24 00:31:37',null,'河南省信阳市淮滨县','淮滨县',',1515,1658,',1658)
, (1668,'2013-06-24 00:31:38','2013-06-24 00:31:38',null,'河南省信阳市息县','息县',',1515,1658,',1658)
, (1669,'2013-06-24 00:31:39','2013-06-24 00:31:39',null,'河南省周口市','周口市',',1515,',1515)
, (1670,'2013-06-24 00:31:40','2013-06-24 00:31:40',null,'河南省周口市川汇区','川汇区',',1515,1669,',1669)
, (1671,'2013-06-24 00:31:41','2013-06-24 00:31:41',null,'河南省周口市扶沟县','扶沟县',',1515,1669,',1669)
, (1672,'2013-06-24 00:31:42','2013-06-24 00:31:42',null,'河南省周口市西华县','西华县',',1515,1669,',1669)
, (1673,'2013-06-24 00:31:43','2013-06-24 00:31:43',null,'河南省周口市商水县','商水县',',1515,1669,',1669)
, (1674,'2013-06-24 00:31:44','2013-06-24 00:31:44',null,'河南省周口市沈丘县','沈丘县',',1515,1669,',1669)
, (1675,'2013-06-24 00:31:45','2013-06-24 00:31:45',null,'河南省周口市郸城县','郸城县',',1515,1669,',1669)
, (1676,'2013-06-24 00:31:46','2013-06-24 00:31:46',null,'河南省周口市淮阳县','淮阳县',',1515,1669,',1669)
, (1677,'2013-06-24 00:31:47','2013-06-24 00:31:47',null,'河南省周口市太康县','太康县',',1515,1669,',1669)
, (1678,'2013-06-24 00:31:48','2013-06-24 00:31:48',null,'河南省周口市鹿邑县','鹿邑县',',1515,1669,',1669)
, (1679,'2013-06-24 00:31:49','2013-06-24 00:31:49',null,'河南省周口市项城市','项城市',',1515,1669,',1669)
, (1680,'2013-06-24 00:31:50','2013-06-24 00:31:50',null,'河南省驻马店市','驻马店市',',1515,',1515)
, (1681,'2013-06-24 00:31:51','2013-06-24 00:31:51',null,'河南省驻马店市驿城区','驿城区',',1515,1680,',1680)
, (1682,'2013-06-24 00:31:52','2013-06-24 00:31:52',null,'河南省驻马店市西平县','西平县',',1515,1680,',1680)
, (1683,'2013-06-24 00:31:53','2013-06-24 00:31:53',null,'河南省驻马店市上蔡县','上蔡县',',1515,1680,',1680)
, (1684,'2013-06-24 00:31:54','2013-06-24 00:31:54',null,'河南省驻马店市平舆县','平舆县',',1515,1680,',1680)
, (1685,'2013-06-24 00:31:55','2013-06-24 00:31:55',null,'河南省驻马店市正阳县','正阳县',',1515,1680,',1680)
, (1686,'2013-06-24 00:31:56','2013-06-24 00:31:56',null,'河南省驻马店市确山县','确山县',',1515,1680,',1680)
, (1687,'2013-06-24 00:31:57','2013-06-24 00:31:57',null,'河南省驻马店市泌阳县','泌阳县',',1515,1680,',1680)
, (1688,'2013-06-24 00:31:58','2013-06-24 00:31:58',null,'河南省驻马店市汝南县','汝南县',',1515,1680,',1680)
, (1689,'2013-06-24 00:31:59','2013-06-24 00:31:59',null,'河南省驻马店市遂平县','遂平县',',1515,1680,',1680)
, (1690,'2013-06-24 00:32:00','2013-06-24 00:32:00',null,'河南省驻马店市新蔡县','新蔡县',',1515,1680,',1680)
, (1691,'2013-06-24 00:32:01','2013-06-24 00:32:01',null,'河南省济源市','济源市',',1515,',1515)
, (1692,'2013-06-24 00:32:02','2013-06-24 00:32:02',null,'湖北省','湖北省',',',null)
, (1693,'2013-06-24 00:32:03','2013-06-24 00:32:03',null,'湖北省武汉市','武汉市',',1692,',1692)
, (1694,'2013-06-24 00:32:04','2013-06-24 00:32:04',null,'湖北省武汉市江岸区','江岸区',',1692,1693,',1693)
, (1695,'2013-06-24 00:32:05','2013-06-24 00:32:05',null,'湖北省武汉市江汉区','江汉区',',1692,1693,',1693)
, (1696,'2013-06-24 00:32:06','2013-06-24 00:32:06',null,'湖北省武汉市硚口区','硚口区',',1692,1693,',1693)
, (1697,'2013-06-24 00:32:07','2013-06-24 00:32:07',null,'湖北省武汉市汉阳区','汉阳区',',1692,1693,',1693)
, (1698,'2013-06-24 00:32:08','2013-06-24 00:32:08',null,'湖北省武汉市武昌区','武昌区',',1692,1693,',1693)
, (1699,'2013-06-24 00:32:09','2013-06-24 00:32:09',null,'湖北省武汉市青山区','青山区',',1692,1693,',1693)
, (1700,'2013-06-24 00:32:10','2013-06-24 00:32:10',null,'湖北省武汉市洪山区','洪山区',',1692,1693,',1693)
, (1701,'2013-06-24 00:32:11','2013-06-24 00:32:11',null,'湖北省武汉市东西湖区','东西湖区',',1692,1693,',1693)
, (1702,'2013-06-24 00:32:12','2013-06-24 00:32:12',null,'湖北省武汉市汉南区','汉南区',',1692,1693,',1693)
, (1703,'2013-06-24 00:32:13','2013-06-24 00:32:13',null,'湖北省武汉市蔡甸区','蔡甸区',',1692,1693,',1693)
, (1704,'2013-06-24 00:32:14','2013-06-24 00:32:14',null,'湖北省武汉市江夏区','江夏区',',1692,1693,',1693)
, (1705,'2013-06-24 00:32:15','2013-06-24 00:32:15',null,'湖北省武汉市黄陂区','黄陂区',',1692,1693,',1693)
, (1706,'2013-06-24 00:32:16','2013-06-24 00:32:16',null,'湖北省武汉市新洲区','新洲区',',1692,1693,',1693)
, (1707,'2013-06-24 00:32:17','2013-06-24 00:32:17',null,'湖北省黄石市','黄石市',',1692,',1692)
, (1708,'2013-06-24 00:32:18','2013-06-24 00:32:18',null,'湖北省黄石市黄石港区','黄石港区',',1692,1707,',1707)
, (1709,'2013-06-24 00:32:19','2013-06-24 00:32:19',null,'湖北省黄石市西塞山区','西塞山区',',1692,1707,',1707)
, (1710,'2013-06-24 00:32:20','2013-06-24 00:32:20',null,'湖北省黄石市下陆区','下陆区',',1692,1707,',1707)
, (1711,'2013-06-24 00:32:21','2013-06-24 00:32:21',null,'湖北省黄石市铁山区','铁山区',',1692,1707,',1707)
, (1712,'2013-06-24 00:32:22','2013-06-24 00:32:22',null,'湖北省黄石市阳新县','阳新县',',1692,1707,',1707)
, (1713,'2013-06-24 00:32:23','2013-06-24 00:32:23',null,'湖北省黄石市大冶市','大冶市',',1692,1707,',1707)
, (1714,'2013-06-24 00:32:24','2013-06-24 00:32:24',null,'湖北省十堰市','十堰市',',1692,',1692)
, (1715,'2013-06-24 00:32:25','2013-06-24 00:32:25',null,'湖北省十堰市茅箭区','茅箭区',',1692,1714,',1714)
, (1716,'2013-06-24 00:32:26','2013-06-24 00:32:26',null,'湖北省十堰市张湾区','张湾区',',1692,1714,',1714)
, (1717,'2013-06-24 00:32:27','2013-06-24 00:32:27',null,'湖北省十堰市郧县','郧县',',1692,1714,',1714)
, (1718,'2013-06-24 00:32:28','2013-06-24 00:32:28',null,'湖北省十堰市郧西县','郧西县',',1692,1714,',1714)
, (1719,'2013-06-24 00:32:29','2013-06-24 00:32:29',null,'湖北省十堰市竹山县','竹山县',',1692,1714,',1714)
, (1720,'2013-06-24 00:32:30','2013-06-24 00:32:30',null,'湖北省十堰市竹溪县','竹溪县',',1692,1714,',1714)
, (1721,'2013-06-24 00:32:31','2013-06-24 00:32:31',null,'湖北省十堰市房县','房县',',1692,1714,',1714)
, (1722,'2013-06-24 00:32:32','2013-06-24 00:32:32',null,'湖北省十堰市丹江口市','丹江口市',',1692,1714,',1714)
, (1723,'2013-06-24 00:32:33','2013-06-24 00:32:33',null,'湖北省宜昌市','宜昌市',',1692,',1692)
, (1724,'2013-06-24 00:32:34','2013-06-24 00:32:34',null,'湖北省宜昌市西陵区','西陵区',',1692,1723,',1723)
, (1725,'2013-06-24 00:32:35','2013-06-24 00:32:35',null,'湖北省宜昌市伍家岗区','伍家岗区',',1692,1723,',1723)
, (1726,'2013-06-24 00:32:36','2013-06-24 00:32:36',null,'湖北省宜昌市点军区','点军区',',1692,1723,',1723)
, (1727,'2013-06-24 00:32:37','2013-06-24 00:32:37',null,'湖北省宜昌市猇亭区','猇亭区',',1692,1723,',1723)
, (1728,'2013-06-24 00:32:38','2013-06-24 00:32:38',null,'湖北省宜昌市夷陵区','夷陵区',',1692,1723,',1723)
, (1729,'2013-06-24 00:32:39','2013-06-24 00:32:39',null,'湖北省宜昌市远安县','远安县',',1692,1723,',1723)
, (1730,'2013-06-24 00:32:40','2013-06-24 00:32:40',null,'湖北省宜昌市兴山县','兴山县',',1692,1723,',1723)
, (1731,'2013-06-24 00:32:41','2013-06-24 00:32:41',null,'湖北省宜昌市秭归县','秭归县',',1692,1723,',1723)
, (1732,'2013-06-24 00:32:42','2013-06-24 00:32:42',null,'湖北省宜昌市长阳土家族自治县','长阳土家族自治县',',1692,1723,',1723)
, (1733,'2013-06-24 00:32:43','2013-06-24 00:32:43',null,'湖北省宜昌市五峰土家族自治县','五峰土家族自治县',',1692,1723,',1723)
, (1734,'2013-06-24 00:32:44','2013-06-24 00:32:44',null,'湖北省宜昌市宜都市','宜都市',',1692,1723,',1723)
, (1735,'2013-06-24 00:32:45','2013-06-24 00:32:45',null,'湖北省宜昌市当阳市','当阳市',',1692,1723,',1723)
, (1736,'2013-06-24 00:32:46','2013-06-24 00:32:46',null,'湖北省宜昌市枝江市','枝江市',',1692,1723,',1723)
, (1737,'2013-06-24 00:32:47','2013-06-24 00:32:47',null,'湖北省襄阳市','襄阳市',',1692,',1692)
, (1738,'2013-06-24 00:32:48','2013-06-24 00:32:48',null,'湖北省襄阳市襄城区','襄城区',',1692,1737,',1737)
, (1739,'2013-06-24 00:32:49','2013-06-24 00:32:49',null,'湖北省襄阳市樊城区','樊城区',',1692,1737,',1737)
, (1740,'2013-06-24 00:32:50','2013-06-24 00:32:50',null,'湖北省襄阳市襄州区','襄州区',',1692,1737,',1737)
, (1741,'2013-06-24 00:32:51','2013-06-24 00:32:51',null,'湖北省襄阳市南漳县','南漳县',',1692,1737,',1737)
, (1742,'2013-06-24 00:32:52','2013-06-24 00:32:52',null,'湖北省襄阳市谷城县','谷城县',',1692,1737,',1737)
, (1743,'2013-06-24 00:32:53','2013-06-24 00:32:53',null,'湖北省襄阳市保康县','保康县',',1692,1737,',1737)
, (1744,'2013-06-24 00:32:54','2013-06-24 00:32:54',null,'湖北省襄阳市老河口市','老河口市',',1692,1737,',1737)
, (1745,'2013-06-24 00:32:55','2013-06-24 00:32:55',null,'湖北省襄阳市枣阳市','枣阳市',',1692,1737,',1737)
, (1746,'2013-06-24 00:32:56','2013-06-24 00:32:56',null,'湖北省襄阳市宜城市','宜城市',',1692,1737,',1737)
, (1747,'2013-06-24 00:32:57','2013-06-24 00:32:57',null,'湖北省鄂州市','鄂州市',',1692,',1692)
, (1748,'2013-06-24 00:32:58','2013-06-24 00:32:58',null,'湖北省鄂州市梁子湖区','梁子湖区',',1692,1747,',1747)
, (1749,'2013-06-24 00:32:59','2013-06-24 00:32:59',null,'湖北省鄂州市华容区','华容区',',1692,1747,',1747)
, (1750,'2013-06-24 00:33:00','2013-06-24 00:33:00',null,'湖北省鄂州市鄂城区','鄂城区',',1692,1747,',1747)
, (1751,'2013-06-24 00:33:01','2013-06-24 00:33:01',null,'湖北省荆门市','荆门市',',1692,',1692)
, (1752,'2013-06-24 00:33:02','2013-06-24 00:33:02',null,'湖北省荆门市东宝区','东宝区',',1692,1751,',1751)
, (1753,'2013-06-24 00:33:03','2013-06-24 00:33:03',null,'湖北省荆门市掇刀区','掇刀区',',1692,1751,',1751)
, (1754,'2013-06-24 00:33:04','2013-06-24 00:33:04',null,'湖北省荆门市京山县','京山县',',1692,1751,',1751)
, (1755,'2013-06-24 00:33:05','2013-06-24 00:33:05',null,'湖北省荆门市沙洋县','沙洋县',',1692,1751,',1751)
, (1756,'2013-06-24 00:33:06','2013-06-24 00:33:06',null,'湖北省荆门市钟祥市','钟祥市',',1692,1751,',1751)
, (1757,'2013-06-24 00:33:07','2013-06-24 00:33:07',null,'湖北省孝感市','孝感市',',1692,',1692)
, (1758,'2013-06-24 00:33:08','2013-06-24 00:33:08',null,'湖北省孝感市孝南区','孝南区',',1692,1757,',1757)
, (1759,'2013-06-24 00:33:09','2013-06-24 00:33:09',null,'湖北省孝感市孝昌县','孝昌县',',1692,1757,',1757)
, (1760,'2013-06-24 00:33:10','2013-06-24 00:33:10',null,'湖北省孝感市大悟县','大悟县',',1692,1757,',1757)
, (1761,'2013-06-24 00:33:11','2013-06-24 00:33:11',null,'湖北省孝感市云梦县','云梦县',',1692,1757,',1757)
, (1762,'2013-06-24 00:33:12','2013-06-24 00:33:12',null,'湖北省孝感市应城市','应城市',',1692,1757,',1757)
, (1763,'2013-06-24 00:33:13','2013-06-24 00:33:13',null,'湖北省孝感市安陆市','安陆市',',1692,1757,',1757)
, (1764,'2013-06-24 00:33:14','2013-06-24 00:33:14',null,'湖北省孝感市汉川市','汉川市',',1692,1757,',1757)
, (1765,'2013-06-24 00:33:15','2013-06-24 00:33:15',null,'湖北省荆州市','荆州市',',1692,',1692)
, (1766,'2013-06-24 00:33:16','2013-06-24 00:33:16',null,'湖北省荆州市沙市区','沙市区',',1692,1765,',1765)
, (1767,'2013-06-24 00:33:17','2013-06-24 00:33:17',null,'湖北省荆州市荆州区','荆州区',',1692,1765,',1765)
, (1768,'2013-06-24 00:33:18','2013-06-24 00:33:18',null,'湖北省荆州市公安县','公安县',',1692,1765,',1765)
, (1769,'2013-06-24 00:33:19','2013-06-24 00:33:19',null,'湖北省荆州市监利县','监利县',',1692,1765,',1765)
, (1770,'2013-06-24 00:33:20','2013-06-24 00:33:20',null,'湖北省荆州市江陵县','江陵县',',1692,1765,',1765)
, (1771,'2013-06-24 00:33:21','2013-06-24 00:33:21',null,'湖北省荆州市石首市','石首市',',1692,1765,',1765)
, (1772,'2013-06-24 00:33:22','2013-06-24 00:33:22',null,'湖北省荆州市洪湖市','洪湖市',',1692,1765,',1765)
, (1773,'2013-06-24 00:33:23','2013-06-24 00:33:23',null,'湖北省荆州市松滋市','松滋市',',1692,1765,',1765)
, (1774,'2013-06-24 00:33:24','2013-06-24 00:33:24',null,'湖北省黄冈市','黄冈市',',1692,',1692)
, (1775,'2013-06-24 00:33:25','2013-06-24 00:33:25',null,'湖北省黄冈市黄州区','黄州区',',1692,1774,',1774)
, (1776,'2013-06-24 00:33:26','2013-06-24 00:33:26',null,'湖北省黄冈市团风县','团风县',',1692,1774,',1774)
, (1777,'2013-06-24 00:33:27','2013-06-24 00:33:27',null,'湖北省黄冈市红安县','红安县',',1692,1774,',1774)
, (1778,'2013-06-24 00:33:28','2013-06-24 00:33:28',null,'湖北省黄冈市罗田县','罗田县',',1692,1774,',1774)
, (1779,'2013-06-24 00:33:29','2013-06-24 00:33:29',null,'湖北省黄冈市英山县','英山县',',1692,1774,',1774)
, (1780,'2013-06-24 00:33:30','2013-06-24 00:33:30',null,'湖北省黄冈市浠水县','浠水县',',1692,1774,',1774)
, (1781,'2013-06-24 00:33:31','2013-06-24 00:33:31',null,'湖北省黄冈市蕲春县','蕲春县',',1692,1774,',1774)
, (1782,'2013-06-24 00:33:32','2013-06-24 00:33:32',null,'湖北省黄冈市黄梅县','黄梅县',',1692,1774,',1774)
, (1783,'2013-06-24 00:33:33','2013-06-24 00:33:33',null,'湖北省黄冈市麻城市','麻城市',',1692,1774,',1774)
, (1784,'2013-06-24 00:33:34','2013-06-24 00:33:34',null,'湖北省黄冈市武穴市','武穴市',',1692,1774,',1774)
, (1785,'2013-06-24 00:33:35','2013-06-24 00:33:35',null,'湖北省咸宁市','咸宁市',',1692,',1692)
, (1786,'2013-06-24 00:33:36','2013-06-24 00:33:36',null,'湖北省咸宁市咸安区','咸安区',',1692,1785,',1785)
, (1787,'2013-06-24 00:33:37','2013-06-24 00:33:37',null,'湖北省咸宁市嘉鱼县','嘉鱼县',',1692,1785,',1785)
, (1788,'2013-06-24 00:33:38','2013-06-24 00:33:38',null,'湖北省咸宁市通城县','通城县',',1692,1785,',1785)
, (1789,'2013-06-24 00:33:39','2013-06-24 00:33:39',null,'湖北省咸宁市崇阳县','崇阳县',',1692,1785,',1785)
, (1790,'2013-06-24 00:33:40','2013-06-24 00:33:40',null,'湖北省咸宁市通山县','通山县',',1692,1785,',1785)
, (1791,'2013-06-24 00:33:41','2013-06-24 00:33:41',null,'湖北省咸宁市赤壁市','赤壁市',',1692,1785,',1785)
, (1792,'2013-06-24 00:33:42','2013-06-24 00:33:42',null,'湖北省随州市','随州市',',1692,',1692)
, (1793,'2013-06-24 00:33:43','2013-06-24 00:33:43',null,'湖北省随州市曾都区','曾都区',',1692,1792,',1792)
, (1794,'2013-06-24 00:33:44','2013-06-24 00:33:44',null,'湖北省随州市随县','随县',',1692,1792,',1792)
, (1795,'2013-06-24 00:33:45','2013-06-24 00:33:45',null,'湖北省随州市广水市','广水市',',1692,1792,',1792)
, (1796,'2013-06-24 00:33:46','2013-06-24 00:33:46',null,'湖北省恩施土家族苗族自治州','恩施土家族苗族自治州',',1692,',1692)
, (1797,'2013-06-24 00:33:47','2013-06-24 00:33:47',null,'湖北省恩施土家族苗族自治州恩施市','恩施市',',1692,1796,',1796)
, (1798,'2013-06-24 00:33:48','2013-06-24 00:33:48',null,'湖北省恩施土家族苗族自治州利川市','利川市',',1692,1796,',1796)
, (1799,'2013-06-24 00:33:49','2013-06-24 00:33:49',null,'湖北省恩施土家族苗族自治州建始县','建始县',',1692,1796,',1796)
, (1800,'2013-06-24 00:33:50','2013-06-24 00:33:50',null,'湖北省恩施土家族苗族自治州巴东县','巴东县',',1692,1796,',1796)
, (1801,'2013-06-24 00:33:51','2013-06-24 00:33:51',null,'湖北省恩施土家族苗族自治州宣恩县','宣恩县',',1692,1796,',1796)
, (1802,'2013-06-24 00:33:52','2013-06-24 00:33:52',null,'湖北省恩施土家族苗族自治州咸丰县','咸丰县',',1692,1796,',1796)
, (1803,'2013-06-24 00:33:53','2013-06-24 00:33:53',null,'湖北省恩施土家族苗族自治州来凤县','来凤县',',1692,1796,',1796)
, (1804,'2013-06-24 00:33:54','2013-06-24 00:33:54',null,'湖北省恩施土家族苗族自治州鹤峰县','鹤峰县',',1692,1796,',1796)
, (1805,'2013-06-24 00:33:55','2013-06-24 00:33:55',null,'湖北省仙桃市','仙桃市',',1692,',1692)
, (1806,'2013-06-24 00:33:56','2013-06-24 00:33:56',null,'湖北省潜江市','潜江市',',1692,',1692)
, (1807,'2013-06-24 00:33:57','2013-06-24 00:33:57',null,'湖北省天门市','天门市',',1692,',1692)
, (1808,'2013-06-24 00:33:58','2013-06-24 00:33:58',null,'湖北省神农架林区','神农架林区',',1692,',1692)
, (1809,'2013-06-24 00:33:59','2013-06-24 00:33:59',null,'湖南省','湖南省',',',null)
, (1810,'2013-06-24 00:34:00','2013-06-24 00:34:00',null,'湖南省长沙市','长沙市',',1809,',1809)
, (1811,'2013-06-24 00:34:01','2013-06-24 00:34:01',null,'湖南省长沙市芙蓉区','芙蓉区',',1809,1810,',1810)
, (1812,'2013-06-24 00:34:02','2013-06-24 00:34:02',null,'湖南省长沙市天心区','天心区',',1809,1810,',1810)
, (1813,'2013-06-24 00:34:03','2013-06-24 00:34:03',null,'湖南省长沙市岳麓区','岳麓区',',1809,1810,',1810)
, (1814,'2013-06-24 00:34:04','2013-06-24 00:34:04',null,'湖南省长沙市开福区','开福区',',1809,1810,',1810)
, (1815,'2013-06-24 00:34:05','2013-06-24 00:34:05',null,'湖南省长沙市雨花区','雨花区',',1809,1810,',1810)
, (1816,'2013-06-24 00:34:06','2013-06-24 00:34:06',null,'湖南省长沙市望城区','望城区',',1809,1810,',1810)
, (1817,'2013-06-24 00:34:07','2013-06-24 00:34:07',null,'湖南省长沙市长沙县','长沙县',',1809,1810,',1810)
, (1818,'2013-06-24 00:34:08','2013-06-24 00:34:08',null,'湖南省长沙市宁乡县','宁乡县',',1809,1810,',1810)
, (1819,'2013-06-24 00:34:09','2013-06-24 00:34:09',null,'湖南省长沙市浏阳市','浏阳市',',1809,1810,',1810)
, (1820,'2013-06-24 00:34:10','2013-06-24 00:34:10',null,'湖南省株洲市','株洲市',',1809,',1809)
, (1821,'2013-06-24 00:34:11','2013-06-24 00:34:11',null,'湖南省株洲市荷塘区','荷塘区',',1809,1820,',1820)
, (1822,'2013-06-24 00:34:12','2013-06-24 00:34:12',null,'湖南省株洲市芦淞区','芦淞区',',1809,1820,',1820)
, (1823,'2013-06-24 00:34:13','2013-06-24 00:34:13',null,'湖南省株洲市石峰区','石峰区',',1809,1820,',1820)
, (1824,'2013-06-24 00:34:14','2013-06-24 00:34:14',null,'湖南省株洲市天元区','天元区',',1809,1820,',1820)
, (1825,'2013-06-24 00:34:15','2013-06-24 00:34:15',null,'湖南省株洲市株洲县','株洲县',',1809,1820,',1820)
, (1826,'2013-06-24 00:34:16','2013-06-24 00:34:16',null,'湖南省株洲市攸县','攸县',',1809,1820,',1820)
, (1827,'2013-06-24 00:34:17','2013-06-24 00:34:17',null,'湖南省株洲市茶陵县','茶陵县',',1809,1820,',1820)
, (1828,'2013-06-24 00:34:18','2013-06-24 00:34:18',null,'湖南省株洲市炎陵县','炎陵县',',1809,1820,',1820)
, (1829,'2013-06-24 00:34:19','2013-06-24 00:34:19',null,'湖南省株洲市醴陵市','醴陵市',',1809,1820,',1820)
, (1830,'2013-06-24 00:34:20','2013-06-24 00:34:20',null,'湖南省湘潭市','湘潭市',',1809,',1809)
, (1831,'2013-06-24 00:34:21','2013-06-24 00:34:21',null,'湖南省湘潭市雨湖区','雨湖区',',1809,1830,',1830)
, (1832,'2013-06-24 00:34:22','2013-06-24 00:34:22',null,'湖南省湘潭市岳塘区','岳塘区',',1809,1830,',1830)
, (1833,'2013-06-24 00:34:23','2013-06-24 00:34:23',null,'湖南省湘潭市湘潭县','湘潭县',',1809,1830,',1830)
, (1834,'2013-06-24 00:34:24','2013-06-24 00:34:24',null,'湖南省湘潭市湘乡市','湘乡市',',1809,1830,',1830)
, (1835,'2013-06-24 00:34:25','2013-06-24 00:34:25',null,'湖南省湘潭市韶山市','韶山市',',1809,1830,',1830)
, (1836,'2013-06-24 00:34:26','2013-06-24 00:34:26',null,'湖南省衡阳市','衡阳市',',1809,',1809)
, (1837,'2013-06-24 00:34:27','2013-06-24 00:34:27',null,'湖南省衡阳市珠晖区','珠晖区',',1809,1836,',1836)
, (1838,'2013-06-24 00:34:28','2013-06-24 00:34:28',null,'湖南省衡阳市雁峰区','雁峰区',',1809,1836,',1836)
, (1839,'2013-06-24 00:34:29','2013-06-24 00:34:29',null,'湖南省衡阳市石鼓区','石鼓区',',1809,1836,',1836)
, (1840,'2013-06-24 00:34:30','2013-06-24 00:34:30',null,'湖南省衡阳市蒸湘区','蒸湘区',',1809,1836,',1836)
, (1841,'2013-06-24 00:34:31','2013-06-24 00:34:31',null,'湖南省衡阳市南岳区','南岳区',',1809,1836,',1836)
, (1842,'2013-06-24 00:34:32','2013-06-24 00:34:32',null,'湖南省衡阳市衡阳县','衡阳县',',1809,1836,',1836)
, (1843,'2013-06-24 00:34:33','2013-06-24 00:34:33',null,'湖南省衡阳市衡南县','衡南县',',1809,1836,',1836)
, (1844,'2013-06-24 00:34:34','2013-06-24 00:34:34',null,'湖南省衡阳市衡山县','衡山县',',1809,1836,',1836)
, (1845,'2013-06-24 00:34:35','2013-06-24 00:34:35',null,'湖南省衡阳市衡东县','衡东县',',1809,1836,',1836)
, (1846,'2013-06-24 00:34:36','2013-06-24 00:34:36',null,'湖南省衡阳市祁东县','祁东县',',1809,1836,',1836)
, (1847,'2013-06-24 00:34:37','2013-06-24 00:34:37',null,'湖南省衡阳市耒阳市','耒阳市',',1809,1836,',1836)
, (1848,'2013-06-24 00:34:38','2013-06-24 00:34:38',null,'湖南省衡阳市常宁市','常宁市',',1809,1836,',1836)
, (1849,'2013-06-24 00:34:39','2013-06-24 00:34:39',null,'湖南省邵阳市','邵阳市',',1809,',1809)
, (1850,'2013-06-24 00:34:40','2013-06-24 00:34:40',null,'湖南省邵阳市双清区','双清区',',1809,1849,',1849)
, (1851,'2013-06-24 00:34:41','2013-06-24 00:34:41',null,'湖南省邵阳市大祥区','大祥区',',1809,1849,',1849)
, (1852,'2013-06-24 00:34:42','2013-06-24 00:34:42',null,'湖南省邵阳市北塔区','北塔区',',1809,1849,',1849)
, (1853,'2013-06-24 00:34:43','2013-06-24 00:34:43',null,'湖南省邵阳市邵东县','邵东县',',1809,1849,',1849)
, (1854,'2013-06-24 00:34:44','2013-06-24 00:34:44',null,'湖南省邵阳市新邵县','新邵县',',1809,1849,',1849)
, (1855,'2013-06-24 00:34:45','2013-06-24 00:34:45',null,'湖南省邵阳市邵阳县','邵阳县',',1809,1849,',1849)
, (1856,'2013-06-24 00:34:46','2013-06-24 00:34:46',null,'湖南省邵阳市隆回县','隆回县',',1809,1849,',1849)
, (1857,'2013-06-24 00:34:47','2013-06-24 00:34:47',null,'湖南省邵阳市洞口县','洞口县',',1809,1849,',1849)
, (1858,'2013-06-24 00:34:48','2013-06-24 00:34:48',null,'湖南省邵阳市绥宁县','绥宁县',',1809,1849,',1849)
, (1859,'2013-06-24 00:34:49','2013-06-24 00:34:49',null,'湖南省邵阳市新宁县','新宁县',',1809,1849,',1849)
, (1860,'2013-06-24 00:34:50','2013-06-24 00:34:50',null,'湖南省邵阳市城步苗族自治县','城步苗族自治县',',1809,1849,',1849)
, (1861,'2013-06-24 00:34:51','2013-06-24 00:34:51',null,'湖南省邵阳市武冈市','武冈市',',1809,1849,',1849)
, (1862,'2013-06-24 00:34:52','2013-06-24 00:34:52',null,'湖南省岳阳市','岳阳市',',1809,',1809)
, (1863,'2013-06-24 00:34:53','2013-06-24 00:34:53',null,'湖南省岳阳市岳阳楼区','岳阳楼区',',1809,1862,',1862)
, (1864,'2013-06-24 00:34:54','2013-06-24 00:34:54',null,'湖南省岳阳市云溪区','云溪区',',1809,1862,',1862)
, (1865,'2013-06-24 00:34:55','2013-06-24 00:34:55',null,'湖南省岳阳市君山区','君山区',',1809,1862,',1862)
, (1866,'2013-06-24 00:34:56','2013-06-24 00:34:56',null,'湖南省岳阳市岳阳县','岳阳县',',1809,1862,',1862)
, (1867,'2013-06-24 00:34:57','2013-06-24 00:34:57',null,'湖南省岳阳市华容县','华容县',',1809,1862,',1862)
, (1868,'2013-06-24 00:34:58','2013-06-24 00:34:58',null,'湖南省岳阳市湘阴县','湘阴县',',1809,1862,',1862)
, (1869,'2013-06-24 00:34:59','2013-06-24 00:34:59',null,'湖南省岳阳市平江县','平江县',',1809,1862,',1862)
, (1870,'2013-06-24 00:35:00','2013-06-24 00:35:00',null,'湖南省岳阳市汨罗市','汨罗市',',1809,1862,',1862)
, (1871,'2013-06-24 00:35:01','2013-06-24 00:35:01',null,'湖南省岳阳市临湘市','临湘市',',1809,1862,',1862)
, (1872,'2013-06-24 00:35:02','2013-06-24 00:35:02',null,'湖南省常德市','常德市',',1809,',1809)
, (1873,'2013-06-24 00:35:03','2013-06-24 00:35:03',null,'湖南省常德市武陵区','武陵区',',1809,1872,',1872)
, (1874,'2013-06-24 00:35:04','2013-06-24 00:35:04',null,'湖南省常德市鼎城区','鼎城区',',1809,1872,',1872)
, (1875,'2013-06-24 00:35:05','2013-06-24 00:35:05',null,'湖南省常德市安乡县','安乡县',',1809,1872,',1872)
, (1876,'2013-06-24 00:35:06','2013-06-24 00:35:06',null,'湖南省常德市汉寿县','汉寿县',',1809,1872,',1872)
, (1877,'2013-06-24 00:35:07','2013-06-24 00:35:07',null,'湖南省常德市澧县','澧县',',1809,1872,',1872)
, (1878,'2013-06-24 00:35:08','2013-06-24 00:35:08',null,'湖南省常德市临澧县','临澧县',',1809,1872,',1872)
, (1879,'2013-06-24 00:35:09','2013-06-24 00:35:09',null,'湖南省常德市桃源县','桃源县',',1809,1872,',1872)
, (1880,'2013-06-24 00:35:10','2013-06-24 00:35:10',null,'湖南省常德市石门县','石门县',',1809,1872,',1872)
, (1881,'2013-06-24 00:35:11','2013-06-24 00:35:11',null,'湖南省常德市津市市','津市市',',1809,1872,',1872)
, (1882,'2013-06-24 00:35:12','2013-06-24 00:35:12',null,'湖南省张家界市','张家界市',',1809,',1809)
, (1883,'2013-06-24 00:35:13','2013-06-24 00:35:13',null,'湖南省张家界市永定区','永定区',',1809,1882,',1882)
, (1884,'2013-06-24 00:35:14','2013-06-24 00:35:14',null,'湖南省张家界市武陵源区','武陵源区',',1809,1882,',1882)
, (1885,'2013-06-24 00:35:15','2013-06-24 00:35:15',null,'湖南省张家界市慈利县','慈利县',',1809,1882,',1882)
, (1886,'2013-06-24 00:35:16','2013-06-24 00:35:16',null,'湖南省张家界市桑植县','桑植县',',1809,1882,',1882)
, (1887,'2013-06-24 00:35:17','2013-06-24 00:35:17',null,'湖南省益阳市','益阳市',',1809,',1809)
, (1888,'2013-06-24 00:35:18','2013-06-24 00:35:18',null,'湖南省益阳市资阳区','资阳区',',1809,1887,',1887)
, (1889,'2013-06-24 00:35:19','2013-06-24 00:35:19',null,'湖南省益阳市赫山区','赫山区',',1809,1887,',1887)
, (1890,'2013-06-24 00:35:20','2013-06-24 00:35:20',null,'湖南省益阳市南县','南县',',1809,1887,',1887)
, (1891,'2013-06-24 00:35:21','2013-06-24 00:35:21',null,'湖南省益阳市桃江县','桃江县',',1809,1887,',1887)
, (1892,'2013-06-24 00:35:22','2013-06-24 00:35:22',null,'湖南省益阳市安化县','安化县',',1809,1887,',1887)
, (1893,'2013-06-24 00:35:23','2013-06-24 00:35:23',null,'湖南省益阳市沅江市','沅江市',',1809,1887,',1887)
, (1894,'2013-06-24 00:35:24','2013-06-24 00:35:24',null,'湖南省郴州市','郴州市',',1809,',1809)
, (1895,'2013-06-24 00:35:25','2013-06-24 00:35:25',null,'湖南省郴州市北湖区','北湖区',',1809,1894,',1894)
, (1896,'2013-06-24 00:35:26','2013-06-24 00:35:26',null,'湖南省郴州市苏仙区','苏仙区',',1809,1894,',1894)
, (1897,'2013-06-24 00:35:27','2013-06-24 00:35:27',null,'湖南省郴州市桂阳县','桂阳县',',1809,1894,',1894)
, (1898,'2013-06-24 00:35:28','2013-06-24 00:35:28',null,'湖南省郴州市宜章县','宜章县',',1809,1894,',1894)
, (1899,'2013-06-24 00:35:29','2013-06-24 00:35:29',null,'湖南省郴州市永兴县','永兴县',',1809,1894,',1894)
, (1900,'2013-06-24 00:35:30','2013-06-24 00:35:30',null,'湖南省郴州市嘉禾县','嘉禾县',',1809,1894,',1894)
, (1901,'2013-06-24 00:35:31','2013-06-24 00:35:31',null,'湖南省郴州市临武县','临武县',',1809,1894,',1894)
, (1902,'2013-06-24 00:35:32','2013-06-24 00:35:32',null,'湖南省郴州市汝城县','汝城县',',1809,1894,',1894)
, (1903,'2013-06-24 00:35:33','2013-06-24 00:35:33',null,'湖南省郴州市桂东县','桂东县',',1809,1894,',1894)
, (1904,'2013-06-24 00:35:34','2013-06-24 00:35:34',null,'湖南省郴州市安仁县','安仁县',',1809,1894,',1894)
, (1905,'2013-06-24 00:35:35','2013-06-24 00:35:35',null,'湖南省郴州市资兴市','资兴市',',1809,1894,',1894)
, (1906,'2013-06-24 00:35:36','2013-06-24 00:35:36',null,'湖南省永州市','永州市',',1809,',1809)
, (1907,'2013-06-24 00:35:37','2013-06-24 00:35:37',null,'湖南省永州市零陵区','零陵区',',1809,1906,',1906)
, (1908,'2013-06-24 00:35:38','2013-06-24 00:35:38',null,'湖南省永州市冷水滩区','冷水滩区',',1809,1906,',1906)
, (1909,'2013-06-24 00:35:39','2013-06-24 00:35:39',null,'湖南省永州市祁阳县','祁阳县',',1809,1906,',1906)
, (1910,'2013-06-24 00:35:40','2013-06-24 00:35:40',null,'湖南省永州市东安县','东安县',',1809,1906,',1906)
, (1911,'2013-06-24 00:35:41','2013-06-24 00:35:41',null,'湖南省永州市双牌县','双牌县',',1809,1906,',1906)
, (1912,'2013-06-24 00:35:42','2013-06-24 00:35:42',null,'湖南省永州市道县','道县',',1809,1906,',1906)
, (1913,'2013-06-24 00:35:43','2013-06-24 00:35:43',null,'湖南省永州市江永县','江永县',',1809,1906,',1906)
, (1914,'2013-06-24 00:35:44','2013-06-24 00:35:44',null,'湖南省永州市宁远县','宁远县',',1809,1906,',1906)
, (1915,'2013-06-24 00:35:45','2013-06-24 00:35:45',null,'湖南省永州市蓝山县','蓝山县',',1809,1906,',1906)
, (1916,'2013-06-24 00:35:46','2013-06-24 00:35:46',null,'湖南省永州市新田县','新田县',',1809,1906,',1906)
, (1917,'2013-06-24 00:35:47','2013-06-24 00:35:47',null,'湖南省永州市江华瑶族自治县','江华瑶族自治县',',1809,1906,',1906)
, (1918,'2013-06-24 00:35:48','2013-06-24 00:35:48',null,'湖南省怀化市','怀化市',',1809,',1809)
, (1919,'2013-06-24 00:35:49','2013-06-24 00:35:49',null,'湖南省怀化市鹤城区','鹤城区',',1809,1918,',1918)
, (1920,'2013-06-24 00:35:50','2013-06-24 00:35:50',null,'湖南省怀化市中方县','中方县',',1809,1918,',1918)
, (1921,'2013-06-24 00:35:51','2013-06-24 00:35:51',null,'湖南省怀化市沅陵县','沅陵县',',1809,1918,',1918)
, (1922,'2013-06-24 00:35:52','2013-06-24 00:35:52',null,'湖南省怀化市辰溪县','辰溪县',',1809,1918,',1918)
, (1923,'2013-06-24 00:35:53','2013-06-24 00:35:53',null,'湖南省怀化市溆浦县','溆浦县',',1809,1918,',1918)
, (1924,'2013-06-24 00:35:54','2013-06-24 00:35:54',null,'湖南省怀化市会同县','会同县',',1809,1918,',1918)
, (1925,'2013-06-24 00:35:55','2013-06-24 00:35:55',null,'湖南省怀化市麻阳苗族自治县','麻阳苗族自治县',',1809,1918,',1918)
, (1926,'2013-06-24 00:35:56','2013-06-24 00:35:56',null,'湖南省怀化市新晃侗族自治县','新晃侗族自治县',',1809,1918,',1918)
, (1927,'2013-06-24 00:35:57','2013-06-24 00:35:57',null,'湖南省怀化市芷江侗族自治县','芷江侗族自治县',',1809,1918,',1918)
, (1928,'2013-06-24 00:35:58','2013-06-24 00:35:58',null,'湖南省怀化市靖州苗族侗族自治县','靖州苗族侗族自治县',',1809,1918,',1918)
, (1929,'2013-06-24 00:35:59','2013-06-24 00:35:59',null,'湖南省怀化市通道侗族自治县','通道侗族自治县',',1809,1918,',1918)
, (1930,'2013-06-24 00:36:00','2013-06-24 00:36:00',null,'湖南省怀化市洪江市','洪江市',',1809,1918,',1918)
, (1931,'2013-06-24 00:36:01','2013-06-24 00:36:01',null,'湖南省娄底市','娄底市',',1809,',1809)
, (1932,'2013-06-24 00:36:02','2013-06-24 00:36:02',null,'湖南省娄底市娄星区','娄星区',',1809,1931,',1931)
, (1933,'2013-06-24 00:36:03','2013-06-24 00:36:03',null,'湖南省娄底市双峰县','双峰县',',1809,1931,',1931)
, (1934,'2013-06-24 00:36:04','2013-06-24 00:36:04',null,'湖南省娄底市新化县','新化县',',1809,1931,',1931)
, (1935,'2013-06-24 00:36:05','2013-06-24 00:36:05',null,'湖南省娄底市冷水江市','冷水江市',',1809,1931,',1931)
, (1936,'2013-06-24 00:36:06','2013-06-24 00:36:06',null,'湖南省娄底市涟源市','涟源市',',1809,1931,',1931)
, (1937,'2013-06-24 00:36:07','2013-06-24 00:36:07',null,'湖南省湘西土家族苗族自治州','湘西土家族苗族自治州',',1809,',1809)
, (1938,'2013-06-24 00:36:08','2013-06-24 00:36:08',null,'湖南省湘西土家族苗族自治州吉首市','吉首市',',1809,1937,',1937)
, (1939,'2013-06-24 00:36:09','2013-06-24 00:36:09',null,'湖南省湘西土家族苗族自治州泸溪县','泸溪县',',1809,1937,',1937)
, (1940,'2013-06-24 00:36:10','2013-06-24 00:36:10',null,'湖南省湘西土家族苗族自治州凤凰县','凤凰县',',1809,1937,',1937)
, (1941,'2013-06-24 00:36:11','2013-06-24 00:36:11',null,'湖南省湘西土家族苗族自治州花垣县','花垣县',',1809,1937,',1937)
, (1942,'2013-06-24 00:36:12','2013-06-24 00:36:12',null,'湖南省湘西土家族苗族自治州保靖县','保靖县',',1809,1937,',1937)
, (1943,'2013-06-24 00:36:13','2013-06-24 00:36:13',null,'湖南省湘西土家族苗族自治州古丈县','古丈县',',1809,1937,',1937)
, (1944,'2013-06-24 00:36:14','2013-06-24 00:36:14',null,'湖南省湘西土家族苗族自治州永顺县','永顺县',',1809,1937,',1937)
, (1945,'2013-06-24 00:36:15','2013-06-24 00:36:15',null,'湖南省湘西土家族苗族自治州龙山县','龙山县',',1809,1937,',1937)
, (1946,'2013-06-24 00:36:16','2013-06-24 00:36:16',null,'广东省','广东省',',',null)
, (1947,'2013-06-24 00:36:17','2013-06-24 00:36:17',null,'广东省广州市','广州市',',1946,',1946)
, (1948,'2013-06-24 00:36:18','2013-06-24 00:36:18',null,'广东省广州市荔湾区','荔湾区',',1946,1947,',1947)
, (1949,'2013-06-24 00:36:19','2013-06-24 00:36:19',null,'广东省广州市越秀区','越秀区',',1946,1947,',1947)
, (1950,'2013-06-24 00:36:20','2013-06-24 00:36:20',null,'广东省广州市海珠区','海珠区',',1946,1947,',1947)
, (1951,'2013-06-24 00:36:21','2013-06-24 00:36:21',null,'广东省广州市天河区','天河区',',1946,1947,',1947)
, (1952,'2013-06-24 00:36:22','2013-06-24 00:36:22',null,'广东省广州市白云区','白云区',',1946,1947,',1947)
, (1953,'2013-06-24 00:36:23','2013-06-24 00:36:23',null,'广东省广州市黄埔区','黄埔区',',1946,1947,',1947)
, (1954,'2013-06-24 00:36:24','2013-06-24 00:36:24',null,'广东省广州市番禺区','番禺区',',1946,1947,',1947)
, (1955,'2013-06-24 00:36:25','2013-06-24 00:36:25',null,'广东省广州市花都区','花都区',',1946,1947,',1947)
, (1956,'2013-06-24 00:36:26','2013-06-24 00:36:26',null,'广东省广州市南沙区','南沙区',',1946,1947,',1947)
, (1957,'2013-06-24 00:36:27','2013-06-24 00:36:27',null,'广东省广州市萝岗区','萝岗区',',1946,1947,',1947)
, (1958,'2013-06-24 00:36:28','2013-06-24 00:36:28',null,'广东省广州市增城市','增城市',',1946,1947,',1947)
, (1959,'2013-06-24 00:36:29','2013-06-24 00:36:29',null,'广东省广州市从化市','从化市',',1946,1947,',1947)
, (1960,'2013-06-24 00:36:30','2013-06-24 00:36:30',null,'广东省韶关市','韶关市',',1946,',1946)
, (1961,'2013-06-24 00:36:31','2013-06-24 00:36:31',null,'广东省韶关市武江区','武江区',',1946,1960,',1960)
, (1962,'2013-06-24 00:36:32','2013-06-24 00:36:32',null,'广东省韶关市浈江区','浈江区',',1946,1960,',1960)
, (1963,'2013-06-24 00:36:33','2013-06-24 00:36:33',null,'广东省韶关市曲江区','曲江区',',1946,1960,',1960)
, (1964,'2013-06-24 00:36:34','2013-06-24 00:36:34',null,'广东省韶关市始兴县','始兴县',',1946,1960,',1960)
, (1965,'2013-06-24 00:36:35','2013-06-24 00:36:35',null,'广东省韶关市仁化县','仁化县',',1946,1960,',1960)
, (1966,'2013-06-24 00:36:36','2013-06-24 00:36:36',null,'广东省韶关市翁源县','翁源县',',1946,1960,',1960)
, (1967,'2013-06-24 00:36:37','2013-06-24 00:36:37',null,'广东省韶关市乳源瑶族自治县','乳源瑶族自治县',',1946,1960,',1960)
, (1968,'2013-06-24 00:36:38','2013-06-24 00:36:38',null,'广东省韶关市新丰县','新丰县',',1946,1960,',1960)
, (1969,'2013-06-24 00:36:39','2013-06-24 00:36:39',null,'广东省韶关市乐昌市','乐昌市',',1946,1960,',1960)
, (1970,'2013-06-24 00:36:40','2013-06-24 00:36:40',null,'广东省韶关市南雄市','南雄市',',1946,1960,',1960)
, (1971,'2013-06-24 00:36:41','2013-06-24 00:36:41',null,'广东省深圳市','深圳市',',1946,',1946)
, (1972,'2013-06-24 00:36:42','2013-06-24 00:36:42',null,'广东省深圳市罗湖区','罗湖区',',1946,1971,',1971)
, (1973,'2013-06-24 00:36:43','2013-06-24 00:36:43',null,'广东省深圳市福田区','福田区',',1946,1971,',1971)
, (1974,'2013-06-24 00:36:44','2013-06-24 00:36:44',null,'广东省深圳市南山区','南山区',',1946,1971,',1971)
, (1975,'2013-06-24 00:36:45','2013-06-24 00:36:45',null,'广东省深圳市宝安区','宝安区',',1946,1971,',1971)
, (1976,'2013-06-24 00:36:46','2013-06-24 00:36:46',null,'广东省深圳市龙岗区','龙岗区',',1946,1971,',1971)
, (1977,'2013-06-24 00:36:47','2013-06-24 00:36:47',null,'广东省深圳市盐田区','盐田区',',1946,1971,',1971)
, (1978,'2013-06-24 00:36:48','2013-06-24 00:36:48',null,'广东省珠海市','珠海市',',1946,',1946)
, (1979,'2013-06-24 00:36:49','2013-06-24 00:36:49',null,'广东省珠海市香洲区','香洲区',',1946,1978,',1978)
, (1980,'2013-06-24 00:36:50','2013-06-24 00:36:50',null,'广东省珠海市斗门区','斗门区',',1946,1978,',1978)
, (1981,'2013-06-24 00:36:51','2013-06-24 00:36:51',null,'广东省珠海市金湾区','金湾区',',1946,1978,',1978)
, (1982,'2013-06-24 00:36:52','2013-06-24 00:36:52',null,'广东省汕头市','汕头市',',1946,',1946)
, (1983,'2013-06-24 00:36:53','2013-06-24 00:36:53',null,'广东省汕头市龙湖区','龙湖区',',1946,1982,',1982)
, (1984,'2013-06-24 00:36:54','2013-06-24 00:36:54',null,'广东省汕头市金平区','金平区',',1946,1982,',1982)
, (1985,'2013-06-24 00:36:55','2013-06-24 00:36:55',null,'广东省汕头市濠江区','濠江区',',1946,1982,',1982)
, (1986,'2013-06-24 00:36:56','2013-06-24 00:36:56',null,'广东省汕头市潮阳区','潮阳区',',1946,1982,',1982)
, (1987,'2013-06-24 00:36:57','2013-06-24 00:36:57',null,'广东省汕头市潮南区','潮南区',',1946,1982,',1982)
, (1988,'2013-06-24 00:36:58','2013-06-24 00:36:58',null,'广东省汕头市澄海区','澄海区',',1946,1982,',1982)
, (1989,'2013-06-24 00:36:59','2013-06-24 00:36:59',null,'广东省汕头市南澳县','南澳县',',1946,1982,',1982)
, (1990,'2013-06-24 00:37:00','2013-06-24 00:37:00',null,'广东省佛山市','佛山市',',1946,',1946)
, (1991,'2013-06-24 00:37:01','2013-06-24 00:37:01',null,'广东省佛山市禅城区','禅城区',',1946,1990,',1990)
, (1992,'2013-06-24 00:37:02','2013-06-24 00:37:02',null,'广东省佛山市南海区','南海区',',1946,1990,',1990)
, (1993,'2013-06-24 00:37:03','2013-06-24 00:37:03',null,'广东省佛山市顺德区','顺德区',',1946,1990,',1990)
, (1994,'2013-06-24 00:37:04','2013-06-24 00:37:04',null,'广东省佛山市三水区','三水区',',1946,1990,',1990)
, (1995,'2013-06-24 00:37:05','2013-06-24 00:37:05',null,'广东省佛山市高明区','高明区',',1946,1990,',1990)
, (1996,'2013-06-24 00:37:06','2013-06-24 00:37:06',null,'广东省江门市','江门市',',1946,',1946)
, (1997,'2013-06-24 00:37:07','2013-06-24 00:37:07',null,'广东省江门市蓬江区','蓬江区',',1946,1996,',1996)
, (1998,'2013-06-24 00:37:08','2013-06-24 00:37:08',null,'广东省江门市江海区','江海区',',1946,1996,',1996)
, (1999,'2013-06-24 00:37:09','2013-06-24 00:37:09',null,'广东省江门市新会区','新会区',',1946,1996,',1996)
, (2000,'2013-06-24 00:37:10','2013-06-24 00:37:10',null,'广东省江门市台山市','台山市',',1946,1996,',1996);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (2001,'2013-06-24 00:37:11','2013-06-24 00:37:11',null,'广东省江门市开平市','开平市',',1946,1996,',1996)
, (2002,'2013-06-24 00:37:12','2013-06-24 00:37:12',null,'广东省江门市鹤山市','鹤山市',',1946,1996,',1996)
, (2003,'2013-06-24 00:37:13','2013-06-24 00:37:13',null,'广东省江门市恩平市','恩平市',',1946,1996,',1996)
, (2004,'2013-06-24 00:37:14','2013-06-24 00:37:14',null,'广东省湛江市','湛江市',',1946,',1946)
, (2005,'2013-06-24 00:37:15','2013-06-24 00:37:15',null,'广东省湛江市赤坎区','赤坎区',',1946,2004,',2004)
, (2006,'2013-06-24 00:37:16','2013-06-24 00:37:16',null,'广东省湛江市霞山区','霞山区',',1946,2004,',2004)
, (2007,'2013-06-24 00:37:17','2013-06-24 00:37:17',null,'广东省湛江市坡头区','坡头区',',1946,2004,',2004)
, (2008,'2013-06-24 00:37:18','2013-06-24 00:37:18',null,'广东省湛江市麻章区','麻章区',',1946,2004,',2004)
, (2009,'2013-06-24 00:37:19','2013-06-24 00:37:19',null,'广东省湛江市遂溪县','遂溪县',',1946,2004,',2004)
, (2010,'2013-06-24 00:37:20','2013-06-24 00:37:20',null,'广东省湛江市徐闻县','徐闻县',',1946,2004,',2004)
, (2011,'2013-06-24 00:37:21','2013-06-24 00:37:21',null,'广东省湛江市廉江市','廉江市',',1946,2004,',2004)
, (2012,'2013-06-24 00:37:22','2013-06-24 00:37:22',null,'广东省湛江市雷州市','雷州市',',1946,2004,',2004)
, (2013,'2013-06-24 00:37:23','2013-06-24 00:37:23',null,'广东省湛江市吴川市','吴川市',',1946,2004,',2004)
, (2014,'2013-06-24 00:37:24','2013-06-24 00:37:24',null,'广东省茂名市','茂名市',',1946,',1946)
, (2015,'2013-06-24 00:37:25','2013-06-24 00:37:25',null,'广东省茂名市茂南区','茂南区',',1946,2014,',2014)
, (2016,'2013-06-24 00:37:26','2013-06-24 00:37:26',null,'广东省茂名市茂港区','茂港区',',1946,2014,',2014)
, (2017,'2013-06-24 00:37:27','2013-06-24 00:37:27',null,'广东省茂名市电白县','电白县',',1946,2014,',2014)
, (2018,'2013-06-24 00:37:28','2013-06-24 00:37:28',null,'广东省茂名市高州市','高州市',',1946,2014,',2014)
, (2019,'2013-06-24 00:37:29','2013-06-24 00:37:29',null,'广东省茂名市化州市','化州市',',1946,2014,',2014)
, (2020,'2013-06-24 00:37:30','2013-06-24 00:37:30',null,'广东省茂名市信宜市','信宜市',',1946,2014,',2014)
, (2021,'2013-06-24 00:37:31','2013-06-24 00:37:31',null,'广东省肇庆市','肇庆市',',1946,',1946)
, (2022,'2013-06-24 00:37:32','2013-06-24 00:37:32',null,'广东省肇庆市端州区','端州区',',1946,2021,',2021)
, (2023,'2013-06-24 00:37:33','2013-06-24 00:37:33',null,'广东省肇庆市鼎湖区','鼎湖区',',1946,2021,',2021)
, (2024,'2013-06-24 00:37:34','2013-06-24 00:37:34',null,'广东省肇庆市广宁县','广宁县',',1946,2021,',2021)
, (2025,'2013-06-24 00:37:35','2013-06-24 00:37:35',null,'广东省肇庆市怀集县','怀集县',',1946,2021,',2021)
, (2026,'2013-06-24 00:37:36','2013-06-24 00:37:36',null,'广东省肇庆市封开县','封开县',',1946,2021,',2021)
, (2027,'2013-06-24 00:37:37','2013-06-24 00:37:37',null,'广东省肇庆市德庆县','德庆县',',1946,2021,',2021)
, (2028,'2013-06-24 00:37:38','2013-06-24 00:37:38',null,'广东省肇庆市高要市','高要市',',1946,2021,',2021)
, (2029,'2013-06-24 00:37:39','2013-06-24 00:37:39',null,'广东省肇庆市四会市','四会市',',1946,2021,',2021)
, (2030,'2013-06-24 00:37:40','2013-06-24 00:37:40',null,'广东省惠州市','惠州市',',1946,',1946)
, (2031,'2013-06-24 00:37:41','2013-06-24 00:37:41',null,'广东省惠州市惠城区','惠城区',',1946,2030,',2030)
, (2032,'2013-06-24 00:37:42','2013-06-24 00:37:42',null,'广东省惠州市惠阳区','惠阳区',',1946,2030,',2030)
, (2033,'2013-06-24 00:37:43','2013-06-24 00:37:43',null,'广东省惠州市博罗县','博罗县',',1946,2030,',2030)
, (2034,'2013-06-24 00:37:44','2013-06-24 00:37:44',null,'广东省惠州市惠东县','惠东县',',1946,2030,',2030)
, (2035,'2013-06-24 00:37:45','2013-06-24 00:37:45',null,'广东省惠州市龙门县','龙门县',',1946,2030,',2030)
, (2036,'2013-06-24 00:37:46','2013-06-24 00:37:46',null,'广东省梅州市','梅州市',',1946,',1946)
, (2037,'2013-06-24 00:37:47','2013-06-24 00:37:47',null,'广东省梅州市梅江区','梅江区',',1946,2036,',2036)
, (2038,'2013-06-24 00:37:48','2013-06-24 00:37:48',null,'广东省梅州市梅县','梅县',',1946,2036,',2036)
, (2039,'2013-06-24 00:37:49','2013-06-24 00:37:49',null,'广东省梅州市大埔县','大埔县',',1946,2036,',2036)
, (2040,'2013-06-24 00:37:50','2013-06-24 00:37:50',null,'广东省梅州市丰顺县','丰顺县',',1946,2036,',2036)
, (2041,'2013-06-24 00:37:51','2013-06-24 00:37:51',null,'广东省梅州市五华县','五华县',',1946,2036,',2036)
, (2042,'2013-06-24 00:37:52','2013-06-24 00:37:52',null,'广东省梅州市平远县','平远县',',1946,2036,',2036)
, (2043,'2013-06-24 00:37:53','2013-06-24 00:37:53',null,'广东省梅州市蕉岭县','蕉岭县',',1946,2036,',2036)
, (2044,'2013-06-24 00:37:54','2013-06-24 00:37:54',null,'广东省梅州市兴宁市','兴宁市',',1946,2036,',2036)
, (2045,'2013-06-24 00:37:55','2013-06-24 00:37:55',null,'广东省汕尾市','汕尾市',',1946,',1946)
, (2046,'2013-06-24 00:37:56','2013-06-24 00:37:56',null,'广东省汕尾市城区','城区',',1946,2045,',2045)
, (2047,'2013-06-24 00:37:57','2013-06-24 00:37:57',null,'广东省汕尾市海丰县','海丰县',',1946,2045,',2045)
, (2048,'2013-06-24 00:37:58','2013-06-24 00:37:58',null,'广东省汕尾市陆河县','陆河县',',1946,2045,',2045)
, (2049,'2013-06-24 00:37:59','2013-06-24 00:37:59',null,'广东省汕尾市陆丰市','陆丰市',',1946,2045,',2045)
, (2050,'2013-06-24 00:38:00','2013-06-24 00:38:00',null,'广东省河源市','河源市',',1946,',1946)
, (2051,'2013-06-24 00:38:01','2013-06-24 00:38:01',null,'广东省河源市源城区','源城区',',1946,2050,',2050)
, (2052,'2013-06-24 00:38:02','2013-06-24 00:38:02',null,'广东省河源市紫金县','紫金县',',1946,2050,',2050)
, (2053,'2013-06-24 00:38:03','2013-06-24 00:38:03',null,'广东省河源市龙川县','龙川县',',1946,2050,',2050)
, (2054,'2013-06-24 00:38:04','2013-06-24 00:38:04',null,'广东省河源市连平县','连平县',',1946,2050,',2050)
, (2055,'2013-06-24 00:38:05','2013-06-24 00:38:05',null,'广东省河源市和平县','和平县',',1946,2050,',2050)
, (2056,'2013-06-24 00:38:06','2013-06-24 00:38:06',null,'广东省河源市东源县','东源县',',1946,2050,',2050)
, (2057,'2013-06-24 00:38:07','2013-06-24 00:38:07',null,'广东省阳江市','阳江市',',1946,',1946)
, (2058,'2013-06-24 00:38:08','2013-06-24 00:38:08',null,'广东省阳江市江城区','江城区',',1946,2057,',2057)
, (2059,'2013-06-24 00:38:09','2013-06-24 00:38:09',null,'广东省阳江市阳西县','阳西县',',1946,2057,',2057)
, (2060,'2013-06-24 00:38:10','2013-06-24 00:38:10',null,'广东省阳江市阳东县','阳东县',',1946,2057,',2057)
, (2061,'2013-06-24 00:38:11','2013-06-24 00:38:11',null,'广东省阳江市阳春市','阳春市',',1946,2057,',2057)
, (2062,'2013-06-24 00:38:12','2013-06-24 00:38:12',null,'广东省清远市','清远市',',1946,',1946)
, (2063,'2013-06-24 00:38:13','2013-06-24 00:38:13',null,'广东省清远市清城区','清城区',',1946,2062,',2062)
, (2064,'2013-06-24 00:38:14','2013-06-24 00:38:14',null,'广东省清远市佛冈县','佛冈县',',1946,2062,',2062)
, (2065,'2013-06-24 00:38:15','2013-06-24 00:38:15',null,'广东省清远市阳山县','阳山县',',1946,2062,',2062)
, (2066,'2013-06-24 00:38:16','2013-06-24 00:38:16',null,'广东省清远市连山壮族瑶族自治县','连山壮族瑶族自治县',',1946,2062,',2062)
, (2067,'2013-06-24 00:38:17','2013-06-24 00:38:17',null,'广东省清远市连南瑶族自治县','连南瑶族自治县',',1946,2062,',2062)
, (2068,'2013-06-24 00:38:18','2013-06-24 00:38:18',null,'广东省清远市清新县','清新县',',1946,2062,',2062)
, (2069,'2013-06-24 00:38:19','2013-06-24 00:38:19',null,'广东省清远市英德市','英德市',',1946,2062,',2062)
, (2070,'2013-06-24 00:38:20','2013-06-24 00:38:20',null,'广东省清远市连州市','连州市',',1946,2062,',2062)
, (2071,'2013-06-24 00:38:21','2013-06-24 00:38:21',null,'广东省东莞市','东莞市',',1946,',1946)
, (2072,'2013-06-24 00:38:22','2013-06-24 00:38:22',null,'广东省中山市','中山市',',1946,',1946)
, (2073,'2013-06-24 00:38:23','2013-06-24 00:38:23',null,'广东省潮州市','潮州市',',1946,',1946)
, (2074,'2013-06-24 00:38:24','2013-06-24 00:38:24',null,'广东省潮州市湘桥区','湘桥区',',1946,2073,',2073)
, (2075,'2013-06-24 00:38:25','2013-06-24 00:38:25',null,'广东省潮州市潮安县','潮安县',',1946,2073,',2073)
, (2076,'2013-06-24 00:38:26','2013-06-24 00:38:26',null,'广东省潮州市饶平县','饶平县',',1946,2073,',2073)
, (2077,'2013-06-24 00:38:27','2013-06-24 00:38:27',null,'广东省揭阳市','揭阳市',',1946,',1946)
, (2078,'2013-06-24 00:38:28','2013-06-24 00:38:28',null,'广东省揭阳市榕城区','榕城区',',1946,2077,',2077)
, (2079,'2013-06-24 00:38:29','2013-06-24 00:38:29',null,'广东省揭阳市揭东县','揭东县',',1946,2077,',2077)
, (2080,'2013-06-24 00:38:30','2013-06-24 00:38:30',null,'广东省揭阳市揭西县','揭西县',',1946,2077,',2077)
, (2081,'2013-06-24 00:38:31','2013-06-24 00:38:31',null,'广东省揭阳市惠来县','惠来县',',1946,2077,',2077)
, (2082,'2013-06-24 00:38:32','2013-06-24 00:38:32',null,'广东省揭阳市普宁市','普宁市',',1946,2077,',2077)
, (2083,'2013-06-24 00:38:33','2013-06-24 00:38:33',null,'广东省云浮市','云浮市',',1946,',1946)
, (2084,'2013-06-24 00:38:34','2013-06-24 00:38:34',null,'广东省云浮市云城区','云城区',',1946,2083,',2083)
, (2085,'2013-06-24 00:38:35','2013-06-24 00:38:35',null,'广东省云浮市新兴县','新兴县',',1946,2083,',2083)
, (2086,'2013-06-24 00:38:36','2013-06-24 00:38:36',null,'广东省云浮市郁南县','郁南县',',1946,2083,',2083)
, (2087,'2013-06-24 00:38:37','2013-06-24 00:38:37',null,'广东省云浮市云安县','云安县',',1946,2083,',2083)
, (2088,'2013-06-24 00:38:38','2013-06-24 00:38:38',null,'广东省云浮市罗定市','罗定市',',1946,2083,',2083)
, (2089,'2013-06-24 00:38:39','2013-06-24 00:38:39',null,'广西壮族自治区','广西壮族自治区',',',null)
, (2090,'2013-06-24 00:38:40','2013-06-24 00:38:40',null,'广西壮族自治区南宁市','南宁市',',2089,',2089)
, (2091,'2013-06-24 00:38:41','2013-06-24 00:38:41',null,'广西壮族自治区南宁市兴宁区','兴宁区',',2089,2090,',2090)
, (2092,'2013-06-24 00:38:42','2013-06-24 00:38:42',null,'广西壮族自治区南宁市青秀区','青秀区',',2089,2090,',2090)
, (2093,'2013-06-24 00:38:43','2013-06-24 00:38:43',null,'广西壮族自治区南宁市江南区','江南区',',2089,2090,',2090)
, (2094,'2013-06-24 00:38:44','2013-06-24 00:38:44',null,'广西壮族自治区南宁市西乡塘区','西乡塘区',',2089,2090,',2090)
, (2095,'2013-06-24 00:38:45','2013-06-24 00:38:45',null,'广西壮族自治区南宁市良庆区','良庆区',',2089,2090,',2090)
, (2096,'2013-06-24 00:38:46','2013-06-24 00:38:46',null,'广西壮族自治区南宁市邕宁区','邕宁区',',2089,2090,',2090)
, (2097,'2013-06-24 00:38:47','2013-06-24 00:38:47',null,'广西壮族自治区南宁市武鸣县','武鸣县',',2089,2090,',2090)
, (2098,'2013-06-24 00:38:48','2013-06-24 00:38:48',null,'广西壮族自治区南宁市隆安县','隆安县',',2089,2090,',2090)
, (2099,'2013-06-24 00:38:49','2013-06-24 00:38:49',null,'广西壮族自治区南宁市马山县','马山县',',2089,2090,',2090)
, (2100,'2013-06-24 00:38:50','2013-06-24 00:38:50',null,'广西壮族自治区南宁市上林县','上林县',',2089,2090,',2090)
, (2101,'2013-06-24 00:38:51','2013-06-24 00:38:51',null,'广西壮族自治区南宁市宾阳县','宾阳县',',2089,2090,',2090)
, (2102,'2013-06-24 00:38:52','2013-06-24 00:38:52',null,'广西壮族自治区南宁市横县','横县',',2089,2090,',2090)
, (2103,'2013-06-24 00:38:53','2013-06-24 00:38:53',null,'广西壮族自治区柳州市','柳州市',',2089,',2089)
, (2104,'2013-06-24 00:38:54','2013-06-24 00:38:54',null,'广西壮族自治区柳州市城中区','城中区',',2089,2103,',2103)
, (2105,'2013-06-24 00:38:55','2013-06-24 00:38:55',null,'广西壮族自治区柳州市鱼峰区','鱼峰区',',2089,2103,',2103)
, (2106,'2013-06-24 00:38:56','2013-06-24 00:38:56',null,'广西壮族自治区柳州市柳南区','柳南区',',2089,2103,',2103)
, (2107,'2013-06-24 00:38:57','2013-06-24 00:38:57',null,'广西壮族自治区柳州市柳北区','柳北区',',2089,2103,',2103)
, (2108,'2013-06-24 00:38:58','2013-06-24 00:38:58',null,'广西壮族自治区柳州市柳江县','柳江县',',2089,2103,',2103)
, (2109,'2013-06-24 00:38:59','2013-06-24 00:38:59',null,'广西壮族自治区柳州市柳城县','柳城县',',2089,2103,',2103)
, (2110,'2013-06-24 00:39:00','2013-06-24 00:39:00',null,'广西壮族自治区柳州市鹿寨县','鹿寨县',',2089,2103,',2103)
, (2111,'2013-06-24 00:39:01','2013-06-24 00:39:01',null,'广西壮族自治区柳州市融安县','融安县',',2089,2103,',2103)
, (2112,'2013-06-24 00:39:02','2013-06-24 00:39:02',null,'广西壮族自治区柳州市融水苗族自治县','融水苗族自治县',',2089,2103,',2103)
, (2113,'2013-06-24 00:39:03','2013-06-24 00:39:03',null,'广西壮族自治区柳州市三江侗族自治县','三江侗族自治县',',2089,2103,',2103)
, (2114,'2013-06-24 00:39:04','2013-06-24 00:39:04',null,'广西壮族自治区桂林市','桂林市',',2089,',2089)
, (2115,'2013-06-24 00:39:05','2013-06-24 00:39:05',null,'广西壮族自治区桂林市秀峰区','秀峰区',',2089,2114,',2114)
, (2116,'2013-06-24 00:39:06','2013-06-24 00:39:06',null,'广西壮族自治区桂林市叠彩区','叠彩区',',2089,2114,',2114)
, (2117,'2013-06-24 00:39:07','2013-06-24 00:39:07',null,'广西壮族自治区桂林市象山区','象山区',',2089,2114,',2114)
, (2118,'2013-06-24 00:39:08','2013-06-24 00:39:08',null,'广西壮族自治区桂林市七星区','七星区',',2089,2114,',2114)
, (2119,'2013-06-24 00:39:09','2013-06-24 00:39:09',null,'广西壮族自治区桂林市雁山区','雁山区',',2089,2114,',2114)
, (2120,'2013-06-24 00:39:10','2013-06-24 00:39:10',null,'广西壮族自治区桂林市阳朔县','阳朔县',',2089,2114,',2114)
, (2121,'2013-06-24 00:39:11','2013-06-24 00:39:11',null,'广西壮族自治区桂林市临桂县','临桂县',',2089,2114,',2114)
, (2122,'2013-06-24 00:39:12','2013-06-24 00:39:12',null,'广西壮族自治区桂林市灵川县','灵川县',',2089,2114,',2114)
, (2123,'2013-06-24 00:39:13','2013-06-24 00:39:13',null,'广西壮族自治区桂林市全州县','全州县',',2089,2114,',2114)
, (2124,'2013-06-24 00:39:14','2013-06-24 00:39:14',null,'广西壮族自治区桂林市兴安县','兴安县',',2089,2114,',2114)
, (2125,'2013-06-24 00:39:15','2013-06-24 00:39:15',null,'广西壮族自治区桂林市永福县','永福县',',2089,2114,',2114)
, (2126,'2013-06-24 00:39:16','2013-06-24 00:39:16',null,'广西壮族自治区桂林市灌阳县','灌阳县',',2089,2114,',2114)
, (2127,'2013-06-24 00:39:17','2013-06-24 00:39:17',null,'广西壮族自治区桂林市龙胜各族自治县','龙胜各族自治县',',2089,2114,',2114)
, (2128,'2013-06-24 00:39:18','2013-06-24 00:39:18',null,'广西壮族自治区桂林市资源县','资源县',',2089,2114,',2114)
, (2129,'2013-06-24 00:39:19','2013-06-24 00:39:19',null,'广西壮族自治区桂林市平乐县','平乐县',',2089,2114,',2114)
, (2130,'2013-06-24 00:39:20','2013-06-24 00:39:20',null,'广西壮族自治区桂林市荔浦县','荔浦县',',2089,2114,',2114)
, (2131,'2013-06-24 00:39:21','2013-06-24 00:39:21',null,'广西壮族自治区桂林市恭城瑶族自治县','恭城瑶族自治县',',2089,2114,',2114)
, (2132,'2013-06-24 00:39:22','2013-06-24 00:39:22',null,'广西壮族自治区梧州市','梧州市',',2089,',2089)
, (2133,'2013-06-24 00:39:23','2013-06-24 00:39:23',null,'广西壮族自治区梧州市万秀区','万秀区',',2089,2132,',2132)
, (2134,'2013-06-24 00:39:24','2013-06-24 00:39:24',null,'广西壮族自治区梧州市蝶山区','蝶山区',',2089,2132,',2132)
, (2135,'2013-06-24 00:39:25','2013-06-24 00:39:25',null,'广西壮族自治区梧州市长洲区','长洲区',',2089,2132,',2132)
, (2136,'2013-06-24 00:39:26','2013-06-24 00:39:26',null,'广西壮族自治区梧州市苍梧县','苍梧县',',2089,2132,',2132)
, (2137,'2013-06-24 00:39:27','2013-06-24 00:39:27',null,'广西壮族自治区梧州市藤县','藤县',',2089,2132,',2132)
, (2138,'2013-06-24 00:39:28','2013-06-24 00:39:28',null,'广西壮族自治区梧州市蒙山县','蒙山县',',2089,2132,',2132)
, (2139,'2013-06-24 00:39:29','2013-06-24 00:39:29',null,'广西壮族自治区梧州市岑溪市','岑溪市',',2089,2132,',2132)
, (2140,'2013-06-24 00:39:30','2013-06-24 00:39:30',null,'广西壮族自治区北海市','北海市',',2089,',2089)
, (2141,'2013-06-24 00:39:31','2013-06-24 00:39:31',null,'广西壮族自治区北海市海城区','海城区',',2089,2140,',2140)
, (2142,'2013-06-24 00:39:32','2013-06-24 00:39:32',null,'广西壮族自治区北海市银海区','银海区',',2089,2140,',2140)
, (2143,'2013-06-24 00:39:33','2013-06-24 00:39:33',null,'广西壮族自治区北海市铁山港区','铁山港区',',2089,2140,',2140)
, (2144,'2013-06-24 00:39:34','2013-06-24 00:39:34',null,'广西壮族自治区北海市合浦县','合浦县',',2089,2140,',2140)
, (2145,'2013-06-24 00:39:35','2013-06-24 00:39:35',null,'广西壮族自治区防城港市','防城港市',',2089,',2089)
, (2146,'2013-06-24 00:39:36','2013-06-24 00:39:36',null,'广西壮族自治区防城港市港口区','港口区',',2089,2145,',2145)
, (2147,'2013-06-24 00:39:37','2013-06-24 00:39:37',null,'广西壮族自治区防城港市防城区','防城区',',2089,2145,',2145)
, (2148,'2013-06-24 00:39:38','2013-06-24 00:39:38',null,'广西壮族自治区防城港市上思县','上思县',',2089,2145,',2145)
, (2149,'2013-06-24 00:39:39','2013-06-24 00:39:39',null,'广西壮族自治区防城港市东兴市','东兴市',',2089,2145,',2145)
, (2150,'2013-06-24 00:39:40','2013-06-24 00:39:40',null,'广西壮族自治区钦州市','钦州市',',2089,',2089)
, (2151,'2013-06-24 00:39:41','2013-06-24 00:39:41',null,'广西壮族自治区钦州市钦南区','钦南区',',2089,2150,',2150)
, (2152,'2013-06-24 00:39:42','2013-06-24 00:39:42',null,'广西壮族自治区钦州市钦北区','钦北区',',2089,2150,',2150)
, (2153,'2013-06-24 00:39:43','2013-06-24 00:39:43',null,'广西壮族自治区钦州市灵山县','灵山县',',2089,2150,',2150)
, (2154,'2013-06-24 00:39:44','2013-06-24 00:39:44',null,'广西壮族自治区钦州市浦北县','浦北县',',2089,2150,',2150)
, (2155,'2013-06-24 00:39:45','2013-06-24 00:39:45',null,'广西壮族自治区贵港市','贵港市',',2089,',2089)
, (2156,'2013-06-24 00:39:46','2013-06-24 00:39:46',null,'广西壮族自治区贵港市港北区','港北区',',2089,2155,',2155)
, (2157,'2013-06-24 00:39:47','2013-06-24 00:39:47',null,'广西壮族自治区贵港市港南区','港南区',',2089,2155,',2155)
, (2158,'2013-06-24 00:39:48','2013-06-24 00:39:48',null,'广西壮族自治区贵港市覃塘区','覃塘区',',2089,2155,',2155)
, (2159,'2013-06-24 00:39:49','2013-06-24 00:39:49',null,'广西壮族自治区贵港市平南县','平南县',',2089,2155,',2155)
, (2160,'2013-06-24 00:39:50','2013-06-24 00:39:50',null,'广西壮族自治区贵港市桂平市','桂平市',',2089,2155,',2155)
, (2161,'2013-06-24 00:39:51','2013-06-24 00:39:51',null,'广西壮族自治区玉林市','玉林市',',2089,',2089)
, (2162,'2013-06-24 00:39:52','2013-06-24 00:39:52',null,'广西壮族自治区玉林市玉州区','玉州区',',2089,2161,',2161)
, (2163,'2013-06-24 00:39:53','2013-06-24 00:39:53',null,'广西壮族自治区玉林市容县','容县',',2089,2161,',2161)
, (2164,'2013-06-24 00:39:54','2013-06-24 00:39:54',null,'广西壮族自治区玉林市陆川县','陆川县',',2089,2161,',2161)
, (2165,'2013-06-24 00:39:55','2013-06-24 00:39:55',null,'广西壮族自治区玉林市博白县','博白县',',2089,2161,',2161)
, (2166,'2013-06-24 00:39:56','2013-06-24 00:39:56',null,'广西壮族自治区玉林市兴业县','兴业县',',2089,2161,',2161)
, (2167,'2013-06-24 00:39:57','2013-06-24 00:39:57',null,'广西壮族自治区玉林市北流市','北流市',',2089,2161,',2161)
, (2168,'2013-06-24 00:39:58','2013-06-24 00:39:58',null,'广西壮族自治区百色市','百色市',',2089,',2089)
, (2169,'2013-06-24 00:39:59','2013-06-24 00:39:59',null,'广西壮族自治区百色市右江区','右江区',',2089,2168,',2168)
, (2170,'2013-06-24 00:40:00','2013-06-24 00:40:00',null,'广西壮族自治区百色市田阳县','田阳县',',2089,2168,',2168)
, (2171,'2013-06-24 00:40:01','2013-06-24 00:40:01',null,'广西壮族自治区百色市田东县','田东县',',2089,2168,',2168)
, (2172,'2013-06-24 00:40:02','2013-06-24 00:40:02',null,'广西壮族自治区百色市平果县','平果县',',2089,2168,',2168)
, (2173,'2013-06-24 00:40:03','2013-06-24 00:40:03',null,'广西壮族自治区百色市德保县','德保县',',2089,2168,',2168)
, (2174,'2013-06-24 00:40:04','2013-06-24 00:40:04',null,'广西壮族自治区百色市靖西县','靖西县',',2089,2168,',2168)
, (2175,'2013-06-24 00:40:05','2013-06-24 00:40:05',null,'广西壮族自治区百色市那坡县','那坡县',',2089,2168,',2168)
, (2176,'2013-06-24 00:40:06','2013-06-24 00:40:06',null,'广西壮族自治区百色市凌云县','凌云县',',2089,2168,',2168)
, (2177,'2013-06-24 00:40:07','2013-06-24 00:40:07',null,'广西壮族自治区百色市乐业县','乐业县',',2089,2168,',2168)
, (2178,'2013-06-24 00:40:08','2013-06-24 00:40:08',null,'广西壮族自治区百色市田林县','田林县',',2089,2168,',2168)
, (2179,'2013-06-24 00:40:09','2013-06-24 00:40:09',null,'广西壮族自治区百色市西林县','西林县',',2089,2168,',2168)
, (2180,'2013-06-24 00:40:10','2013-06-24 00:40:10',null,'广西壮族自治区百色市隆林各族自治县','隆林各族自治县',',2089,2168,',2168)
, (2181,'2013-06-24 00:40:11','2013-06-24 00:40:11',null,'广西壮族自治区贺州市','贺州市',',2089,',2089)
, (2182,'2013-06-24 00:40:12','2013-06-24 00:40:12',null,'广西壮族自治区贺州市八步区','八步区',',2089,2181,',2181)
, (2183,'2013-06-24 00:40:13','2013-06-24 00:40:13',null,'广西壮族自治区贺州市昭平县','昭平县',',2089,2181,',2181)
, (2184,'2013-06-24 00:40:14','2013-06-24 00:40:14',null,'广西壮族自治区贺州市钟山县','钟山县',',2089,2181,',2181)
, (2185,'2013-06-24 00:40:15','2013-06-24 00:40:15',null,'广西壮族自治区贺州市富川瑶族自治县','富川瑶族自治县',',2089,2181,',2181)
, (2186,'2013-06-24 00:40:16','2013-06-24 00:40:16',null,'广西壮族自治区河池市','河池市',',2089,',2089)
, (2187,'2013-06-24 00:40:17','2013-06-24 00:40:17',null,'广西壮族自治区河池市金城江区','金城江区',',2089,2186,',2186)
, (2188,'2013-06-24 00:40:18','2013-06-24 00:40:18',null,'广西壮族自治区河池市南丹县','南丹县',',2089,2186,',2186)
, (2189,'2013-06-24 00:40:19','2013-06-24 00:40:19',null,'广西壮族自治区河池市天峨县','天峨县',',2089,2186,',2186)
, (2190,'2013-06-24 00:40:20','2013-06-24 00:40:20',null,'广西壮族自治区河池市凤山县','凤山县',',2089,2186,',2186)
, (2191,'2013-06-24 00:40:21','2013-06-24 00:40:21',null,'广西壮族自治区河池市东兰县','东兰县',',2089,2186,',2186)
, (2192,'2013-06-24 00:40:22','2013-06-24 00:40:22',null,'广西壮族自治区河池市罗城仫佬族自治县','罗城仫佬族自治县',',2089,2186,',2186)
, (2193,'2013-06-24 00:40:23','2013-06-24 00:40:23',null,'广西壮族自治区河池市环江毛南族自治县','环江毛南族自治县',',2089,2186,',2186)
, (2194,'2013-06-24 00:40:24','2013-06-24 00:40:24',null,'广西壮族自治区河池市巴马瑶族自治县','巴马瑶族自治县',',2089,2186,',2186)
, (2195,'2013-06-24 00:40:25','2013-06-24 00:40:25',null,'广西壮族自治区河池市都安瑶族自治县','都安瑶族自治县',',2089,2186,',2186)
, (2196,'2013-06-24 00:40:26','2013-06-24 00:40:26',null,'广西壮族自治区河池市大化瑶族自治县','大化瑶族自治县',',2089,2186,',2186)
, (2197,'2013-06-24 00:40:27','2013-06-24 00:40:27',null,'广西壮族自治区河池市宜州市','宜州市',',2089,2186,',2186)
, (2198,'2013-06-24 00:40:28','2013-06-24 00:40:28',null,'广西壮族自治区来宾市','来宾市',',2089,',2089)
, (2199,'2013-06-24 00:40:29','2013-06-24 00:40:29',null,'广西壮族自治区来宾市兴宾区','兴宾区',',2089,2198,',2198)
, (2200,'2013-06-24 00:40:30','2013-06-24 00:40:30',null,'广西壮族自治区来宾市忻城县','忻城县',',2089,2198,',2198)
, (2201,'2013-06-24 00:40:31','2013-06-24 00:40:31',null,'广西壮族自治区来宾市象州县','象州县',',2089,2198,',2198)
, (2202,'2013-06-24 00:40:32','2013-06-24 00:40:32',null,'广西壮族自治区来宾市武宣县','武宣县',',2089,2198,',2198)
, (2203,'2013-06-24 00:40:33','2013-06-24 00:40:33',null,'广西壮族自治区来宾市金秀瑶族自治县','金秀瑶族自治县',',2089,2198,',2198)
, (2204,'2013-06-24 00:40:34','2013-06-24 00:40:34',null,'广西壮族自治区来宾市合山市','合山市',',2089,2198,',2198)
, (2205,'2013-06-24 00:40:35','2013-06-24 00:40:35',null,'广西壮族自治区崇左市','崇左市',',2089,',2089)
, (2206,'2013-06-24 00:40:36','2013-06-24 00:40:36',null,'广西壮族自治区崇左市江洲区','江洲区',',2089,2205,',2205)
, (2207,'2013-06-24 00:40:37','2013-06-24 00:40:37',null,'广西壮族自治区崇左市扶绥县','扶绥县',',2089,2205,',2205)
, (2208,'2013-06-24 00:40:38','2013-06-24 00:40:38',null,'广西壮族自治区崇左市宁明县','宁明县',',2089,2205,',2205)
, (2209,'2013-06-24 00:40:39','2013-06-24 00:40:39',null,'广西壮族自治区崇左市龙州县','龙州县',',2089,2205,',2205)
, (2210,'2013-06-24 00:40:40','2013-06-24 00:40:40',null,'广西壮族自治区崇左市大新县','大新县',',2089,2205,',2205)
, (2211,'2013-06-24 00:40:41','2013-06-24 00:40:41',null,'广西壮族自治区崇左市天等县','天等县',',2089,2205,',2205)
, (2212,'2013-06-24 00:40:42','2013-06-24 00:40:42',null,'广西壮族自治区崇左市凭祥市','凭祥市',',2089,2205,',2205)
, (2213,'2013-06-24 00:40:43','2013-06-24 00:40:43',null,'海南省','海南省',',',null)
, (2214,'2013-06-24 00:40:44','2013-06-24 00:40:44',null,'海南省海口市','海口市',',2213,',2213)
, (2215,'2013-06-24 00:40:45','2013-06-24 00:40:45',null,'海南省海口市秀英区','秀英区',',2213,2214,',2214)
, (2216,'2013-06-24 00:40:46','2013-06-24 00:40:46',null,'海南省海口市龙华区','龙华区',',2213,2214,',2214)
, (2217,'2013-06-24 00:40:47','2013-06-24 00:40:47',null,'海南省海口市琼山区','琼山区',',2213,2214,',2214)
, (2218,'2013-06-24 00:40:48','2013-06-24 00:40:48',null,'海南省海口市美兰区','美兰区',',2213,2214,',2214)
, (2219,'2013-06-24 00:40:49','2013-06-24 00:40:49',null,'海南省三亚市','三亚市',',2213,',2213)
, (2220,'2013-06-24 00:40:50','2013-06-24 00:40:50',null,'海南省三沙市','三沙市',',2213,',2213)
, (2221,'2013-06-24 00:40:51','2013-06-24 00:40:51',null,'海南省三沙市西沙群岛','西沙群岛',',2213,2220,',2220)
, (2222,'2013-06-24 00:40:52','2013-06-24 00:40:52',null,'海南省三沙市南沙群岛','南沙群岛',',2213,2220,',2220)
, (2223,'2013-06-24 00:40:53','2013-06-24 00:40:53',null,'海南省三沙市中沙群岛的岛礁及其海域','中沙群岛的岛礁及其海域',',2213,2220,',2220)
, (2224,'2013-06-24 00:40:54','2013-06-24 00:40:54',null,'海南省五指山市','五指山市',',2213,',2213)
, (2225,'2013-06-24 00:40:55','2013-06-24 00:40:55',null,'海南省琼海市','琼海市',',2213,',2213)
, (2226,'2013-06-24 00:40:56','2013-06-24 00:40:56',null,'海南省儋州市','儋州市',',2213,',2213)
, (2227,'2013-06-24 00:40:57','2013-06-24 00:40:57',null,'海南省文昌市','文昌市',',2213,',2213)
, (2228,'2013-06-24 00:40:58','2013-06-24 00:40:58',null,'海南省万宁市','万宁市',',2213,',2213)
, (2229,'2013-06-24 00:40:59','2013-06-24 00:40:59',null,'海南省东方市','东方市',',2213,',2213)
, (2230,'2013-06-24 00:41:00','2013-06-24 00:41:00',null,'海南省定安县','定安县',',2213,',2213)
, (2231,'2013-06-24 00:41:01','2013-06-24 00:41:01',null,'海南省屯昌县','屯昌县',',2213,',2213)
, (2232,'2013-06-24 00:41:02','2013-06-24 00:41:02',null,'海南省澄迈县','澄迈县',',2213,',2213)
, (2233,'2013-06-24 00:41:03','2013-06-24 00:41:03',null,'海南省临高县','临高县',',2213,',2213)
, (2234,'2013-06-24 00:41:04','2013-06-24 00:41:04',null,'海南省白沙黎族自治县','白沙黎族自治县',',2213,',2213)
, (2235,'2013-06-24 00:41:05','2013-06-24 00:41:05',null,'海南省昌江黎族自治县','昌江黎族自治县',',2213,',2213)
, (2236,'2013-06-24 00:41:06','2013-06-24 00:41:06',null,'海南省乐东黎族自治县','乐东黎族自治县',',2213,',2213)
, (2237,'2013-06-24 00:41:07','2013-06-24 00:41:07',null,'海南省陵水黎族自治县','陵水黎族自治县',',2213,',2213)
, (2238,'2013-06-24 00:41:08','2013-06-24 00:41:08',null,'海南省保亭黎族苗族自治县','保亭黎族苗族自治县',',2213,',2213)
, (2239,'2013-06-24 00:41:09','2013-06-24 00:41:09',null,'海南省琼中黎族苗族自治县','琼中黎族苗族自治县',',2213,',2213)
, (2240,'2013-06-24 00:41:10','2013-06-24 00:41:10',null,'重庆市','重庆市',',',null)
, (2241,'2013-06-24 00:41:11','2013-06-24 00:41:11',null,'重庆市万州区','万州区',',2240,',2240)
, (2242,'2013-06-24 00:41:12','2013-06-24 00:41:12',null,'重庆市涪陵区','涪陵区',',2240,',2240)
, (2243,'2013-06-24 00:41:13','2013-06-24 00:41:13',null,'重庆市渝中区','渝中区',',2240,',2240)
, (2244,'2013-06-24 00:41:14','2013-06-24 00:41:14',null,'重庆市大渡口区','大渡口区',',2240,',2240)
, (2245,'2013-06-24 00:41:15','2013-06-24 00:41:15',null,'重庆市江北区','江北区',',2240,',2240)
, (2246,'2013-06-24 00:41:16','2013-06-24 00:41:16',null,'重庆市沙坪坝区','沙坪坝区',',2240,',2240)
, (2247,'2013-06-24 00:41:17','2013-06-24 00:41:17',null,'重庆市九龙坡区','九龙坡区',',2240,',2240)
, (2248,'2013-06-24 00:41:18','2013-06-24 00:41:18',null,'重庆市南岸区','南岸区',',2240,',2240)
, (2249,'2013-06-24 00:41:19','2013-06-24 00:41:19',null,'重庆市北碚区','北碚区',',2240,',2240)
, (2250,'2013-06-24 00:41:20','2013-06-24 00:41:20',null,'重庆市綦江区','綦江区',',2240,',2240)
, (2251,'2013-06-24 00:41:21','2013-06-24 00:41:21',null,'重庆市大足区','大足区',',2240,',2240)
, (2252,'2013-06-24 00:41:22','2013-06-24 00:41:22',null,'重庆市渝北区','渝北区',',2240,',2240)
, (2253,'2013-06-24 00:41:23','2013-06-24 00:41:23',null,'重庆市巴南区','巴南区',',2240,',2240)
, (2254,'2013-06-24 00:41:24','2013-06-24 00:41:24',null,'重庆市黔江区','黔江区',',2240,',2240)
, (2255,'2013-06-24 00:41:25','2013-06-24 00:41:25',null,'重庆市长寿区','长寿区',',2240,',2240)
, (2256,'2013-06-24 00:41:26','2013-06-24 00:41:26',null,'重庆市江津区','江津区',',2240,',2240)
, (2257,'2013-06-24 00:41:27','2013-06-24 00:41:27',null,'重庆市合川区','合川区',',2240,',2240)
, (2258,'2013-06-24 00:41:28','2013-06-24 00:41:28',null,'重庆市永川区','永川区',',2240,',2240)
, (2259,'2013-06-24 00:41:29','2013-06-24 00:41:29',null,'重庆市南川区','南川区',',2240,',2240)
, (2260,'2013-06-24 00:41:30','2013-06-24 00:41:30',null,'重庆市潼南县','潼南县',',2240,',2240)
, (2261,'2013-06-24 00:41:31','2013-06-24 00:41:31',null,'重庆市铜梁县','铜梁县',',2240,',2240)
, (2262,'2013-06-24 00:41:32','2013-06-24 00:41:32',null,'重庆市荣昌县','荣昌县',',2240,',2240)
, (2263,'2013-06-24 00:41:33','2013-06-24 00:41:33',null,'重庆市璧山县','璧山县',',2240,',2240)
, (2264,'2013-06-24 00:41:34','2013-06-24 00:41:34',null,'重庆市梁平县','梁平县',',2240,',2240)
, (2265,'2013-06-24 00:41:35','2013-06-24 00:41:35',null,'重庆市城口县','城口县',',2240,',2240)
, (2266,'2013-06-24 00:41:36','2013-06-24 00:41:36',null,'重庆市丰都县','丰都县',',2240,',2240)
, (2267,'2013-06-24 00:41:37','2013-06-24 00:41:37',null,'重庆市垫江县','垫江县',',2240,',2240)
, (2268,'2013-06-24 00:41:38','2013-06-24 00:41:38',null,'重庆市武隆县','武隆县',',2240,',2240)
, (2269,'2013-06-24 00:41:39','2013-06-24 00:41:39',null,'重庆市忠县','忠县',',2240,',2240)
, (2270,'2013-06-24 00:41:40','2013-06-24 00:41:40',null,'重庆市开县','开县',',2240,',2240)
, (2271,'2013-06-24 00:41:41','2013-06-24 00:41:41',null,'重庆市云阳县','云阳县',',2240,',2240)
, (2272,'2013-06-24 00:41:42','2013-06-24 00:41:42',null,'重庆市奉节县','奉节县',',2240,',2240)
, (2273,'2013-06-24 00:41:43','2013-06-24 00:41:43',null,'重庆市巫山县','巫山县',',2240,',2240)
, (2274,'2013-06-24 00:41:44','2013-06-24 00:41:44',null,'重庆市巫溪县','巫溪县',',2240,',2240)
, (2275,'2013-06-24 00:41:45','2013-06-24 00:41:45',null,'重庆市石柱土家族自治县','石柱土家族自治县',',2240,',2240)
, (2276,'2013-06-24 00:41:46','2013-06-24 00:41:46',null,'重庆市秀山土家族苗族自治县','秀山土家族苗族自治县',',2240,',2240)
, (2277,'2013-06-24 00:41:47','2013-06-24 00:41:47',null,'重庆市酉阳土家族苗族自治县','酉阳土家族苗族自治县',',2240,',2240)
, (2278,'2013-06-24 00:41:48','2013-06-24 00:41:48',null,'重庆市彭水苗族土家族自治县','彭水苗族土家族自治县',',2240,',2240)
, (2279,'2013-06-24 00:41:49','2013-06-24 00:41:49',null,'四川省','四川省',',',null)
, (2280,'2013-06-24 00:41:50','2013-06-24 00:41:50',null,'四川省成都市','成都市',',2279,',2279)
, (2281,'2013-06-24 00:41:51','2013-06-24 00:41:51',null,'四川省成都市锦江区','锦江区',',2279,2280,',2280)
, (2282,'2013-06-24 00:41:52','2013-06-24 00:41:52',null,'四川省成都市青羊区','青羊区',',2279,2280,',2280)
, (2283,'2013-06-24 00:41:53','2013-06-24 00:41:53',null,'四川省成都市金牛区','金牛区',',2279,2280,',2280)
, (2284,'2013-06-24 00:41:54','2013-06-24 00:41:54',null,'四川省成都市武侯区','武侯区',',2279,2280,',2280)
, (2285,'2013-06-24 00:41:55','2013-06-24 00:41:55',null,'四川省成都市成华区','成华区',',2279,2280,',2280)
, (2286,'2013-06-24 00:41:56','2013-06-24 00:41:56',null,'四川省成都市龙泉驿区','龙泉驿区',',2279,2280,',2280)
, (2287,'2013-06-24 00:41:57','2013-06-24 00:41:57',null,'四川省成都市青白江区','青白江区',',2279,2280,',2280)
, (2288,'2013-06-24 00:41:58','2013-06-24 00:41:58',null,'四川省成都市新都区','新都区',',2279,2280,',2280)
, (2289,'2013-06-24 00:41:59','2013-06-24 00:41:59',null,'四川省成都市温江区','温江区',',2279,2280,',2280)
, (2290,'2013-06-24 00:42:00','2013-06-24 00:42:00',null,'四川省成都市金堂县','金堂县',',2279,2280,',2280)
, (2291,'2013-06-24 00:42:01','2013-06-24 00:42:01',null,'四川省成都市双流县','双流县',',2279,2280,',2280)
, (2292,'2013-06-24 00:42:02','2013-06-24 00:42:02',null,'四川省成都市郫县','郫县',',2279,2280,',2280)
, (2293,'2013-06-24 00:42:03','2013-06-24 00:42:03',null,'四川省成都市大邑县','大邑县',',2279,2280,',2280)
, (2294,'2013-06-24 00:42:04','2013-06-24 00:42:04',null,'四川省成都市蒲江县','蒲江县',',2279,2280,',2280)
, (2295,'2013-06-24 00:42:05','2013-06-24 00:42:05',null,'四川省成都市新津县','新津县',',2279,2280,',2280)
, (2296,'2013-06-24 00:42:06','2013-06-24 00:42:06',null,'四川省成都市都江堰市','都江堰市',',2279,2280,',2280)
, (2297,'2013-06-24 00:42:07','2013-06-24 00:42:07',null,'四川省成都市彭州市','彭州市',',2279,2280,',2280)
, (2298,'2013-06-24 00:42:08','2013-06-24 00:42:08',null,'四川省成都市邛崃市','邛崃市',',2279,2280,',2280)
, (2299,'2013-06-24 00:42:09','2013-06-24 00:42:09',null,'四川省成都市崇州市','崇州市',',2279,2280,',2280)
, (2300,'2013-06-24 00:42:10','2013-06-24 00:42:10',null,'四川省自贡市','自贡市',',2279,',2279)
, (2301,'2013-06-24 00:42:11','2013-06-24 00:42:11',null,'四川省自贡市自流井区','自流井区',',2279,2300,',2300)
, (2302,'2013-06-24 00:42:12','2013-06-24 00:42:12',null,'四川省自贡市贡井区','贡井区',',2279,2300,',2300)
, (2303,'2013-06-24 00:42:13','2013-06-24 00:42:13',null,'四川省自贡市大安区','大安区',',2279,2300,',2300)
, (2304,'2013-06-24 00:42:14','2013-06-24 00:42:14',null,'四川省自贡市沿滩区','沿滩区',',2279,2300,',2300)
, (2305,'2013-06-24 00:42:15','2013-06-24 00:42:15',null,'四川省自贡市荣县','荣县',',2279,2300,',2300)
, (2306,'2013-06-24 00:42:16','2013-06-24 00:42:16',null,'四川省自贡市富顺县','富顺县',',2279,2300,',2300)
, (2307,'2013-06-24 00:42:17','2013-06-24 00:42:17',null,'四川省攀枝花市','攀枝花市',',2279,',2279)
, (2308,'2013-06-24 00:42:18','2013-06-24 00:42:18',null,'四川省攀枝花市东区','东区',',2279,2307,',2307)
, (2309,'2013-06-24 00:42:19','2013-06-24 00:42:19',null,'四川省攀枝花市西区','西区',',2279,2307,',2307)
, (2310,'2013-06-24 00:42:20','2013-06-24 00:42:20',null,'四川省攀枝花市仁和区','仁和区',',2279,2307,',2307)
, (2311,'2013-06-24 00:42:21','2013-06-24 00:42:21',null,'四川省攀枝花市米易县','米易县',',2279,2307,',2307)
, (2312,'2013-06-24 00:42:22','2013-06-24 00:42:22',null,'四川省攀枝花市盐边县','盐边县',',2279,2307,',2307)
, (2313,'2013-06-24 00:42:23','2013-06-24 00:42:23',null,'四川省泸州市','泸州市',',2279,',2279)
, (2314,'2013-06-24 00:42:24','2013-06-24 00:42:24',null,'四川省泸州市江阳区','江阳区',',2279,2313,',2313)
, (2315,'2013-06-24 00:42:25','2013-06-24 00:42:25',null,'四川省泸州市纳溪区','纳溪区',',2279,2313,',2313)
, (2316,'2013-06-24 00:42:26','2013-06-24 00:42:26',null,'四川省泸州市龙马潭区','龙马潭区',',2279,2313,',2313)
, (2317,'2013-06-24 00:42:27','2013-06-24 00:42:27',null,'四川省泸州市泸县','泸县',',2279,2313,',2313)
, (2318,'2013-06-24 00:42:28','2013-06-24 00:42:28',null,'四川省泸州市合江县','合江县',',2279,2313,',2313)
, (2319,'2013-06-24 00:42:29','2013-06-24 00:42:29',null,'四川省泸州市叙永县','叙永县',',2279,2313,',2313)
, (2320,'2013-06-24 00:42:30','2013-06-24 00:42:30',null,'四川省泸州市古蔺县','古蔺县',',2279,2313,',2313)
, (2321,'2013-06-24 00:42:31','2013-06-24 00:42:31',null,'四川省德阳市','德阳市',',2279,',2279)
, (2322,'2013-06-24 00:42:32','2013-06-24 00:42:32',null,'四川省德阳市旌阳区','旌阳区',',2279,2321,',2321)
, (2323,'2013-06-24 00:42:33','2013-06-24 00:42:33',null,'四川省德阳市中江县','中江县',',2279,2321,',2321)
, (2324,'2013-06-24 00:42:34','2013-06-24 00:42:34',null,'四川省德阳市罗江县','罗江县',',2279,2321,',2321)
, (2325,'2013-06-24 00:42:35','2013-06-24 00:42:35',null,'四川省德阳市广汉市','广汉市',',2279,2321,',2321)
, (2326,'2013-06-24 00:42:36','2013-06-24 00:42:36',null,'四川省德阳市什邡市','什邡市',',2279,2321,',2321)
, (2327,'2013-06-24 00:42:37','2013-06-24 00:42:37',null,'四川省德阳市绵竹市','绵竹市',',2279,2321,',2321)
, (2328,'2013-06-24 00:42:38','2013-06-24 00:42:38',null,'四川省绵阳市','绵阳市',',2279,',2279)
, (2329,'2013-06-24 00:42:39','2013-06-24 00:42:39',null,'四川省绵阳市涪城区','涪城区',',2279,2328,',2328)
, (2330,'2013-06-24 00:42:40','2013-06-24 00:42:40',null,'四川省绵阳市游仙区','游仙区',',2279,2328,',2328)
, (2331,'2013-06-24 00:42:41','2013-06-24 00:42:41',null,'四川省绵阳市三台县','三台县',',2279,2328,',2328)
, (2332,'2013-06-24 00:42:42','2013-06-24 00:42:42',null,'四川省绵阳市盐亭县','盐亭县',',2279,2328,',2328)
, (2333,'2013-06-24 00:42:43','2013-06-24 00:42:43',null,'四川省绵阳市安县','安县',',2279,2328,',2328)
, (2334,'2013-06-24 00:42:44','2013-06-24 00:42:44',null,'四川省绵阳市梓潼县','梓潼县',',2279,2328,',2328)
, (2335,'2013-06-24 00:42:45','2013-06-24 00:42:45',null,'四川省绵阳市北川羌族自治县','北川羌族自治县',',2279,2328,',2328)
, (2336,'2013-06-24 00:42:46','2013-06-24 00:42:46',null,'四川省绵阳市平武县','平武县',',2279,2328,',2328)
, (2337,'2013-06-24 00:42:47','2013-06-24 00:42:47',null,'四川省绵阳市江油市','江油市',',2279,2328,',2328)
, (2338,'2013-06-24 00:42:48','2013-06-24 00:42:48',null,'四川省广元市','广元市',',2279,',2279)
, (2339,'2013-06-24 00:42:49','2013-06-24 00:42:49',null,'四川省广元市利州区','利州区',',2279,2338,',2338)
, (2340,'2013-06-24 00:42:50','2013-06-24 00:42:50',null,'四川省广元市元坝区','元坝区',',2279,2338,',2338)
, (2341,'2013-06-24 00:42:51','2013-06-24 00:42:51',null,'四川省广元市朝天区','朝天区',',2279,2338,',2338)
, (2342,'2013-06-24 00:42:52','2013-06-24 00:42:52',null,'四川省广元市旺苍县','旺苍县',',2279,2338,',2338)
, (2343,'2013-06-24 00:42:53','2013-06-24 00:42:53',null,'四川省广元市青川县','青川县',',2279,2338,',2338)
, (2344,'2013-06-24 00:42:54','2013-06-24 00:42:54',null,'四川省广元市剑阁县','剑阁县',',2279,2338,',2338)
, (2345,'2013-06-24 00:42:55','2013-06-24 00:42:55',null,'四川省广元市苍溪县','苍溪县',',2279,2338,',2338)
, (2346,'2013-06-24 00:42:56','2013-06-24 00:42:56',null,'四川省遂宁市','遂宁市',',2279,',2279)
, (2347,'2013-06-24 00:42:57','2013-06-24 00:42:57',null,'四川省遂宁市船山区','船山区',',2279,2346,',2346)
, (2348,'2013-06-24 00:42:58','2013-06-24 00:42:58',null,'四川省遂宁市安居区','安居区',',2279,2346,',2346)
, (2349,'2013-06-24 00:42:59','2013-06-24 00:42:59',null,'四川省遂宁市蓬溪县','蓬溪县',',2279,2346,',2346)
, (2350,'2013-06-24 00:43:00','2013-06-24 00:43:00',null,'四川省遂宁市射洪县','射洪县',',2279,2346,',2346)
, (2351,'2013-06-24 00:43:01','2013-06-24 00:43:01',null,'四川省遂宁市大英县','大英县',',2279,2346,',2346)
, (2352,'2013-06-24 00:43:02','2013-06-24 00:43:02',null,'四川省内江市','内江市',',2279,',2279)
, (2353,'2013-06-24 00:43:03','2013-06-24 00:43:03',null,'四川省内江市市中区','市中区',',2279,2352,',2352)
, (2354,'2013-06-24 00:43:04','2013-06-24 00:43:04',null,'四川省内江市东兴区','东兴区',',2279,2352,',2352)
, (2355,'2013-06-24 00:43:05','2013-06-24 00:43:05',null,'四川省内江市威远县','威远县',',2279,2352,',2352)
, (2356,'2013-06-24 00:43:06','2013-06-24 00:43:06',null,'四川省内江市资中县','资中县',',2279,2352,',2352)
, (2357,'2013-06-24 00:43:07','2013-06-24 00:43:07',null,'四川省内江市隆昌县','隆昌县',',2279,2352,',2352)
, (2358,'2013-06-24 00:43:08','2013-06-24 00:43:08',null,'四川省乐山市','乐山市',',2279,',2279)
, (2359,'2013-06-24 00:43:09','2013-06-24 00:43:09',null,'四川省乐山市市中区','市中区',',2279,2358,',2358)
, (2360,'2013-06-24 00:43:10','2013-06-24 00:43:10',null,'四川省乐山市沙湾区','沙湾区',',2279,2358,',2358)
, (2361,'2013-06-24 00:43:11','2013-06-24 00:43:11',null,'四川省乐山市五通桥区','五通桥区',',2279,2358,',2358)
, (2362,'2013-06-24 00:43:12','2013-06-24 00:43:12',null,'四川省乐山市金口河区','金口河区',',2279,2358,',2358)
, (2363,'2013-06-24 00:43:13','2013-06-24 00:43:13',null,'四川省乐山市犍为县','犍为县',',2279,2358,',2358)
, (2364,'2013-06-24 00:43:14','2013-06-24 00:43:14',null,'四川省乐山市井研县','井研县',',2279,2358,',2358)
, (2365,'2013-06-24 00:43:15','2013-06-24 00:43:15',null,'四川省乐山市夹江县','夹江县',',2279,2358,',2358)
, (2366,'2013-06-24 00:43:16','2013-06-24 00:43:16',null,'四川省乐山市沐川县','沐川县',',2279,2358,',2358)
, (2367,'2013-06-24 00:43:17','2013-06-24 00:43:17',null,'四川省乐山市峨边彝族自治县','峨边彝族自治县',',2279,2358,',2358)
, (2368,'2013-06-24 00:43:18','2013-06-24 00:43:18',null,'四川省乐山市马边彝族自治县','马边彝族自治县',',2279,2358,',2358)
, (2369,'2013-06-24 00:43:19','2013-06-24 00:43:19',null,'四川省乐山市峨眉山市','峨眉山市',',2279,2358,',2358)
, (2370,'2013-06-24 00:43:20','2013-06-24 00:43:20',null,'四川省南充市','南充市',',2279,',2279)
, (2371,'2013-06-24 00:43:21','2013-06-24 00:43:21',null,'四川省南充市顺庆区','顺庆区',',2279,2370,',2370)
, (2372,'2013-06-24 00:43:22','2013-06-24 00:43:22',null,'四川省南充市高坪区','高坪区',',2279,2370,',2370)
, (2373,'2013-06-24 00:43:23','2013-06-24 00:43:23',null,'四川省南充市嘉陵区','嘉陵区',',2279,2370,',2370)
, (2374,'2013-06-24 00:43:24','2013-06-24 00:43:24',null,'四川省南充市南部县','南部县',',2279,2370,',2370)
, (2375,'2013-06-24 00:43:25','2013-06-24 00:43:25',null,'四川省南充市营山县','营山县',',2279,2370,',2370)
, (2376,'2013-06-24 00:43:26','2013-06-24 00:43:26',null,'四川省南充市蓬安县','蓬安县',',2279,2370,',2370)
, (2377,'2013-06-24 00:43:27','2013-06-24 00:43:27',null,'四川省南充市仪陇县','仪陇县',',2279,2370,',2370)
, (2378,'2013-06-24 00:43:28','2013-06-24 00:43:28',null,'四川省南充市西充县','西充县',',2279,2370,',2370)
, (2379,'2013-06-24 00:43:29','2013-06-24 00:43:29',null,'四川省南充市阆中市','阆中市',',2279,2370,',2370)
, (2380,'2013-06-24 00:43:30','2013-06-24 00:43:30',null,'四川省眉山市','眉山市',',2279,',2279)
, (2381,'2013-06-24 00:43:31','2013-06-24 00:43:31',null,'四川省眉山市东坡区','东坡区',',2279,2380,',2380)
, (2382,'2013-06-24 00:43:32','2013-06-24 00:43:32',null,'四川省眉山市仁寿县','仁寿县',',2279,2380,',2380)
, (2383,'2013-06-24 00:43:33','2013-06-24 00:43:33',null,'四川省眉山市彭山县','彭山县',',2279,2380,',2380)
, (2384,'2013-06-24 00:43:34','2013-06-24 00:43:34',null,'四川省眉山市洪雅县','洪雅县',',2279,2380,',2380)
, (2385,'2013-06-24 00:43:35','2013-06-24 00:43:35',null,'四川省眉山市丹棱县','丹棱县',',2279,2380,',2380)
, (2386,'2013-06-24 00:43:36','2013-06-24 00:43:36',null,'四川省眉山市青神县','青神县',',2279,2380,',2380)
, (2387,'2013-06-24 00:43:37','2013-06-24 00:43:37',null,'四川省宜宾市','宜宾市',',2279,',2279)
, (2388,'2013-06-24 00:43:38','2013-06-24 00:43:38',null,'四川省宜宾市翠屏区','翠屏区',',2279,2387,',2387)
, (2389,'2013-06-24 00:43:39','2013-06-24 00:43:39',null,'四川省宜宾市南溪区','南溪区',',2279,2387,',2387)
, (2390,'2013-06-24 00:43:40','2013-06-24 00:43:40',null,'四川省宜宾市宜宾县','宜宾县',',2279,2387,',2387)
, (2391,'2013-06-24 00:43:41','2013-06-24 00:43:41',null,'四川省宜宾市江安县','江安县',',2279,2387,',2387)
, (2392,'2013-06-24 00:43:42','2013-06-24 00:43:42',null,'四川省宜宾市长宁县','长宁县',',2279,2387,',2387)
, (2393,'2013-06-24 00:43:43','2013-06-24 00:43:43',null,'四川省宜宾市高县','高县',',2279,2387,',2387)
, (2394,'2013-06-24 00:43:44','2013-06-24 00:43:44',null,'四川省宜宾市珙县','珙县',',2279,2387,',2387)
, (2395,'2013-06-24 00:43:45','2013-06-24 00:43:45',null,'四川省宜宾市筠连县','筠连县',',2279,2387,',2387)
, (2396,'2013-06-24 00:43:46','2013-06-24 00:43:46',null,'四川省宜宾市兴文县','兴文县',',2279,2387,',2387)
, (2397,'2013-06-24 00:43:47','2013-06-24 00:43:47',null,'四川省宜宾市屏山县','屏山县',',2279,2387,',2387)
, (2398,'2013-06-24 00:43:48','2013-06-24 00:43:48',null,'四川省广安市','广安市',',2279,',2279)
, (2399,'2013-06-24 00:43:49','2013-06-24 00:43:49',null,'四川省广安市广安区','广安区',',2279,2398,',2398)
, (2400,'2013-06-24 00:43:50','2013-06-24 00:43:50',null,'四川省广安市岳池县','岳池县',',2279,2398,',2398)
, (2401,'2013-06-24 00:43:51','2013-06-24 00:43:51',null,'四川省广安市武胜县','武胜县',',2279,2398,',2398)
, (2402,'2013-06-24 00:43:52','2013-06-24 00:43:52',null,'四川省广安市邻水县','邻水县',',2279,2398,',2398)
, (2403,'2013-06-24 00:43:53','2013-06-24 00:43:53',null,'四川省广安市华蓥市','华蓥市',',2279,2398,',2398)
, (2404,'2013-06-24 00:43:54','2013-06-24 00:43:54',null,'四川省达州市','达州市',',2279,',2279)
, (2405,'2013-06-24 00:43:55','2013-06-24 00:43:55',null,'四川省达州市通川区','通川区',',2279,2404,',2404)
, (2406,'2013-06-24 00:43:56','2013-06-24 00:43:56',null,'四川省达州市达县','达县',',2279,2404,',2404)
, (2407,'2013-06-24 00:43:57','2013-06-24 00:43:57',null,'四川省达州市宣汉县','宣汉县',',2279,2404,',2404)
, (2408,'2013-06-24 00:43:58','2013-06-24 00:43:58',null,'四川省达州市开江县','开江县',',2279,2404,',2404)
, (2409,'2013-06-24 00:43:59','2013-06-24 00:43:59',null,'四川省达州市大竹县','大竹县',',2279,2404,',2404)
, (2410,'2013-06-24 00:44:00','2013-06-24 00:44:00',null,'四川省达州市渠县','渠县',',2279,2404,',2404)
, (2411,'2013-06-24 00:44:01','2013-06-24 00:44:01',null,'四川省达州市万源市','万源市',',2279,2404,',2404)
, (2412,'2013-06-24 00:44:02','2013-06-24 00:44:02',null,'四川省雅安市','雅安市',',2279,',2279)
, (2413,'2013-06-24 00:44:03','2013-06-24 00:44:03',null,'四川省雅安市雨城区','雨城区',',2279,2412,',2412)
, (2414,'2013-06-24 00:44:04','2013-06-24 00:44:04',null,'四川省雅安市名山区','名山区',',2279,2412,',2412)
, (2415,'2013-06-24 00:44:05','2013-06-24 00:44:05',null,'四川省雅安市荥经县','荥经县',',2279,2412,',2412)
, (2416,'2013-06-24 00:44:06','2013-06-24 00:44:06',null,'四川省雅安市汉源县','汉源县',',2279,2412,',2412)
, (2417,'2013-06-24 00:44:07','2013-06-24 00:44:07',null,'四川省雅安市石棉县','石棉县',',2279,2412,',2412)
, (2418,'2013-06-24 00:44:08','2013-06-24 00:44:08',null,'四川省雅安市天全县','天全县',',2279,2412,',2412)
, (2419,'2013-06-24 00:44:09','2013-06-24 00:44:09',null,'四川省雅安市芦山县','芦山县',',2279,2412,',2412)
, (2420,'2013-06-24 00:44:10','2013-06-24 00:44:10',null,'四川省雅安市宝兴县','宝兴县',',2279,2412,',2412)
, (2421,'2013-06-24 00:44:11','2013-06-24 00:44:11',null,'四川省巴中市','巴中市',',2279,',2279)
, (2422,'2013-06-24 00:44:12','2013-06-24 00:44:12',null,'四川省巴中市巴州区','巴州区',',2279,2421,',2421)
, (2423,'2013-06-24 00:44:13','2013-06-24 00:44:13',null,'四川省巴中市通江县','通江县',',2279,2421,',2421)
, (2424,'2013-06-24 00:44:14','2013-06-24 00:44:14',null,'四川省巴中市南江县','南江县',',2279,2421,',2421)
, (2425,'2013-06-24 00:44:15','2013-06-24 00:44:15',null,'四川省巴中市平昌县','平昌县',',2279,2421,',2421)
, (2426,'2013-06-24 00:44:16','2013-06-24 00:44:16',null,'四川省资阳市','资阳市',',2279,',2279)
, (2427,'2013-06-24 00:44:17','2013-06-24 00:44:17',null,'四川省资阳市雁江区','雁江区',',2279,2426,',2426)
, (2428,'2013-06-24 00:44:18','2013-06-24 00:44:18',null,'四川省资阳市安岳县','安岳县',',2279,2426,',2426)
, (2429,'2013-06-24 00:44:19','2013-06-24 00:44:19',null,'四川省资阳市乐至县','乐至县',',2279,2426,',2426)
, (2430,'2013-06-24 00:44:20','2013-06-24 00:44:20',null,'四川省资阳市简阳市','简阳市',',2279,2426,',2426)
, (2431,'2013-06-24 00:44:21','2013-06-24 00:44:21',null,'四川省阿坝藏族羌族自治州','阿坝藏族羌族自治州',',2279,',2279)
, (2432,'2013-06-24 00:44:22','2013-06-24 00:44:22',null,'四川省阿坝藏族羌族自治州汶川县','汶川县',',2279,2431,',2431)
, (2433,'2013-06-24 00:44:23','2013-06-24 00:44:23',null,'四川省阿坝藏族羌族自治州理县','理县',',2279,2431,',2431)
, (2434,'2013-06-24 00:44:24','2013-06-24 00:44:24',null,'四川省阿坝藏族羌族自治州茂县','茂县',',2279,2431,',2431)
, (2435,'2013-06-24 00:44:25','2013-06-24 00:44:25',null,'四川省阿坝藏族羌族自治州松潘县','松潘县',',2279,2431,',2431)
, (2436,'2013-06-24 00:44:26','2013-06-24 00:44:26',null,'四川省阿坝藏族羌族自治州九寨沟县','九寨沟县',',2279,2431,',2431)
, (2437,'2013-06-24 00:44:27','2013-06-24 00:44:27',null,'四川省阿坝藏族羌族自治州金川县','金川县',',2279,2431,',2431)
, (2438,'2013-06-24 00:44:28','2013-06-24 00:44:28',null,'四川省阿坝藏族羌族自治州小金县','小金县',',2279,2431,',2431)
, (2439,'2013-06-24 00:44:29','2013-06-24 00:44:29',null,'四川省阿坝藏族羌族自治州黑水县','黑水县',',2279,2431,',2431)
, (2440,'2013-06-24 00:44:30','2013-06-24 00:44:30',null,'四川省阿坝藏族羌族自治州马尔康县','马尔康县',',2279,2431,',2431)
, (2441,'2013-06-24 00:44:31','2013-06-24 00:44:31',null,'四川省阿坝藏族羌族自治州壤塘县','壤塘县',',2279,2431,',2431)
, (2442,'2013-06-24 00:44:32','2013-06-24 00:44:32',null,'四川省阿坝藏族羌族自治州阿坝县','阿坝县',',2279,2431,',2431)
, (2443,'2013-06-24 00:44:33','2013-06-24 00:44:33',null,'四川省阿坝藏族羌族自治州若尔盖县','若尔盖县',',2279,2431,',2431)
, (2444,'2013-06-24 00:44:34','2013-06-24 00:44:34',null,'四川省阿坝藏族羌族自治州红原县','红原县',',2279,2431,',2431)
, (2445,'2013-06-24 00:44:35','2013-06-24 00:44:35',null,'四川省甘孜藏族自治州','甘孜藏族自治州',',2279,',2279)
, (2446,'2013-06-24 00:44:36','2013-06-24 00:44:36',null,'四川省甘孜藏族自治州康定县','康定县',',2279,2445,',2445)
, (2447,'2013-06-24 00:44:37','2013-06-24 00:44:37',null,'四川省甘孜藏族自治州泸定县','泸定县',',2279,2445,',2445)
, (2448,'2013-06-24 00:44:38','2013-06-24 00:44:38',null,'四川省甘孜藏族自治州丹巴县','丹巴县',',2279,2445,',2445)
, (2449,'2013-06-24 00:44:39','2013-06-24 00:44:39',null,'四川省甘孜藏族自治州九龙县','九龙县',',2279,2445,',2445)
, (2450,'2013-06-24 00:44:40','2013-06-24 00:44:40',null,'四川省甘孜藏族自治州雅江县','雅江县',',2279,2445,',2445)
, (2451,'2013-06-24 00:44:41','2013-06-24 00:44:41',null,'四川省甘孜藏族自治州道孚县','道孚县',',2279,2445,',2445)
, (2452,'2013-06-24 00:44:42','2013-06-24 00:44:42',null,'四川省甘孜藏族自治州炉霍县','炉霍县',',2279,2445,',2445)
, (2453,'2013-06-24 00:44:43','2013-06-24 00:44:43',null,'四川省甘孜藏族自治州甘孜县','甘孜县',',2279,2445,',2445)
, (2454,'2013-06-24 00:44:44','2013-06-24 00:44:44',null,'四川省甘孜藏族自治州新龙县','新龙县',',2279,2445,',2445)
, (2455,'2013-06-24 00:44:45','2013-06-24 00:44:45',null,'四川省甘孜藏族自治州德格县','德格县',',2279,2445,',2445)
, (2456,'2013-06-24 00:44:46','2013-06-24 00:44:46',null,'四川省甘孜藏族自治州白玉县','白玉县',',2279,2445,',2445)
, (2457,'2013-06-24 00:44:47','2013-06-24 00:44:47',null,'四川省甘孜藏族自治州石渠县','石渠县',',2279,2445,',2445)
, (2458,'2013-06-24 00:44:48','2013-06-24 00:44:48',null,'四川省甘孜藏族自治州色达县','色达县',',2279,2445,',2445)
, (2459,'2013-06-24 00:44:49','2013-06-24 00:44:49',null,'四川省甘孜藏族自治州理塘县','理塘县',',2279,2445,',2445)
, (2460,'2013-06-24 00:44:50','2013-06-24 00:44:50',null,'四川省甘孜藏族自治州巴塘县','巴塘县',',2279,2445,',2445)
, (2461,'2013-06-24 00:44:51','2013-06-24 00:44:51',null,'四川省甘孜藏族自治州乡城县','乡城县',',2279,2445,',2445)
, (2462,'2013-06-24 00:44:52','2013-06-24 00:44:52',null,'四川省甘孜藏族自治州稻城县','稻城县',',2279,2445,',2445)
, (2463,'2013-06-24 00:44:53','2013-06-24 00:44:53',null,'四川省甘孜藏族自治州得荣县','得荣县',',2279,2445,',2445)
, (2464,'2013-06-24 00:44:54','2013-06-24 00:44:54',null,'四川省凉山彝族自治州','凉山彝族自治州',',2279,',2279)
, (2465,'2013-06-24 00:44:55','2013-06-24 00:44:55',null,'四川省凉山彝族自治州西昌市','西昌市',',2279,2464,',2464)
, (2466,'2013-06-24 00:44:56','2013-06-24 00:44:56',null,'四川省凉山彝族自治州木里藏族自治县','木里藏族自治县',',2279,2464,',2464)
, (2467,'2013-06-24 00:44:57','2013-06-24 00:44:57',null,'四川省凉山彝族自治州盐源县','盐源县',',2279,2464,',2464)
, (2468,'2013-06-24 00:44:58','2013-06-24 00:44:58',null,'四川省凉山彝族自治州德昌县','德昌县',',2279,2464,',2464)
, (2469,'2013-06-24 00:44:59','2013-06-24 00:44:59',null,'四川省凉山彝族自治州会理县','会理县',',2279,2464,',2464)
, (2470,'2013-06-24 00:45:00','2013-06-24 00:45:00',null,'四川省凉山彝族自治州会东县','会东县',',2279,2464,',2464)
, (2471,'2013-06-24 00:45:01','2013-06-24 00:45:01',null,'四川省凉山彝族自治州宁南县','宁南县',',2279,2464,',2464)
, (2472,'2013-06-24 00:45:02','2013-06-24 00:45:02',null,'四川省凉山彝族自治州普格县','普格县',',2279,2464,',2464)
, (2473,'2013-06-24 00:45:03','2013-06-24 00:45:03',null,'四川省凉山彝族自治州布拖县','布拖县',',2279,2464,',2464)
, (2474,'2013-06-24 00:45:04','2013-06-24 00:45:04',null,'四川省凉山彝族自治州金阳县','金阳县',',2279,2464,',2464)
, (2475,'2013-06-24 00:45:05','2013-06-24 00:45:05',null,'四川省凉山彝族自治州昭觉县','昭觉县',',2279,2464,',2464)
, (2476,'2013-06-24 00:45:06','2013-06-24 00:45:06',null,'四川省凉山彝族自治州喜德县','喜德县',',2279,2464,',2464)
, (2477,'2013-06-24 00:45:07','2013-06-24 00:45:07',null,'四川省凉山彝族自治州冕宁县','冕宁县',',2279,2464,',2464)
, (2478,'2013-06-24 00:45:08','2013-06-24 00:45:08',null,'四川省凉山彝族自治州越西县','越西县',',2279,2464,',2464)
, (2479,'2013-06-24 00:45:09','2013-06-24 00:45:09',null,'四川省凉山彝族自治州甘洛县','甘洛县',',2279,2464,',2464)
, (2480,'2013-06-24 00:45:10','2013-06-24 00:45:10',null,'四川省凉山彝族自治州美姑县','美姑县',',2279,2464,',2464)
, (2481,'2013-06-24 00:45:11','2013-06-24 00:45:11',null,'四川省凉山彝族自治州雷波县','雷波县',',2279,2464,',2464)
, (2482,'2013-06-24 00:45:12','2013-06-24 00:45:12',null,'贵州省','贵州省',',',null)
, (2483,'2013-06-24 00:45:13','2013-06-24 00:45:13',null,'贵州省贵阳市','贵阳市',',2482,',2482)
, (2484,'2013-06-24 00:45:14','2013-06-24 00:45:14',null,'贵州省贵阳市南明区','南明区',',2482,2483,',2483)
, (2485,'2013-06-24 00:45:15','2013-06-24 00:45:15',null,'贵州省贵阳市云岩区','云岩区',',2482,2483,',2483)
, (2486,'2013-06-24 00:45:16','2013-06-24 00:45:16',null,'贵州省贵阳市花溪区','花溪区',',2482,2483,',2483)
, (2487,'2013-06-24 00:45:17','2013-06-24 00:45:17',null,'贵州省贵阳市乌当区','乌当区',',2482,2483,',2483)
, (2488,'2013-06-24 00:45:18','2013-06-24 00:45:18',null,'贵州省贵阳市白云区','白云区',',2482,2483,',2483)
, (2489,'2013-06-24 00:45:19','2013-06-24 00:45:19',null,'贵州省贵阳市小河区','小河区',',2482,2483,',2483)
, (2490,'2013-06-24 00:45:20','2013-06-24 00:45:20',null,'贵州省贵阳市开阳县','开阳县',',2482,2483,',2483)
, (2491,'2013-06-24 00:45:21','2013-06-24 00:45:21',null,'贵州省贵阳市息烽县','息烽县',',2482,2483,',2483)
, (2492,'2013-06-24 00:45:22','2013-06-24 00:45:22',null,'贵州省贵阳市修文县','修文县',',2482,2483,',2483)
, (2493,'2013-06-24 00:45:23','2013-06-24 00:45:23',null,'贵州省贵阳市清镇市','清镇市',',2482,2483,',2483)
, (2494,'2013-06-24 00:45:24','2013-06-24 00:45:24',null,'贵州省六盘水市','六盘水市',',2482,',2482)
, (2495,'2013-06-24 00:45:25','2013-06-24 00:45:25',null,'贵州省六盘水市钟山区','钟山区',',2482,2494,',2494)
, (2496,'2013-06-24 00:45:26','2013-06-24 00:45:26',null,'贵州省六盘水市六枝特区','六枝特区',',2482,2494,',2494)
, (2497,'2013-06-24 00:45:27','2013-06-24 00:45:27',null,'贵州省六盘水市水城县','水城县',',2482,2494,',2494)
, (2498,'2013-06-24 00:45:28','2013-06-24 00:45:28',null,'贵州省六盘水市盘县','盘县',',2482,2494,',2494)
, (2499,'2013-06-24 00:45:29','2013-06-24 00:45:29',null,'贵州省遵义市','遵义市',',2482,',2482)
, (2500,'2013-06-24 00:45:30','2013-06-24 00:45:30',null,'贵州省遵义市红花岗区','红花岗区',',2482,2499,',2499);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (2501,'2013-06-24 00:45:31','2013-06-24 00:45:31',null,'贵州省遵义市汇川区','汇川区',',2482,2499,',2499)
, (2502,'2013-06-24 00:45:32','2013-06-24 00:45:32',null,'贵州省遵义市遵义县','遵义县',',2482,2499,',2499)
, (2503,'2013-06-24 00:45:33','2013-06-24 00:45:33',null,'贵州省遵义市桐梓县','桐梓县',',2482,2499,',2499)
, (2504,'2013-06-24 00:45:34','2013-06-24 00:45:34',null,'贵州省遵义市绥阳县','绥阳县',',2482,2499,',2499)
, (2505,'2013-06-24 00:45:35','2013-06-24 00:45:35',null,'贵州省遵义市正安县','正安县',',2482,2499,',2499)
, (2506,'2013-06-24 00:45:36','2013-06-24 00:45:36',null,'贵州省遵义市道真仡佬族苗族自治县','道真仡佬族苗族自治县',',2482,2499,',2499)
, (2507,'2013-06-24 00:45:37','2013-06-24 00:45:37',null,'贵州省遵义市务川仡佬族苗族自治县','务川仡佬族苗族自治县',',2482,2499,',2499)
, (2508,'2013-06-24 00:45:38','2013-06-24 00:45:38',null,'贵州省遵义市凤冈县','凤冈县',',2482,2499,',2499)
, (2509,'2013-06-24 00:45:39','2013-06-24 00:45:39',null,'贵州省遵义市湄潭县','湄潭县',',2482,2499,',2499)
, (2510,'2013-06-24 00:45:40','2013-06-24 00:45:40',null,'贵州省遵义市余庆县','余庆县',',2482,2499,',2499)
, (2511,'2013-06-24 00:45:41','2013-06-24 00:45:41',null,'贵州省遵义市习水县','习水县',',2482,2499,',2499)
, (2512,'2013-06-24 00:45:42','2013-06-24 00:45:42',null,'贵州省遵义市赤水市','赤水市',',2482,2499,',2499)
, (2513,'2013-06-24 00:45:43','2013-06-24 00:45:43',null,'贵州省遵义市仁怀市','仁怀市',',2482,2499,',2499)
, (2514,'2013-06-24 00:45:44','2013-06-24 00:45:44',null,'贵州省安顺市','安顺市',',2482,',2482)
, (2515,'2013-06-24 00:45:45','2013-06-24 00:45:45',null,'贵州省安顺市西秀区','西秀区',',2482,2514,',2514)
, (2516,'2013-06-24 00:45:46','2013-06-24 00:45:46',null,'贵州省安顺市平坝县','平坝县',',2482,2514,',2514)
, (2517,'2013-06-24 00:45:47','2013-06-24 00:45:47',null,'贵州省安顺市普定县','普定县',',2482,2514,',2514)
, (2518,'2013-06-24 00:45:48','2013-06-24 00:45:48',null,'贵州省安顺市镇宁布依族苗族自治县','镇宁布依族苗族自治县',',2482,2514,',2514)
, (2519,'2013-06-24 00:45:49','2013-06-24 00:45:49',null,'贵州省安顺市关岭布依族苗族自治县','关岭布依族苗族自治县',',2482,2514,',2514)
, (2520,'2013-06-24 00:45:50','2013-06-24 00:45:50',null,'贵州省安顺市紫云苗族布依族自治县','紫云苗族布依族自治县',',2482,2514,',2514)
, (2521,'2013-06-24 00:45:51','2013-06-24 00:45:51',null,'贵州省毕节市','毕节市',',2482,',2482)
, (2522,'2013-06-24 00:45:52','2013-06-24 00:45:52',null,'贵州省毕节市七星关区','七星关区',',2482,2521,',2521)
, (2523,'2013-06-24 00:45:53','2013-06-24 00:45:53',null,'贵州省毕节市大方县','大方县',',2482,2521,',2521)
, (2524,'2013-06-24 00:45:54','2013-06-24 00:45:54',null,'贵州省毕节市黔西县','黔西县',',2482,2521,',2521)
, (2525,'2013-06-24 00:45:55','2013-06-24 00:45:55',null,'贵州省毕节市金沙县','金沙县',',2482,2521,',2521)
, (2526,'2013-06-24 00:45:56','2013-06-24 00:45:56',null,'贵州省毕节市织金县','织金县',',2482,2521,',2521)
, (2527,'2013-06-24 00:45:57','2013-06-24 00:45:57',null,'贵州省毕节市纳雍县','纳雍县',',2482,2521,',2521)
, (2528,'2013-06-24 00:45:58','2013-06-24 00:45:58',null,'贵州省毕节市威宁彝族回族苗族自治县','威宁彝族回族苗族自治县',',2482,2521,',2521)
, (2529,'2013-06-24 00:45:59','2013-06-24 00:45:59',null,'贵州省毕节市赫章县','赫章县',',2482,2521,',2521)
, (2530,'2013-06-24 00:46:00','2013-06-24 00:46:00',null,'贵州省铜仁市','铜仁市',',2482,',2482)
, (2531,'2013-06-24 00:46:01','2013-06-24 00:46:01',null,'贵州省铜仁市碧江区','碧江区',',2482,2530,',2530)
, (2532,'2013-06-24 00:46:02','2013-06-24 00:46:02',null,'贵州省铜仁市万山区','万山区',',2482,2530,',2530)
, (2533,'2013-06-24 00:46:03','2013-06-24 00:46:03',null,'贵州省铜仁市江口县','江口县',',2482,2530,',2530)
, (2534,'2013-06-24 00:46:04','2013-06-24 00:46:04',null,'贵州省铜仁市玉屏侗族自治县','玉屏侗族自治县',',2482,2530,',2530)
, (2535,'2013-06-24 00:46:05','2013-06-24 00:46:05',null,'贵州省铜仁市石阡县','石阡县',',2482,2530,',2530)
, (2536,'2013-06-24 00:46:06','2013-06-24 00:46:06',null,'贵州省铜仁市思南县','思南县',',2482,2530,',2530)
, (2537,'2013-06-24 00:46:07','2013-06-24 00:46:07',null,'贵州省铜仁市印江土家族苗族自治县','印江土家族苗族自治县',',2482,2530,',2530)
, (2538,'2013-06-24 00:46:08','2013-06-24 00:46:08',null,'贵州省铜仁市德江县','德江县',',2482,2530,',2530)
, (2539,'2013-06-24 00:46:09','2013-06-24 00:46:09',null,'贵州省铜仁市沿河土家族自治县','沿河土家族自治县',',2482,2530,',2530)
, (2540,'2013-06-24 00:46:10','2013-06-24 00:46:10',null,'贵州省铜仁市松桃苗族自治县','松桃苗族自治县',',2482,2530,',2530)
, (2541,'2013-06-24 00:46:11','2013-06-24 00:46:11',null,'贵州省黔西南布依族苗族自治州','黔西南布依族苗族自治州',',2482,',2482)
, (2542,'2013-06-24 00:46:12','2013-06-24 00:46:12',null,'贵州省黔西南布依族苗族自治州兴义市','兴义市',',2482,2541,',2541)
, (2543,'2013-06-24 00:46:13','2013-06-24 00:46:13',null,'贵州省黔西南布依族苗族自治州兴仁县','兴仁县',',2482,2541,',2541)
, (2544,'2013-06-24 00:46:14','2013-06-24 00:46:14',null,'贵州省黔西南布依族苗族自治州普安县','普安县',',2482,2541,',2541)
, (2545,'2013-06-24 00:46:15','2013-06-24 00:46:15',null,'贵州省黔西南布依族苗族自治州晴隆县','晴隆县',',2482,2541,',2541)
, (2546,'2013-06-24 00:46:16','2013-06-24 00:46:16',null,'贵州省黔西南布依族苗族自治州贞丰县','贞丰县',',2482,2541,',2541)
, (2547,'2013-06-24 00:46:17','2013-06-24 00:46:17',null,'贵州省黔西南布依族苗族自治州望谟县','望谟县',',2482,2541,',2541)
, (2548,'2013-06-24 00:46:18','2013-06-24 00:46:18',null,'贵州省黔西南布依族苗族自治州册亨县','册亨县',',2482,2541,',2541)
, (2549,'2013-06-24 00:46:19','2013-06-24 00:46:19',null,'贵州省黔西南布依族苗族自治州安龙县','安龙县',',2482,2541,',2541)
, (2550,'2013-06-24 00:46:20','2013-06-24 00:46:20',null,'贵州省黔东南苗族侗族自治州','黔东南苗族侗族自治州',',2482,',2482)
, (2551,'2013-06-24 00:46:21','2013-06-24 00:46:21',null,'贵州省黔东南苗族侗族自治州凯里市','凯里市',',2482,2550,',2550)
, (2552,'2013-06-24 00:46:22','2013-06-24 00:46:22',null,'贵州省黔东南苗族侗族自治州黄平县','黄平县',',2482,2550,',2550)
, (2553,'2013-06-24 00:46:23','2013-06-24 00:46:23',null,'贵州省黔东南苗族侗族自治州施秉县','施秉县',',2482,2550,',2550)
, (2554,'2013-06-24 00:46:24','2013-06-24 00:46:24',null,'贵州省黔东南苗族侗族自治州三穗县','三穗县',',2482,2550,',2550)
, (2555,'2013-06-24 00:46:25','2013-06-24 00:46:25',null,'贵州省黔东南苗族侗族自治州镇远县','镇远县',',2482,2550,',2550)
, (2556,'2013-06-24 00:46:26','2013-06-24 00:46:26',null,'贵州省黔东南苗族侗族自治州岑巩县','岑巩县',',2482,2550,',2550)
, (2557,'2013-06-24 00:46:27','2013-06-24 00:46:27',null,'贵州省黔东南苗族侗族自治州天柱县','天柱县',',2482,2550,',2550)
, (2558,'2013-06-24 00:46:28','2013-06-24 00:46:28',null,'贵州省黔东南苗族侗族自治州锦屏县','锦屏县',',2482,2550,',2550)
, (2559,'2013-06-24 00:46:29','2013-06-24 00:46:29',null,'贵州省黔东南苗族侗族自治州剑河县','剑河县',',2482,2550,',2550)
, (2560,'2013-06-24 00:46:30','2013-06-24 00:46:30',null,'贵州省黔东南苗族侗族自治州台江县','台江县',',2482,2550,',2550)
, (2561,'2013-06-24 00:46:31','2013-06-24 00:46:31',null,'贵州省黔东南苗族侗族自治州黎平县','黎平县',',2482,2550,',2550)
, (2562,'2013-06-24 00:46:32','2013-06-24 00:46:32',null,'贵州省黔东南苗族侗族自治州榕江县','榕江县',',2482,2550,',2550)
, (2563,'2013-06-24 00:46:33','2013-06-24 00:46:33',null,'贵州省黔东南苗族侗族自治州从江县','从江县',',2482,2550,',2550)
, (2564,'2013-06-24 00:46:34','2013-06-24 00:46:34',null,'贵州省黔东南苗族侗族自治州雷山县','雷山县',',2482,2550,',2550)
, (2565,'2013-06-24 00:46:35','2013-06-24 00:46:35',null,'贵州省黔东南苗族侗族自治州麻江县','麻江县',',2482,2550,',2550)
, (2566,'2013-06-24 00:46:36','2013-06-24 00:46:36',null,'贵州省黔东南苗族侗族自治州丹寨县','丹寨县',',2482,2550,',2550)
, (2567,'2013-06-24 00:46:37','2013-06-24 00:46:37',null,'贵州省黔南布依族苗族自治州','黔南布依族苗族自治州',',2482,',2482)
, (2568,'2013-06-24 00:46:38','2013-06-24 00:46:38',null,'贵州省黔南布依族苗族自治州都匀市','都匀市',',2482,2567,',2567)
, (2569,'2013-06-24 00:46:39','2013-06-24 00:46:39',null,'贵州省黔南布依族苗族自治州福泉市','福泉市',',2482,2567,',2567)
, (2570,'2013-06-24 00:46:40','2013-06-24 00:46:40',null,'贵州省黔南布依族苗族自治州荔波县','荔波县',',2482,2567,',2567)
, (2571,'2013-06-24 00:46:41','2013-06-24 00:46:41',null,'贵州省黔南布依族苗族自治州贵定县','贵定县',',2482,2567,',2567)
, (2572,'2013-06-24 00:46:42','2013-06-24 00:46:42',null,'贵州省黔南布依族苗族自治州瓮安县','瓮安县',',2482,2567,',2567)
, (2573,'2013-06-24 00:46:43','2013-06-24 00:46:43',null,'贵州省黔南布依族苗族自治州独山县','独山县',',2482,2567,',2567)
, (2574,'2013-06-24 00:46:44','2013-06-24 00:46:44',null,'贵州省黔南布依族苗族自治州平塘县','平塘县',',2482,2567,',2567)
, (2575,'2013-06-24 00:46:45','2013-06-24 00:46:45',null,'贵州省黔南布依族苗族自治州罗甸县','罗甸县',',2482,2567,',2567)
, (2576,'2013-06-24 00:46:46','2013-06-24 00:46:46',null,'贵州省黔南布依族苗族自治州长顺县','长顺县',',2482,2567,',2567)
, (2577,'2013-06-24 00:46:47','2013-06-24 00:46:47',null,'贵州省黔南布依族苗族自治州龙里县','龙里县',',2482,2567,',2567)
, (2578,'2013-06-24 00:46:48','2013-06-24 00:46:48',null,'贵州省黔南布依族苗族自治州惠水县','惠水县',',2482,2567,',2567)
, (2579,'2013-06-24 00:46:49','2013-06-24 00:46:49',null,'贵州省黔南布依族苗族自治州三都水族自治县','三都水族自治县',',2482,2567,',2567)
, (2580,'2013-06-24 00:46:50','2013-06-24 00:46:50',null,'云南省','云南省',',',null)
, (2581,'2013-06-24 00:46:51','2013-06-24 00:46:51',null,'云南省昆明市','昆明市',',2580,',2580)
, (2582,'2013-06-24 00:46:52','2013-06-24 00:46:52',null,'云南省昆明市五华区','五华区',',2580,2581,',2581)
, (2583,'2013-06-24 00:46:53','2013-06-24 00:46:53',null,'云南省昆明市盘龙区','盘龙区',',2580,2581,',2581)
, (2584,'2013-06-24 00:46:54','2013-06-24 00:46:54',null,'云南省昆明市官渡区','官渡区',',2580,2581,',2581)
, (2585,'2013-06-24 00:46:55','2013-06-24 00:46:55',null,'云南省昆明市西山区','西山区',',2580,2581,',2581)
, (2586,'2013-06-24 00:46:56','2013-06-24 00:46:56',null,'云南省昆明市东川区','东川区',',2580,2581,',2581)
, (2587,'2013-06-24 00:46:57','2013-06-24 00:46:57',null,'云南省昆明市呈贡区','呈贡区',',2580,2581,',2581)
, (2588,'2013-06-24 00:46:58','2013-06-24 00:46:58',null,'云南省昆明市晋宁县','晋宁县',',2580,2581,',2581)
, (2589,'2013-06-24 00:46:59','2013-06-24 00:46:59',null,'云南省昆明市富民县','富民县',',2580,2581,',2581)
, (2590,'2013-06-24 00:47:00','2013-06-24 00:47:00',null,'云南省昆明市宜良县','宜良县',',2580,2581,',2581)
, (2591,'2013-06-24 00:47:01','2013-06-24 00:47:01',null,'云南省昆明市石林彝族自治县','石林彝族自治县',',2580,2581,',2581)
, (2592,'2013-06-24 00:47:02','2013-06-24 00:47:02',null,'云南省昆明市嵩明县','嵩明县',',2580,2581,',2581)
, (2593,'2013-06-24 00:47:03','2013-06-24 00:47:03',null,'云南省昆明市禄劝彝族苗族自治县','禄劝彝族苗族自治县',',2580,2581,',2581)
, (2594,'2013-06-24 00:47:04','2013-06-24 00:47:04',null,'云南省昆明市寻甸回族彝族自治县','寻甸回族彝族自治县',',2580,2581,',2581)
, (2595,'2013-06-24 00:47:05','2013-06-24 00:47:05',null,'云南省昆明市安宁市','安宁市',',2580,2581,',2581)
, (2596,'2013-06-24 00:47:06','2013-06-24 00:47:06',null,'云南省曲靖市','曲靖市',',2580,',2580)
, (2597,'2013-06-24 00:47:07','2013-06-24 00:47:07',null,'云南省曲靖市麒麟区','麒麟区',',2580,2596,',2596)
, (2598,'2013-06-24 00:47:08','2013-06-24 00:47:08',null,'云南省曲靖市马龙县','马龙县',',2580,2596,',2596)
, (2599,'2013-06-24 00:47:09','2013-06-24 00:47:09',null,'云南省曲靖市陆良县','陆良县',',2580,2596,',2596)
, (2600,'2013-06-24 00:47:10','2013-06-24 00:47:10',null,'云南省曲靖市师宗县','师宗县',',2580,2596,',2596)
, (2601,'2013-06-24 00:47:11','2013-06-24 00:47:11',null,'云南省曲靖市罗平县','罗平县',',2580,2596,',2596)
, (2602,'2013-06-24 00:47:12','2013-06-24 00:47:12',null,'云南省曲靖市富源县','富源县',',2580,2596,',2596)
, (2603,'2013-06-24 00:47:13','2013-06-24 00:47:13',null,'云南省曲靖市会泽县','会泽县',',2580,2596,',2596)
, (2604,'2013-06-24 00:47:14','2013-06-24 00:47:14',null,'云南省曲靖市沾益县','沾益县',',2580,2596,',2596)
, (2605,'2013-06-24 00:47:15','2013-06-24 00:47:15',null,'云南省曲靖市宣威市','宣威市',',2580,2596,',2596)
, (2606,'2013-06-24 00:47:16','2013-06-24 00:47:16',null,'云南省玉溪市','玉溪市',',2580,',2580)
, (2607,'2013-06-24 00:47:17','2013-06-24 00:47:17',null,'云南省玉溪市红塔区','红塔区',',2580,2606,',2606)
, (2608,'2013-06-24 00:47:18','2013-06-24 00:47:18',null,'云南省玉溪市江川县','江川县',',2580,2606,',2606)
, (2609,'2013-06-24 00:47:19','2013-06-24 00:47:19',null,'云南省玉溪市澄江县','澄江县',',2580,2606,',2606)
, (2610,'2013-06-24 00:47:20','2013-06-24 00:47:20',null,'云南省玉溪市通海县','通海县',',2580,2606,',2606)
, (2611,'2013-06-24 00:47:21','2013-06-24 00:47:21',null,'云南省玉溪市华宁县','华宁县',',2580,2606,',2606)
, (2612,'2013-06-24 00:47:22','2013-06-24 00:47:22',null,'云南省玉溪市易门县','易门县',',2580,2606,',2606)
, (2613,'2013-06-24 00:47:23','2013-06-24 00:47:23',null,'云南省玉溪市峨山彝族自治县','峨山彝族自治县',',2580,2606,',2606)
, (2614,'2013-06-24 00:47:24','2013-06-24 00:47:24',null,'云南省玉溪市新平彝族傣族自治县','新平彝族傣族自治县',',2580,2606,',2606)
, (2615,'2013-06-24 00:47:25','2013-06-24 00:47:25',null,'云南省玉溪市元江哈尼族彝族傣族自治县','元江哈尼族彝族傣族自治县',',2580,2606,',2606)
, (2616,'2013-06-24 00:47:26','2013-06-24 00:47:26',null,'云南省保山市','保山市',',2580,',2580)
, (2617,'2013-06-24 00:47:27','2013-06-24 00:47:27',null,'云南省保山市隆阳区','隆阳区',',2580,2616,',2616)
, (2618,'2013-06-24 00:47:28','2013-06-24 00:47:28',null,'云南省保山市施甸县','施甸县',',2580,2616,',2616)
, (2619,'2013-06-24 00:47:29','2013-06-24 00:47:29',null,'云南省保山市腾冲县','腾冲县',',2580,2616,',2616)
, (2620,'2013-06-24 00:47:30','2013-06-24 00:47:30',null,'云南省保山市龙陵县','龙陵县',',2580,2616,',2616)
, (2621,'2013-06-24 00:47:31','2013-06-24 00:47:31',null,'云南省保山市昌宁县','昌宁县',',2580,2616,',2616)
, (2622,'2013-06-24 00:47:32','2013-06-24 00:47:32',null,'云南省昭通市','昭通市',',2580,',2580)
, (2623,'2013-06-24 00:47:33','2013-06-24 00:47:33',null,'云南省昭通市昭阳区','昭阳区',',2580,2622,',2622)
, (2624,'2013-06-24 00:47:34','2013-06-24 00:47:34',null,'云南省昭通市鲁甸县','鲁甸县',',2580,2622,',2622)
, (2625,'2013-06-24 00:47:35','2013-06-24 00:47:35',null,'云南省昭通市巧家县','巧家县',',2580,2622,',2622)
, (2626,'2013-06-24 00:47:36','2013-06-24 00:47:36',null,'云南省昭通市盐津县','盐津县',',2580,2622,',2622)
, (2627,'2013-06-24 00:47:37','2013-06-24 00:47:37',null,'云南省昭通市大关县','大关县',',2580,2622,',2622)
, (2628,'2013-06-24 00:47:38','2013-06-24 00:47:38',null,'云南省昭通市永善县','永善县',',2580,2622,',2622)
, (2629,'2013-06-24 00:47:39','2013-06-24 00:47:39',null,'云南省昭通市绥江县','绥江县',',2580,2622,',2622)
, (2630,'2013-06-24 00:47:40','2013-06-24 00:47:40',null,'云南省昭通市镇雄县','镇雄县',',2580,2622,',2622)
, (2631,'2013-06-24 00:47:41','2013-06-24 00:47:41',null,'云南省昭通市彝良县','彝良县',',2580,2622,',2622)
, (2632,'2013-06-24 00:47:42','2013-06-24 00:47:42',null,'云南省昭通市威信县','威信县',',2580,2622,',2622)
, (2633,'2013-06-24 00:47:43','2013-06-24 00:47:43',null,'云南省昭通市水富县','水富县',',2580,2622,',2622)
, (2634,'2013-06-24 00:47:44','2013-06-24 00:47:44',null,'云南省丽江市','丽江市',',2580,',2580)
, (2635,'2013-06-24 00:47:45','2013-06-24 00:47:45',null,'云南省丽江市古城区','古城区',',2580,2634,',2634)
, (2636,'2013-06-24 00:47:46','2013-06-24 00:47:46',null,'云南省丽江市玉龙纳西族自治县','玉龙纳西族自治县',',2580,2634,',2634)
, (2637,'2013-06-24 00:47:47','2013-06-24 00:47:47',null,'云南省丽江市永胜县','永胜县',',2580,2634,',2634)
, (2638,'2013-06-24 00:47:48','2013-06-24 00:47:48',null,'云南省丽江市华坪县','华坪县',',2580,2634,',2634)
, (2639,'2013-06-24 00:47:49','2013-06-24 00:47:49',null,'云南省丽江市宁蒗彝族自治县','宁蒗彝族自治县',',2580,2634,',2634)
, (2640,'2013-06-24 00:47:50','2013-06-24 00:47:50',null,'云南省普洱市','普洱市',',2580,',2580)
, (2641,'2013-06-24 00:47:51','2013-06-24 00:47:51',null,'云南省普洱市思茅区','思茅区',',2580,2640,',2640)
, (2642,'2013-06-24 00:47:52','2013-06-24 00:47:52',null,'云南省普洱市宁洱哈尼族彝族自治县','宁洱哈尼族彝族自治县',',2580,2640,',2640)
, (2643,'2013-06-24 00:47:53','2013-06-24 00:47:53',null,'云南省普洱市墨江哈尼族自治县','墨江哈尼族自治县',',2580,2640,',2640)
, (2644,'2013-06-24 00:47:54','2013-06-24 00:47:54',null,'云南省普洱市景东彝族自治县','景东彝族自治县',',2580,2640,',2640)
, (2645,'2013-06-24 00:47:55','2013-06-24 00:47:55',null,'云南省普洱市景谷傣族彝族自治县','景谷傣族彝族自治县',',2580,2640,',2640)
, (2646,'2013-06-24 00:47:56','2013-06-24 00:47:56',null,'云南省普洱市镇沅彝族哈尼族拉祜族自治县','镇沅彝族哈尼族拉祜族自治县',',2580,2640,',2640)
, (2647,'2013-06-24 00:47:57','2013-06-24 00:47:57',null,'云南省普洱市江城哈尼族彝族自治县','江城哈尼族彝族自治县',',2580,2640,',2640)
, (2648,'2013-06-24 00:47:58','2013-06-24 00:47:58',null,'云南省普洱市孟连傣族拉祜族佤族自治县','孟连傣族拉祜族佤族自治县',',2580,2640,',2640)
, (2649,'2013-06-24 00:47:59','2013-06-24 00:47:59',null,'云南省普洱市澜沧拉祜族自治县','澜沧拉祜族自治县',',2580,2640,',2640)
, (2650,'2013-06-24 00:48:00','2013-06-24 00:48:00',null,'云南省普洱市西盟佤族自治县','西盟佤族自治县',',2580,2640,',2640)
, (2651,'2013-06-24 00:48:01','2013-06-24 00:48:01',null,'云南省临沧市','临沧市',',2580,',2580)
, (2652,'2013-06-24 00:48:02','2013-06-24 00:48:02',null,'云南省临沧市临翔区','临翔区',',2580,2651,',2651)
, (2653,'2013-06-24 00:48:03','2013-06-24 00:48:03',null,'云南省临沧市凤庆县','凤庆县',',2580,2651,',2651)
, (2654,'2013-06-24 00:48:04','2013-06-24 00:48:04',null,'云南省临沧市云县','云县',',2580,2651,',2651)
, (2655,'2013-06-24 00:48:05','2013-06-24 00:48:05',null,'云南省临沧市永德县','永德县',',2580,2651,',2651)
, (2656,'2013-06-24 00:48:06','2013-06-24 00:48:06',null,'云南省临沧市镇康县','镇康县',',2580,2651,',2651)
, (2657,'2013-06-24 00:48:07','2013-06-24 00:48:07',null,'云南省临沧市双江拉祜族佤族布朗族傣族自治县','双江拉祜族佤族布朗族傣族自治县',',2580,2651,',2651)
, (2658,'2013-06-24 00:48:08','2013-06-24 00:48:08',null,'云南省临沧市耿马傣族佤族自治县','耿马傣族佤族自治县',',2580,2651,',2651)
, (2659,'2013-06-24 00:48:09','2013-06-24 00:48:09',null,'云南省临沧市沧源佤族自治县','沧源佤族自治县',',2580,2651,',2651)
, (2660,'2013-06-24 00:48:10','2013-06-24 00:48:10',null,'云南省楚雄彝族自治州','楚雄彝族自治州',',2580,',2580)
, (2661,'2013-06-24 00:48:11','2013-06-24 00:48:11',null,'云南省楚雄彝族自治州楚雄市','楚雄市',',2580,2660,',2660)
, (2662,'2013-06-24 00:48:12','2013-06-24 00:48:12',null,'云南省楚雄彝族自治州双柏县','双柏县',',2580,2660,',2660)
, (2663,'2013-06-24 00:48:13','2013-06-24 00:48:13',null,'云南省楚雄彝族自治州牟定县','牟定县',',2580,2660,',2660)
, (2664,'2013-06-24 00:48:14','2013-06-24 00:48:14',null,'云南省楚雄彝族自治州南华县','南华县',',2580,2660,',2660)
, (2665,'2013-06-24 00:48:15','2013-06-24 00:48:15',null,'云南省楚雄彝族自治州姚安县','姚安县',',2580,2660,',2660)
, (2666,'2013-06-24 00:48:16','2013-06-24 00:48:16',null,'云南省楚雄彝族自治州大姚县','大姚县',',2580,2660,',2660)
, (2667,'2013-06-24 00:48:17','2013-06-24 00:48:17',null,'云南省楚雄彝族自治州永仁县','永仁县',',2580,2660,',2660)
, (2668,'2013-06-24 00:48:18','2013-06-24 00:48:18',null,'云南省楚雄彝族自治州元谋县','元谋县',',2580,2660,',2660)
, (2669,'2013-06-24 00:48:19','2013-06-24 00:48:19',null,'云南省楚雄彝族自治州武定县','武定县',',2580,2660,',2660)
, (2670,'2013-06-24 00:48:20','2013-06-24 00:48:20',null,'云南省楚雄彝族自治州禄丰县','禄丰县',',2580,2660,',2660)
, (2671,'2013-06-24 00:48:21','2013-06-24 00:48:21',null,'云南省红河哈尼族彝族自治州','红河哈尼族彝族自治州',',2580,',2580)
, (2672,'2013-06-24 00:48:22','2013-06-24 00:48:22',null,'云南省红河哈尼族彝族自治州个旧市','个旧市',',2580,2671,',2671)
, (2673,'2013-06-24 00:48:23','2013-06-24 00:48:23',null,'云南省红河哈尼族彝族自治州开远市','开远市',',2580,2671,',2671)
, (2674,'2013-06-24 00:48:24','2013-06-24 00:48:24',null,'云南省红河哈尼族彝族自治州蒙自市','蒙自市',',2580,2671,',2671)
, (2675,'2013-06-24 00:48:25','2013-06-24 00:48:25',null,'云南省红河哈尼族彝族自治州屏边苗族自治县','屏边苗族自治县',',2580,2671,',2671)
, (2676,'2013-06-24 00:48:26','2013-06-24 00:48:26',null,'云南省红河哈尼族彝族自治州建水县','建水县',',2580,2671,',2671)
, (2677,'2013-06-24 00:48:27','2013-06-24 00:48:27',null,'云南省红河哈尼族彝族自治州石屏县','石屏县',',2580,2671,',2671)
, (2678,'2013-06-24 00:48:28','2013-06-24 00:48:28',null,'云南省红河哈尼族彝族自治州弥勒县','弥勒县',',2580,2671,',2671)
, (2679,'2013-06-24 00:48:29','2013-06-24 00:48:29',null,'云南省红河哈尼族彝族自治州泸西县','泸西县',',2580,2671,',2671)
, (2680,'2013-06-24 00:48:30','2013-06-24 00:48:30',null,'云南省红河哈尼族彝族自治州元阳县','元阳县',',2580,2671,',2671)
, (2681,'2013-06-24 00:48:31','2013-06-24 00:48:31',null,'云南省红河哈尼族彝族自治州红河县','红河县',',2580,2671,',2671)
, (2682,'2013-06-24 00:48:32','2013-06-24 00:48:32',null,'云南省红河哈尼族彝族自治州金平苗族瑶族傣族自治县','金平苗族瑶族傣族自治县',',2580,2671,',2671)
, (2683,'2013-06-24 00:48:33','2013-06-24 00:48:33',null,'云南省红河哈尼族彝族自治州绿春县','绿春县',',2580,2671,',2671)
, (2684,'2013-06-24 00:48:34','2013-06-24 00:48:34',null,'云南省红河哈尼族彝族自治州河口瑶族自治县','河口瑶族自治县',',2580,2671,',2671)
, (2685,'2013-06-24 00:48:35','2013-06-24 00:48:35',null,'云南省文山壮族苗族自治州','文山壮族苗族自治州',',2580,',2580)
, (2686,'2013-06-24 00:48:36','2013-06-24 00:48:36',null,'云南省文山壮族苗族自治州文山市','文山市',',2580,2685,',2685)
, (2687,'2013-06-24 00:48:37','2013-06-24 00:48:37',null,'云南省文山壮族苗族自治州砚山县','砚山县',',2580,2685,',2685)
, (2688,'2013-06-24 00:48:38','2013-06-24 00:48:38',null,'云南省文山壮族苗族自治州西畴县','西畴县',',2580,2685,',2685)
, (2689,'2013-06-24 00:48:39','2013-06-24 00:48:39',null,'云南省文山壮族苗族自治州麻栗坡县','麻栗坡县',',2580,2685,',2685)
, (2690,'2013-06-24 00:48:40','2013-06-24 00:48:40',null,'云南省文山壮族苗族自治州马关县','马关县',',2580,2685,',2685)
, (2691,'2013-06-24 00:48:41','2013-06-24 00:48:41',null,'云南省文山壮族苗族自治州丘北县','丘北县',',2580,2685,',2685)
, (2692,'2013-06-24 00:48:42','2013-06-24 00:48:42',null,'云南省文山壮族苗族自治州广南县','广南县',',2580,2685,',2685)
, (2693,'2013-06-24 00:48:43','2013-06-24 00:48:43',null,'云南省文山壮族苗族自治州富宁县','富宁县',',2580,2685,',2685)
, (2694,'2013-06-24 00:48:44','2013-06-24 00:48:44',null,'云南省西双版纳傣族自治州','西双版纳傣族自治州',',2580,',2580)
, (2695,'2013-06-24 00:48:45','2013-06-24 00:48:45',null,'云南省西双版纳傣族自治州景洪市','景洪市',',2580,2694,',2694)
, (2696,'2013-06-24 00:48:46','2013-06-24 00:48:46',null,'云南省西双版纳傣族自治州勐海县','勐海县',',2580,2694,',2694)
, (2697,'2013-06-24 00:48:47','2013-06-24 00:48:47',null,'云南省西双版纳傣族自治州勐腊县','勐腊县',',2580,2694,',2694)
, (2698,'2013-06-24 00:48:48','2013-06-24 00:48:48',null,'云南省大理白族自治州','大理白族自治州',',2580,',2580)
, (2699,'2013-06-24 00:48:49','2013-06-24 00:48:49',null,'云南省大理白族自治州大理市','大理市',',2580,2698,',2698)
, (2700,'2013-06-24 00:48:50','2013-06-24 00:48:50',null,'云南省大理白族自治州漾濞彝族自治县','漾濞彝族自治县',',2580,2698,',2698)
, (2701,'2013-06-24 00:48:51','2013-06-24 00:48:51',null,'云南省大理白族自治州祥云县','祥云县',',2580,2698,',2698)
, (2702,'2013-06-24 00:48:52','2013-06-24 00:48:52',null,'云南省大理白族自治州宾川县','宾川县',',2580,2698,',2698)
, (2703,'2013-06-24 00:48:53','2013-06-24 00:48:53',null,'云南省大理白族自治州弥渡县','弥渡县',',2580,2698,',2698)
, (2704,'2013-06-24 00:48:54','2013-06-24 00:48:54',null,'云南省大理白族自治州南涧彝族自治县','南涧彝族自治县',',2580,2698,',2698)
, (2705,'2013-06-24 00:48:55','2013-06-24 00:48:55',null,'云南省大理白族自治州巍山彝族回族自治县','巍山彝族回族自治县',',2580,2698,',2698)
, (2706,'2013-06-24 00:48:56','2013-06-24 00:48:56',null,'云南省大理白族自治州永平县','永平县',',2580,2698,',2698)
, (2707,'2013-06-24 00:48:57','2013-06-24 00:48:57',null,'云南省大理白族自治州云龙县','云龙县',',2580,2698,',2698)
, (2708,'2013-06-24 00:48:58','2013-06-24 00:48:58',null,'云南省大理白族自治州洱源县','洱源县',',2580,2698,',2698)
, (2709,'2013-06-24 00:48:59','2013-06-24 00:48:59',null,'云南省大理白族自治州剑川县','剑川县',',2580,2698,',2698)
, (2710,'2013-06-24 00:49:00','2013-06-24 00:49:00',null,'云南省大理白族自治州鹤庆县','鹤庆县',',2580,2698,',2698)
, (2711,'2013-06-24 00:49:01','2013-06-24 00:49:01',null,'云南省德宏傣族景颇族自治州','德宏傣族景颇族自治州',',2580,',2580)
, (2712,'2013-06-24 00:49:02','2013-06-24 00:49:02',null,'云南省德宏傣族景颇族自治州瑞丽市','瑞丽市',',2580,2711,',2711)
, (2713,'2013-06-24 00:49:03','2013-06-24 00:49:03',null,'云南省德宏傣族景颇族自治州芒市','芒市',',2580,2711,',2711)
, (2714,'2013-06-24 00:49:04','2013-06-24 00:49:04',null,'云南省德宏傣族景颇族自治州梁河县','梁河县',',2580,2711,',2711)
, (2715,'2013-06-24 00:49:05','2013-06-24 00:49:05',null,'云南省德宏傣族景颇族自治州盈江县','盈江县',',2580,2711,',2711)
, (2716,'2013-06-24 00:49:06','2013-06-24 00:49:06',null,'云南省德宏傣族景颇族自治州陇川县','陇川县',',2580,2711,',2711)
, (2717,'2013-06-24 00:49:07','2013-06-24 00:49:07',null,'云南省怒江傈僳族自治州','怒江傈僳族自治州',',2580,',2580)
, (2718,'2013-06-24 00:49:08','2013-06-24 00:49:08',null,'云南省怒江傈僳族自治州泸水县','泸水县',',2580,2717,',2717)
, (2719,'2013-06-24 00:49:09','2013-06-24 00:49:09',null,'云南省怒江傈僳族自治州福贡县','福贡县',',2580,2717,',2717)
, (2720,'2013-06-24 00:49:10','2013-06-24 00:49:10',null,'云南省怒江傈僳族自治州贡山独龙族怒族自治县','贡山独龙族怒族自治县',',2580,2717,',2717)
, (2721,'2013-06-24 00:49:11','2013-06-24 00:49:11',null,'云南省怒江傈僳族自治州兰坪白族普米族自治县','兰坪白族普米族自治县',',2580,2717,',2717)
, (2722,'2013-06-24 00:49:12','2013-06-24 00:49:12',null,'云南省迪庆藏族自治州','迪庆藏族自治州',',2580,',2580)
, (2723,'2013-06-24 00:49:13','2013-06-24 00:49:13',null,'云南省迪庆藏族自治州香格里拉县','香格里拉县',',2580,2722,',2722)
, (2724,'2013-06-24 00:49:14','2013-06-24 00:49:14',null,'云南省迪庆藏族自治州德钦县','德钦县',',2580,2722,',2722)
, (2725,'2013-06-24 00:49:15','2013-06-24 00:49:15',null,'云南省迪庆藏族自治州维西傈僳族自治县','维西傈僳族自治县',',2580,2722,',2722)
, (2726,'2013-06-24 00:49:16','2013-06-24 00:49:16',null,'西藏自治区','西藏自治区',',',null)
, (2727,'2013-06-24 00:49:17','2013-06-24 00:49:17',null,'西藏自治区拉萨市','拉萨市',',2726,',2726)
, (2728,'2013-06-24 00:49:18','2013-06-24 00:49:18',null,'西藏自治区拉萨市城关区','城关区',',2726,2727,',2727)
, (2729,'2013-06-24 00:49:19','2013-06-24 00:49:19',null,'西藏自治区拉萨市林周县','林周县',',2726,2727,',2727)
, (2730,'2013-06-24 00:49:20','2013-06-24 00:49:20',null,'西藏自治区拉萨市当雄县','当雄县',',2726,2727,',2727)
, (2731,'2013-06-24 00:49:21','2013-06-24 00:49:21',null,'西藏自治区拉萨市尼木县','尼木县',',2726,2727,',2727)
, (2732,'2013-06-24 00:49:22','2013-06-24 00:49:22',null,'西藏自治区拉萨市曲水县','曲水县',',2726,2727,',2727)
, (2733,'2013-06-24 00:49:23','2013-06-24 00:49:23',null,'西藏自治区拉萨市堆龙德庆县','堆龙德庆县',',2726,2727,',2727)
, (2734,'2013-06-24 00:49:24','2013-06-24 00:49:24',null,'西藏自治区拉萨市达孜县','达孜县',',2726,2727,',2727)
, (2735,'2013-06-24 00:49:25','2013-06-24 00:49:25',null,'西藏自治区拉萨市墨竹工卡县','墨竹工卡县',',2726,2727,',2727)
, (2736,'2013-06-24 00:49:26','2013-06-24 00:49:26',null,'西藏自治区昌都地区','昌都地区',',2726,',2726)
, (2737,'2013-06-24 00:49:27','2013-06-24 00:49:27',null,'西藏自治区昌都地区昌都县','昌都县',',2726,2736,',2736)
, (2738,'2013-06-24 00:49:28','2013-06-24 00:49:28',null,'西藏自治区昌都地区江达县','江达县',',2726,2736,',2736)
, (2739,'2013-06-24 00:49:29','2013-06-24 00:49:29',null,'西藏自治区昌都地区贡觉县','贡觉县',',2726,2736,',2736)
, (2740,'2013-06-24 00:49:30','2013-06-24 00:49:30',null,'西藏自治区昌都地区类乌齐县','类乌齐县',',2726,2736,',2736)
, (2741,'2013-06-24 00:49:31','2013-06-24 00:49:31',null,'西藏自治区昌都地区丁青县','丁青县',',2726,2736,',2736)
, (2742,'2013-06-24 00:49:32','2013-06-24 00:49:32',null,'西藏自治区昌都地区察雅县','察雅县',',2726,2736,',2736)
, (2743,'2013-06-24 00:49:33','2013-06-24 00:49:33',null,'西藏自治区昌都地区八宿县','八宿县',',2726,2736,',2736)
, (2744,'2013-06-24 00:49:34','2013-06-24 00:49:34',null,'西藏自治区昌都地区左贡县','左贡县',',2726,2736,',2736)
, (2745,'2013-06-24 00:49:35','2013-06-24 00:49:35',null,'西藏自治区昌都地区芒康县','芒康县',',2726,2736,',2736)
, (2746,'2013-06-24 00:49:36','2013-06-24 00:49:36',null,'西藏自治区昌都地区洛隆县','洛隆县',',2726,2736,',2736)
, (2747,'2013-06-24 00:49:37','2013-06-24 00:49:37',null,'西藏自治区昌都地区边坝县','边坝县',',2726,2736,',2736)
, (2748,'2013-06-24 00:49:38','2013-06-24 00:49:38',null,'西藏自治区山南地区','山南地区',',2726,',2726)
, (2749,'2013-06-24 00:49:39','2013-06-24 00:49:39',null,'西藏自治区山南地区乃东县','乃东县',',2726,2748,',2748)
, (2750,'2013-06-24 00:49:40','2013-06-24 00:49:40',null,'西藏自治区山南地区扎囊县','扎囊县',',2726,2748,',2748)
, (2751,'2013-06-24 00:49:41','2013-06-24 00:49:41',null,'西藏自治区山南地区贡嘎县','贡嘎县',',2726,2748,',2748)
, (2752,'2013-06-24 00:49:42','2013-06-24 00:49:42',null,'西藏自治区山南地区桑日县','桑日县',',2726,2748,',2748)
, (2753,'2013-06-24 00:49:43','2013-06-24 00:49:43',null,'西藏自治区山南地区琼结县','琼结县',',2726,2748,',2748)
, (2754,'2013-06-24 00:49:44','2013-06-24 00:49:44',null,'西藏自治区山南地区曲松县','曲松县',',2726,2748,',2748)
, (2755,'2013-06-24 00:49:45','2013-06-24 00:49:45',null,'西藏自治区山南地区措美县','措美县',',2726,2748,',2748)
, (2756,'2013-06-24 00:49:46','2013-06-24 00:49:46',null,'西藏自治区山南地区洛扎县','洛扎县',',2726,2748,',2748)
, (2757,'2013-06-24 00:49:47','2013-06-24 00:49:47',null,'西藏自治区山南地区加查县','加查县',',2726,2748,',2748)
, (2758,'2013-06-24 00:49:48','2013-06-24 00:49:48',null,'西藏自治区山南地区隆子县','隆子县',',2726,2748,',2748)
, (2759,'2013-06-24 00:49:49','2013-06-24 00:49:49',null,'西藏自治区山南地区错那县','错那县',',2726,2748,',2748)
, (2760,'2013-06-24 00:49:50','2013-06-24 00:49:50',null,'西藏自治区山南地区浪卡子县','浪卡子县',',2726,2748,',2748)
, (2761,'2013-06-24 00:49:51','2013-06-24 00:49:51',null,'西藏自治区日喀则地区','日喀则地区',',2726,',2726)
, (2762,'2013-06-24 00:49:52','2013-06-24 00:49:52',null,'西藏自治区日喀则地区日喀则市','日喀则市',',2726,2761,',2761)
, (2763,'2013-06-24 00:49:53','2013-06-24 00:49:53',null,'西藏自治区日喀则地区南木林县','南木林县',',2726,2761,',2761)
, (2764,'2013-06-24 00:49:54','2013-06-24 00:49:54',null,'西藏自治区日喀则地区江孜县','江孜县',',2726,2761,',2761)
, (2765,'2013-06-24 00:49:55','2013-06-24 00:49:55',null,'西藏自治区日喀则地区定日县','定日县',',2726,2761,',2761)
, (2766,'2013-06-24 00:49:56','2013-06-24 00:49:56',null,'西藏自治区日喀则地区萨迦县','萨迦县',',2726,2761,',2761)
, (2767,'2013-06-24 00:49:57','2013-06-24 00:49:57',null,'西藏自治区日喀则地区拉孜县','拉孜县',',2726,2761,',2761)
, (2768,'2013-06-24 00:49:58','2013-06-24 00:49:58',null,'西藏自治区日喀则地区昂仁县','昂仁县',',2726,2761,',2761)
, (2769,'2013-06-24 00:49:59','2013-06-24 00:49:59',null,'西藏自治区日喀则地区谢通门县','谢通门县',',2726,2761,',2761)
, (2770,'2013-06-24 00:50:00','2013-06-24 00:50:00',null,'西藏自治区日喀则地区白朗县','白朗县',',2726,2761,',2761)
, (2771,'2013-06-24 00:50:01','2013-06-24 00:50:01',null,'西藏自治区日喀则地区仁布县','仁布县',',2726,2761,',2761)
, (2772,'2013-06-24 00:50:02','2013-06-24 00:50:02',null,'西藏自治区日喀则地区康马县','康马县',',2726,2761,',2761)
, (2773,'2013-06-24 00:50:03','2013-06-24 00:50:03',null,'西藏自治区日喀则地区定结县','定结县',',2726,2761,',2761)
, (2774,'2013-06-24 00:50:04','2013-06-24 00:50:04',null,'西藏自治区日喀则地区仲巴县','仲巴县',',2726,2761,',2761)
, (2775,'2013-06-24 00:50:05','2013-06-24 00:50:05',null,'西藏自治区日喀则地区亚东县','亚东县',',2726,2761,',2761)
, (2776,'2013-06-24 00:50:06','2013-06-24 00:50:06',null,'西藏自治区日喀则地区吉隆县','吉隆县',',2726,2761,',2761)
, (2777,'2013-06-24 00:50:07','2013-06-24 00:50:07',null,'西藏自治区日喀则地区聂拉木县','聂拉木县',',2726,2761,',2761)
, (2778,'2013-06-24 00:50:08','2013-06-24 00:50:08',null,'西藏自治区日喀则地区萨嘎县','萨嘎县',',2726,2761,',2761)
, (2779,'2013-06-24 00:50:09','2013-06-24 00:50:09',null,'西藏自治区日喀则地区岗巴县','岗巴县',',2726,2761,',2761)
, (2780,'2013-06-24 00:50:10','2013-06-24 00:50:10',null,'西藏自治区那曲地区','那曲地区',',2726,',2726)
, (2781,'2013-06-24 00:50:11','2013-06-24 00:50:11',null,'西藏自治区那曲地区那曲县','那曲县',',2726,2780,',2780)
, (2782,'2013-06-24 00:50:12','2013-06-24 00:50:12',null,'西藏自治区那曲地区嘉黎县','嘉黎县',',2726,2780,',2780)
, (2783,'2013-06-24 00:50:13','2013-06-24 00:50:13',null,'西藏自治区那曲地区比如县','比如县',',2726,2780,',2780)
, (2784,'2013-06-24 00:50:14','2013-06-24 00:50:14',null,'西藏自治区那曲地区聂荣县','聂荣县',',2726,2780,',2780)
, (2785,'2013-06-24 00:50:15','2013-06-24 00:50:15',null,'西藏自治区那曲地区安多县','安多县',',2726,2780,',2780)
, (2786,'2013-06-24 00:50:16','2013-06-24 00:50:16',null,'西藏自治区那曲地区申扎县','申扎县',',2726,2780,',2780)
, (2787,'2013-06-24 00:50:17','2013-06-24 00:50:17',null,'西藏自治区那曲地区索县','索县',',2726,2780,',2780)
, (2788,'2013-06-24 00:50:18','2013-06-24 00:50:18',null,'西藏自治区那曲地区班戈县','班戈县',',2726,2780,',2780)
, (2789,'2013-06-24 00:50:19','2013-06-24 00:50:19',null,'西藏自治区那曲地区巴青县','巴青县',',2726,2780,',2780)
, (2790,'2013-06-24 00:50:20','2013-06-24 00:50:20',null,'西藏自治区那曲地区尼玛县','尼玛县',',2726,2780,',2780)
, (2791,'2013-06-24 00:50:21','2013-06-24 00:50:21',null,'西藏自治区阿里地区','阿里地区',',2726,',2726)
, (2792,'2013-06-24 00:50:22','2013-06-24 00:50:22',null,'西藏自治区阿里地区普兰县','普兰县',',2726,2791,',2791)
, (2793,'2013-06-24 00:50:23','2013-06-24 00:50:23',null,'西藏自治区阿里地区札达县','札达县',',2726,2791,',2791)
, (2794,'2013-06-24 00:50:24','2013-06-24 00:50:24',null,'西藏自治区阿里地区噶尔县','噶尔县',',2726,2791,',2791)
, (2795,'2013-06-24 00:50:25','2013-06-24 00:50:25',null,'西藏自治区阿里地区日土县','日土县',',2726,2791,',2791)
, (2796,'2013-06-24 00:50:26','2013-06-24 00:50:26',null,'西藏自治区阿里地区革吉县','革吉县',',2726,2791,',2791)
, (2797,'2013-06-24 00:50:27','2013-06-24 00:50:27',null,'西藏自治区阿里地区改则县','改则县',',2726,2791,',2791)
, (2798,'2013-06-24 00:50:28','2013-06-24 00:50:28',null,'西藏自治区阿里地区措勤县','措勤县',',2726,2791,',2791)
, (2799,'2013-06-24 00:50:29','2013-06-24 00:50:29',null,'西藏自治区林芝地区','林芝地区',',2726,',2726)
, (2800,'2013-06-24 00:50:30','2013-06-24 00:50:30',null,'西藏自治区林芝地区林芝县','林芝县',',2726,2799,',2799)
, (2801,'2013-06-24 00:50:31','2013-06-24 00:50:31',null,'西藏自治区林芝地区工布江达县','工布江达县',',2726,2799,',2799)
, (2802,'2013-06-24 00:50:32','2013-06-24 00:50:32',null,'西藏自治区林芝地区米林县','米林县',',2726,2799,',2799)
, (2803,'2013-06-24 00:50:33','2013-06-24 00:50:33',null,'西藏自治区林芝地区墨脱县','墨脱县',',2726,2799,',2799)
, (2804,'2013-06-24 00:50:34','2013-06-24 00:50:34',null,'西藏自治区林芝地区波密县','波密县',',2726,2799,',2799)
, (2805,'2013-06-24 00:50:35','2013-06-24 00:50:35',null,'西藏自治区林芝地区察隅县','察隅县',',2726,2799,',2799)
, (2806,'2013-06-24 00:50:36','2013-06-24 00:50:36',null,'西藏自治区林芝地区朗县','朗县',',2726,2799,',2799)
, (2807,'2013-06-24 00:50:37','2013-06-24 00:50:37',null,'陕西省','陕西省',',',null)
, (2808,'2013-06-24 00:50:38','2013-06-24 00:50:38',null,'陕西省西安市','西安市',',2807,',2807)
, (2809,'2013-06-24 00:50:39','2013-06-24 00:50:39',null,'陕西省西安市新城区','新城区',',2807,2808,',2808)
, (2810,'2013-06-24 00:50:40','2013-06-24 00:50:40',null,'陕西省西安市碑林区','碑林区',',2807,2808,',2808)
, (2811,'2013-06-24 00:50:41','2013-06-24 00:50:41',null,'陕西省西安市莲湖区','莲湖区',',2807,2808,',2808)
, (2812,'2013-06-24 00:50:42','2013-06-24 00:50:42',null,'陕西省西安市灞桥区','灞桥区',',2807,2808,',2808)
, (2813,'2013-06-24 00:50:43','2013-06-24 00:50:43',null,'陕西省西安市未央区','未央区',',2807,2808,',2808)
, (2814,'2013-06-24 00:50:44','2013-06-24 00:50:44',null,'陕西省西安市雁塔区','雁塔区',',2807,2808,',2808)
, (2815,'2013-06-24 00:50:45','2013-06-24 00:50:45',null,'陕西省西安市阎良区','阎良区',',2807,2808,',2808)
, (2816,'2013-06-24 00:50:46','2013-06-24 00:50:46',null,'陕西省西安市临潼区','临潼区',',2807,2808,',2808)
, (2817,'2013-06-24 00:50:47','2013-06-24 00:50:47',null,'陕西省西安市长安区','长安区',',2807,2808,',2808)
, (2818,'2013-06-24 00:50:48','2013-06-24 00:50:48',null,'陕西省西安市蓝田县','蓝田县',',2807,2808,',2808)
, (2819,'2013-06-24 00:50:49','2013-06-24 00:50:49',null,'陕西省西安市周至县','周至县',',2807,2808,',2808)
, (2820,'2013-06-24 00:50:50','2013-06-24 00:50:50',null,'陕西省西安市户县','户县',',2807,2808,',2808)
, (2821,'2013-06-24 00:50:51','2013-06-24 00:50:51',null,'陕西省西安市高陵县','高陵县',',2807,2808,',2808)
, (2822,'2013-06-24 00:50:52','2013-06-24 00:50:52',null,'陕西省铜川市','铜川市',',2807,',2807)
, (2823,'2013-06-24 00:50:53','2013-06-24 00:50:53',null,'陕西省铜川市王益区','王益区',',2807,2822,',2822)
, (2824,'2013-06-24 00:50:54','2013-06-24 00:50:54',null,'陕西省铜川市印台区','印台区',',2807,2822,',2822)
, (2825,'2013-06-24 00:50:55','2013-06-24 00:50:55',null,'陕西省铜川市耀州区','耀州区',',2807,2822,',2822)
, (2826,'2013-06-24 00:50:56','2013-06-24 00:50:56',null,'陕西省铜川市宜君县','宜君县',',2807,2822,',2822)
, (2827,'2013-06-24 00:50:57','2013-06-24 00:50:57',null,'陕西省宝鸡市','宝鸡市',',2807,',2807)
, (2828,'2013-06-24 00:50:58','2013-06-24 00:50:58',null,'陕西省宝鸡市渭滨区','渭滨区',',2807,2827,',2827)
, (2829,'2013-06-24 00:50:59','2013-06-24 00:50:59',null,'陕西省宝鸡市金台区','金台区',',2807,2827,',2827)
, (2830,'2013-06-24 00:51:00','2013-06-24 00:51:00',null,'陕西省宝鸡市陈仓区','陈仓区',',2807,2827,',2827)
, (2831,'2013-06-24 00:51:01','2013-06-24 00:51:01',null,'陕西省宝鸡市凤翔县','凤翔县',',2807,2827,',2827)
, (2832,'2013-06-24 00:51:02','2013-06-24 00:51:02',null,'陕西省宝鸡市岐山县','岐山县',',2807,2827,',2827)
, (2833,'2013-06-24 00:51:03','2013-06-24 00:51:03',null,'陕西省宝鸡市扶风县','扶风县',',2807,2827,',2827)
, (2834,'2013-06-24 00:51:04','2013-06-24 00:51:04',null,'陕西省宝鸡市眉县','眉县',',2807,2827,',2827)
, (2835,'2013-06-24 00:51:05','2013-06-24 00:51:05',null,'陕西省宝鸡市陇县','陇县',',2807,2827,',2827)
, (2836,'2013-06-24 00:51:06','2013-06-24 00:51:06',null,'陕西省宝鸡市千阳县','千阳县',',2807,2827,',2827)
, (2837,'2013-06-24 00:51:07','2013-06-24 00:51:07',null,'陕西省宝鸡市麟游县','麟游县',',2807,2827,',2827)
, (2838,'2013-06-24 00:51:08','2013-06-24 00:51:08',null,'陕西省宝鸡市凤县','凤县',',2807,2827,',2827)
, (2839,'2013-06-24 00:51:09','2013-06-24 00:51:09',null,'陕西省宝鸡市太白县','太白县',',2807,2827,',2827)
, (2840,'2013-06-24 00:51:10','2013-06-24 00:51:10',null,'陕西省咸阳市','咸阳市',',2807,',2807)
, (2841,'2013-06-24 00:51:11','2013-06-24 00:51:11',null,'陕西省咸阳市秦都区','秦都区',',2807,2840,',2840)
, (2842,'2013-06-24 00:51:12','2013-06-24 00:51:12',null,'陕西省咸阳市杨陵区','杨陵区',',2807,2840,',2840)
, (2843,'2013-06-24 00:51:13','2013-06-24 00:51:13',null,'陕西省咸阳市渭城区','渭城区',',2807,2840,',2840)
, (2844,'2013-06-24 00:51:14','2013-06-24 00:51:14',null,'陕西省咸阳市三原县','三原县',',2807,2840,',2840)
, (2845,'2013-06-24 00:51:15','2013-06-24 00:51:15',null,'陕西省咸阳市泾阳县','泾阳县',',2807,2840,',2840)
, (2846,'2013-06-24 00:51:16','2013-06-24 00:51:16',null,'陕西省咸阳市乾县','乾县',',2807,2840,',2840)
, (2847,'2013-06-24 00:51:17','2013-06-24 00:51:17',null,'陕西省咸阳市礼泉县','礼泉县',',2807,2840,',2840)
, (2848,'2013-06-24 00:51:18','2013-06-24 00:51:18',null,'陕西省咸阳市永寿县','永寿县',',2807,2840,',2840)
, (2849,'2013-06-24 00:51:19','2013-06-24 00:51:19',null,'陕西省咸阳市彬县','彬县',',2807,2840,',2840)
, (2850,'2013-06-24 00:51:20','2013-06-24 00:51:20',null,'陕西省咸阳市长武县','长武县',',2807,2840,',2840)
, (2851,'2013-06-24 00:51:21','2013-06-24 00:51:21',null,'陕西省咸阳市旬邑县','旬邑县',',2807,2840,',2840)
, (2852,'2013-06-24 00:51:22','2013-06-24 00:51:22',null,'陕西省咸阳市淳化县','淳化县',',2807,2840,',2840)
, (2853,'2013-06-24 00:51:23','2013-06-24 00:51:23',null,'陕西省咸阳市武功县','武功县',',2807,2840,',2840)
, (2854,'2013-06-24 00:51:24','2013-06-24 00:51:24',null,'陕西省咸阳市兴平市','兴平市',',2807,2840,',2840)
, (2855,'2013-06-24 00:51:25','2013-06-24 00:51:25',null,'陕西省渭南市','渭南市',',2807,',2807)
, (2856,'2013-06-24 00:51:26','2013-06-24 00:51:26',null,'陕西省渭南市临渭区','临渭区',',2807,2855,',2855)
, (2857,'2013-06-24 00:51:27','2013-06-24 00:51:27',null,'陕西省渭南市华县','华县',',2807,2855,',2855)
, (2858,'2013-06-24 00:51:28','2013-06-24 00:51:28',null,'陕西省渭南市潼关县','潼关县',',2807,2855,',2855)
, (2859,'2013-06-24 00:51:29','2013-06-24 00:51:29',null,'陕西省渭南市大荔县','大荔县',',2807,2855,',2855)
, (2860,'2013-06-24 00:51:30','2013-06-24 00:51:30',null,'陕西省渭南市合阳县','合阳县',',2807,2855,',2855)
, (2861,'2013-06-24 00:51:31','2013-06-24 00:51:31',null,'陕西省渭南市澄城县','澄城县',',2807,2855,',2855)
, (2862,'2013-06-24 00:51:32','2013-06-24 00:51:32',null,'陕西省渭南市蒲城县','蒲城县',',2807,2855,',2855)
, (2863,'2013-06-24 00:51:33','2013-06-24 00:51:33',null,'陕西省渭南市白水县','白水县',',2807,2855,',2855)
, (2864,'2013-06-24 00:51:34','2013-06-24 00:51:34',null,'陕西省渭南市富平县','富平县',',2807,2855,',2855)
, (2865,'2013-06-24 00:51:35','2013-06-24 00:51:35',null,'陕西省渭南市韩城市','韩城市',',2807,2855,',2855)
, (2866,'2013-06-24 00:51:36','2013-06-24 00:51:36',null,'陕西省渭南市华阴市','华阴市',',2807,2855,',2855)
, (2867,'2013-06-24 00:51:37','2013-06-24 00:51:37',null,'陕西省延安市','延安市',',2807,',2807)
, (2868,'2013-06-24 00:51:38','2013-06-24 00:51:38',null,'陕西省延安市宝塔区','宝塔区',',2807,2867,',2867)
, (2869,'2013-06-24 00:51:39','2013-06-24 00:51:39',null,'陕西省延安市延长县','延长县',',2807,2867,',2867)
, (2870,'2013-06-24 00:51:40','2013-06-24 00:51:40',null,'陕西省延安市延川县','延川县',',2807,2867,',2867)
, (2871,'2013-06-24 00:51:41','2013-06-24 00:51:41',null,'陕西省延安市子长县','子长县',',2807,2867,',2867)
, (2872,'2013-06-24 00:51:42','2013-06-24 00:51:42',null,'陕西省延安市安塞县','安塞县',',2807,2867,',2867)
, (2873,'2013-06-24 00:51:43','2013-06-24 00:51:43',null,'陕西省延安市志丹县','志丹县',',2807,2867,',2867)
, (2874,'2013-06-24 00:51:44','2013-06-24 00:51:44',null,'陕西省延安市吴起县','吴起县',',2807,2867,',2867)
, (2875,'2013-06-24 00:51:45','2013-06-24 00:51:45',null,'陕西省延安市甘泉县','甘泉县',',2807,2867,',2867)
, (2876,'2013-06-24 00:51:46','2013-06-24 00:51:46',null,'陕西省延安市富县','富县',',2807,2867,',2867)
, (2877,'2013-06-24 00:51:47','2013-06-24 00:51:47',null,'陕西省延安市洛川县','洛川县',',2807,2867,',2867)
, (2878,'2013-06-24 00:51:48','2013-06-24 00:51:48',null,'陕西省延安市宜川县','宜川县',',2807,2867,',2867)
, (2879,'2013-06-24 00:51:49','2013-06-24 00:51:49',null,'陕西省延安市黄龙县','黄龙县',',2807,2867,',2867)
, (2880,'2013-06-24 00:51:50','2013-06-24 00:51:50',null,'陕西省延安市黄陵县','黄陵县',',2807,2867,',2867)
, (2881,'2013-06-24 00:51:51','2013-06-24 00:51:51',null,'陕西省汉中市','汉中市',',2807,',2807)
, (2882,'2013-06-24 00:51:52','2013-06-24 00:51:52',null,'陕西省汉中市汉台区','汉台区',',2807,2881,',2881)
, (2883,'2013-06-24 00:51:53','2013-06-24 00:51:53',null,'陕西省汉中市南郑县','南郑县',',2807,2881,',2881)
, (2884,'2013-06-24 00:51:54','2013-06-24 00:51:54',null,'陕西省汉中市城固县','城固县',',2807,2881,',2881)
, (2885,'2013-06-24 00:51:55','2013-06-24 00:51:55',null,'陕西省汉中市洋县','洋县',',2807,2881,',2881)
, (2886,'2013-06-24 00:51:56','2013-06-24 00:51:56',null,'陕西省汉中市西乡县','西乡县',',2807,2881,',2881)
, (2887,'2013-06-24 00:51:57','2013-06-24 00:51:57',null,'陕西省汉中市勉县','勉县',',2807,2881,',2881)
, (2888,'2013-06-24 00:51:58','2013-06-24 00:51:58',null,'陕西省汉中市宁强县','宁强县',',2807,2881,',2881)
, (2889,'2013-06-24 00:51:59','2013-06-24 00:51:59',null,'陕西省汉中市略阳县','略阳县',',2807,2881,',2881)
, (2890,'2013-06-24 00:52:00','2013-06-24 00:52:00',null,'陕西省汉中市镇巴县','镇巴县',',2807,2881,',2881)
, (2891,'2013-06-24 00:52:01','2013-06-24 00:52:01',null,'陕西省汉中市留坝县','留坝县',',2807,2881,',2881)
, (2892,'2013-06-24 00:52:02','2013-06-24 00:52:02',null,'陕西省汉中市佛坪县','佛坪县',',2807,2881,',2881)
, (2893,'2013-06-24 00:52:03','2013-06-24 00:52:03',null,'陕西省榆林市','榆林市',',2807,',2807)
, (2894,'2013-06-24 00:52:04','2013-06-24 00:52:04',null,'陕西省榆林市榆阳区','榆阳区',',2807,2893,',2893)
, (2895,'2013-06-24 00:52:05','2013-06-24 00:52:05',null,'陕西省榆林市神木县','神木县',',2807,2893,',2893)
, (2896,'2013-06-24 00:52:06','2013-06-24 00:52:06',null,'陕西省榆林市府谷县','府谷县',',2807,2893,',2893)
, (2897,'2013-06-24 00:52:07','2013-06-24 00:52:07',null,'陕西省榆林市横山县','横山县',',2807,2893,',2893)
, (2898,'2013-06-24 00:52:08','2013-06-24 00:52:08',null,'陕西省榆林市靖边县','靖边县',',2807,2893,',2893)
, (2899,'2013-06-24 00:52:09','2013-06-24 00:52:09',null,'陕西省榆林市定边县','定边县',',2807,2893,',2893)
, (2900,'2013-06-24 00:52:10','2013-06-24 00:52:10',null,'陕西省榆林市绥德县','绥德县',',2807,2893,',2893)
, (2901,'2013-06-24 00:52:11','2013-06-24 00:52:11',null,'陕西省榆林市米脂县','米脂县',',2807,2893,',2893)
, (2902,'2013-06-24 00:52:12','2013-06-24 00:52:12',null,'陕西省榆林市佳县','佳县',',2807,2893,',2893)
, (2903,'2013-06-24 00:52:13','2013-06-24 00:52:13',null,'陕西省榆林市吴堡县','吴堡县',',2807,2893,',2893)
, (2904,'2013-06-24 00:52:14','2013-06-24 00:52:14',null,'陕西省榆林市清涧县','清涧县',',2807,2893,',2893)
, (2905,'2013-06-24 00:52:15','2013-06-24 00:52:15',null,'陕西省榆林市子洲县','子洲县',',2807,2893,',2893)
, (2906,'2013-06-24 00:52:16','2013-06-24 00:52:16',null,'陕西省安康市','安康市',',2807,',2807)
, (2907,'2013-06-24 00:52:17','2013-06-24 00:52:17',null,'陕西省安康市汉滨区','汉滨区',',2807,2906,',2906)
, (2908,'2013-06-24 00:52:18','2013-06-24 00:52:18',null,'陕西省安康市汉阴县','汉阴县',',2807,2906,',2906)
, (2909,'2013-06-24 00:52:19','2013-06-24 00:52:19',null,'陕西省安康市石泉县','石泉县',',2807,2906,',2906)
, (2910,'2013-06-24 00:52:20','2013-06-24 00:52:20',null,'陕西省安康市宁陕县','宁陕县',',2807,2906,',2906)
, (2911,'2013-06-24 00:52:21','2013-06-24 00:52:21',null,'陕西省安康市紫阳县','紫阳县',',2807,2906,',2906)
, (2912,'2013-06-24 00:52:22','2013-06-24 00:52:22',null,'陕西省安康市岚皋县','岚皋县',',2807,2906,',2906)
, (2913,'2013-06-24 00:52:23','2013-06-24 00:52:23',null,'陕西省安康市平利县','平利县',',2807,2906,',2906)
, (2914,'2013-06-24 00:52:24','2013-06-24 00:52:24',null,'陕西省安康市镇坪县','镇坪县',',2807,2906,',2906)
, (2915,'2013-06-24 00:52:25','2013-06-24 00:52:25',null,'陕西省安康市旬阳县','旬阳县',',2807,2906,',2906)
, (2916,'2013-06-24 00:52:26','2013-06-24 00:52:26',null,'陕西省安康市白河县','白河县',',2807,2906,',2906)
, (2917,'2013-06-24 00:52:27','2013-06-24 00:52:27',null,'陕西省商洛市','商洛市',',2807,',2807)
, (2918,'2013-06-24 00:52:28','2013-06-24 00:52:28',null,'陕西省商洛市商州区','商州区',',2807,2917,',2917)
, (2919,'2013-06-24 00:52:29','2013-06-24 00:52:29',null,'陕西省商洛市洛南县','洛南县',',2807,2917,',2917)
, (2920,'2013-06-24 00:52:30','2013-06-24 00:52:30',null,'陕西省商洛市丹凤县','丹凤县',',2807,2917,',2917)
, (2921,'2013-06-24 00:52:31','2013-06-24 00:52:31',null,'陕西省商洛市商南县','商南县',',2807,2917,',2917)
, (2922,'2013-06-24 00:52:32','2013-06-24 00:52:32',null,'陕西省商洛市山阳县','山阳县',',2807,2917,',2917)
, (2923,'2013-06-24 00:52:33','2013-06-24 00:52:33',null,'陕西省商洛市镇安县','镇安县',',2807,2917,',2917)
, (2924,'2013-06-24 00:52:34','2013-06-24 00:52:34',null,'陕西省商洛市柞水县','柞水县',',2807,2917,',2917)
, (2925,'2013-06-24 00:52:35','2013-06-24 00:52:35',null,'甘肃省','甘肃省',',',null)
, (2926,'2013-06-24 00:52:36','2013-06-24 00:52:36',null,'甘肃省兰州市','兰州市',',2925,',2925)
, (2927,'2013-06-24 00:52:37','2013-06-24 00:52:37',null,'甘肃省兰州市城关区','城关区',',2925,2926,',2926)
, (2928,'2013-06-24 00:52:38','2013-06-24 00:52:38',null,'甘肃省兰州市七里河区','七里河区',',2925,2926,',2926)
, (2929,'2013-06-24 00:52:39','2013-06-24 00:52:39',null,'甘肃省兰州市西固区','西固区',',2925,2926,',2926)
, (2930,'2013-06-24 00:52:40','2013-06-24 00:52:40',null,'甘肃省兰州市安宁区','安宁区',',2925,2926,',2926)
, (2931,'2013-06-24 00:52:41','2013-06-24 00:52:41',null,'甘肃省兰州市红古区','红古区',',2925,2926,',2926)
, (2932,'2013-06-24 00:52:42','2013-06-24 00:52:42',null,'甘肃省兰州市永登县','永登县',',2925,2926,',2926)
, (2933,'2013-06-24 00:52:43','2013-06-24 00:52:43',null,'甘肃省兰州市皋兰县','皋兰县',',2925,2926,',2926)
, (2934,'2013-06-24 00:52:44','2013-06-24 00:52:44',null,'甘肃省兰州市榆中县','榆中县',',2925,2926,',2926)
, (2935,'2013-06-24 00:52:45','2013-06-24 00:52:45',null,'甘肃省嘉峪关市','嘉峪关市',',2925,',2925)
, (2936,'2013-06-24 00:52:46','2013-06-24 00:52:46',null,'甘肃省金昌市','金昌市',',2925,',2925)
, (2937,'2013-06-24 00:52:47','2013-06-24 00:52:47',null,'甘肃省金昌市金川区','金川区',',2925,2936,',2936)
, (2938,'2013-06-24 00:52:48','2013-06-24 00:52:48',null,'甘肃省金昌市永昌县','永昌县',',2925,2936,',2936)
, (2939,'2013-06-24 00:52:49','2013-06-24 00:52:49',null,'甘肃省白银市','白银市',',2925,',2925)
, (2940,'2013-06-24 00:52:50','2013-06-24 00:52:50',null,'甘肃省白银市白银区','白银区',',2925,2939,',2939)
, (2941,'2013-06-24 00:52:51','2013-06-24 00:52:51',null,'甘肃省白银市平川区','平川区',',2925,2939,',2939)
, (2942,'2013-06-24 00:52:52','2013-06-24 00:52:52',null,'甘肃省白银市靖远县','靖远县',',2925,2939,',2939)
, (2943,'2013-06-24 00:52:53','2013-06-24 00:52:53',null,'甘肃省白银市会宁县','会宁县',',2925,2939,',2939)
, (2944,'2013-06-24 00:52:54','2013-06-24 00:52:54',null,'甘肃省白银市景泰县','景泰县',',2925,2939,',2939)
, (2945,'2013-06-24 00:52:55','2013-06-24 00:52:55',null,'甘肃省天水市','天水市',',2925,',2925)
, (2946,'2013-06-24 00:52:56','2013-06-24 00:52:56',null,'甘肃省天水市秦州区','秦州区',',2925,2945,',2945)
, (2947,'2013-06-24 00:52:57','2013-06-24 00:52:57',null,'甘肃省天水市麦积区','麦积区',',2925,2945,',2945)
, (2948,'2013-06-24 00:52:58','2013-06-24 00:52:58',null,'甘肃省天水市清水县','清水县',',2925,2945,',2945)
, (2949,'2013-06-24 00:52:59','2013-06-24 00:52:59',null,'甘肃省天水市秦安县','秦安县',',2925,2945,',2945)
, (2950,'2013-06-24 00:53:00','2013-06-24 00:53:00',null,'甘肃省天水市甘谷县','甘谷县',',2925,2945,',2945)
, (2951,'2013-06-24 00:53:01','2013-06-24 00:53:01',null,'甘肃省天水市武山县','武山县',',2925,2945,',2945)
, (2952,'2013-06-24 00:53:02','2013-06-24 00:53:02',null,'甘肃省天水市张家川回族自治县','张家川回族自治县',',2925,2945,',2945)
, (2953,'2013-06-24 00:53:03','2013-06-24 00:53:03',null,'甘肃省武威市','武威市',',2925,',2925)
, (2954,'2013-06-24 00:53:04','2013-06-24 00:53:04',null,'甘肃省武威市凉州区','凉州区',',2925,2953,',2953)
, (2955,'2013-06-24 00:53:05','2013-06-24 00:53:05',null,'甘肃省武威市民勤县','民勤县',',2925,2953,',2953)
, (2956,'2013-06-24 00:53:06','2013-06-24 00:53:06',null,'甘肃省武威市古浪县','古浪县',',2925,2953,',2953)
, (2957,'2013-06-24 00:53:07','2013-06-24 00:53:07',null,'甘肃省武威市天祝藏族自治县','天祝藏族自治县',',2925,2953,',2953)
, (2958,'2013-06-24 00:53:08','2013-06-24 00:53:08',null,'甘肃省张掖市','张掖市',',2925,',2925)
, (2959,'2013-06-24 00:53:09','2013-06-24 00:53:09',null,'甘肃省张掖市甘州区','甘州区',',2925,2958,',2958)
, (2960,'2013-06-24 00:53:10','2013-06-24 00:53:10',null,'甘肃省张掖市肃南裕固族自治县','肃南裕固族自治县',',2925,2958,',2958)
, (2961,'2013-06-24 00:53:11','2013-06-24 00:53:11',null,'甘肃省张掖市民乐县','民乐县',',2925,2958,',2958)
, (2962,'2013-06-24 00:53:12','2013-06-24 00:53:12',null,'甘肃省张掖市临泽县','临泽县',',2925,2958,',2958)
, (2963,'2013-06-24 00:53:13','2013-06-24 00:53:13',null,'甘肃省张掖市高台县','高台县',',2925,2958,',2958)
, (2964,'2013-06-24 00:53:14','2013-06-24 00:53:14',null,'甘肃省张掖市山丹县','山丹县',',2925,2958,',2958)
, (2965,'2013-06-24 00:53:15','2013-06-24 00:53:15',null,'甘肃省平凉市','平凉市',',2925,',2925)
, (2966,'2013-06-24 00:53:16','2013-06-24 00:53:16',null,'甘肃省平凉市崆峒区','崆峒区',',2925,2965,',2965)
, (2967,'2013-06-24 00:53:17','2013-06-24 00:53:17',null,'甘肃省平凉市泾川县','泾川县',',2925,2965,',2965)
, (2968,'2013-06-24 00:53:18','2013-06-24 00:53:18',null,'甘肃省平凉市灵台县','灵台县',',2925,2965,',2965)
, (2969,'2013-06-24 00:53:19','2013-06-24 00:53:19',null,'甘肃省平凉市崇信县','崇信县',',2925,2965,',2965)
, (2970,'2013-06-24 00:53:20','2013-06-24 00:53:20',null,'甘肃省平凉市华亭县','华亭县',',2925,2965,',2965)
, (2971,'2013-06-24 00:53:21','2013-06-24 00:53:21',null,'甘肃省平凉市庄浪县','庄浪县',',2925,2965,',2965)
, (2972,'2013-06-24 00:53:22','2013-06-24 00:53:22',null,'甘肃省平凉市静宁县','静宁县',',2925,2965,',2965)
, (2973,'2013-06-24 00:53:23','2013-06-24 00:53:23',null,'甘肃省酒泉市','酒泉市',',2925,',2925)
, (2974,'2013-06-24 00:53:24','2013-06-24 00:53:24',null,'甘肃省酒泉市肃州区','肃州区',',2925,2973,',2973)
, (2975,'2013-06-24 00:53:25','2013-06-24 00:53:25',null,'甘肃省酒泉市金塔县','金塔县',',2925,2973,',2973)
, (2976,'2013-06-24 00:53:26','2013-06-24 00:53:26',null,'甘肃省酒泉市瓜州县','瓜州县',',2925,2973,',2973)
, (2977,'2013-06-24 00:53:27','2013-06-24 00:53:27',null,'甘肃省酒泉市肃北蒙古族自治县','肃北蒙古族自治县',',2925,2973,',2973)
, (2978,'2013-06-24 00:53:28','2013-06-24 00:53:28',null,'甘肃省酒泉市阿克塞哈萨克族自治县','阿克塞哈萨克族自治县',',2925,2973,',2973)
, (2979,'2013-06-24 00:53:29','2013-06-24 00:53:29',null,'甘肃省酒泉市玉门市','玉门市',',2925,2973,',2973)
, (2980,'2013-06-24 00:53:30','2013-06-24 00:53:30',null,'甘肃省酒泉市敦煌市','敦煌市',',2925,2973,',2973)
, (2981,'2013-06-24 00:53:31','2013-06-24 00:53:31',null,'甘肃省庆阳市','庆阳市',',2925,',2925)
, (2982,'2013-06-24 00:53:32','2013-06-24 00:53:32',null,'甘肃省庆阳市西峰区','西峰区',',2925,2981,',2981)
, (2983,'2013-06-24 00:53:33','2013-06-24 00:53:33',null,'甘肃省庆阳市庆城县','庆城县',',2925,2981,',2981)
, (2984,'2013-06-24 00:53:34','2013-06-24 00:53:34',null,'甘肃省庆阳市环县','环县',',2925,2981,',2981)
, (2985,'2013-06-24 00:53:35','2013-06-24 00:53:35',null,'甘肃省庆阳市华池县','华池县',',2925,2981,',2981)
, (2986,'2013-06-24 00:53:36','2013-06-24 00:53:36',null,'甘肃省庆阳市合水县','合水县',',2925,2981,',2981)
, (2987,'2013-06-24 00:53:37','2013-06-24 00:53:37',null,'甘肃省庆阳市正宁县','正宁县',',2925,2981,',2981)
, (2988,'2013-06-24 00:53:38','2013-06-24 00:53:38',null,'甘肃省庆阳市宁县','宁县',',2925,2981,',2981)
, (2989,'2013-06-24 00:53:39','2013-06-24 00:53:39',null,'甘肃省庆阳市镇原县','镇原县',',2925,2981,',2981)
, (2990,'2013-06-24 00:53:40','2013-06-24 00:53:40',null,'甘肃省定西市','定西市',',2925,',2925)
, (2991,'2013-06-24 00:53:41','2013-06-24 00:53:41',null,'甘肃省定西市安定区','安定区',',2925,2990,',2990)
, (2992,'2013-06-24 00:53:42','2013-06-24 00:53:42',null,'甘肃省定西市通渭县','通渭县',',2925,2990,',2990)
, (2993,'2013-06-24 00:53:43','2013-06-24 00:53:43',null,'甘肃省定西市陇西县','陇西县',',2925,2990,',2990)
, (2994,'2013-06-24 00:53:44','2013-06-24 00:53:44',null,'甘肃省定西市渭源县','渭源县',',2925,2990,',2990)
, (2995,'2013-06-24 00:53:45','2013-06-24 00:53:45',null,'甘肃省定西市临洮县','临洮县',',2925,2990,',2990)
, (2996,'2013-06-24 00:53:46','2013-06-24 00:53:46',null,'甘肃省定西市漳县','漳县',',2925,2990,',2990)
, (2997,'2013-06-24 00:53:47','2013-06-24 00:53:47',null,'甘肃省定西市岷县','岷县',',2925,2990,',2990)
, (2998,'2013-06-24 00:53:48','2013-06-24 00:53:48',null,'甘肃省陇南市','陇南市',',2925,',2925)
, (2999,'2013-06-24 00:53:49','2013-06-24 00:53:49',null,'甘肃省陇南市武都区','武都区',',2925,2998,',2998)
, (3000,'2013-06-24 00:53:50','2013-06-24 00:53:50',null,'甘肃省陇南市成县','成县',',2925,2998,',2998);
insert into `xx_area`(`id`,`create_date`,`modify_date`,`orders`,`full_name`,`name`,`tree_path`,`parent`) values (3001,'2013-06-24 00:53:51','2013-06-24 00:53:51',null,'甘肃省陇南市文县','文县',',2925,2998,',2998)
, (3002,'2013-06-24 00:53:52','2013-06-24 00:53:52',null,'甘肃省陇南市宕昌县','宕昌县',',2925,2998,',2998)
, (3003,'2013-06-24 00:53:53','2013-06-24 00:53:53',null,'甘肃省陇南市康县','康县',',2925,2998,',2998)
, (3004,'2013-06-24 00:53:54','2013-06-24 00:53:54',null,'甘肃省陇南市西和县','西和县',',2925,2998,',2998)
, (3005,'2013-06-24 00:53:55','2013-06-24 00:53:55',null,'甘肃省陇南市礼县','礼县',',2925,2998,',2998)
, (3006,'2013-06-24 00:53:56','2013-06-24 00:53:56',null,'甘肃省陇南市徽县','徽县',',2925,2998,',2998)
, (3007,'2013-06-24 00:53:57','2013-06-24 00:53:57',null,'甘肃省陇南市两当县','两当县',',2925,2998,',2998)
, (3008,'2013-06-24 00:53:58','2013-06-24 00:53:58',null,'甘肃省临夏回族自治州','临夏回族自治州',',2925,',2925)
, (3009,'2013-06-24 00:53:59','2013-06-24 00:53:59',null,'甘肃省临夏回族自治州临夏市','临夏市',',2925,3008,',3008)
, (3010,'2013-06-24 00:54:00','2013-06-24 00:54:00',null,'甘肃省临夏回族自治州临夏县','临夏县',',2925,3008,',3008)
, (3011,'2013-06-24 00:54:01','2013-06-24 00:54:01',null,'甘肃省临夏回族自治州康乐县','康乐县',',2925,3008,',3008)
, (3012,'2013-06-24 00:54:02','2013-06-24 00:54:02',null,'甘肃省临夏回族自治州永靖县','永靖县',',2925,3008,',3008)
, (3013,'2013-06-24 00:54:03','2013-06-24 00:54:03',null,'甘肃省临夏回族自治州广河县','广河县',',2925,3008,',3008)
, (3014,'2013-06-24 00:54:04','2013-06-24 00:54:04',null,'甘肃省临夏回族自治州和政县','和政县',',2925,3008,',3008)
, (3015,'2013-06-24 00:54:05','2013-06-24 00:54:05',null,'甘肃省临夏回族自治州东乡族自治县','东乡族自治县',',2925,3008,',3008)
, (3016,'2013-06-24 00:54:06','2013-06-24 00:54:06',null,'甘肃省临夏回族自治州积石山保安族东乡族撒拉族自治县','积石山保安族东乡族撒拉族自治县',',2925,3008,',3008)
, (3017,'2013-06-24 00:54:07','2013-06-24 00:54:07',null,'甘肃省甘南藏族自治州','甘南藏族自治州',',2925,',2925)
, (3018,'2013-06-24 00:54:08','2013-06-24 00:54:08',null,'甘肃省甘南藏族自治州合作市','合作市',',2925,3017,',3017)
, (3019,'2013-06-24 00:54:09','2013-06-24 00:54:09',null,'甘肃省甘南藏族自治州临潭县','临潭县',',2925,3017,',3017)
, (3020,'2013-06-24 00:54:10','2013-06-24 00:54:10',null,'甘肃省甘南藏族自治州卓尼县','卓尼县',',2925,3017,',3017)
, (3021,'2013-06-24 00:54:11','2013-06-24 00:54:11',null,'甘肃省甘南藏族自治州舟曲县','舟曲县',',2925,3017,',3017)
, (3022,'2013-06-24 00:54:12','2013-06-24 00:54:12',null,'甘肃省甘南藏族自治州迭部县','迭部县',',2925,3017,',3017)
, (3023,'2013-06-24 00:54:13','2013-06-24 00:54:13',null,'甘肃省甘南藏族自治州玛曲县','玛曲县',',2925,3017,',3017)
, (3024,'2013-06-24 00:54:14','2013-06-24 00:54:14',null,'甘肃省甘南藏族自治州碌曲县','碌曲县',',2925,3017,',3017)
, (3025,'2013-06-24 00:54:15','2013-06-24 00:54:15',null,'甘肃省甘南藏族自治州夏河县','夏河县',',2925,3017,',3017)
, (3026,'2013-06-24 00:54:16','2013-06-24 00:54:16',null,'青海省','青海省',',',null)
, (3027,'2013-06-24 00:54:17','2013-06-24 00:54:17',null,'青海省西宁市','西宁市',',3026,',3026)
, (3028,'2013-06-24 00:54:18','2013-06-24 00:54:18',null,'青海省西宁市城东区','城东区',',3026,3027,',3027)
, (3029,'2013-06-24 00:54:19','2013-06-24 00:54:19',null,'青海省西宁市城中区','城中区',',3026,3027,',3027)
, (3030,'2013-06-24 00:54:20','2013-06-24 00:54:20',null,'青海省西宁市城西区','城西区',',3026,3027,',3027)
, (3031,'2013-06-24 00:54:21','2013-06-24 00:54:21',null,'青海省西宁市城北区','城北区',',3026,3027,',3027)
, (3032,'2013-06-24 00:54:22','2013-06-24 00:54:22',null,'青海省西宁市大通回族土族自治县','大通回族土族自治县',',3026,3027,',3027)
, (3033,'2013-06-24 00:54:23','2013-06-24 00:54:23',null,'青海省西宁市湟中县','湟中县',',3026,3027,',3027)
, (3034,'2013-06-24 00:54:24','2013-06-24 00:54:24',null,'青海省西宁市湟源县','湟源县',',3026,3027,',3027)
, (3035,'2013-06-24 00:54:25','2013-06-24 00:54:25',null,'青海省海东地区','海东地区',',3026,',3026)
, (3036,'2013-06-24 00:54:26','2013-06-24 00:54:26',null,'青海省海东地区平安县','平安县',',3026,3035,',3035)
, (3037,'2013-06-24 00:54:27','2013-06-24 00:54:27',null,'青海省海东地区民和回族土族自治县','民和回族土族自治县',',3026,3035,',3035)
, (3038,'2013-06-24 00:54:28','2013-06-24 00:54:28',null,'青海省海东地区乐都县','乐都县',',3026,3035,',3035)
, (3039,'2013-06-24 00:54:29','2013-06-24 00:54:29',null,'青海省海东地区互助土族自治县','互助土族自治县',',3026,3035,',3035)
, (3040,'2013-06-24 00:54:30','2013-06-24 00:54:30',null,'青海省海东地区化隆回族自治县','化隆回族自治县',',3026,3035,',3035)
, (3041,'2013-06-24 00:54:31','2013-06-24 00:54:31',null,'青海省海东地区循化撒拉族自治县','循化撒拉族自治县',',3026,3035,',3035)
, (3042,'2013-06-24 00:54:32','2013-06-24 00:54:32',null,'青海省海北藏族自治州','海北藏族自治州',',3026,',3026)
, (3043,'2013-06-24 00:54:33','2013-06-24 00:54:33',null,'青海省海北藏族自治州门源回族自治县','门源回族自治县',',3026,3042,',3042)
, (3044,'2013-06-24 00:54:34','2013-06-24 00:54:34',null,'青海省海北藏族自治州祁连县','祁连县',',3026,3042,',3042)
, (3045,'2013-06-24 00:54:35','2013-06-24 00:54:35',null,'青海省海北藏族自治州海晏县','海晏县',',3026,3042,',3042)
, (3046,'2013-06-24 00:54:36','2013-06-24 00:54:36',null,'青海省海北藏族自治州刚察县','刚察县',',3026,3042,',3042)
, (3047,'2013-06-24 00:54:37','2013-06-24 00:54:37',null,'青海省黄南藏族自治州','黄南藏族自治州',',3026,',3026)
, (3048,'2013-06-24 00:54:38','2013-06-24 00:54:38',null,'青海省黄南藏族自治州同仁县','同仁县',',3026,3047,',3047)
, (3049,'2013-06-24 00:54:39','2013-06-24 00:54:39',null,'青海省黄南藏族自治州尖扎县','尖扎县',',3026,3047,',3047)
, (3050,'2013-06-24 00:54:40','2013-06-24 00:54:40',null,'青海省黄南藏族自治州泽库县','泽库县',',3026,3047,',3047)
, (3051,'2013-06-24 00:54:41','2013-06-24 00:54:41',null,'青海省黄南藏族自治州河南蒙古族自治县','河南蒙古族自治县',',3026,3047,',3047)
, (3052,'2013-06-24 00:54:42','2013-06-24 00:54:42',null,'青海省海南藏族自治州','海南藏族自治州',',3026,',3026)
, (3053,'2013-06-24 00:54:43','2013-06-24 00:54:43',null,'青海省海南藏族自治州共和县','共和县',',3026,3052,',3052)
, (3054,'2013-06-24 00:54:44','2013-06-24 00:54:44',null,'青海省海南藏族自治州同德县','同德县',',3026,3052,',3052)
, (3055,'2013-06-24 00:54:45','2013-06-24 00:54:45',null,'青海省海南藏族自治州贵德县','贵德县',',3026,3052,',3052)
, (3056,'2013-06-24 00:54:46','2013-06-24 00:54:46',null,'青海省海南藏族自治州兴海县','兴海县',',3026,3052,',3052)
, (3057,'2013-06-24 00:54:47','2013-06-24 00:54:47',null,'青海省海南藏族自治州贵南县','贵南县',',3026,3052,',3052)
, (3058,'2013-06-24 00:54:48','2013-06-24 00:54:48',null,'青海省果洛藏族自治州','果洛藏族自治州',',3026,',3026)
, (3059,'2013-06-24 00:54:49','2013-06-24 00:54:49',null,'青海省果洛藏族自治州玛沁县','玛沁县',',3026,3058,',3058)
, (3060,'2013-06-24 00:54:50','2013-06-24 00:54:50',null,'青海省果洛藏族自治州班玛县','班玛县',',3026,3058,',3058)
, (3061,'2013-06-24 00:54:51','2013-06-24 00:54:51',null,'青海省果洛藏族自治州甘德县','甘德县',',3026,3058,',3058)
, (3062,'2013-06-24 00:54:52','2013-06-24 00:54:52',null,'青海省果洛藏族自治州达日县','达日县',',3026,3058,',3058)
, (3063,'2013-06-24 00:54:53','2013-06-24 00:54:53',null,'青海省果洛藏族自治州久治县','久治县',',3026,3058,',3058)
, (3064,'2013-06-24 00:54:54','2013-06-24 00:54:54',null,'青海省果洛藏族自治州玛多县','玛多县',',3026,3058,',3058)
, (3065,'2013-06-24 00:54:55','2013-06-24 00:54:55',null,'青海省玉树藏族自治州','玉树藏族自治州',',3026,',3026)
, (3066,'2013-06-24 00:54:56','2013-06-24 00:54:56',null,'青海省玉树藏族自治州玉树县','玉树县',',3026,3065,',3065)
, (3067,'2013-06-24 00:54:57','2013-06-24 00:54:57',null,'青海省玉树藏族自治州杂多县','杂多县',',3026,3065,',3065)
, (3068,'2013-06-24 00:54:58','2013-06-24 00:54:58',null,'青海省玉树藏族自治州称多县','称多县',',3026,3065,',3065)
, (3069,'2013-06-24 00:54:59','2013-06-24 00:54:59',null,'青海省玉树藏族自治州治多县','治多县',',3026,3065,',3065)
, (3070,'2013-06-24 00:55:00','2013-06-24 00:55:00',null,'青海省玉树藏族自治州囊谦县','囊谦县',',3026,3065,',3065)
, (3071,'2013-06-24 00:55:01','2013-06-24 00:55:01',null,'青海省玉树藏族自治州曲麻莱县','曲麻莱县',',3026,3065,',3065)
, (3072,'2013-06-24 00:55:02','2013-06-24 00:55:02',null,'青海省海西蒙古族藏族自治州','海西蒙古族藏族自治州',',3026,',3026)
, (3073,'2013-06-24 00:55:03','2013-06-24 00:55:03',null,'青海省海西蒙古族藏族自治州格尔木市','格尔木市',',3026,3072,',3072)
, (3074,'2013-06-24 00:55:04','2013-06-24 00:55:04',null,'青海省海西蒙古族藏族自治州德令哈市','德令哈市',',3026,3072,',3072)
, (3075,'2013-06-24 00:55:05','2013-06-24 00:55:05',null,'青海省海西蒙古族藏族自治州乌兰县','乌兰县',',3026,3072,',3072)
, (3076,'2013-06-24 00:55:06','2013-06-24 00:55:06',null,'青海省海西蒙古族藏族自治州都兰县','都兰县',',3026,3072,',3072)
, (3077,'2013-06-24 00:55:07','2013-06-24 00:55:07',null,'青海省海西蒙古族藏族自治州天峻县','天峻县',',3026,3072,',3072)
, (3078,'2013-06-24 00:55:08','2013-06-24 00:55:08',null,'宁夏回族自治区','宁夏回族自治区',',',null)
, (3079,'2013-06-24 00:55:09','2013-06-24 00:55:09',null,'宁夏回族自治区银川市','银川市',',3078,',3078)
, (3080,'2013-06-24 00:55:10','2013-06-24 00:55:10',null,'宁夏回族自治区银川市兴庆区','兴庆区',',3078,3079,',3079)
, (3081,'2013-06-24 00:55:11','2013-06-24 00:55:11',null,'宁夏回族自治区银川市西夏区','西夏区',',3078,3079,',3079)
, (3082,'2013-06-24 00:55:12','2013-06-24 00:55:12',null,'宁夏回族自治区银川市金凤区','金凤区',',3078,3079,',3079)
, (3083,'2013-06-24 00:55:13','2013-06-24 00:55:13',null,'宁夏回族自治区银川市永宁县','永宁县',',3078,3079,',3079)
, (3084,'2013-06-24 00:55:14','2013-06-24 00:55:14',null,'宁夏回族自治区银川市贺兰县','贺兰县',',3078,3079,',3079)
, (3085,'2013-06-24 00:55:15','2013-06-24 00:55:15',null,'宁夏回族自治区银川市灵武市','灵武市',',3078,3079,',3079)
, (3086,'2013-06-24 00:55:16','2013-06-24 00:55:16',null,'宁夏回族自治区石嘴山市','石嘴山市',',3078,',3078)
, (3087,'2013-06-24 00:55:17','2013-06-24 00:55:17',null,'宁夏回族自治区石嘴山市大武口区','大武口区',',3078,3086,',3086)
, (3088,'2013-06-24 00:55:18','2013-06-24 00:55:18',null,'宁夏回族自治区石嘴山市惠农区','惠农区',',3078,3086,',3086)
, (3089,'2013-06-24 00:55:19','2013-06-24 00:55:19',null,'宁夏回族自治区石嘴山市平罗县','平罗县',',3078,3086,',3086)
, (3090,'2013-06-24 00:55:20','2013-06-24 00:55:20',null,'宁夏回族自治区吴忠市','吴忠市',',3078,',3078)
, (3091,'2013-06-24 00:55:21','2013-06-24 00:55:21',null,'宁夏回族自治区吴忠市利通区','利通区',',3078,3090,',3090)
, (3092,'2013-06-24 00:55:22','2013-06-24 00:55:22',null,'宁夏回族自治区吴忠市红寺堡区','红寺堡区',',3078,3090,',3090)
, (3093,'2013-06-24 00:55:23','2013-06-24 00:55:23',null,'宁夏回族自治区吴忠市盐池县','盐池县',',3078,3090,',3090)
, (3094,'2013-06-24 00:55:24','2013-06-24 00:55:24',null,'宁夏回族自治区吴忠市同心县','同心县',',3078,3090,',3090)
, (3095,'2013-06-24 00:55:25','2013-06-24 00:55:25',null,'宁夏回族自治区吴忠市青铜峡市','青铜峡市',',3078,3090,',3090)
, (3096,'2013-06-24 00:55:26','2013-06-24 00:55:26',null,'宁夏回族自治区固原市','固原市',',3078,',3078)
, (3097,'2013-06-24 00:55:27','2013-06-24 00:55:27',null,'宁夏回族自治区固原市原州区','原州区',',3078,3096,',3096)
, (3098,'2013-06-24 00:55:28','2013-06-24 00:55:28',null,'宁夏回族自治区固原市西吉县','西吉县',',3078,3096,',3096)
, (3099,'2013-06-24 00:55:29','2013-06-24 00:55:29',null,'宁夏回族自治区固原市隆德县','隆德县',',3078,3096,',3096)
, (3100,'2013-06-24 00:55:30','2013-06-24 00:55:30',null,'宁夏回族自治区固原市泾源县','泾源县',',3078,3096,',3096)
, (3101,'2013-06-24 00:55:31','2013-06-24 00:55:31',null,'宁夏回族自治区固原市彭阳县','彭阳县',',3078,3096,',3096)
, (3102,'2013-06-24 00:55:32','2013-06-24 00:55:32',null,'宁夏回族自治区中卫市','中卫市',',3078,',3078)
, (3103,'2013-06-24 00:55:33','2013-06-24 00:55:33',null,'宁夏回族自治区中卫市沙坡头区','沙坡头区',',3078,3102,',3102)
, (3104,'2013-06-24 00:55:34','2013-06-24 00:55:34',null,'宁夏回族自治区中卫市中宁县','中宁县',',3078,3102,',3102)
, (3105,'2013-06-24 00:55:35','2013-06-24 00:55:35',null,'宁夏回族自治区中卫市海原县','海原县',',3078,3102,',3102)
, (3106,'2013-06-24 00:55:36','2013-06-24 00:55:36',null,'新疆维吾尔自治区','新疆维吾尔自治区',',',null)
, (3107,'2013-06-24 00:55:37','2013-06-24 00:55:37',null,'新疆维吾尔自治区乌鲁木齐市','乌鲁木齐市',',3106,',3106)
, (3108,'2013-06-24 00:55:38','2013-06-24 00:55:38',null,'新疆维吾尔自治区乌鲁木齐市天山区','天山区',',3106,3107,',3107)
, (3109,'2013-06-24 00:55:39','2013-06-24 00:55:39',null,'新疆维吾尔自治区乌鲁木齐市沙依巴克区','沙依巴克区',',3106,3107,',3107)
, (3110,'2013-06-24 00:55:40','2013-06-24 00:55:40',null,'新疆维吾尔自治区乌鲁木齐市新市区','新市区',',3106,3107,',3107)
, (3111,'2013-06-24 00:55:41','2013-06-24 00:55:41',null,'新疆维吾尔自治区乌鲁木齐市水磨沟区','水磨沟区',',3106,3107,',3107)
, (3112,'2013-06-24 00:55:42','2013-06-24 00:55:42',null,'新疆维吾尔自治区乌鲁木齐市头屯河区','头屯河区',',3106,3107,',3107)
, (3113,'2013-06-24 00:55:43','2013-06-24 00:55:43',null,'新疆维吾尔自治区乌鲁木齐市达坂城区','达坂城区',',3106,3107,',3107)
, (3114,'2013-06-24 00:55:44','2013-06-24 00:55:44',null,'新疆维吾尔自治区乌鲁木齐市米东区','米东区',',3106,3107,',3107)
, (3115,'2013-06-24 00:55:45','2013-06-24 00:55:45',null,'新疆维吾尔自治区乌鲁木齐市乌鲁木齐县','乌鲁木齐县',',3106,3107,',3107)
, (3116,'2013-06-24 00:55:46','2013-06-24 00:55:46',null,'新疆维吾尔自治区克拉玛依市','克拉玛依市',',3106,',3106)
, (3117,'2013-06-24 00:55:47','2013-06-24 00:55:47',null,'新疆维吾尔自治区克拉玛依市独山子区','独山子区',',3106,3116,',3116)
, (3118,'2013-06-24 00:55:48','2013-06-24 00:55:48',null,'新疆维吾尔自治区克拉玛依市克拉玛依区','克拉玛依区',',3106,3116,',3116)
, (3119,'2013-06-24 00:55:49','2013-06-24 00:55:49',null,'新疆维吾尔自治区克拉玛依市白碱滩区','白碱滩区',',3106,3116,',3116)
, (3120,'2013-06-24 00:55:50','2013-06-24 00:55:50',null,'新疆维吾尔自治区克拉玛依市乌尔禾区','乌尔禾区',',3106,3116,',3116)
, (3121,'2013-06-24 00:55:51','2013-06-24 00:55:51',null,'新疆维吾尔自治区吐鲁番地区','吐鲁番地区',',3106,',3106)
, (3122,'2013-06-24 00:55:52','2013-06-24 00:55:52',null,'新疆维吾尔自治区吐鲁番地区吐鲁番市','吐鲁番市',',3106,3121,',3121)
, (3123,'2013-06-24 00:55:53','2013-06-24 00:55:53',null,'新疆维吾尔自治区吐鲁番地区鄯善县','鄯善县',',3106,3121,',3121)
, (3124,'2013-06-24 00:55:54','2013-06-24 00:55:54',null,'新疆维吾尔自治区吐鲁番地区托克逊县','托克逊县',',3106,3121,',3121)
, (3125,'2013-06-24 00:55:55','2013-06-24 00:55:55',null,'新疆维吾尔自治区哈密地区','哈密地区',',3106,',3106)
, (3126,'2013-06-24 00:55:56','2013-06-24 00:55:56',null,'新疆维吾尔自治区哈密地区哈密市','哈密市',',3106,3125,',3125)
, (3127,'2013-06-24 00:55:57','2013-06-24 00:55:57',null,'新疆维吾尔自治区哈密地区巴里坤哈萨克自治县','巴里坤哈萨克自治县',',3106,3125,',3125)
, (3128,'2013-06-24 00:55:58','2013-06-24 00:55:58',null,'新疆维吾尔自治区哈密地区伊吾县','伊吾县',',3106,3125,',3125)
, (3129,'2013-06-24 00:55:59','2013-06-24 00:55:59',null,'新疆维吾尔自治区昌吉回族自治州','昌吉回族自治州',',3106,',3106)
, (3130,'2013-06-24 00:56:00','2013-06-24 00:56:00',null,'新疆维吾尔自治区昌吉回族自治州昌吉市','昌吉市',',3106,3129,',3129)
, (3131,'2013-06-24 00:56:01','2013-06-24 00:56:01',null,'新疆维吾尔自治区昌吉回族自治州阜康市','阜康市',',3106,3129,',3129)
, (3132,'2013-06-24 00:56:02','2013-06-24 00:56:02',null,'新疆维吾尔自治区昌吉回族自治州呼图壁县','呼图壁县',',3106,3129,',3129)
, (3133,'2013-06-24 00:56:03','2013-06-24 00:56:03',null,'新疆维吾尔自治区昌吉回族自治州玛纳斯县','玛纳斯县',',3106,3129,',3129)
, (3134,'2013-06-24 00:56:04','2013-06-24 00:56:04',null,'新疆维吾尔自治区昌吉回族自治州奇台县','奇台县',',3106,3129,',3129)
, (3135,'2013-06-24 00:56:05','2013-06-24 00:56:05',null,'新疆维吾尔自治区昌吉回族自治州吉木萨尔县','吉木萨尔县',',3106,3129,',3129)
, (3136,'2013-06-24 00:56:06','2013-06-24 00:56:06',null,'新疆维吾尔自治区昌吉回族自治州木垒哈萨克自治县','木垒哈萨克自治县',',3106,3129,',3129)
, (3137,'2013-06-24 00:56:07','2013-06-24 00:56:07',null,'新疆维吾尔自治区博尔塔拉蒙古自治州','博尔塔拉蒙古自治州',',3106,',3106)
, (3138,'2013-06-24 00:56:08','2013-06-24 00:56:08',null,'新疆维吾尔自治区博尔塔拉蒙古自治州博乐市','博乐市',',3106,3137,',3137)
, (3139,'2013-06-24 00:56:09','2013-06-24 00:56:09',null,'新疆维吾尔自治区博尔塔拉蒙古自治州精河县','精河县',',3106,3137,',3137)
, (3140,'2013-06-24 00:56:10','2013-06-24 00:56:10',null,'新疆维吾尔自治区博尔塔拉蒙古自治州温泉县','温泉县',',3106,3137,',3137)
, (3141,'2013-06-24 00:56:11','2013-06-24 00:56:11',null,'新疆维吾尔自治区巴音郭楞蒙古自治州','巴音郭楞蒙古自治州',',3106,',3106)
, (3142,'2013-06-24 00:56:12','2013-06-24 00:56:12',null,'新疆维吾尔自治区巴音郭楞蒙古自治州库尔勒市','库尔勒市',',3106,3141,',3141)
, (3143,'2013-06-24 00:56:13','2013-06-24 00:56:13',null,'新疆维吾尔自治区巴音郭楞蒙古自治州轮台县','轮台县',',3106,3141,',3141)
, (3144,'2013-06-24 00:56:14','2013-06-24 00:56:14',null,'新疆维吾尔自治区巴音郭楞蒙古自治州尉犁县','尉犁县',',3106,3141,',3141)
, (3145,'2013-06-24 00:56:15','2013-06-24 00:56:15',null,'新疆维吾尔自治区巴音郭楞蒙古自治州若羌县','若羌县',',3106,3141,',3141)
, (3146,'2013-06-24 00:56:16','2013-06-24 00:56:16',null,'新疆维吾尔自治区巴音郭楞蒙古自治州且末县','且末县',',3106,3141,',3141)
, (3147,'2013-06-24 00:56:17','2013-06-24 00:56:17',null,'新疆维吾尔自治区巴音郭楞蒙古自治州焉耆回族自治县','焉耆回族自治县',',3106,3141,',3141)
, (3148,'2013-06-24 00:56:18','2013-06-24 00:56:18',null,'新疆维吾尔自治区巴音郭楞蒙古自治州和静县','和静县',',3106,3141,',3141)
, (3149,'2013-06-24 00:56:19','2013-06-24 00:56:19',null,'新疆维吾尔自治区巴音郭楞蒙古自治州和硕县','和硕县',',3106,3141,',3141)
, (3150,'2013-06-24 00:56:20','2013-06-24 00:56:20',null,'新疆维吾尔自治区巴音郭楞蒙古自治州博湖县','博湖县',',3106,3141,',3141)
, (3151,'2013-06-24 00:56:21','2013-06-24 00:56:21',null,'新疆维吾尔自治区阿克苏地区','阿克苏地区',',3106,',3106)
, (3152,'2013-06-24 00:56:22','2013-06-24 00:56:22',null,'新疆维吾尔自治区阿克苏地区阿克苏市','阿克苏市',',3106,3151,',3151)
, (3153,'2013-06-24 00:56:23','2013-06-24 00:56:23',null,'新疆维吾尔自治区阿克苏地区温宿县','温宿县',',3106,3151,',3151)
, (3154,'2013-06-24 00:56:24','2013-06-24 00:56:24',null,'新疆维吾尔自治区阿克苏地区库车县','库车县',',3106,3151,',3151)
, (3155,'2013-06-24 00:56:25','2013-06-24 00:56:25',null,'新疆维吾尔自治区阿克苏地区沙雅县','沙雅县',',3106,3151,',3151)
, (3156,'2013-06-24 00:56:26','2013-06-24 00:56:26',null,'新疆维吾尔自治区阿克苏地区新和县','新和县',',3106,3151,',3151)
, (3157,'2013-06-24 00:56:27','2013-06-24 00:56:27',null,'新疆维吾尔自治区阿克苏地区拜城县','拜城县',',3106,3151,',3151)
, (3158,'2013-06-24 00:56:28','2013-06-24 00:56:28',null,'新疆维吾尔自治区阿克苏地区乌什县','乌什县',',3106,3151,',3151)
, (3159,'2013-06-24 00:56:29','2013-06-24 00:56:29',null,'新疆维吾尔自治区阿克苏地区阿瓦提县','阿瓦提县',',3106,3151,',3151)
, (3160,'2013-06-24 00:56:30','2013-06-24 00:56:30',null,'新疆维吾尔自治区阿克苏地区柯坪县','柯坪县',',3106,3151,',3151)
, (3161,'2013-06-24 00:56:31','2013-06-24 00:56:31',null,'新疆维吾尔自治区克孜勒苏柯尔克孜自治州','克孜勒苏柯尔克孜自治州',',3106,',3106)
, (3162,'2013-06-24 00:56:32','2013-06-24 00:56:32',null,'新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿图什市','阿图什市',',3106,3161,',3161)
, (3163,'2013-06-24 00:56:33','2013-06-24 00:56:33',null,'新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿克陶县','阿克陶县',',3106,3161,',3161)
, (3164,'2013-06-24 00:56:34','2013-06-24 00:56:34',null,'新疆维吾尔自治区克孜勒苏柯尔克孜自治州阿合奇县','阿合奇县',',3106,3161,',3161)
, (3165,'2013-06-24 00:56:35','2013-06-24 00:56:35',null,'新疆维吾尔自治区克孜勒苏柯尔克孜自治州乌恰县','乌恰县',',3106,3161,',3161)
, (3166,'2013-06-24 00:56:36','2013-06-24 00:56:36',null,'新疆维吾尔自治区喀什地区','喀什地区',',3106,',3106)
, (3167,'2013-06-24 00:56:37','2013-06-24 00:56:37',null,'新疆维吾尔自治区喀什地区喀什市','喀什市',',3106,3166,',3166)
, (3168,'2013-06-24 00:56:38','2013-06-24 00:56:38',null,'新疆维吾尔自治区喀什地区疏附县','疏附县',',3106,3166,',3166)
, (3169,'2013-06-24 00:56:39','2013-06-24 00:56:39',null,'新疆维吾尔自治区喀什地区疏勒县','疏勒县',',3106,3166,',3166)
, (3170,'2013-06-24 00:56:40','2013-06-24 00:56:40',null,'新疆维吾尔自治区喀什地区英吉沙县','英吉沙县',',3106,3166,',3166)
, (3171,'2013-06-24 00:56:41','2013-06-24 00:56:41',null,'新疆维吾尔自治区喀什地区泽普县','泽普县',',3106,3166,',3166)
, (3172,'2013-06-24 00:56:42','2013-06-24 00:56:42',null,'新疆维吾尔自治区喀什地区莎车县','莎车县',',3106,3166,',3166)
, (3173,'2013-06-24 00:56:43','2013-06-24 00:56:43',null,'新疆维吾尔自治区喀什地区叶城县','叶城县',',3106,3166,',3166)
, (3174,'2013-06-24 00:56:44','2013-06-24 00:56:44',null,'新疆维吾尔自治区喀什地区麦盖提县','麦盖提县',',3106,3166,',3166)
, (3175,'2013-06-24 00:56:45','2013-06-24 00:56:45',null,'新疆维吾尔自治区喀什地区岳普湖县','岳普湖县',',3106,3166,',3166)
, (3176,'2013-06-24 00:56:46','2013-06-24 00:56:46',null,'新疆维吾尔自治区喀什地区伽师县','伽师县',',3106,3166,',3166)
, (3177,'2013-06-24 00:56:47','2013-06-24 00:56:47',null,'新疆维吾尔自治区喀什地区巴楚县','巴楚县',',3106,3166,',3166)
, (3178,'2013-06-24 00:56:48','2013-06-24 00:56:48',null,'新疆维吾尔自治区喀什地区塔什库尔干塔吉克自治县','塔什库尔干塔吉克自治县',',3106,3166,',3166)
, (3179,'2013-06-24 00:56:49','2013-06-24 00:56:49',null,'新疆维吾尔自治区和田地区','和田地区',',3106,',3106)
, (3180,'2013-06-24 00:56:50','2013-06-24 00:56:50',null,'新疆维吾尔自治区和田地区和田市','和田市',',3106,3179,',3179)
, (3181,'2013-06-24 00:56:51','2013-06-24 00:56:51',null,'新疆维吾尔自治区和田地区和田县','和田县',',3106,3179,',3179)
, (3182,'2013-06-24 00:56:52','2013-06-24 00:56:52',null,'新疆维吾尔自治区和田地区墨玉县','墨玉县',',3106,3179,',3179)
, (3183,'2013-06-24 00:56:53','2013-06-24 00:56:53',null,'新疆维吾尔自治区和田地区皮山县','皮山县',',3106,3179,',3179)
, (3184,'2013-06-24 00:56:54','2013-06-24 00:56:54',null,'新疆维吾尔自治区和田地区洛浦县','洛浦县',',3106,3179,',3179)
, (3185,'2013-06-24 00:56:55','2013-06-24 00:56:55',null,'新疆维吾尔自治区和田地区策勒县','策勒县',',3106,3179,',3179)
, (3186,'2013-06-24 00:56:56','2013-06-24 00:56:56',null,'新疆维吾尔自治区和田地区于田县','于田县',',3106,3179,',3179)
, (3187,'2013-06-24 00:56:57','2013-06-24 00:56:57',null,'新疆维吾尔自治区和田地区民丰县','民丰县',',3106,3179,',3179)
, (3188,'2013-06-24 00:56:58','2013-06-24 00:56:58',null,'新疆维吾尔自治区伊犁哈萨克自治州','伊犁哈萨克自治州',',3106,',3106)
, (3189,'2013-06-24 00:56:59','2013-06-24 00:56:59',null,'新疆维吾尔自治区伊犁哈萨克自治州伊宁市','伊宁市',',3106,3188,',3188)
, (3190,'2013-06-24 00:57:00','2013-06-24 00:57:00',null,'新疆维吾尔自治区伊犁哈萨克自治州奎屯市','奎屯市',',3106,3188,',3188)
, (3191,'2013-06-24 00:57:01','2013-06-24 00:57:01',null,'新疆维吾尔自治区伊犁哈萨克自治州伊宁县','伊宁县',',3106,3188,',3188)
, (3192,'2013-06-24 00:57:02','2013-06-24 00:57:02',null,'新疆维吾尔自治区伊犁哈萨克自治州察布查尔锡伯自治县','察布查尔锡伯自治县',',3106,3188,',3188)
, (3193,'2013-06-24 00:57:03','2013-06-24 00:57:03',null,'新疆维吾尔自治区伊犁哈萨克自治州霍城县','霍城县',',3106,3188,',3188)
, (3194,'2013-06-24 00:57:04','2013-06-24 00:57:04',null,'新疆维吾尔自治区伊犁哈萨克自治州巩留县','巩留县',',3106,3188,',3188)
, (3195,'2013-06-24 00:57:05','2013-06-24 00:57:05',null,'新疆维吾尔自治区伊犁哈萨克自治州新源县','新源县',',3106,3188,',3188)
, (3196,'2013-06-24 00:57:06','2013-06-24 00:57:06',null,'新疆维吾尔自治区伊犁哈萨克自治州昭苏县','昭苏县',',3106,3188,',3188)
, (3197,'2013-06-24 00:57:07','2013-06-24 00:57:07',null,'新疆维吾尔自治区伊犁哈萨克自治州特克斯县','特克斯县',',3106,3188,',3188)
, (3198,'2013-06-24 00:57:08','2013-06-24 00:57:08',null,'新疆维吾尔自治区伊犁哈萨克自治州尼勒克县','尼勒克县',',3106,3188,',3188)
, (3199,'2013-06-24 00:57:09','2013-06-24 00:57:09',null,'新疆维吾尔自治区塔城地区','塔城地区',',3106,',3106)
, (3200,'2013-06-24 00:57:10','2013-06-24 00:57:10',null,'新疆维吾尔自治区塔城地区塔城市','塔城市',',3106,3199,',3199)
, (3201,'2013-06-24 00:57:11','2013-06-24 00:57:11',null,'新疆维吾尔自治区塔城地区乌苏市','乌苏市',',3106,3199,',3199)
, (3202,'2013-06-24 00:57:12','2013-06-24 00:57:12',null,'新疆维吾尔自治区塔城地区额敏县','额敏县',',3106,3199,',3199)
, (3203,'2013-06-24 00:57:13','2013-06-24 00:57:13',null,'新疆维吾尔自治区塔城地区沙湾县','沙湾县',',3106,3199,',3199)
, (3204,'2013-06-24 00:57:14','2013-06-24 00:57:14',null,'新疆维吾尔自治区塔城地区托里县','托里县',',3106,3199,',3199)
, (3205,'2013-06-24 00:57:15','2013-06-24 00:57:15',null,'新疆维吾尔自治区塔城地区裕民县','裕民县',',3106,3199,',3199)
, (3206,'2013-06-24 00:57:16','2013-06-24 00:57:16',null,'新疆维吾尔自治区塔城地区和布克赛尔蒙古自治县','和布克赛尔蒙古自治县',',3106,3199,',3199)
, (3207,'2013-06-24 00:57:17','2013-06-24 00:57:17',null,'新疆维吾尔自治区阿勒泰地区','阿勒泰地区',',3106,',3106)
, (3208,'2013-06-24 00:57:18','2013-06-24 00:57:18',null,'新疆维吾尔自治区阿勒泰地区阿勒泰市','阿勒泰市',',3106,3207,',3207)
, (3209,'2013-06-24 00:57:19','2013-06-24 00:57:19',null,'新疆维吾尔自治区阿勒泰地区布尔津县','布尔津县',',3106,3207,',3207)
, (3210,'2013-06-24 00:57:20','2013-06-24 00:57:20',null,'新疆维吾尔自治区阿勒泰地区富蕴县','富蕴县',',3106,3207,',3207)
, (3211,'2013-06-24 00:57:21','2013-06-24 00:57:21',null,'新疆维吾尔自治区阿勒泰地区福海县','福海县',',3106,3207,',3207)
, (3212,'2013-06-24 00:57:22','2013-06-24 00:57:22',null,'新疆维吾尔自治区阿勒泰地区哈巴河县','哈巴河县',',3106,3207,',3207)
, (3213,'2013-06-24 00:57:23','2013-06-24 00:57:23',null,'新疆维吾尔自治区阿勒泰地区青河县','青河县',',3106,3207,',3207)
, (3214,'2013-06-24 00:57:24','2013-06-24 00:57:24',null,'新疆维吾尔自治区阿勒泰地区吉木乃县','吉木乃县',',3106,3207,',3207)
, (3215,'2013-06-24 00:57:25','2013-06-24 00:57:25',null,'新疆维吾尔自治区石河子市','石河子市',',3106,',3106)
, (3216,'2013-06-24 00:57:26','2013-06-24 00:57:26',null,'新疆维吾尔自治区阿拉尔市','阿拉尔市',',3106,',3106)
, (3217,'2013-06-24 00:57:27','2013-06-24 00:57:27',null,'新疆维吾尔自治区图木舒克市','图木舒克市',',3106,',3106)
, (3218,'2013-06-24 00:57:28','2013-06-24 00:57:28',null,'新疆维吾尔自治区五家渠市','五家渠市',',3106,',3106)
, (3219,'2013-06-24 00:57:29','2013-06-24 00:57:29',null,'台湾省','台湾省',',',null)
, (3220,'2013-06-24 00:57:30','2013-06-24 00:57:30',null,'台湾省台北市','台北市',',3219,',3219)
, (3221,'2013-06-24 00:57:31','2013-06-24 00:57:31',null,'台湾省高雄市','高雄市',',3219,',3219)
, (3222,'2013-06-24 00:57:32','2013-06-24 00:57:32',null,'台湾省台南市','台南市',',3219,',3219)
, (3223,'2013-06-24 00:57:33','2013-06-24 00:57:33',null,'台湾省台中市','台中市',',3219,',3219)
, (3224,'2013-06-24 00:57:34','2013-06-24 00:57:34',null,'台湾省金门县','金门县',',3219,',3219)
, (3225,'2013-06-24 00:57:35','2013-06-24 00:57:35',null,'台湾省南投县','南投县',',3219,',3219)
, (3226,'2013-06-24 00:57:36','2013-06-24 00:57:36',null,'台湾省基隆市','基隆市',',3219,',3219)
, (3227,'2013-06-24 00:57:37','2013-06-24 00:57:37',null,'台湾省新竹市','新竹市',',3219,',3219)
, (3228,'2013-06-24 00:57:38','2013-06-24 00:57:38',null,'台湾省嘉义市','嘉义市',',3219,',3219)
, (3229,'2013-06-24 00:57:39','2013-06-24 00:57:39',null,'台湾省新北市','新北市',',3219,',3219)
, (3230,'2013-06-24 00:57:40','2013-06-24 00:57:40',null,'台湾省宜兰县','宜兰县',',3219,',3219)
, (3231,'2013-06-24 00:57:41','2013-06-24 00:57:41',null,'台湾省新竹县','新竹县',',3219,',3219)
, (3232,'2013-06-24 00:57:42','2013-06-24 00:57:42',null,'台湾省桃园县','桃园县',',3219,',3219)
, (3233,'2013-06-24 00:57:43','2013-06-24 00:57:43',null,'台湾省苗栗县','苗栗县',',3219,',3219)
, (3234,'2013-06-24 00:57:44','2013-06-24 00:57:44',null,'台湾省彰化县','彰化县',',3219,',3219)
, (3235,'2013-06-24 00:57:45','2013-06-24 00:57:45',null,'台湾省嘉义县','嘉义县',',3219,',3219)
, (3236,'2013-06-24 00:57:46','2013-06-24 00:57:46',null,'台湾省云林县','云林县',',3219,',3219)
, (3237,'2013-06-24 00:57:47','2013-06-24 00:57:47',null,'台湾省屏东县','屏东县',',3219,',3219)
, (3238,'2013-06-24 00:57:48','2013-06-24 00:57:48',null,'台湾省台东县','台东县',',3219,',3219)
, (3239,'2013-06-24 00:57:49','2013-06-24 00:57:49',null,'台湾省花莲县','花莲县',',3219,',3219)
, (3240,'2013-06-24 00:57:50','2013-06-24 00:57:50',null,'台湾省澎湖县','澎湖县',',3219,',3219)
, (3241,'2013-06-24 00:57:51','2013-06-24 00:57:51',null,'台湾省台北市中正区','中正区',',3219,3220,',3220)
, (3242,'2013-06-24 00:57:52','2013-06-24 00:57:52',null,'台湾省台北市大同区','大同区',',3219,3220,',3220)
, (3243,'2013-06-24 00:57:53','2013-06-24 00:57:53',null,'台湾省台北市中山区','中山区',',3219,3220,',3220)
, (3244,'2013-06-24 00:57:54','2013-06-24 00:57:54',null,'台湾省台北市松山区','松山区',',3219,3220,',3220)
, (3245,'2013-06-24 00:57:55','2013-06-24 00:57:55',null,'台湾省台北市大安区','大安区',',3219,3220,',3220)
, (3246,'2013-06-24 00:57:56','2013-06-24 00:57:56',null,'台湾省台北市万华区','万华区',',3219,3220,',3220)
, (3247,'2013-06-24 00:57:57','2013-06-24 00:57:57',null,'台湾省台北市信义区','信义区',',3219,3220,',3220)
, (3248,'2013-06-24 00:57:58','2013-06-24 00:57:58',null,'台湾省台北市士林区','士林区',',3219,3220,',3220)
, (3249,'2013-06-24 00:57:59','2013-06-24 00:57:59',null,'台湾省台北市北投区','北投区',',3219,3220,',3220)
, (3250,'2013-06-24 00:58:00','2013-06-24 00:58:00',null,'台湾省台北市内湖区','内湖区',',3219,3220,',3220)
, (3251,'2013-06-24 00:58:01','2013-06-24 00:58:01',null,'台湾省台北市南港区','南港区',',3219,3220,',3220)
, (3252,'2013-06-24 00:58:02','2013-06-24 00:58:02',null,'台湾省台北市文山区','文山区',',3219,3220,',3220)
, (3253,'2013-06-24 00:58:03','2013-06-24 00:58:03',null,'台湾省嘉义县东区','东区',',3219,3235,',3235)
, (3254,'2013-06-24 00:58:04','2013-06-24 00:58:04',null,'台湾省嘉义县西区','西区',',3219,3235,',3235)
, (3255,'2013-06-24 00:58:05','2013-06-24 00:58:05',null,'台湾省高雄市新兴区','新兴区',',3219,3221,',3221)
, (3256,'2013-06-24 00:58:06','2013-06-24 00:58:06',null,'台湾省高雄市前金区','前金区',',3219,3221,',3221)
, (3257,'2013-06-24 00:58:07','2013-06-24 00:58:07',null,'台湾省高雄市芩雅区','芩雅区',',3219,3221,',3221)
, (3258,'2013-06-24 00:58:08','2013-06-24 00:58:08',null,'台湾省高雄市盐埕区','盐埕区',',3219,3221,',3221)
, (3259,'2013-06-24 00:58:09','2013-06-24 00:58:09',null,'台湾省高雄市鼓山区','鼓山区',',3219,3221,',3221)
, (3260,'2013-06-24 00:58:10','2013-06-24 00:58:10',null,'台湾省高雄市旗津区','旗津区',',3219,3221,',3221)
, (3261,'2013-06-24 00:58:11','2013-06-24 00:58:11',null,'台湾省高雄市前镇区','前镇区',',3219,3221,',3221)
, (3262,'2013-06-24 00:58:12','2013-06-24 00:58:12',null,'台湾省高雄市三民区','三民区',',3219,3221,',3221)
, (3263,'2013-06-24 00:58:13','2013-06-24 00:58:13',null,'台湾省高雄市左营区','左营区',',3219,3221,',3221)
, (3264,'2013-06-24 00:58:14','2013-06-24 00:58:14',null,'台湾省高雄市楠梓区','楠梓区',',3219,3221,',3221)
, (3265,'2013-06-24 00:58:15','2013-06-24 00:58:15',null,'台湾省高雄市小港区','小港区',',3219,3221,',3221)
, (3266,'2013-06-24 00:58:16','2013-06-24 00:58:16',null,'台湾省基隆市仁爱区','仁爱区',',3219,3226,',3226)
, (3267,'2013-06-24 00:58:17','2013-06-24 00:58:17',null,'台湾省基隆市信义区','信义区',',3219,3226,',3226)
, (3268,'2013-06-24 00:58:18','2013-06-24 00:58:18',null,'台湾省基隆市中正区','中正区',',3219,3226,',3226)
, (3269,'2013-06-24 00:58:19','2013-06-24 00:58:19',null,'台湾省基隆市中山区','中山区',',3219,3226,',3226)
, (3270,'2013-06-24 00:58:20','2013-06-24 00:58:20',null,'台湾省基隆市安乐区','安乐区',',3219,3226,',3226)
, (3271,'2013-06-24 00:58:21','2013-06-24 00:58:21',null,'台湾省基隆市暖暖区','暖暖区',',3219,3226,',3226)
, (3272,'2013-06-24 00:58:22','2013-06-24 00:58:22',null,'台湾省基隆市七堵区','七堵区',',3219,3226,',3226)
, (3273,'2013-06-24 00:58:23','2013-06-24 00:58:23',null,'台湾省台南市中西区','中西区',',3219,3222,',3222)
, (3274,'2013-06-24 00:58:24','2013-06-24 00:58:24',null,'台湾省台南市东区','东区',',3219,3222,',3222)
, (3275,'2013-06-24 00:58:25','2013-06-24 00:58:25',null,'台湾省台南市南区','南区',',3219,3222,',3222)
, (3276,'2013-06-24 00:58:26','2013-06-24 00:58:26',null,'台湾省台南市北区','北区',',3219,3222,',3222)
, (3277,'2013-06-24 00:58:27','2013-06-24 00:58:27',null,'台湾省台南市安平区','安平区',',3219,3222,',3222)
, (3278,'2013-06-24 00:58:28','2013-06-24 00:58:28',null,'台湾省台南市安南区','安南区',',3219,3222,',3222)
, (3279,'2013-06-24 00:58:29','2013-06-24 00:58:29',null,'台湾省新竹市东区','东区',',3219,3227,',3227)
, (3280,'2013-06-24 00:58:30','2013-06-24 00:58:30',null,'台湾省新竹市北区','北区',',3219,3227,',3227)
, (3281,'2013-06-24 00:58:31','2013-06-24 00:58:31',null,'台湾省新竹市香山区','香山区',',3219,3227,',3227)
, (3282,'2013-06-24 00:58:32','2013-06-24 00:58:32',null,'台湾省台中市中区','中区',',3219,3223,',3223)
, (3283,'2013-06-24 00:58:33','2013-06-24 00:58:33',null,'台湾省台中市东区','东区',',3219,3223,',3223)
, (3284,'2013-06-24 00:58:34','2013-06-24 00:58:34',null,'台湾省台中市南区','南区',',3219,3223,',3223)
, (3285,'2013-06-24 00:58:35','2013-06-24 00:58:35',null,'台湾省台中市西区','西区',',3219,3223,',3223)
, (3286,'2013-06-24 00:58:36','2013-06-24 00:58:36',null,'台湾省台中市北区','北区',',3219,3223,',3223)
, (3287,'2013-06-24 00:58:37','2013-06-24 00:58:37',null,'台湾省台中市北屯区','北屯区',',3219,3223,',3223)
, (3288,'2013-06-24 00:58:38','2013-06-24 00:58:38',null,'台湾省台中市西屯区','西屯区',',3219,3223,',3223)
, (3289,'2013-06-24 00:58:39','2013-06-24 00:58:39',null,'台湾省台中市南屯区','南屯区',',3219,3223,',3223)
, (3290,'2013-06-24 00:58:40','2013-06-24 00:58:40',null,'台湾省嘉义市东区','东区',',3219,3228,',3228)
, (3291,'2013-06-24 00:58:41','2013-06-24 00:58:41',null,'台湾省嘉义市西区','西区',',3219,3228,',3228)
, (3292,'2013-06-24 00:58:42','2013-06-24 00:58:42',null,'香港特别行政区','香港特别行政区',',',null)
, (3293,'2013-06-24 00:58:43','2013-06-24 00:58:43',null,'香港特别行政区香港岛','香港岛',',3292,',3292)
, (3294,'2013-06-24 00:58:44','2013-06-24 00:58:44',null,'香港特别行政区九龙','九龙',',3292,',3292)
, (3295,'2013-06-24 00:58:45','2013-06-24 00:58:45',null,'香港特别行政区新界','新界',',3292,',3292)
, (3296,'2013-06-24 00:58:46','2013-06-24 00:58:46',null,'香港特别行政区九龙九龙城区','九龙城区',',3292,3294,',3294)
, (3297,'2013-06-24 00:58:47','2013-06-24 00:58:47',null,'香港特别行政区九龙油尖旺区','油尖旺区',',3292,3294,',3294)
, (3298,'2013-06-24 00:58:48','2013-06-24 00:58:48',null,'香港特别行政区九龙深水埗区','深水埗区',',3292,3294,',3294)
, (3299,'2013-06-24 00:58:49','2013-06-24 00:58:49',null,'香港特别行政区九龙黄大仙区','黄大仙区',',3292,3294,',3294)
, (3300,'2013-06-24 00:58:50','2013-06-24 00:58:50',null,'香港特别行政区九龙观塘区','观塘区',',3292,3294,',3294)
, (3301,'2013-06-24 00:58:51','2013-06-24 00:58:51',null,'香港特别行政区香港岛中西区','中西区',',3292,3293,',3293)
, (3302,'2013-06-24 00:58:52','2013-06-24 00:58:52',null,'香港特别行政区香港岛湾仔','湾仔',',3292,3293,',3293)
, (3303,'2013-06-24 00:58:53','2013-06-24 00:58:53',null,'香港特别行政区香港岛东区','东区',',3292,3293,',3293)
, (3304,'2013-06-24 00:58:54','2013-06-24 00:58:54',null,'香港特别行政区香港岛南区','南区',',3292,3293,',3293)
, (3305,'2013-06-24 00:58:55','2013-06-24 00:58:55',null,'香港特别行政区新界北区','北区',',3292,3295,',3295)
, (3306,'2013-06-24 00:58:56','2013-06-24 00:58:56',null,'香港特别行政区新界大埔区','大埔区',',3292,3295,',3295)
, (3307,'2013-06-24 00:58:57','2013-06-24 00:58:57',null,'香港特别行政区新界沙田区','沙田区',',3292,3295,',3295)
, (3308,'2013-06-24 00:58:58','2013-06-24 00:58:58',null,'香港特别行政区新界西贡区','西贡区',',3292,3295,',3295)
, (3309,'2013-06-24 00:58:59','2013-06-24 00:58:59',null,'香港特别行政区新界元朗区','元朗区',',3292,3295,',3295)
, (3310,'2013-06-24 00:59:00','2013-06-24 00:59:00',null,'香港特别行政区新界屯门区','屯门区',',3292,3295,',3295)
, (3311,'2013-06-24 00:59:01','2013-06-24 00:59:01',null,'香港特别行政区新界荃湾区','荃湾区',',3292,3295,',3295)
, (3312,'2013-06-24 00:59:02','2013-06-24 00:59:02',null,'香港特别行政区新界葵青区','葵青区',',3292,3295,',3295)
, (3313,'2013-06-24 00:59:03','2013-06-24 00:59:03',null,'香港特别行政区新界离岛区','离岛区',',3292,3295,',3295)
, (3314,'2013-06-24 00:59:04','2013-06-24 00:59:04',null,'澳门特别行政区','澳门特别行政区',',',null)
, (3315,'2013-06-24 00:59:05','2013-06-24 00:59:05',null,'澳门特别行政区澳门半岛','澳门半岛',',3314,',3314)
, (3316,'2013-06-24 00:59:06','2013-06-24 00:59:06',null,'澳门特别行政区离岛','离岛',',3314,',3314);

insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (1,'2013-06-24 00:59:07','2013-06-24 00:59:07',100,1,'filePlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (2,'2013-06-24 00:59:08','2013-06-24 00:59:08',1,1,'alipayDirectPlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (3,'2013-06-24 00:59:09','2013-06-24 00:59:09',2,1,'tenpayDirectPlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (4,'2013-06-24 00:59:10','2013-06-24 00:59:10',3,1,'pay99billPlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (5,'2013-06-24 00:59:11','2013-06-24 00:59:11',4,1,'yeepayPlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (6,'2013-06-24 00:59:12','2013-06-24 00:59:12',5,1,'unionpayPlugin');
insert into `xx_plugin_config`(`id`,`create_date`,`modify_date`,`orders`,`is_enabled`,`plugin_id`) values (7,'2013-06-24 00:59:13','2013-06-24 00:59:13',6,1,'paypalPlugin');

insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/alipay.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (2,'支付宝即时交易','paymentName');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/tenpay.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (3,'财付通即时交易','paymentName');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/99bill.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (4,'快钱支付','paymentName');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/yeepay.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (5,'易宝支付','paymentName');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/unionpay.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (6,'银联在线支付','paymentName');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'USD','currency');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'0','fee');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'fixed','feeType');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'abc','key');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'http://storage.shopxx.net/demo-image/3.0/payment_plugin/paypal.gif','logo');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'abc','partner');
insert into `xx_plugin_config_attribute`(`plugin_config`,`attributes`,`name`) values (7,'Paypal','paymentName');

insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (1,'2013-06-24 00:59:51','2013-06-24 00:59:51',6,0);
insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (2,'2013-06-24 00:59:52','2013-06-24 00:59:52',1,1);
insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (3,'2013-06-24 00:59:53','2013-06-24 00:59:53',1,2);
insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (4,'2013-06-24 00:59:54','2013-06-24 00:59:54',1,3);
insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (5,'2013-06-24 00:59:55','2013-06-24 00:59:55',1,4);
insert into `xx_sn`(`id`,`create_date`,`modify_date`,`last_value`,`type`) values (6,'2013-06-24 00:59:56','2013-06-24 00:59:56',1,5);

insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (1,'2013-06-24 00:59:57','2013-06-24 00:59:57','${setting.siteName}','${setting.siteName}','${setting.siteName}',0);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (2,'2013-06-24 00:59:58','2013-06-24 00:59:58','${productCategory.name}','${productCategory.name}','${productCategory.name}',1);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (3,'2013-06-24 00:59:59','2013-06-24 00:59:59','${productKeyword}','${productKeyword}','${productKeyword}',2);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (4,'2013-06-24 01:00:00','2013-06-24 01:00:00','${product.name}','${product.name}','${product.name}',3);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (5,'2013-06-24 01:00:01','2013-06-24 01:00:01','${articleCategory.name}','${articleCategory.name}','${articleCategory.name}',4);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (6,'2013-06-24 01:00:02','2013-06-24 01:00:02','${articleKeyword}','${articleKeyword}','${articleKeyword}',5);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (7,'2013-06-24 01:00:03','2013-06-24 01:00:03','${article.title}','${article.title}','${article.title}',6);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (8,'2013-06-24 01:00:04','2013-06-24 01:00:04','${setting.siteName}','${setting.siteName}','${setting.siteName}',7);
insert into `xx_seo`(`id`,`create_date`,`modify_date`,`description`,`keywords`,`title`,`type`) values (9,'2013-06-24 01:00:05','2013-06-24 01:00:05','${brand.name}','${brand.name}','${brand.name}',8);

insert into `xx_member`(`id`,`create_date`,`modify_date`,`address`,`amount`,`attribute_value0`,`attribute_value1`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`,`balance`,`birth`,`email`,`gender`,`is_enabled`,`is_locked`,`locked_date`,`login_date`,`login_failure_count`,`login_ip`,`mobile`,`name`,`password`,`phone`,`point`,`register_ip`,`safe_key_expire`,`safe_key_value`,`username`,`zip_code`,`area`,`member_rank`) values (1,'2013-06-24 00:00:00','2013-06-24 00:00:00',null,0.000000000000,null,null,null,null,null,null,null,null,null,null,0.000000000000,'2013-06-24 00:00:00','test@shopxx.net',0,1,0,null,'2013-06-24 00:00:00',0,'192.168.1.1',null,'test','098f6bcd4621d373cade4e832627b4f6',null,0,'192.168.1.1',null,null,'test',null,9,1);

insert into `xx_delivery_corp`(`id`,`create_date`,`modify_date`,`orders`,`code`,`name`,`url`) values (1,'2013-06-24 00:00:01','2013-06-24 00:00:01',1,'yuantong','圆通速递','http://www.yto.net.cn');
insert into `xx_delivery_corp`(`id`,`create_date`,`modify_date`,`orders`,`code`,`name`,`url`) values (2,'2013-06-24 00:00:02','2013-06-24 00:00:02',2,'shentong','申通快递','http://www.sto.cn');
insert into `xx_delivery_corp`(`id`,`create_date`,`modify_date`,`orders`,`code`,`name`,`url`) values (3,'2013-06-24 00:00:03','2013-06-24 00:00:03',3,'yunda','韵达快运','http://www.yundaex.com');
insert into `xx_delivery_corp`(`id`,`create_date`,`modify_date`,`orders`,`code`,`name`,`url`) values (4,'2013-06-24 00:00:04','2013-06-24 00:00:04',4,'shunfeng','顺丰速递','http://www.sf-express.com');

insert into `xx_shipping_method`(`id`,`create_date`,`modify_date`,`orders`,`continue_price`,`continue_weight`,`description`,`first_price`,`first_weight`,`icon`,`name`,`default_delivery_corp`) values (1,'2013-06-24 00:00:05','2013-06-24 00:00:05',1,0.000000,1000,'系统将根据您的收货地址自动匹配快递公司进行配送，享受免运费服务',0.000000,1000,'http://storage.shopxx.net/demo-image/3.0/shipping_method/normal.gif','普通快递',2);
insert into `xx_shipping_method`(`id`,`create_date`,`modify_date`,`orders`,`continue_price`,`continue_weight`,`description`,`first_price`,`first_weight`,`icon`,`name`,`default_delivery_corp`) values (2,'2013-06-24 00:00:06','2013-06-24 00:00:06',2,0.000000,1000,'需支付10元配送费用，不享受免运费服务',10.000000,1000,'http://storage.shopxx.net/demo-image/3.0/shipping_method/shunfeng.gif','顺丰速递',4);

insert into `xx_payment_method`(`id`,`create_date`,`modify_date`,`orders`,`content`,`description`,`icon`,`method`,`name`,`timeout`) values (1,'2013-06-24 00:00:07','2013-06-24 00:00:07',1,null,'支持支付宝、财付通、以及大多数网上银行支付','http://storage.shopxx.net/demo-image/3.0/payment_method/online.gif',0,'网上支付',1440);
insert into `xx_payment_method`(`id`,`create_date`,`modify_date`,`orders`,`content`,`description`,`icon`,`method`,`name`,`timeout`) values (2,'2013-06-24 00:00:08','2013-06-24 00:00:08',2,'<img src="http://storage.shopxx.net/demo-image/3.0/201301/8417e751-a1d2-4727-82da-003075a44398.jpg" />','支持工行、建行、农行汇款支付，收款时间一般为汇款后的1-2个工作日','http://storage.shopxx.net/demo-image/3.0/payment_method/remittance.gif',1,'银行汇款',null);
insert into `xx_payment_method`(`id`,`create_date`,`modify_date`,`orders`,`content`,`description`,`icon`,`method`,`name`,`timeout`) values (3,'2013-06-24 00:00:09','2013-06-24 00:00:09',3,null,'由快递公司送货上门，您签收后直接将货款交付给快递员','http://storage.shopxx.net/demo-image/3.0/payment_method/cash_on_delivery.gif',1,'货到付款',null);

insert into `xx_payment_shipping_method`(`payment_methods`,`shipping_methods`) values (1,1);
insert into `xx_payment_shipping_method`(`payment_methods`,`shipping_methods`) values (2,1);
insert into `xx_payment_shipping_method`(`payment_methods`,`shipping_methods`) values (1,2);
insert into `xx_payment_shipping_method`(`payment_methods`,`shipping_methods`) values (2,2);
insert into `xx_payment_shipping_method`(`payment_methods`,`shipping_methods`) values (3,2);

insert into `xx_delivery_center`(`id`,`create_date`,`modify_date`,`address`,`area_name`,`contact`,`is_default`,`memo`,`mobile`,`name`,`phone`,`zip_code`,`area`) values (1,'2013-06-24 00:00:15','2013-06-24 00:00:15','新建安天坛东路888号','北京市东城区','李小明',1,null,'13888888888','北京发货中心','010-88888888','100062',2);

insert into `xx_delivery_template`(`id`,`create_date`,`modify_date`,`background`,`content`,`height`,`is_default`,`memo`,`name`,`offsetx`,`offsety`,`width`) values (1,'2013-06-24 00:00:16','2013-06-24 00:00:16','http://storage.shopxx.net/demo-image/3.0/delivery_template/yto.png','<DIV class=item style="Z-INDEX: 10; LEFT: 102px; TOP: 127px"><PRE>${deliveryCenter.name}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 9; LEFT: 103px; TOP: 98px"><PRE>${deliveryCenter.contact}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 11; LEFT: 102px; TOP: 164px"><PRE>${deliveryCenter.areaName}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 3; LEFT: 116px; TOP: 227px"><PRE>${deliveryCenter.mobile}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 5; LEFT: 278px; TOP: 227px"><PRE>${deliveryCenter.phone}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class="item selected" style="Z-INDEX: 7; LEFT: 459px; TOP: 113px"><PRE>${order.consignee}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 10; LEFT: 455px; TOP: 171px"><PRE>${order.areaName}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 15; LEFT: 408px; TOP: 203px"><PRE>${order.address}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 1; LEFT: 50px; TOP: 198px"><PRE>${deliveryCenter.address}</PRE>
<DIV class=resize></DIV></DIV>
<DIV class=item style="Z-INDEX: 18; LEFT: 501px; TOP: 226px"><PRE>${order.phone}</PRE>
<DIV class=resize></DIV></DIV>',483,1,null,'圆通快递',0,0,800);

insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (1,'2013-06-24 00:00:17','2013-06-24 00:00:17',1,'\0','会员中心',0,'/CMall/member/index.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (2,'2013-06-24 00:00:18','2013-06-24 00:00:18',2,'\0','购物指南',0,'/CMall/article/list/3.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (3,'2013-06-24 00:00:19','2013-06-24 00:00:19',3,'\0','关于我们',0,'/CMall/article/list/7.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (4,'2013-06-24 00:00:20','2013-06-24 00:00:20',4,'\0','社区首页',1,'${currentArea}');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (5,'2013-06-24 00:00:21','2013-06-24 00:00:21',5,'\0','商品交易',1,'/CMall/product/list/1.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (6,'2013-06-24 00:00:22','2013-06-24 00:00:22',6,'\0','餐饮服务',1,'/CMall/product/list/2.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (7,'2013-06-24 00:00:23','2013-06-24 00:00:23',7,'\0','生活服务',1,'/CMall/product/list/3.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (12,'2013-06-24 00:00:28','2013-06-24 00:00:28',12,'\0','关于我们',2,'#');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (13,'2013-06-24 00:00:29','2013-06-24 00:00:29',13,'\0','联系我们',2,'#');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (14,'2013-06-24 00:00:30','2013-06-24 00:00:30',14,'\0','诚聘英才',2,'#');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (15,'2013-06-24 00:00:31','2013-06-24 00:00:31',15,'\0','法律声明',2,'#');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (16,'2013-06-24 00:00:32','2013-06-24 00:00:32',16,'\0','友情链接',2,'/CMall/friend_link.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (17,'2013-06-24 00:00:33','2013-06-24 00:00:33',17,'','支付方式',2,'/CMall/article/list/4.jhtml');
insert  into `xx_navigation`(`id`,`create_date`,`modify_date`,`orders`,`is_blank_target`,`name`,`position`,`url`) values (18,'2013-06-24 00:00:34','2013-06-24 00:00:34',18,'','配送方式',2,'/CMall/article/list/5.jhtml');

insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (1,'2013-06-24 00:00:37','2013-06-24 00:00:37',1,'http://storage.shopxx.net/demo-image/3.0/friend_link/shopxx.gif','SHOP++官网',1,'http://www.shopxx.net');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (2,'2013-06-24 00:00:38','2013-06-24 00:00:38',2,'http://storage.shopxx.net/demo-image/3.0/friend_link/shopxx.gif','SHOP++论坛',1,'http://bbs.shopxx.net');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (3,'2013-06-24 00:00:39','2013-06-24 00:00:39',3,'http://storage.shopxx.net/demo-image/3.0/friend_link/alipay.gif','支付宝',1,'http://www.alipay.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (4,'2013-06-24 00:00:40','2013-06-24 00:00:40',4,'http://storage.shopxx.net/demo-image/3.0/friend_link/tenpay.gif','财付通',1,'http://www.tenpay.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (5,'2013-06-24 00:00:41','2013-06-24 00:00:41',5,'http://storage.shopxx.net/demo-image/3.0/friend_link/chinapay.gif','银联在线',1,'http://www.chinapay.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (6,'2013-06-24 00:00:42','2013-06-24 00:00:42',6,'http://storage.shopxx.net/demo-image/3.0/friend_link/99bill.gif','快钱支付',1,'http://www.99bill.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (7,'2013-06-24 00:00:43','2013-06-24 00:00:43',7,'http://storage.shopxx.net/demo-image/3.0/friend_link/admin5.gif','A5下载',1,'http://down.admin5.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (8,'2013-06-24 00:00:44','2013-06-24 00:00:44',8,'http://storage.shopxx.net/demo-image/3.0/friend_link/kuaidi100.gif','快递100',1,'http://www.kuaidi100.com');
insert into `xx_friend_link`(`id`,`create_date`,`modify_date`,`orders`,`logo`,`name`,`type`,`url`) values (9,'2013-06-24 00:00:45','2013-06-24 00:00:45',9,'http://storage.shopxx.net/demo-image/3.0/friend_link/cnzz.gif','站长统计',1,'http://www.cnzz.com');

insert into `xx_tag`(`id`,`create_date`,`modify_date`,`orders`,`icon`,`memo`,`name`,`type`) values (1,'2013-06-24 00:00:46','2013-06-24 00:00:46',1,'http://storage.shopxx.net/demo-image/3.0/tag/hot.gif',null,'热销',1);
insert into `xx_tag`(`id`,`create_date`,`modify_date`,`orders`,`icon`,`memo`,`name`,`type`) values (2,'2013-06-24 00:00:47','2013-06-24 00:00:47',2,'http://storage.shopxx.net/demo-image/3.0/tag/new.gif',null,'最新',1);
insert into `xx_tag`(`id`,`create_date`,`modify_date`,`orders`,`icon`,`memo`,`name`,`type`) values (3,'2013-06-24 00:00:48','2013-06-24 00:00:48',3,null,null,'热点',0);
insert into `xx_tag`(`id`,`create_date`,`modify_date`,`orders`,`icon`,`memo`,`name`,`type`) values (4,'2013-06-24 00:00:49','2013-06-24 00:00:49',4,null,null,'推荐',0);

insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (1,'2013-06-24 00:00:50','2013-06-24 00:00:50',1,0,'商城动态',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (2,'2013-06-24 00:00:51','2013-06-24 00:00:51',2,0,'活动促销',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (3,'2013-06-24 00:00:52','2013-06-24 00:00:52',3,0,'购物指南',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (4,'2013-06-24 00:00:53','2013-06-24 00:00:53',4,0,'支付方式',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (5,'2013-06-24 00:00:54','2013-06-24 00:00:54',5,0,'配送方式',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (6,'2013-06-24 00:00:55','2013-06-24 00:00:55',6,0,'售后服务',null,null,null,',',null);
insert into `xx_article_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (7,'2013-06-24 00:00:56','2013-06-24 00:00:56',7,0,'关于我们',null,null,null,',',null);

-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (1,'2013-06-24 00:01:31','2013-06-24 00:01:31',1,0,'时尚女装',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (2,'2013-06-24 00:01:32','2013-06-24 00:01:32',2,0,'精品男装',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (3,'2013-06-24 00:01:33','2013-06-24 00:01:33',3,0,'精致内衣',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (4,'2013-06-24 00:01:34','2013-06-24 00:01:34',4,0,'服饰配件',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (5,'2013-06-24 00:01:35','2013-06-24 00:01:35',5,0,'时尚女鞋',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (6,'2013-06-24 00:01:36','2013-06-24 00:01:36',6,0,'流行男鞋',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (7,'2013-06-24 00:01:37','2013-06-24 00:01:37',7,0,'潮流女包',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (8,'2013-06-24 00:01:38','2013-06-24 00:01:38',8,0,'精品男包',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (9,'2013-06-24 00:01:39','2013-06-24 00:01:39',9,0,'童装童鞋',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (10,'2013-06-24 00:01:40','2013-06-24 00:01:40',10,0,'时尚饰品',null,null,null,',',null);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (11,'2013-06-24 00:01:41','2013-06-24 00:01:41',1,1,'连衣裙',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (12,'2013-06-24 00:01:42','2013-06-24 00:01:42',2,1,'针织衫',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (13,'2013-06-24 00:01:43','2013-06-24 00:01:43',3,1,'短外套',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (14,'2013-06-24 00:01:44','2013-06-24 00:01:44',4,1,'小西装',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (15,'2013-06-24 00:01:45','2013-06-24 00:01:45',5,1,'牛仔裤',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (16,'2013-06-24 00:01:46','2013-06-24 00:01:46',6,1,'T恤',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (17,'2013-06-24 00:01:47','2013-06-24 00:01:47',7,1,'衬衫',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (18,'2013-06-24 00:01:48','2013-06-24 00:01:48',8,1,'风衣',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (19,'2013-06-24 00:01:49','2013-06-24 00:01:49',9,1,'卫衣',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (20,'2013-06-24 00:01:50','2013-06-24 00:01:50',10,1,'裤子',null,null,null,',1,',1);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (21,'2013-06-24 00:01:51','2013-06-24 00:01:51',1,1,'针织衫',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (22,'2013-06-24 00:01:52','2013-06-24 00:01:52',2,1,'POLO衫',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (23,'2013-06-24 00:01:53','2013-06-24 00:01:53',3,1,'休闲裤',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (24,'2013-06-24 00:01:54','2013-06-24 00:01:54',4,1,'牛仔裤',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (25,'2013-06-24 00:01:55','2013-06-24 00:01:55',5,1,'T恤',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (26,'2013-06-24 00:01:56','2013-06-24 00:01:56',6,1,'衬衫',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (27,'2013-06-24 00:01:57','2013-06-24 00:01:57',7,1,'西服',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (28,'2013-06-24 00:01:58','2013-06-24 00:01:58',8,1,'西裤',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (29,'2013-06-24 00:01:59','2013-06-24 00:01:59',9,1,'风衣',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (30,'2013-06-24 00:02:00','2013-06-24 00:02:00',10,1,'卫衣',null,null,null,',2,',2);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (31,'2013-06-24 00:02:01','2013-06-24 00:02:01',1,1,'女式内裤',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (32,'2013-06-24 00:02:02','2013-06-24 00:02:02',2,1,'男式内裤',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (33,'2013-06-24 00:02:03','2013-06-24 00:02:03',3,1,'保暖内衣',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (34,'2013-06-24 00:02:04','2013-06-24 00:02:04',4,1,'塑身衣',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (35,'2013-06-24 00:02:05','2013-06-24 00:02:05',5,1,'连裤袜',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (36,'2013-06-24 00:02:06','2013-06-24 00:02:06',6,1,'打底袜',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (37,'2013-06-24 00:02:07','2013-06-24 00:02:07',7,1,'文胸',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (38,'2013-06-24 00:02:08','2013-06-24 00:02:08',8,1,'睡衣',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (39,'2013-06-24 00:02:09','2013-06-24 00:02:09',9,1,'泳装',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (40,'2013-06-24 00:02:10','2013-06-24 00:02:10',10,1,'浴袍',null,null,null,',3,',3);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (41,'2013-06-24 00:02:11','2013-06-24 00:02:11',1,1,'女士腰带',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (42,'2013-06-24 00:02:12','2013-06-24 00:02:12',2,1,'男士皮带',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (43,'2013-06-24 00:02:13','2013-06-24 00:02:13',3,1,'女士围巾',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (44,'2013-06-24 00:02:14','2013-06-24 00:02:14',4,1,'男士围巾',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (45,'2013-06-24 00:02:15','2013-06-24 00:02:15',5,1,'帽子',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (46,'2013-06-24 00:02:16','2013-06-24 00:02:16',6,1,'手套',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (47,'2013-06-24 00:02:17','2013-06-24 00:02:17',7,1,'领带',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (48,'2013-06-24 00:02:18','2013-06-24 00:02:18',8,1,'领结',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (49,'2013-06-24 00:02:19','2013-06-24 00:02:19',9,1,'发饰',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (50,'2013-06-24 00:02:20','2013-06-24 00:02:20',10,1,'袖扣',null,null,null,',4,',4);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (51,'2013-06-24 00:02:21','2013-06-24 00:02:21',1,1,'高帮鞋',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (52,'2013-06-24 00:02:22','2013-06-24 00:02:22',2,1,'雪地靴',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (53,'2013-06-24 00:02:23','2013-06-24 00:02:23',3,1,'中筒靴',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (54,'2013-06-24 00:02:24','2013-06-24 00:02:24',4,1,'单鞋',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (55,'2013-06-24 00:02:25','2013-06-24 00:02:25',5,1,'凉鞋',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (56,'2013-06-24 00:02:26','2013-06-24 00:02:26',6,1,'靴子',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (57,'2013-06-24 00:02:27','2013-06-24 00:02:27',7,1,'短靴',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (58,'2013-06-24 00:02:28','2013-06-24 00:02:28',8,1,'雨靴',null,null,null,',5,',5);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (59,'2013-06-24 00:02:29','2013-06-24 00:02:29',1,1,'低帮鞋',null,null,null,',6,',6);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (60,'2013-06-24 00:02:30','2013-06-24 00:02:30',2,1,'高帮鞋',null,null,null,',6,',6);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (61,'2013-06-24 00:02:31','2013-06-24 00:02:31',3,1,'休闲鞋',null,null,null,',6,',6);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (62,'2013-06-24 00:02:32','2013-06-24 00:02:32',4,1,'正装鞋',null,null,null,',6,',6);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (63,'2013-06-24 00:02:33','2013-06-24 00:02:33',1,1,'单肩包',null,null,null,',7,',7);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (64,'2013-06-24 00:02:34','2013-06-24 00:02:34',2,1,'双肩包',null,null,null,',7,',7);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (65,'2013-06-24 00:02:35','2013-06-24 00:02:35',3,1,'手提包',null,null,null,',7,',7);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (66,'2013-06-24 00:02:36','2013-06-24 00:02:36',4,1,'手拿包',null,null,null,',7,',7);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (67,'2013-06-24 00:02:37','2013-06-24 00:02:37',1,1,'单肩男',null,null,null,',8,',8);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (68,'2013-06-24 00:02:38','2013-06-24 00:02:38',2,1,'双肩包',null,null,null,',8,',8);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (69,'2013-06-24 00:02:39','2013-06-24 00:02:39',3,1,'手提包',null,null,null,',8,',8);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (70,'2013-06-24 00:02:40','2013-06-24 00:02:40',4,1,'手拿包',null,null,null,',8,',8);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (71,'2013-06-24 00:02:41','2013-06-24 00:02:41',1,1,'运动鞋',null,null,null,',9,',9);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (72,'2013-06-24 00:02:42','2013-06-24 00:02:42',2,1,'牛仔裤',null,null,null,',9,',9);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (73,'2013-06-24 00:02:43','2013-06-24 00:02:43',3,1,'套装',null,null,null,',9,',9);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (74,'2013-06-24 00:02:44','2013-06-24 00:02:44',4,1,'裤子',null,null,null,',9,',9);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (75,'2013-06-24 00:02:45','2013-06-24 00:02:45',1,1,'项链',null,null,null,',10,',10);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (76,'2013-06-24 00:02:46','2013-06-24 00:02:46',2,1,'手链',null,null,null,',10,',10);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (77,'2013-06-24 00:02:47','2013-06-24 00:02:47',3,1,'戒指',null,null,null,',10,',10);
-- insert into `xx_product_category`(`id`,`create_date`,`modify_date`,`orders`,`grade`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`tree_path`,`parent`) values (78,'2013-06-24 00:02:48','2013-06-24 00:02:48',4,1,'耳饰',null,null,null,',10,',10);

-- xx_company
-- insert into xx_company (id, name, url, introduction, create_date, modify_date) values (1, '福建七匹狼实业股份有限公司',null,null, '2013-06-24 00:15:02','2013-06-24 00:15:02');
-- insert into xx_company (id, name, url, introduction, create_date, modify_date) values (2, '联想控股有限公司',null,null, '2013-06-24 00:15:02','2013-06-24 00:15:02');

-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (1,'2013-06-24 00:02:49','2013-06-24 00:02:49',1,'<img src="http://storage.shopxx.net/demo-image/3.0/201301/32937deb-f9c7-4baf-87ec-9d7c140e6f56.jpg" />','http://storage.shopxx.net/demo-image/3.0/brand/vimly.gif','梵希蔓',1,null,1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (2,'2013-06-24 00:02:50','2013-06-24 00:02:50',2,'<img src="http://storage.shopxx.net/demo-image/3.0/201301/4a43f5da-bd99-4e73-8a45-c3cf97df5bc1.jpg" />','http://storage.shopxx.net/demo-image/3.0/brand/eifini.gif','伊芙丽',1,'http://www.eifini.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (3,'2013-06-24 00:02:51','2013-06-24 00:02:51',3,'<img src="http://storage.shopxx.net/demo-image/3.0/201301/393335cd-fa85-4697-9a35-be7920533923.jpg" />','http://storage.shopxx.net/demo-image/3.0/brand/sentubila.gif','尚都比拉',1,'http://www.shangdubila.net',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (4,'2013-06-24 00:02:52','2013-06-24 00:02:52',4,'森马，国内休闲服行业迅速崛起的领军品牌。森马集团有限公司以“创大众服饰名牌”为发展宗旨，积极推行特许经营发展模式，休闲装和童装品牌连锁网点遍布全国二十九个省、市、自治区、直辖市，形成了完整的市场网络格局。集团公司现有休闲装 “semir”及童装“balabala”等两个知名服装品牌。森马集团有限公司于1996年12月18日创立于浙江省温州市，是一家以虚拟经营模式为特色，以系列休闲服饰为主导产业的无区域集团。公司注册资本为人民币2.38亿元，总资产达10多亿元，是温州市大企业大集团之一。','http://storage.shopxx.net/demo-image/3.0/brand/semir.gif','森马',1,'http://www.semir.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (5,'2013-06-24 00:02:53','2013-06-24 00:02:53',5,'<img src="http://storage.shopxx.net/demo-image/3.0/201301/84a3cc7a-c43b-4efc-8ed1-ba104cfb9a62.jpg" />','http://storage.shopxx.net/demo-image/3.0/brand/yishion.gif','以纯',1,'http://www.yishion.com.cn',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (6,'2013-06-24 00:02:54','2013-06-24 00:02:54',6,'李宁公司是中国家喻户晓的“体操王子”李宁先生在1990年创立的体育用品公司。经过二十多年的探索，李宁公司已逐步成为代表中国的、国际领先的运动品牌公司。从成立初期率先在全国建立特许专卖营销体系到持续多年赞助中国体育代表团参加国内外各种赛事；从成为国内第一家实施ERP的体育用品企业到不断进行品牌定位的调整，再到2004年6月在香港的上市，李宁公司经历了中国民族企业的发展与繁荣。<br />
-- 李宁公司拥有品牌营销、研发、设计、制造、经销及零售能力，产品主要包括自有李宁品牌生产的运动及休闲鞋类、服装、器材和配件产品。主要采用外包生产和特许分销商模式，在中国已经建立庞大的供应链管理体系以及分销和零售网络，截止2011年末，李宁品牌店铺在中国境内总数达到8255间，并且在东南亚、中亚、欧洲等地区开拓业务。<br />
-- 李宁公司还采取多品牌业务发展的策略，在聚焦自有核心李宁品牌的同时，还(i)与Aigle International S.A成立合资经营，并获授予专营权在中国生产、推广、分销及销售法国AIGLE（艾高）品牌户外运动用品；(ii)透过附属公司从事生产、研发、推广及销售红双喜品牌乒乓球及其它体育器材；(iii)获Lotto Sport Italia S.p.A旗下公司授予独家特许权，在中国开发、制造、推广、分销及销售意大利运动时尚Lotto（乐途）品牌特许产品；及(iv)从事Kason（凯胜）品牌羽毛球专业产品的研发、制造及销售。<br />
-- 创新是李宁品牌发展的根本。李宁公司自成立之初就非常重视原创设计。1998年建立了中国第一家服装与鞋产品设计开发中心，率先成为自主开发的中国体育用品公司。2004年8月，香港设计研发中心成立，集中负责设计李宁品牌服装产品。并且与国内外各大知名高校和研究机构保持密切合作。<br />','http://storage.shopxx.net/demo-image/3.0/brand/lining.gif','李宁',1,'http://www.li-ning.com.cn',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (7,'2013-06-24 00:02:55','2013-06-24 00:02:55',7,'耐克是全球著名的体育用品制造商，总部位于美国俄勒冈州，生产的体育用品包罗万象：服装、鞋类、运动器材等。<br />
-- 耐克一直将激励全世界的每一位运动员并为其献上最好的产品视为光荣的任务。耐克的语言就是运动的语言。耐克公司投入了大量的人力、物力用于新产品的开发和研制。耐克首创的气垫技术给体育界带来了一场革命。运用这项技术制造出的运动鞋可以很好地保护运动员的脚踝，防止其在作剧烈运动时扭伤。<br />
-- 耐克 (Nike) 被誉为是“近20年世界新创建的最成功的消费品公司”。耐克 (Nike) 运动鞋除了强化高科技运动性能，如今更讲究时尚的外形设计，频频与各国各界潮流达人合作推出联名限量版。2009年初陈冠希的Clot品牌与耐克 (Nike) 的联名新款红色中国鞋 Clot×Nike AIR FORCE 1 在上海一上市，即成为疯抢对象。在美国，有高达七成的青少年的梦想是有一双耐克 (Nike) 鞋。<br />','http://storage.shopxx.net/demo-image/3.0/brand/nike.gif','耐克',1,'http://www.nike.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (8,'2013-06-24 00:02:56','2013-06-24 00:02:56',8,'阿迪达斯的目标是协调与员工的私人和家庭需要的阿迪达斯集团的商业利益。提出工作与生活平衡方案：面向家庭的服务，灵活的工作时间和地点，人的发展和领导能力相关的工作与生活的平衡。<br />
-- 阿迪达斯目前分为三个系列，分别为：运动表现系列（三条纹LOGO）、运动传统系列（三叶草LOGO)、运动时尚系列(球状内含三条纹LOGO)。<br />
-- 运动表现系列专门致力于大众体育运动事业，其定位是大众化的运动风潮，采用阿迪三条纹LOGO，价格较易大众所接受。<br />
-- 运动传统系列是阿迪达斯的经典系列，其定位是复古经典风潮，较之运动表现系列更为时尚、高端一些。运动传统系列采用阿迪三叶草LOGO（也是阿迪较早之前的LOGO），因该系列推出的多为限量产品所以价格较易为中高收入人群所接受。<br />','http://storage.shopxx.net/demo-image/3.0/brand/adidas.gif','阿迪达斯',1,'http://www.adidas.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (9,'2013-06-24 00:02:57','2013-06-24 00:02:57',9,'Jack &amp; Jones是针对年龄在18岁到30岁之间的喜欢穿着随意、流行和时尚的男士们设计的。Jack &amp; Jones的设计迎合了国际大都市男士的生活品位，他们喜欢一种独特、轮廓鲜明而朴实的风格，同时采用高品质、时兴和新颖的面料制作的服装。<br />
-- Jack &amp; Jones品牌诞生于1975年，以其简洁纯粹的风格吸引全球追求时尚男性的目光，代表了欧洲时尚潮流的男装品牌，同时也是都市风格服装的典范品牌。<br />
-- Jack &amp; Jones是时尚男装里非常流行的品牌，与女装的ONLY、VERO MODA和男装SELECTED同属丹麦的BESTSELLER公司。他们经营各种男装，有休闲，正装等，还有各种配饰。<br />
-- 杰克琼斯(Jack &amp; Jones) 男装是设计给机敏，明智，受过良好教育，热衷社会活动的都市轻熟男。穿着杰克琼斯(Jack &amp; Jones) 的男人是对现代服装有着自己独特的感受，同时关注国际时装市场趋势的现代人。<br />','http://storage.shopxx.net/demo-image/3.0/brand/jackjones.gif','Jack Jones',1,'http://www.jackjones.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (10,'2013-06-24 00:02:58','2013-06-24 00:02:58',10,'七匹狼男装是中国男装行业开创性品牌，始终致力于为消费者提供满足现代多元化生活需求的高品质服装产品。“男人不只一面”，七匹狼以“品格男装”突显国际化品质和中西兼容的文化格调，以时尚传承经典，以中国面向世界。','http://storage.shopxx.net/demo-image/3.0/brand/septwolves.gif','七匹狼',1,'http://www.septwolves.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (11,'2013-06-24 00:02:59','2013-06-24 00:02:59',11,'恒源祥，创立于1927年的中国上海，产品涵盖绒线、针织、服饰、家纺等大类，绒线、羊毛衫综合销量常年保持同行业第一。<br />
-- 恒源祥既是中国进入市场经济后最早实施品牌运营的企业（1991年），又是中国最早进行特许经营的企业（1999年）。目前拥有98家加盟工厂，400多家加盟销售商、分销商以及5000多个加盟销售网点。中国省级市场销售网点涵盖率为100%，地、市级市场网点覆盖率超过90%，县级市场网点覆盖率超过60%。<br />
-- 品牌经营20年以来，恒源祥品牌获得了巨大的发展，品牌的价值得到了显著的提升。1999年，恒源祥获得“中国驰名商标”称号；2006年，在中国最有价值的100个老字号中，恒源祥位居第二；同年，恒源祥荣膺行业首家全国质量奖；2007年，由世界品牌实验室发布的中国500最具价值品牌排行榜中，恒源祥位列64位，品牌价值94.58亿元；2008年，恒源祥进入“亚洲品牌500强”，位列336位；2010年恒源祥再次入选《亚洲品牌500强》，排名跃升为203位。恒源祥集团做了大量的社会责任工作，所有的活动都是围绕着我们是国家的一员、我们是社会的一员，为社会创造价值为基本出发点，是恒源祥集团勇于承担社会责任的具体表现。未来，我们还将坚定不移地践行使命、精神、价值观，勇于承担社会责任，向成为历史的一部分的目的而持续奋斗。<br />','http://storage.shopxx.net/demo-image/3.0/brand/hengyuanxiang.gif','恒源祥',1,'http://www.g8888.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (12,'2013-06-24 00:03:00','2013-06-24 00:03:00',12,'圣得西（集团）有限公司始创于1989年，公司主要从事西服、西裤、休闲上衣、茄克、T恤、休闲裤、毛衫、衬衣、皮具等男士正装和商务休闲系列化产品的开发、生产和销售，目前拥有“圣得西”、“圣奥威斯”等品牌。公司先后在巴黎、上海建立研发设计中心，引进意大利、日本、德国等国家20余条顶级生产线，聚结世界前沿的服装技术，为中国男士量身打造优雅、舒展的圣得西。历年来，圣得西以其款式新颖、面料精美、工艺精湛而著称，是目前国内高级男士正装和休闲装的代表。','http://storage.shopxx.net/demo-image/3.0/brand/sundance.gif','圣得西',1,'http://www.sundance.com.cn',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (13,'2013-06-24 00:03:01','2013-06-24 00:03:01',13,'品牌介绍：	猫人集团旗下成熟女性内衣品牌，其前身是以"Maoren"为英文名称的猫人品牌。"猫人经典"融合猫人品牌与产品十年历炼精髓，以成熟、品位、性感、经典传承为核心设计风格， 针对35-45岁女性人群身理特点，主力开发高端暖衣、调整型塑身内衣产品，致力于提升都市成熟女性的高品质生活。<br />
-- 品牌定位：	成熟、品位、经典、性感<br />
-- 目标人群：	35-45岁为主的都市成熟女性。成熟、自信，有较好的经济基础，追求高品质生活。在生命的成熟阶段，准备释放全部的魅力，捍卫自己的家庭、事业以及对青春的美好留念。<br />','http://storage.shopxx.net/demo-image/3.0/brand/maoren.gif','猫人',1,'http://www.maoren.net',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (14,'2013-06-24 00:03:02','2013-06-24 00:03:02',14,'"北极绒"属上海赛洋集团旗下品牌，诞生于1998年，是中国最早的保暖内衣龙头品牌之一。产品一经问世，依靠先进的科技理念、优良的品质、大众化消费，以一骑绝尘之势迅速占领市场。赵本山代言广告语"怕冷就穿北极绒，地球人都知道"，更是迅速传遍全国各地、街头巷尾，成为人们茶余饭后的谈资。北极绒也借此迅速蹿升为中国保暖内衣行业的重要领导品牌之一。<br />
-- "千淘万漉虽辛苦，吹尽黄沙始到金"。十四年，梦想引领北极绒一直向前，在前进的道路上，北极绒不断实施产品创新改革、营销模式改革。目前，其发展已经涵盖内衣、家纺、男装三大类共计几千个品类，销售渠道网络覆盖全国28个省、市、自治区6000多个终端，产品品质和声誉赢得了消费者的一致认可。十四年发展历程中，北极绒先后荣获"中国驰名商标"、"国家免检产品"、"2007—2011年中国最具价值500强品牌"、"2001-2010年连续十年全国同类产品销量第一"、"中国内衣十大影响力品牌"、"中国保暖内衣十强品牌"、"生态纺织品认证"、"保暖内衣国家标准主要起草单位"、"中国针织工业协会标准保温率唯一认证"等累累殊荣，以唯一持续十四年长青、十四年辉煌的业绩，成为内衣行业无可争议的领袖品牌。目前，北极绒的品牌价值被世界品牌实验室评估为47.35亿元人民币。北极绒公司拥有20多项专利和5000多家由各级代理商组成的庞大完善的销售网络，产品覆盖除港澳台外的全国所有省、市、自治区，截止目前，仅保暖内衣一个品类就创造了累计销售近4000万套的经营神话，被誉为中国保暖内衣的领袖企业。<br />
-- 2008年开始，公司秉承"合作.分享.共赢"的价值观，进行多方位资源整合，实施品牌联合大发展。"百年梦圆，大国崛起"，北极绒正以领袖风范，高扛民族大旗，引领中国纺织服装企业走向国际舞台，立于世界品牌之林！<br />','http://storage.shopxx.net/demo-image/3.0/brand/beijirong.gif','北极绒',1,'http://www.beijirong.com.cn',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (15,'2013-06-24 00:03:03','2013-06-24 00:03:03',15,'美特斯邦威是周成建创立于温州的一家民营企业，1995年4月22日温州解放剧院第一家专卖店的开业标志着“美特斯邦威”品牌的正式面世。创牌以来，企业坚持走品牌连锁经营的可持续发展道路，在国内服装行业率先采取“虚拟经营”的业务模式，依靠品牌营销、设计、信息化和人才队伍建设在激烈的市场竞争中形成了自己的核心竞争力，获得了令世人瞩目的成就。2004 年，“美特斯邦威 ”全系统销售额突破了25亿元。截止2005年11月30日，集团在中国已拥有上海、温州、北京、杭州、重庆、成都、广州、沈阳、西安 、天津、济南十一家分公司，近1500家加盟和直营店铺（其中面积超过500平米的旗舰店有15家），公司直营体系员工达到了4000多人，全系统员工超过了数万人，成为中国休闲服饰行业的龙头企业之一。','http://storage.shopxx.net/demo-image/3.0/brand/metersbonwe.gif','美特斯·邦威',1,'http://www.metersbonwe.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (16,'2013-06-24 00:03:04','2013-06-24 00:03:04',16,'1993年，真维斯进军中国内地市场，在上海开设了第一间JEANSWEST真维斯专卖店。多年来，真维斯以“名牌大众化”的经营理念，“物超所值”的市场策略，稳占休闲装市场的领袖地位。现今，真维斯已在国内20多个省市开设了2000多间专卖店，拥有现时中国最大的休闲服饰销售网络。&nbsp;<br />
-- <br />
-- 真维斯的经营理念是“名牌大众化”——少数人拥有的物品，令大众都能拥有；市场策略是“物超所值”——高价值的物品，低价钱销售。<br />
-- 真维斯服装是为广大年轻人设计的，将每季最新的潮流元素融入服装当中，以易穿易搭配的款式来吸引顾客。多年来，真维斯以大众潮流的休闲风格，深受年轻人的喜爱，已经成为年轻一代的时尚必需品。<br />
-- <br />
-- 真维斯为了维护和加强品牌的形象，从连锁店铺的购物环境、店内布置、商品陈列、耐心的微笑服务、全面到位的售后服务、营业员的招聘选拔和工作培训及指导等方面入手，提升服务水平。<br />
-- <br />
-- “穷则独善其身，达则兼善天下”是真维斯企业文化的体现。目前在国内贫困地区以真维斯命名的希望小学共有36间。2008年真维斯为“希望小学快乐运动会”捐助130多万元。同年，捐资220万修建55个贫困小学操场为贫困小学建设贡献力量。此外，真维斯还分别斥资2700万元和600万元，设立了“真维斯大学生助学基金”和“真维斯希望教师基金”，为教育事业出一份力。面对灾情时，真维斯向四川汶川和青海玉树共计捐出超过1000万元人民币的善款。并通过举办“大爱中华行——真维斯·真的更精彩”慈善歌会行动，将慈善与娱乐相结合，呼吁更多年轻人关注慈善、奉献爱心。同时真维斯还通过开展“中国真维斯杯休闲装设计大赛”这一活动，给年轻人提供一个展示潜能、相互交流的平台。以体现社会价值为核心的品牌理念已深深牵动每一位真维斯顾客。<br />
-- <br />
-- “真维斯”是一个年轻﹑健康﹑向上的服饰品牌。“真维斯”倡导一种真诚﹑乐观的生活态度。真维斯为渴望被关注﹑被认可的年轻人打造最真的生活态度。做回真我，穿回真我，分享真我。 “真的·更精彩” 真维斯！<br />','http://storage.shopxx.net/demo-image/3.0/brand/jeanswest.gif','真维斯',1,'http://www.jeanswest.com',1,2);
-- insert into `xx_brand`(`id`,`create_date`,`modify_date`,`orders`,`introduction`,`logo`,`name`,`type`,`url`,`company`,`level`) values (17,'2013-06-24 00:03:05','2013-06-24 00:03:05',17,'唐狮“TONLION”直属于宁波博洋服饰有限公司，成立于1994年，以经营男女大众休闲服饰为主。10多年来，“唐狮”服饰长期坚持不断改善产品品质和提供专业优质的服务造福大众。<br />
-- 唐狮坚持“我有我的方式”的品牌信念，为中国的年轻潮人度身打造专属于他们的服饰品牌。2005年以来，连续三年被世界品牌实验室评定为“中国500最具价值品牌”，品牌价值31.92亿元；之后，唐狮又接连尽揽“中国驰名商标”、“中国青年最喜爱的休闲服饰品牌”、“中国服饰品牌年度大奖”等多项傲人荣誉于一身。<br />
-- 2009年初，唐狮顺应潮流，快人一步加入电子商务市场，不仅为品牌成功打开“网销化”布局的第一步，更为热火朝天的网购服装市场添了一笔佳绩。09年底便成功挤入淘宝商城男装分类销量前三名，至今一直保持领先。<br />
-- 2011年，唐狮的目标是突玻2个亿，全方位的打造电子商务第一品牌。在原有淘宝平台的基础上，又积极将营销领域延伸到拍拍、京东、趣点等国内其它网销平台，力求多方面、多层次的发展。通过各平台不同的营销模式，不同的销售群体，在反复的对比中，唐狮积累到更多关于电子商务的宝贵经验，为今后平台的不断完善和壮大，莫定了坚实的基础。<br />
-- 从曾经的服饰品牌新人王，到今天的潮流品牌星势力。每一天，唐狮都在飞速成长，每一年，唐狮都在撰写全新的篇章。唐潮盛狮崛起，辉煌未完待续。<br />','http://storage.shopxx.net/demo-image/3.0/brand/tonlion.gif','唐狮',1,'http://www.tonlion.com',1,2);


insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (1,'2013-06-24 00:03:20','2013-06-24 00:03:20',1,'基本参数',11);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (2,'2013-06-24 00:03:21','2013-06-24 00:03:21',2,'基本参数',14);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (3,'2013-06-24 00:03:22','2013-06-24 00:03:22',3,'基本参数',17);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (4,'2013-06-24 00:03:23','2013-06-24 00:03:23',4,'基本参数',26);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (5,'2013-06-24 00:03:24','2013-06-24 00:03:24',5,'基本参数',27);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (6,'2013-06-24 00:03:25','2013-06-24 00:03:25',6,'基本参数',25);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (7,'2013-06-24 00:03:26','2013-06-24 00:03:26',7,'基本参数',29);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (8,'2013-06-24 00:03:27','2013-06-24 00:03:27',8,'基本参数',18);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (9,'2013-06-24 00:03:28','2013-06-24 00:03:28',9,'基本参数',13);
insert into `xx_parameter_group`(`id`,`create_date`,`modify_date`,`orders`,`name`,`product_category`) values (10,'2013-06-24 00:03:29','2013-06-24 00:03:29',10,'基本参数',19);

insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (1,'2013-06-24 00:03:30','2013-06-24 00:03:30',1,'风格',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (2,'2013-06-24 00:03:31','2013-06-24 00:03:31',2,'通勤',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (3,'2013-06-24 00:03:32','2013-06-24 00:03:32',3,'组合形式',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (4,'2013-06-24 00:03:33','2013-06-24 00:03:33',4,'裙长',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (5,'2013-06-24 00:03:34','2013-06-24 00:03:34',5,'款式',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (6,'2013-06-24 00:03:35','2013-06-24 00:03:35',6,'袖长',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (7,'2013-06-24 00:03:36','2013-06-24 00:03:36',7,'领型',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (8,'2013-06-24 00:03:37','2013-06-24 00:03:37',8,'袖型',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (9,'2013-06-24 00:03:38','2013-06-24 00:03:38',9,'腰型',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (10,'2013-06-24 00:03:39','2013-06-24 00:03:39',10,'衣门襟',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (11,'2013-06-24 00:03:40','2013-06-24 00:03:40',11,'裙型',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (12,'2013-06-24 00:03:41','2013-06-24 00:03:41',12,'图案',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (13,'2013-06-24 00:03:42','2013-06-24 00:03:42',13,'流行元素/工艺',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (14,'2013-06-24 00:03:43','2013-06-24 00:03:43',14,'材质',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (15,'2013-06-24 00:03:44','2013-06-24 00:03:44',15,'主成份含量',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (16,'2013-06-24 00:03:45','2013-06-24 00:03:45',16,'主材质',1);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (17,'2013-06-24 00:03:46','2013-06-24 00:03:46',1,'板型',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (18,'2013-06-24 00:03:47','2013-06-24 00:03:47',2,'厚薄',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (19,'2013-06-24 00:03:48','2013-06-24 00:03:48',3,'组合形式',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (20,'2013-06-24 00:03:49','2013-06-24 00:03:49',4,'风格',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (21,'2013-06-24 00:03:50','2013-06-24 00:03:50',5,'通勤',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (22,'2013-06-24 00:03:51','2013-06-24 00:03:51',6,'衣长',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (23,'2013-06-24 00:03:52','2013-06-24 00:03:52',7,'袖长',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (24,'2013-06-24 00:03:53','2013-06-24 00:03:53',8,'领子',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (25,'2013-06-24 00:03:54','2013-06-24 00:03:54',9,'袖型',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (26,'2013-06-24 00:03:55','2013-06-24 00:03:55',10,'衣门襟',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (27,'2013-06-24 00:03:56','2013-06-24 00:03:56',11,'图案',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (28,'2013-06-24 00:03:57','2013-06-24 00:03:57',12,'款式细节',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (29,'2013-06-24 00:03:58','2013-06-24 00:03:58',13,'面料分类',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (30,'2013-06-24 00:03:59','2013-06-24 00:03:59',14,'面料主成分含量',2);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (31,'2013-06-24 00:04:00','2013-06-24 00:04:00',1,'板型',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (32,'2013-06-24 00:04:01','2013-06-24 00:04:01',2,'风格',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (33,'2013-06-24 00:04:02','2013-06-24 00:04:02',3,'通勤',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (34,'2013-06-24 00:04:03','2013-06-24 00:04:03',4,'衣长',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (35,'2013-06-24 00:04:04','2013-06-24 00:04:04',5,'袖长',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (36,'2013-06-24 00:04:05','2013-06-24 00:04:05',6,'袖型',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (37,'2013-06-24 00:04:06','2013-06-24 00:04:06',7,'领型',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (38,'2013-06-24 00:04:07','2013-06-24 00:04:07',8,'衣门襟',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (39,'2013-06-24 00:04:08','2013-06-24 00:04:08',9,'图案',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (40,'2013-06-24 00:04:09','2013-06-24 00:04:09',10,'款式细节',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (41,'2013-06-24 00:04:10','2013-06-24 00:04:10',11,'材质主成份含量',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (42,'2013-06-24 00:04:11','2013-06-24 00:04:11',12,'质地',3);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (43,'2013-06-24 00:04:12','2013-06-24 00:04:12',1,'袖长',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (44,'2013-06-24 00:04:13','2013-06-24 00:04:13',2,'版型',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (45,'2013-06-24 00:04:14','2013-06-24 00:04:14',3,'领型',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (46,'2013-06-24 00:04:15','2013-06-24 00:04:15',4,'风格',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (47,'2013-06-24 00:04:16','2013-06-24 00:04:16',5,'面料分类',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (48,'2013-06-24 00:04:17','2013-06-24 00:04:17',6,'面料花型',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (49,'2013-06-24 00:04:18','2013-06-24 00:04:18',7,'面料主材质',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (50,'2013-06-24 00:04:19','2013-06-24 00:04:19',8,'棉含量',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (51,'2013-06-24 00:04:20','2013-06-24 00:04:20',9,'年份',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (52,'2013-06-24 00:04:21','2013-06-24 00:04:21',10,'适用季节',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (53,'2013-06-24 00:04:22','2013-06-24 00:04:22',11,'消费群体',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (54,'2013-06-24 00:04:23','2013-06-24 00:04:23',12,'场合',4);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (55,'2013-06-24 00:04:24','2013-06-24 00:04:24',1,'版型',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (56,'2013-06-24 00:04:25','2013-06-24 00:04:25',2,'领型',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (57,'2013-06-24 00:04:26','2013-06-24 00:04:26',3,'衣门襟',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (58,'2013-06-24 00:04:27','2013-06-24 00:04:27',4,'风格',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (59,'2013-06-24 00:04:28','2013-06-24 00:04:28',5,'面料分类',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (60,'2013-06-24 00:04:29','2013-06-24 00:04:29',6,'款式细节',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (61,'2013-06-24 00:04:30','2013-06-24 00:04:30',7,'袖长',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (62,'2013-06-24 00:04:31','2013-06-24 00:04:31',8,'面料主材质',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (63,'2013-06-24 00:04:32','2013-06-24 00:04:32',9,'羊毛含量',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (64,'2013-06-24 00:04:33','2013-06-24 00:04:33',10,'涤纶含量',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (65,'2013-06-24 00:04:34','2013-06-24 00:04:34',11,'适用季节',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (66,'2013-06-24 00:04:35','2013-06-24 00:04:35',12,'场合',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (67,'2013-06-24 00:04:36','2013-06-24 00:04:36',13,'消费群体',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (68,'2013-06-24 00:04:37','2013-06-24 00:04:37',14,'款式品名',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (69,'2013-06-24 00:04:38','2013-06-24 00:04:38',15,'下摆设计',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (70,'2013-06-24 00:04:39','2013-06-24 00:04:39',16,'男装厚薄',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (71,'2013-06-24 00:04:40','2013-06-24 00:04:40',17,'衣长',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (72,'2013-06-24 00:04:41','2013-06-24 00:04:41',18,'口袋设计',5);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (73,'2013-06-24 00:04:42','2013-06-24 00:04:42',1,'袖长',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (74,'2013-06-24 00:04:43','2013-06-24 00:04:43',2,'领型',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (75,'2013-06-24 00:04:44','2013-06-24 00:04:44',3,'面料分类',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (76,'2013-06-24 00:04:45','2013-06-24 00:04:45',4,'款式细节',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (77,'2013-06-24 00:04:46','2013-06-24 00:04:46',5,'工艺处理',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (78,'2013-06-24 00:04:47','2013-06-24 00:04:47',6,'风格',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (79,'2013-06-24 00:04:48','2013-06-24 00:04:48',7,'袖型',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (80,'2013-06-24 00:04:49','2013-06-24 00:04:49',8,'图案',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (81,'2013-06-24 00:04:50','2013-06-24 00:04:50',9,'版型',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (82,'2013-06-24 00:04:51','2013-06-24 00:04:51',10,'面料主材质',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (83,'2013-06-24 00:04:52','2013-06-24 00:04:52',11,'棉含量',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (84,'2013-06-24 00:04:53','2013-06-24 00:04:53',12,'适用季节',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (85,'2013-06-24 00:04:54','2013-06-24 00:04:54',13,'场合',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (86,'2013-06-24 00:04:55','2013-06-24 00:04:55',14,'消费群体',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (87,'2013-06-24 00:04:56','2013-06-24 00:04:56',15,'年份',6);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (88,'2013-06-24 00:04:57','2013-06-24 00:04:57',1,'领型',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (89,'2013-06-24 00:04:58','2013-06-24 00:04:58',2,'风格',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (90,'2013-06-24 00:04:59','2013-06-24 00:04:59',3,'面料分类',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (91,'2013-06-24 00:05:00','2013-06-24 00:05:00',4,'款式细节',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (92,'2013-06-24 00:05:01','2013-06-24 00:05:01',5,'季节',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (93,'2013-06-24 00:05:02','2013-06-24 00:05:02',6,'袖型',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (94,'2013-06-24 00:05:03','2013-06-24 00:05:03',7,'男装厚薄',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (95,'2013-06-24 00:05:04','2013-06-24 00:05:04',8,'版型',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (96,'2013-06-24 00:05:05','2013-06-24 00:05:05',9,'面料主材质',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (97,'2013-06-24 00:05:06','2013-06-24 00:05:06',10,'锦纶含量',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (98,'2013-06-24 00:05:07','2013-06-24 00:05:07',11,'涤纶含量',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (99,'2013-06-24 00:05:08','2013-06-24 00:05:08',12,'场合',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (100,'2013-06-24 00:05:09','2013-06-24 00:05:09',13,'消费群体',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (101,'2013-06-24 00:05:10','2013-06-24 00:05:10',14,'面料分类',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (102,'2013-06-24 00:05:11','2013-06-24 00:05:11',15,'下摆设计',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (103,'2013-06-24 00:05:12','2013-06-24 00:05:12',16,'口袋设计',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (104,'2013-06-24 00:05:13','2013-06-24 00:05:13',17,'衣门襟',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (105,'2013-06-24 00:05:14','2013-06-24 00:05:14',18,'衣长',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (106,'2013-06-24 00:05:15','2013-06-24 00:05:15',19,'花色',7);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (107,'2013-06-24 00:05:16','2013-06-24 00:05:16',1,'板型',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (108,'2013-06-24 00:05:17','2013-06-24 00:05:17',2,'厚薄',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (109,'2013-06-24 00:05:18','2013-06-24 00:05:18',3,'风格',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (110,'2013-06-24 00:05:19','2013-06-24 00:05:19',4,'通勤',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (111,'2013-06-24 00:05:20','2013-06-24 00:05:20',5,'衣长',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (112,'2013-06-24 00:05:21','2013-06-24 00:05:21',6,'袖长',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (113,'2013-06-24 00:05:22','2013-06-24 00:05:22',7,'领子',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (114,'2013-06-24 00:05:23','2013-06-24 00:05:23',8,'袖型',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (115,'2013-06-24 00:05:24','2013-06-24 00:05:24',9,'衣门襟',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (116,'2013-06-24 00:05:25','2013-06-24 00:05:25',10,'图案',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (117,'2013-06-24 00:05:26','2013-06-24 00:05:26',11,'流行元素/工艺',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (118,'2013-06-24 00:05:27','2013-06-24 00:05:27',12,'面料材质',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (119,'2013-06-24 00:05:28','2013-06-24 00:05:28',13,'面料主材质含量',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (120,'2013-06-24 00:05:29','2013-06-24 00:05:29',14,'里料分类',8);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (121,'2013-06-24 00:05:30','2013-06-24 00:05:30',1,'板型',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (122,'2013-06-24 00:05:31','2013-06-24 00:05:31',2,'风格',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (123,'2013-06-24 00:05:32','2013-06-24 00:05:32',3,'通勤',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (124,'2013-06-24 00:05:33','2013-06-24 00:05:33',4,'款式',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (125,'2013-06-24 00:05:34','2013-06-24 00:05:34',5,'袖长',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (126,'2013-06-24 00:05:35','2013-06-24 00:05:35',6,'领型',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (127,'2013-06-24 00:05:36','2013-06-24 00:05:36',7,'袖型',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (128,'2013-06-24 00:05:37','2013-06-24 00:05:37',8,'衣门襟',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (129,'2013-06-24 00:05:38','2013-06-24 00:05:38',9,'皮质',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (130,'2013-06-24 00:05:39','2013-06-24 00:05:39',10,'制作工艺',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (131,'2013-06-24 00:05:40','2013-06-24 00:05:40',11,'流行元素/工艺',9);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (132,'2013-06-24 00:05:41','2013-06-24 00:05:41',1,'板型',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (133,'2013-06-24 00:05:42','2013-06-24 00:05:42',2,'风格',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (134,'2013-06-24 00:05:43','2013-06-24 00:05:43',3,'通勤',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (135,'2013-06-24 00:05:44','2013-06-24 00:05:44',4,'穿着方式',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (136,'2013-06-24 00:05:45','2013-06-24 00:05:45',5,'组合形式',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (137,'2013-06-24 00:05:46','2013-06-24 00:05:46',6,'衣长',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (138,'2013-06-24 00:05:47','2013-06-24 00:05:47',7,'袖长',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (139,'2013-06-24 00:05:48','2013-06-24 00:05:48',8,'领型',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (140,'2013-06-24 00:05:49','2013-06-24 00:05:49',9,'袖型',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (141,'2013-06-24 00:05:50','2013-06-24 00:05:50',10,'图案',10);
insert into `xx_parameter`(`id`,`create_date`,`modify_date`,`orders`,`name`,`parameter_group`) values (142,'2013-06-24 00:05:51','2013-06-24 00:05:51',11,'款式细节',10);

insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (1,'2013-06-24 00:05:52','2013-06-24 00:05:52',1,'材质',0,11);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (2,'2013-06-24 00:05:53','2013-06-24 00:05:53',2,'裙长',1,11);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (3,'2013-06-24 00:05:54','2013-06-24 00:05:54',3,'领型',2,11);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (4,'2013-06-24 00:05:55','2013-06-24 00:05:55',4,'腰型',3,11);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (5,'2013-06-24 00:05:56','2013-06-24 00:05:56',5,'袖型',0,12);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (6,'2013-06-24 00:05:57','2013-06-24 00:05:57',6,'组合形式',1,12);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (7,'2013-06-24 00:05:58','2013-06-24 00:05:58',7,'衣门襟',2,12);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (8,'2013-06-24 00:05:59','2013-06-24 00:05:59',8,'厚薄',3,12);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (9,'2013-06-24 00:06:00','2013-06-24 00:06:00',9,'袖长',0,13);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (10,'2013-06-24 00:06:01','2013-06-24 00:06:01',10,'版型',1,13);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (11,'2013-06-24 00:06:02','2013-06-24 00:06:02',11,'衣长',2,13);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (12,'2013-06-24 00:06:03','2013-06-24 00:06:03',12,'厚薄',3,13);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (13,'2013-06-24 00:06:04','2013-06-24 00:06:04',13,'衣长',0,14);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (14,'2013-06-24 00:06:05','2013-06-24 00:06:05',14,'版型',1,14);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (15,'2013-06-24 00:06:06','2013-06-24 00:06:06',15,'衣门襟',2,14);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (16,'2013-06-24 00:06:07','2013-06-24 00:06:07',16,'款型',0,15);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (17,'2013-06-24 00:06:08','2013-06-24 00:06:08',17,'裤长',1,15);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (18,'2013-06-24 00:06:09','2013-06-24 00:06:09',18,'裤腰',2,15);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (19,'2013-06-24 00:06:10','2013-06-24 00:06:10',19,'面料',3,15);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (20,'2013-06-24 00:06:11','2013-06-24 00:06:11',20,'袖长',0,16);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (21,'2013-06-24 00:06:12','2013-06-24 00:06:12',21,'主材质',1,16);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (22,'2013-06-24 00:06:13','2013-06-24 00:06:13',22,'领型',2,16);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (23,'2013-06-24 00:06:14','2013-06-24 00:06:14',23,'衣长',3,16);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (24,'2013-06-24 00:06:15','2013-06-24 00:06:15',24,'板型',0,17);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (25,'2013-06-24 00:06:16','2013-06-24 00:06:16',25,'主材质',1,17);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (26,'2013-06-24 00:06:17','2013-06-24 00:06:17',26,'风格',2,17);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (27,'2013-06-24 00:06:18','2013-06-24 00:06:18',27,'衣长',3,17);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (28,'2013-06-24 00:06:19','2013-06-24 00:06:19',28,'衣长',0,18);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (29,'2013-06-24 00:06:20','2013-06-24 00:06:20',29,'板型',1,18);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (30,'2013-06-24 00:06:21','2013-06-24 00:06:21',30,'袖长',2,18);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (31,'2013-06-24 00:06:22','2013-06-24 00:06:22',31,'风格',3,18);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (32,'2013-06-24 00:06:23','2013-06-24 00:06:23',32,'款式',0,19);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (33,'2013-06-24 00:06:24','2013-06-24 00:06:24',33,'袖长',1,19);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (34,'2013-06-24 00:06:25','2013-06-24 00:06:25',34,'组合形式',2,19);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (35,'2013-06-24 00:06:26','2013-06-24 00:06:26',35,'厚薄',3,19);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (36,'2013-06-24 00:06:27','2013-06-24 00:06:27',36,'款型',0,20);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (37,'2013-06-24 00:06:28','2013-06-24 00:06:28',37,'裤腰',1,20);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (38,'2013-06-24 00:06:29','2013-06-24 00:06:29',38,'厚薄',2,20);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (39,'2013-06-24 00:06:30','2013-06-24 00:06:30',39,'厚薄',0,21);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (40,'2013-06-24 00:06:31','2013-06-24 00:06:31',40,'款式',1,21);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (41,'2013-06-24 00:06:32','2013-06-24 00:06:32',41,'领型',2,21);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (42,'2013-06-24 00:06:33','2013-06-24 00:06:33',42,'材质',3,21);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (43,'2013-06-24 00:06:34','2013-06-24 00:06:34',43,'袖长',0,22);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (44,'2013-06-24 00:06:35','2013-06-24 00:06:35',44,'风格',1,22);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (45,'2013-06-24 00:06:36','2013-06-24 00:06:36',45,'风格',0,23);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (46,'2013-06-24 00:06:37','2013-06-24 00:06:37',46,'款式',1,23);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (47,'2013-06-24 00:06:38','2013-06-24 00:06:38',47,'裤长',2,23);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (48,'2013-06-24 00:06:39','2013-06-24 00:06:39',48,'裤长',0,24);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (49,'2013-06-24 00:06:40','2013-06-24 00:06:40',49,'裤型',1,24);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (50,'2013-06-24 00:06:41','2013-06-24 00:06:41',50,'风格',2,24);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (51,'2013-06-24 00:06:42','2013-06-24 00:06:42',51,'领型',0,25);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (52,'2013-06-24 00:06:43','2013-06-24 00:06:43',52,'风格',1,25);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (53,'2013-06-24 00:06:44','2013-06-24 00:06:44',53,'袖长',2,25);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (54,'2013-06-24 00:06:45','2013-06-24 00:06:45',54,'袖长',0,26);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (55,'2013-06-24 00:06:46','2013-06-24 00:06:46',55,'风格',1,26);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (56,'2013-06-24 00:06:47','2013-06-24 00:06:47',56,'板型',2,26);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (57,'2013-06-24 00:06:48','2013-06-24 00:06:48',57,'风格',0,27);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (58,'2013-06-24 00:06:49','2013-06-24 00:06:49',58,'版型',1,27);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (59,'2013-06-24 00:06:50','2013-06-24 00:06:50',59,'风格',0,28);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (60,'2013-06-24 00:06:51','2013-06-24 00:06:51',60,'裤长',1,28);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (61,'2013-06-24 00:06:52','2013-06-24 00:06:52',61,'衣长',0,29);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (62,'2013-06-24 00:06:53','2013-06-24 00:06:53',62,'风格',1,29);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (63,'2013-06-24 00:06:54','2013-06-24 00:06:54',63,'板型',2,29);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (64,'2013-06-24 00:06:55','2013-06-24 00:06:55',64,'领型',3,29);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (65,'2013-06-24 00:06:56','2013-06-24 00:06:56',65,'款式',0,30);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (66,'2013-06-24 00:06:57','2013-06-24 00:06:57',66,'领型',1,30);
insert into `xx_attribute`(`id`,`create_date`,`modify_date`,`orders`,`name`,`property_index`,`product_category`) values (67,'2013-06-24 00:06:58','2013-06-24 00:06:58',67,'风格',2,30);

insert into `xx_attribute_option`(`attribute`,`options`) values (1,'雪纺');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'蕾丝');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'织锦');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'牛仔');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'绸缎');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'乔其纱');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'双绉');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'府绸');
insert into `xx_attribute_option`(`attribute`,`options`) values (1,'其他');
insert into `xx_attribute_option`(`attribute`,`options`) values (2,'超短裙');
insert into `xx_attribute_option`(`attribute`,`options`) values (2,'短裙');
insert into `xx_attribute_option`(`attribute`,`options`) values (2,'中裙');
insert into `xx_attribute_option`(`attribute`,`options`) values (2,'中长裙');
insert into `xx_attribute_option`(`attribute`,`options`) values (2,'长裙');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'圆领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'V领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'一字领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'翻领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'荷叶领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'双层领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'立领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'方领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'堆堆领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'连帽');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'娃娃领');
insert into `xx_attribute_option`(`attribute`,`options`) values (3,'西装领');
insert into `xx_attribute_option`(`attribute`,`options`) values (4,'中腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (4,'高腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (4,'宽松腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (4,'松紧腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (4,'低腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'常规袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'蝙蝠袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'泡泡袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'插肩袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'包袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'灯笼袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'荷叶袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'喇叭袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'公主袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (5,'衬衫袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (6,'单件套');
insert into `xx_attribute_option`(`attribute`,`options`) values (6,'假两件套');
insert into `xx_attribute_option`(`attribute`,`options`) values (6,'两件套');
insert into `xx_attribute_option`(`attribute`,`options`) values (7,'单排扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (7,'一粒扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (7,'拉链');
insert into `xx_attribute_option`(`attribute`,`options`) values (7,'双排扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (8,'超薄');
insert into `xx_attribute_option`(`attribute`,`options`) values (8,'薄');
insert into `xx_attribute_option`(`attribute`,`options`) values (8,'适中');
insert into `xx_attribute_option`(`attribute`,`options`) values (8,'厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (8,'加厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (9,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (9,'五分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (9,'七分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (9,'九分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (9,'无袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'直筒型');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'高腰型');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'斗篷型');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'蝙蝠型');
insert into `xx_attribute_option`(`attribute`,`options`) values (10,'披肩型');
insert into `xx_attribute_option`(`attribute`,`options`) values (11,'超短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (11,'短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (11,'常规款');
insert into `xx_attribute_option`(`attribute`,`options`) values (11,'中长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (12,'薄款');
insert into `xx_attribute_option`(`attribute`,`options`) values (12,'普通');
insert into `xx_attribute_option`(`attribute`,`options`) values (12,'加厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (12,'抓绒');
insert into `xx_attribute_option`(`attribute`,`options`) values (13,'短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (13,'常规款');
insert into `xx_attribute_option`(`attribute`,`options`) values (13,'中长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (14,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (14,'直筒型');
insert into `xx_attribute_option`(`attribute`,`options`) values (14,'宽松型');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'一粒扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'单排扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'双排扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'暗扣');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'拉链');
insert into `xx_attribute_option`(`attribute`,`options`) values (15,'系带');
insert into `xx_attribute_option`(`attribute`,`options`) values (17,'长裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (17,'中裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (17,'七分裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (17,'九分裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (17,'短裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (16,'直筒裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (16,'微喇裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (16,'垮裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (16,'背带裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (18,'低腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (18,'中腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (18,'高腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (19,'全棉牛仔布');
insert into `xx_attribute_option`(`attribute`,`options`) values (19,'棉弹牛仔布');
insert into `xx_attribute_option`(`attribute`,`options`) values (19,'加厚牛仔布');
insert into `xx_attribute_option`(`attribute`,`options`) values (19,'薄牛仔布');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'长袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'无袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'中袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'五分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (20,'七分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'棉');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'涤纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'聚酯纤维');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'粘胶');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'氨纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'锦纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'莫代尔');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'蚕丝');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'腈纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (21,'麻');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'圆领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'V领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'立领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'方领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'高领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'翻领');
insert into `xx_attribute_option`(`attribute`,`options`) values (22,'一字领');
insert into `xx_attribute_option`(`attribute`,`options`) values (23,'短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (23,'常规款');
insert into `xx_attribute_option`(`attribute`,`options`) values (23,'中长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (24,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (24,'高腰型');
insert into `xx_attribute_option`(`attribute`,`options`) values (24,'直筒型');
insert into `xx_attribute_option`(`attribute`,`options`) values (25,'羊毛');
insert into `xx_attribute_option`(`attribute`,`options`) values (25,'涤纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (25,'棉');
insert into `xx_attribute_option`(`attribute`,`options`) values (25,'麻');
insert into `xx_attribute_option`(`attribute`,`options`) values (25,'氨纶');
insert into `xx_attribute_option`(`attribute`,`options`) values (26,'原创');
insert into `xx_attribute_option`(`attribute`,`options`) values (26,'百搭');
insert into `xx_attribute_option`(`attribute`,`options`) values (26,'通勤');
insert into `xx_attribute_option`(`attribute`,`options`) values (26,'街头');
insert into `xx_attribute_option`(`attribute`,`options`) values (26,'甜美');
insert into `xx_attribute_option`(`attribute`,`options`) values (27,'短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (27,'中长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (27,'长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (29,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (29,'高腰型');
insert into `xx_attribute_option`(`attribute`,`options`) values (29,'蝙蝠型');
insert into `xx_attribute_option`(`attribute`,`options`) values (29,'裙摆型');
insert into `xx_attribute_option`(`attribute`,`options`) values (29,'直筒型');
insert into `xx_attribute_option`(`attribute`,`options`) values (28,'中长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (28,'长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (28,'加长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'长袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'五分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'七分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'九分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (30,'无袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (31,'通勤');
insert into `xx_attribute_option`(`attribute`,`options`) values (31,'街头');
insert into `xx_attribute_option`(`attribute`,`options`) values (31,'甜美');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'长袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'七分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'九分袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'中袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (33,'无袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (32,'套头');
insert into `xx_attribute_option`(`attribute`,`options`) values (32,'开衫');
insert into `xx_attribute_option`(`attribute`,`options`) values (34,'单件套');
insert into `xx_attribute_option`(`attribute`,`options`) values (34,'上下套');
insert into `xx_attribute_option`(`attribute`,`options`) values (34,'假两件套');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'普通');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'薄款');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'抓绒');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'加厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'棉内胆');
insert into `xx_attribute_option`(`attribute`,`options`) values (35,'毛内胆');
insert into `xx_attribute_option`(`attribute`,`options`) values (36,'铅笔裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (36,'直筒裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (36,'微喇裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (36,'阔腿裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (36,'哈伦裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (37,'低腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (37,'中腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (37,'高腰');
insert into `xx_attribute_option`(`attribute`,`options`) values (38,'超薄');
insert into `xx_attribute_option`(`attribute`,`options`) values (38,'薄款');
insert into `xx_attribute_option`(`attribute`,`options`) values (38,'普通');
insert into `xx_attribute_option`(`attribute`,`options`) values (38,'加厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (39,'普通');
insert into `xx_attribute_option`(`attribute`,`options`) values (39,'薄款');
insert into `xx_attribute_option`(`attribute`,`options`) values (39,'加厚');
insert into `xx_attribute_option`(`attribute`,`options`) values (40,'套头');
insert into `xx_attribute_option`(`attribute`,`options`) values (40,'开衫');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'V领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'圆领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'翻领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'半高领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'高翻领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'连帽');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'门筒领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'蹲领/堆堆领');
insert into `xx_attribute_option`(`attribute`,`options`) values (41,'不可翻高领');
insert into `xx_attribute_option`(`attribute`,`options`) values (42,'纯棉');
insert into `xx_attribute_option`(`attribute`,`options`) values (42,'棉质混纺');
insert into `xx_attribute_option`(`attribute`,`options`) values (42,'人造纤维');
insert into `xx_attribute_option`(`attribute`,`options`) values (42,'丝');
insert into `xx_attribute_option`(`attribute`,`options`) values (43,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (43,'长袖 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (44,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (44,'嘻哈风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (44,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (44,'运动风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'青春休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'日韩个性');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'运动风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'学院风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'嘻哈风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'欧美风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (45,'原创设计');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'修身裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'直筒裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'宽松裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'工装裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'锥形裤 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'低裆跨裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'运动裤/卫裤 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (46,'哈伦裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (47,'长裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (47,'九分裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (47,'七分裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (47,'短裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (48,'长裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (48,'九分裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'直筒型');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'宽松型 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'锥形裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'低裆跨裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'立体剪裁 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (49,'哈伦裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'青春休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'日韩个性');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'街头潮流');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'欧美风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'运动风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'工装牛仔 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'学院风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'商务正装');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'嘻哈风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'原创设计');
insert into `xx_attribute_option`(`attribute`,`options`) values (50,'复古经典');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'圆领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'V领');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'连帽');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'翻领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'衬衫领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'门筒领');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'半高领');
insert into `xx_attribute_option`(`attribute`,`options`) values (51,'其它');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'商务休闲 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'欧美风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'日韩个性 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'青春休闲 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'原创设计');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'运动风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'学院风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (52,'商务正装 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (53,'长袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (53,'短袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (53,'七分袖 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (54,'长袖');
insert into `xx_attribute_option`(`attribute`,`options`) values (54,'短袖 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'商务正装');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'英伦风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'日韩个性 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'欧美风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (55,'原创设计 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (56,'宽松型');
insert into `xx_attribute_option`(`attribute`,`options`) values (56,'修身型 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'商务正装 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'英伦风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'日韩个性');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'原创设计 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'欧美风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (57,'青春休闲 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (58,'宽松型');
insert into `xx_attribute_option`(`attribute`,`options`) values (58,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (59,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (59,'商务正装 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (60,'长裤');
insert into `xx_attribute_option`(`attribute`,`options`) values (60,'短裤 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (61,'中长款 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (61,'短款');
insert into `xx_attribute_option`(`attribute`,`options`) values (61,'长款');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'时尚休闲 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'日韩个性 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'商务正装');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'运动风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'欧美风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'青春休闲 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (62,'原创设计 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (63,'修身型');
insert into `xx_attribute_option`(`attribute`,`options`) values (63,'直筒型 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (63,'宽松型');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'翻领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'连帽 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'西装领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'可脱卸帽 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'双层领');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'半高领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'针织领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (64,'其它 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (65,'套头');
insert into `xx_attribute_option`(`attribute`,`options`) values (65,'开衫 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'连帽 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'立领');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'圆领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'翻领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'V领');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'其它 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (66,'高圆领 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (67,'商务休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (67,'时尚休闲');
insert into `xx_attribute_option`(`attribute`,`options`) values (67,'嘻哈风格 ');
insert into `xx_attribute_option`(`attribute`,`options`) values (67,'英伦风格');
insert into `xx_attribute_option`(`attribute`,`options`) values (67,'运动风格 ');

insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (1,'2013-06-24 00:12:39','2013-06-24 00:12:39',1,'女装','颜色',1);
insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (2,'2013-06-24 00:12:40','2013-06-24 00:12:40',2,'男装','颜色',1);
insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (3,'2013-06-24 00:12:41','2013-06-24 00:12:41',3,'女装','尺码',0);
insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (4,'2013-06-24 00:12:42','2013-06-24 00:12:42',4,'男装','尺码',0);
insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (5,'2013-06-24 00:12:43','2013-06-24 00:12:43',5,'女鞋','尺码',0);
insert into `xx_specification`(`id`,`create_date`,`modify_date`,`orders`,`memo`,`name`,`type`) values (6,'2013-06-24 00:12:44','2013-06-24 00:12:44',6,'男鞋','尺码',0);

insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (1,'2013-06-24 00:12:45','2013-06-24 00:12:45',1,'http://storage.shopxx.net/demo-image/3.0/specification/1.gif','无',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (2,'2013-06-24 00:12:46','2013-06-24 00:12:46',2,'http://storage.shopxx.net/demo-image/3.0/specification/2.gif','黄色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (3,'2013-06-24 00:12:47','2013-06-24 00:12:47',3,'http://storage.shopxx.net/demo-image/3.0/specification/3.gif','酒红色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (4,'2013-06-24 00:12:48','2013-06-24 00:12:48',4,'http://storage.shopxx.net/demo-image/3.0/specification/4.gif','金色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (5,'2013-06-24 00:12:49','2013-06-24 00:12:49',5,'http://storage.shopxx.net/demo-image/3.0/specification/5.gif','橙色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (6,'2013-06-24 00:12:50','2013-06-24 00:12:50',6,'http://storage.shopxx.net/demo-image/3.0/specification/6.gif','灰色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (7,'2013-06-24 00:12:51','2013-06-24 00:12:51',7,'http://storage.shopxx.net/demo-image/3.0/specification/7.gif','蓝色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (8,'2013-06-24 00:12:52','2013-06-24 00:12:52',8,'http://storage.shopxx.net/demo-image/3.0/specification/8.gif','黑色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (9,'2013-06-24 00:12:53','2013-06-24 00:12:53',9,'http://storage.shopxx.net/demo-image/3.0/specification/9.gif','卡其色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (10,'2013-06-24 00:12:54','2013-06-24 00:12:54',10,'http://storage.shopxx.net/demo-image/3.0/specification/10.gif','混色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (11,'2013-06-24 00:12:55','2013-06-24 00:12:55',11,'http://storage.shopxx.net/demo-image/3.0/specification/11.gif','紫色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (12,'2013-06-24 00:12:56','2013-06-24 00:12:56',12,'http://storage.shopxx.net/demo-image/3.0/specification/12.gif','粉红色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (13,'2013-06-24 00:12:57','2013-06-24 00:12:57',13,'http://storage.shopxx.net/demo-image/3.0/specification/13.gif','银色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (14,'2013-06-24 00:12:58','2013-06-24 00:12:58',14,'http://storage.shopxx.net/demo-image/3.0/specification/14.gif','红色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (15,'2013-06-24 00:12:59','2013-06-24 00:12:59',15,'http://storage.shopxx.net/demo-image/3.0/specification/15.gif','白色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (16,'2013-06-24 00:13:00','2013-06-24 00:13:00',16,'http://storage.shopxx.net/demo-image/3.0/specification/16.gif','浅蓝色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (17,'2013-06-24 00:13:01','2013-06-24 00:13:01',17,'http://storage.shopxx.net/demo-image/3.0/specification/17.gif','深蓝色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (18,'2013-06-24 00:13:02','2013-06-24 00:13:02',18,'http://storage.shopxx.net/demo-image/3.0/specification/18.gif','绿色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (19,'2013-06-24 00:13:03','2013-06-24 00:13:03',19,'http://storage.shopxx.net/demo-image/3.0/specification/19.gif','米黄色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (20,'2013-06-24 00:13:04','2013-06-24 00:13:04',20,'http://storage.shopxx.net/demo-image/3.0/specification/20.gif','咖啡色',1);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (21,'2013-06-24 00:13:05','2013-06-24 00:13:05',1,'http://storage.shopxx.net/demo-image/3.0/specification/1.gif','无',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (22,'2013-06-24 00:13:06','2013-06-24 00:13:06',2,'http://storage.shopxx.net/demo-image/3.0/specification/2.gif','黄色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (23,'2013-06-24 00:13:07','2013-06-24 00:13:07',3,'http://storage.shopxx.net/demo-image/3.0/specification/3.gif','酒红色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (24,'2013-06-24 00:13:08','2013-06-24 00:13:08',4,'http://storage.shopxx.net/demo-image/3.0/specification/4.gif','金色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (25,'2013-06-24 00:13:09','2013-06-24 00:13:09',5,'http://storage.shopxx.net/demo-image/3.0/specification/5.gif','橙色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (26,'2013-06-24 00:13:10','2013-06-24 00:13:10',6,'http://storage.shopxx.net/demo-image/3.0/specification/6.gif','灰色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (27,'2013-06-24 00:13:11','2013-06-24 00:13:11',7,'http://storage.shopxx.net/demo-image/3.0/specification/7.gif','蓝色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (28,'2013-06-24 00:13:12','2013-06-24 00:13:12',8,'http://storage.shopxx.net/demo-image/3.0/specification/8.gif','黑色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (29,'2013-06-24 00:13:13','2013-06-24 00:13:13',9,'http://storage.shopxx.net/demo-image/3.0/specification/9.gif','卡其色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (30,'2013-06-24 00:13:14','2013-06-24 00:13:14',10,'http://storage.shopxx.net/demo-image/3.0/specification/10.gif','混色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (31,'2013-06-24 00:13:15','2013-06-24 00:13:15',11,'http://storage.shopxx.net/demo-image/3.0/specification/11.gif','紫色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (32,'2013-06-24 00:13:16','2013-06-24 00:13:16',12,'http://storage.shopxx.net/demo-image/3.0/specification/12.gif','粉红色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (33,'2013-06-24 00:13:17','2013-06-24 00:13:17',13,'http://storage.shopxx.net/demo-image/3.0/specification/13.gif','银色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (34,'2013-06-24 00:13:18','2013-06-24 00:13:18',14,'http://storage.shopxx.net/demo-image/3.0/specification/14.gif','红色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (35,'2013-06-24 00:13:19','2013-06-24 00:13:19',15,'http://storage.shopxx.net/demo-image/3.0/specification/15.gif','白色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (36,'2013-06-24 00:13:20','2013-06-24 00:13:20',16,'http://storage.shopxx.net/demo-image/3.0/specification/16.gif','浅蓝色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (37,'2013-06-24 00:13:21','2013-06-24 00:13:21',17,'http://storage.shopxx.net/demo-image/3.0/specification/17.gif','深蓝色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (38,'2013-06-24 00:13:22','2013-06-24 00:13:22',18,'http://storage.shopxx.net/demo-image/3.0/specification/18.gif','绿色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (39,'2013-06-24 00:13:23','2013-06-24 00:13:23',19,'http://storage.shopxx.net/demo-image/3.0/specification/19.gif','米黄色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (40,'2013-06-24 00:13:24','2013-06-24 00:13:24',20,'http://storage.shopxx.net/demo-image/3.0/specification/20.gif','咖啡色',2);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (41,'2013-06-24 00:13:25','2013-06-24 00:13:25',1,null,'均码',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (42,'2013-06-24 00:13:26','2013-06-24 00:13:26',2,null,'XXS',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (43,'2013-06-24 00:13:27','2013-06-24 00:13:27',3,null,'XS',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (44,'2013-06-24 00:13:28','2013-06-24 00:13:28',4,null,'S',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (45,'2013-06-24 00:13:29','2013-06-24 00:13:29',5,null,'M',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (46,'2013-06-24 00:13:30','2013-06-24 00:13:30',6,null,'L',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (47,'2013-06-24 00:13:31','2013-06-24 00:13:31',7,null,'XL',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (48,'2013-06-24 00:13:32','2013-06-24 00:13:32',8,null,'XXL',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (49,'2013-06-24 00:13:33','2013-06-24 00:13:33',9,null,'XXXL',3);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (50,'2013-06-24 00:13:34','2013-06-24 00:13:34',1,null,'均码',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (51,'2013-06-24 00:13:35','2013-06-24 00:13:35',2,null,'XXS',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (52,'2013-06-24 00:13:36','2013-06-24 00:13:36',3,null,'XS',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (53,'2013-06-24 00:13:37','2013-06-24 00:13:37',4,null,'S',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (54,'2013-06-24 00:13:38','2013-06-24 00:13:38',5,null,'M',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (55,'2013-06-24 00:13:39','2013-06-24 00:13:39',6,null,'L',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (56,'2013-06-24 00:13:40','2013-06-24 00:13:40',7,null,'XL',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (57,'2013-06-24 00:13:41','2013-06-24 00:13:41',8,null,'XXL',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (58,'2013-06-24 00:13:42','2013-06-24 00:13:42',9,null,'XXXL',4);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (59,'2013-06-24 00:13:43','2013-06-24 00:13:43',1,null,'34',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (60,'2013-06-24 00:13:44','2013-06-24 00:13:44',2,null,'35',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (61,'2013-06-24 00:13:45','2013-06-24 00:13:45',3,null,'36',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (62,'2013-06-24 00:13:46','2013-06-24 00:13:46',4,null,'37',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (63,'2013-06-24 00:13:47','2013-06-24 00:13:47',5,null,'38',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (64,'2013-06-24 00:13:48','2013-06-24 00:13:48',6,null,'39',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (65,'2013-06-24 00:13:49','2013-06-24 00:13:49',7,null,'40',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (66,'2013-06-24 00:13:50','2013-06-24 00:13:50',8,null,'41',5);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (67,'2013-06-24 00:13:51','2013-06-24 00:13:51',1,null,'36',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (68,'2013-06-24 00:13:52','2013-06-24 00:13:52',2,null,'37',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (69,'2013-06-24 00:13:53','2013-06-24 00:13:53',3,null,'38',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (70,'2013-06-24 00:13:54','2013-06-24 00:13:54',4,null,'39',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (71,'2013-06-24 00:13:55','2013-06-24 00:13:55',5,null,'40',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (72,'2013-06-24 00:13:56','2013-06-24 00:13:56',6,null,'41',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (73,'2013-06-24 00:13:57','2013-06-24 00:13:57',7,null,'42',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (74,'2013-06-24 00:13:58','2013-06-24 00:13:58',8,null,'43',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (75,'2013-06-24 00:13:59','2013-06-24 00:13:59',9,null,'44',6);
insert into `xx_specification_value`(`id`,`create_date`,`modify_date`,`orders`,`image`,`name`,`specification`) values (76,'2013-06-24 00:14:00','2013-06-24 00:14:00',10,null,'45',6);

insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (1,'2013-06-24 00:14:01','2013-06-24 00:14:01');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (2,'2013-06-24 00:14:02','2013-06-24 00:14:02');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (3,'2013-06-24 00:14:03','2013-06-24 00:14:03');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (4,'2013-06-24 00:14:04','2013-06-24 00:14:04');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (5,'2013-06-24 00:14:05','2013-06-24 00:14:05');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (6,'2013-06-24 00:14:06','2013-06-24 00:14:06');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (7,'2013-06-24 00:14:07','2013-06-24 00:14:07');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (8,'2013-06-24 00:14:08','2013-06-24 00:14:08');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (9,'2013-06-24 00:14:09','2013-06-24 00:14:09');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (10,'2013-06-24 00:14:10','2013-06-24 00:14:10');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (11,'2013-06-24 00:14:11','2013-06-24 00:14:11');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (12,'2013-06-24 00:14:12','2013-06-24 00:14:12');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (13,'2013-06-24 00:14:13','2013-06-24 00:14:13');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (14,'2013-06-24 00:14:14','2013-06-24 00:14:14');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (15,'2013-06-24 00:14:15','2013-06-24 00:14:15');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (16,'2013-06-24 00:14:16','2013-06-24 00:14:16');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (17,'2013-06-24 00:14:17','2013-06-24 00:14:17');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (18,'2013-06-24 00:14:18','2013-06-24 00:14:18');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (19,'2013-06-24 00:14:19','2013-06-24 00:14:19');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (20,'2013-06-24 00:14:20','2013-06-24 00:14:20');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (21,'2013-06-24 00:14:21','2013-06-24 00:14:21');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (22,'2013-06-24 00:14:22','2013-06-24 00:14:22');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (23,'2013-06-24 00:14:23','2013-06-24 00:14:23');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (24,'2013-06-24 00:14:24','2013-06-24 00:14:24');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (25,'2013-06-24 00:14:25','2013-06-24 00:14:25');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (26,'2013-06-24 00:14:26','2013-06-24 00:14:26');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (27,'2013-06-24 00:14:27','2013-06-24 00:14:27');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (28,'2013-06-24 00:14:28','2013-06-24 00:14:28');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (29,'2013-06-24 00:14:29','2013-06-24 00:14:29');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (30,'2013-06-24 00:14:30','2013-06-24 00:14:30');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (31,'2013-06-24 00:14:31','2013-06-24 00:14:31');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (32,'2013-06-24 00:14:32','2013-06-24 00:14:32');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (33,'2013-06-24 00:14:33','2013-06-24 00:14:33');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (34,'2013-06-24 00:14:34','2013-06-24 00:14:34');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (35,'2013-06-24 00:14:35','2013-06-24 00:14:35');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (36,'2013-06-24 00:14:36','2013-06-24 00:14:36');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (37,'2013-06-24 00:14:37','2013-06-24 00:14:37');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (38,'2013-06-24 00:14:38','2013-06-24 00:14:38');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (39,'2013-06-24 00:14:39','2013-06-24 00:14:39');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (40,'2013-06-24 00:14:40','2013-06-24 00:14:40');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (41,'2013-06-24 00:14:41','2013-06-24 00:14:41');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (42,'2013-06-24 00:14:42','2013-06-24 00:14:42');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (43,'2013-06-24 00:14:43','2013-06-24 00:14:43');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (44,'2013-06-24 00:14:44','2013-06-24 00:14:44');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (45,'2013-06-24 00:14:45','2013-06-24 00:14:45');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (46,'2013-06-24 00:14:46','2013-06-24 00:14:46');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (47,'2013-06-24 00:14:47','2013-06-24 00:14:47');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (48,'2013-06-24 00:14:48','2013-06-24 00:14:48');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (49,'2013-06-24 00:14:49','2013-06-24 00:14:49');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (50,'2013-06-24 00:14:50','2013-06-24 00:14:50');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (51,'2013-06-24 00:14:51','2013-06-24 00:14:51');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (52,'2013-06-24 00:14:52','2013-06-24 00:14:52');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (53,'2013-06-24 00:14:53','2013-06-24 00:14:53');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (54,'2013-06-24 00:14:54','2013-06-24 00:14:54');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (55,'2013-06-24 00:14:55','2013-06-24 00:14:55');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (56,'2013-06-24 00:14:56','2013-06-24 00:14:56');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (57,'2013-06-24 00:14:57','2013-06-24 00:14:57');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (58,'2013-06-24 00:14:58','2013-06-24 00:14:58');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (59,'2013-06-24 00:14:59','2013-06-24 00:14:59');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (60,'2013-06-24 00:15:00','2013-06-24 00:15:00');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (61,'2013-06-24 00:15:01','2013-06-24 00:15:01');
insert into `xx_goods`(`id`,`create_date`,`modify_date`) values (62,'2013-06-24 00:15:02','2013-06-24 00:15:02');

-- insert into xx_merchant_category (id, create_date, modify_date, name, seo_description, seo_keywords, seo_title) 
--        values (1, '2013-06-24 00:15:02', '2013-06-24 00:15:02', '服饰', null, null, null)
--        , (2, '2013-06-24 00:15:02', '2013-06-24 00:15:02', '电器', null, null, null)
--        , (3, '2013-06-24 00:15:02', '2013-06-24 00:15:02', '食品', null, null, null)
--        , (4, '2013-06-24 00:15:02', '2013-06-24 00:15:02', '天文', null, null, null)
--        , (5, '2013-06-24 00:15:02', '2013-06-24 00:15:02', '母婴', null, null, null);

-- xx_merchant
insert into `xx_merchant`(`id`,`merchant_category`,`name`,`ename`,`registered_address`,`phone`,`email`,`business_address`,`license_number`,`license_picture`,`organization_code`,`organization_code_picture`,`mobile`,`is_enabled`,`is_approved`,`create_date`,`modify_date`) 
       values (1,1,'超女服装','mgril','兰州市安宁区','13098765432','machine.of.awareness@gmail.com','兰州市安宁区','12365478-09871','image','212934-97488','image','13099377543',1,1,'2013-07-11 00:00:00','2013-07-11 00:00:00');
insert into `xx_merchant`(`id`,`merchant_category`,`name`,`ename`,`registered_address`,`phone`,`email`,`business_address`,`license_number`,`license_picture`,`organization_code`,`organization_code_picture`,`mobile`,`is_enabled`,`is_approved`,`create_date`,`modify_date`) 
       values (22,1,'示例商户','machine','兰州市安宁区','13098765432','machine.of.awareness@gmail.com','兰州市安宁区','12365478-09871','image','212934-97488','image','13099377543',1,1,'2013-07-11 00:00:00','2013-07-11 00:00:00');


-- xx_shop
insert  into `xx_shop`(`id`,`area`,`name`,`merchant`,`address`,`phone`,`business_time`,`completion_time`,`is_enabled`,`create_date`,`modify_date`,`logo`) values (1,9,'超女服装城',1,'北京市房山区','TLI56BF2 CXQN4PPP5HU619F026N3DF5IO5A271PESF KGLWUR67D5J 2DH5BIOV4O 6XHWW7TUDI7ODM8QC L0CERY4988OK4N1','0001-01-01 00:00:00','0001-01-01 00:00:00','','0001-01-01 00:00:07','0001-01-01 00:00:03','/CMall/upload/image/shop/shop_1.gif');
insert  into `xx_shop`(`id`,`area`,`name`,`merchant`,`address`,`phone`,`business_time`,`completion_time`,`is_enabled`,`create_date`,`modify_date`,`logo`) values (22,486,'儿童天地服装城',1,'辽宁省大连市金州区','TLI56BF2 CXQN4PPP5HU619F026N3DF5IO5A271PESF KGLWUR67D5J 2DH5BIOV4O 6XHWW7TUDI7ODM8QC L0CERY4988OK4N1','0001-01-01 00:00:00','0001-01-01 00:00:00','','0001-01-01 00:00:07','0001-01-01 00:00:03',NULL);

insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (1,'2013-06-24 00:00:57','2013-06-24 00:00:57',NULL,'<p>\n	用户购物流程如下：\n</p>\n<img src=\"http://storage.shopxx.net/demo-image/3.0/201301/8e486c07-1365-4fa7-bc62-a40340e0ba59.jpg\" />',16,'','\0',NULL,NULL,NULL,'购物流程',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (2,'2013-06-24 00:00:58','2013-06-24 00:00:58',NULL,'会员等级共分为：注册会员、铜牌会员、银牌会员、金牌会员，会员等级晋升均由系统自动实现，无需申请。',5,'','\0',NULL,NULL,NULL,'会员等级',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (3,'2013-06-24 00:00:59','2013-06-24 00:00:59',NULL,'进入网站首页，点击页面右上方的“注册”链接，将进入会员注册页面，输入您的用户名、密码等信息后点击“注册”按钮即可完成注册。注册成功后，您可以进入“会员中心 - 个人资料”进行个人信息的修改。',4,'','\0',NULL,NULL,NULL,'新用户注册',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (4,'2013-06-24 00:01:00','2013-06-24 00:01:00',NULL,'预存款是商城为方便用户支付而设计开发的支付方式，方便、快捷无任何手续费。您可以先将货款充值到预存款帐户中，在订单支付的过程中可以用此方式来进行支付，同样，如果订单发生退换货产生退款时，也可以退到您的预存款帐户中，以便您下次支付时使用。',4,'','\0',NULL,NULL,NULL,'预存款支付',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (5,'2013-06-24 00:01:01','2013-06-24 00:01:01',NULL,'退换货说明:<br />\n&nbsp;<br />\n一、 退换货总则：<br />\n商城所售商品都是正品行货。商城所有商家将严格按照国家三包政策，针对所售商品履行保修、换货和退货的义务。 <br />\n&nbsp;<br />\n1.符合以下情况，由您实际收到货物日期起7日内可退货；您实际收到货物日期起8日至第15日内可换货：<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 1）国家三包所规定的功能性故障<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经由生产厂家指定或特约售后服务中心检测确认故障属实，并出据出检报告证实。<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 2）到货物品坏损或缺件情况<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经售后人员核查情况属实（期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断及时处理）。<br />\n&nbsp;<br />\n2.由您实际收到货物日期起15日以上，为了不耽误您使用，缩短故障商品的维修时间，建议您在商品出现故障时直接联系当地厂商维修网点处理。请访问厂商官方网站或拨打厂商服务热线，咨询维修网点信息，凭借发票可到网点维修。国家三包规定保修期内，无品牌厂商售后服务产品，商城提供免费维修服务。<br />\n&nbsp;<br />\n二、补充说明：<br />\n1.以下情况不在退货、换货、维修范围之内：<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）任何非商城出售的商品；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）对于过保商品（超过三包保修期的商品）；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3）未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的商品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4）商品的外包装、附件、赠品（券）、说明书不完整，（券）发票缺失或涂改；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5）商品使用正常磨损；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6）手机、数码、IT类商品通过软件升级可以排除的故障不属于三包范围内的故障，只要送至当地生产厂家指定或特约售后服务中心升级即可；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7）高端品牌箱包及饰品QC标签已损坏的；<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 8）出于安全和卫生考虑，贴身用品（内衣等）、食品、化妆品售出后不予退换，经权威部门检测商品存在内在质量问题者除外。<br />\n&nbsp;<br />\n2.判断实际收货日期规则：<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1）快递配送或者自提的订单：以客户实际签收日期为准；<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2）非配送的订单，按照第三方物流平台显示的实际到货日期为准。如果第三方合作伙伴不能有效返回签收日期，则商城客服根据距离等因素和客户人工确认实际到货日期。<br />\n&nbsp;<br />\n商城按照国家相关法律法规及规章制度对商品退换原则进行解释。<br />',5,'','\0',NULL,NULL,NULL,'退换货政策',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (6,'2013-06-24 00:01:02','2013-06-24 00:01:02',NULL,'<p>\n	发票注意事项：\n</p>\n<p>\n	1.为了保障消费者的合法权益，在商城购物时，均为您开具由税务局监制印制的正规机打销售发票（海外代购商品除外）; <br />\n2.发票是有效交易的重要凭据，可作为单位报销的凭证，也能保证您充分享受到我司提供的售后服务，请妥善保管; <br />\n3.我们将随订单为您开具发票，发票内容为您所购买的商品明细，发票金额为您购买商品实际的付款金额;\n</p>\n<p>\n	4.请在订单提交时确认好您所需开具的发票抬头，订单生成后发票抬头将无法再次修改。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	发票开具办法：\n</p>\n<p>\n	1.填写订单信息时请勾选发票，并在下订单时准确填写所需开具的发票抬头名称；\n</p>\n<p>\n	2.发票将随商品一同寄出，收货时请注意查收发票；\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	如有相关发票开具以及换票问题，请与商城客服联系，客服人员将竭诚为您服务；\n</p>',2,'','\0',NULL,NULL,NULL,'发票制度',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (7,'2013-06-24 00:01:03','2013-06-24 00:01:03',NULL,'<p>\n	货到付款：\n</p>\n<p>\n	配送人员将货物送达订单指定的收货地址后，由客户支付订单金额给配送人员的一种付款方式。\n</p>\n<p>\n	<br />\n在商城购物您可以选择货到付款的支付方式，目前货到付款支持现金支付、移动POS刷卡支付等。\n</p>\n<p>\n	您在使用货到付款支付方式时，请在购物车支付方式处选择货到付款，订单生成后，货到付款的支付形式不能更换成其他支付方式，如果您想换成其他支付方式时，请务必删除原货到付款订单，重新在网站下订单选择其他支付方式。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	温馨提示：\n</p>\n<p>\n	1.当您选择货到付款支付方式生成订单后，商城工作人员会根据您的订购要求，为您发货，货物到达您指定地点后，会有工作人员通过电话方式与您联系，在您确认后，根据您的要求将货物送达，请您做好支付准备，以提高收货效率；<br />\n2.签收时，请您仔细核对款项、务必做到货款两清，若事后发现款项错误，我们将无法再核实确认；\n</p>',5,'','\0',NULL,NULL,NULL,'货到付款',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (8,'2013-06-24 00:01:04','2013-06-24 00:01:04',NULL,'承担商城各类产品的售后服务，致力于为广大消费者提供“亲切、快捷、周到”优质阳光服务。多年来我们一直秉承“至真至诚，服务第一；服务是我们的唯一产品，顾客满意是我们服务的终极目标、服务理念。我们提出“服务与责任”理念，把服务责任化，真正地把消费者的利益放在第一位。深层次地挖掘服务精髓，致力专心、专注、专业化服务。',3,'','\0',NULL,NULL,NULL,'服务理念',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (9,'2013-06-24 00:01:05','2013-06-24 00:01:05',NULL,'<p>\n	登陆后，进入“会员中心”可查询到订单状态。&nbsp;<br />\n&nbsp;<br />\n1、等待付款：请您支付订单款项，若订单尚未获得确认，正常工作时间内，最迟2小时可以获得确认，如非正常工作时间，需要等到上班时间确认。<br />\n&nbsp;\n</p>\n<p>\n	3、已支付/等待发货：这时订单已在我们工作人员的处理流程中。<br />\n&nbsp;\n</p>\n<p>\n	4、已支付/已发货：您的货物已经发出，请您稍后注意查收，订单详细中可查到快递公司和快递单号。<br />\n&nbsp;<br />\n5、订单完成：订单已成功完成交易，请对我们的商品进行评论，如收到产品有质量问题，请直接与售后部门联系。\n</p>',2,'','\0',NULL,NULL,NULL,'订单查询',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (10,'2013-06-24 00:01:06','2013-06-24 00:01:06',NULL,'<p>\n	配送范围：全国各地。<br />\n&nbsp;\n</p>\n<p>\n	配送方式：普通快递、自营快递、EMS。<br />\n&nbsp;<br />\n1. 商品购买时根据会员所选配送方式为您安排。<br />\n&nbsp;<br />\n2. 选择快递的配送方式，系统会默认为申通快递。<br />\n&nbsp;<br />\n收货时间：因所在地区不同而略有差异<br />\n&nbsp;<br />\n对于一些送货上门，货到付款的；如果您在签收前发现商品有运输损坏问题，可直接拒收并与我们取得联系，商城会重新安排为您配送。外地订单在您签收前，如果发现商品有运输损坏问题，您也可以拒收包裹，写明原因，通过邮局把货返回给我们，我们在收到您退回的包裹后，会征求您的意见决定是否重新安排邮寄。<br />\n&nbsp;<br />\n配货时限解释：<br />\n&nbsp;<br />\n1.订单一般在 1-2 天内可以确认完毕，若产品缺货将及时通知您。<br />\n&nbsp;<br />\n2.配送时限是从订单状态处理到正在送货次日开始计时。不同的配送方式会有不同的配送时限。<br />\n&nbsp;<br />\n3.如您提供的联系方式或送货地址不正确,将会影响我们配送的速度。为了加快配送速度，请您提供尽可能准确的送货地址信息和联系方式；对于需要送货上门服务的，请不要仅提供信箱号，否则无法为您进行配送。如果您留的送货地址为单位地址，请特别注明您可以收货的时间，如遇到国家法定假日，无特殊说明则送货期限顺延。\n</p>',2,'','\0',NULL,NULL,NULL,'配送方式',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (11,'2013-06-24 00:01:07','2013-06-24 00:01:07',NULL,'<p>\n	会员级别分四级，具体为：普通会员、银牌会员、金牌会员、白金会员，会员级别晋升均由系统自动实现，无需申请。\n</p>\n<p>\n	普通会员：<br />\n条件：任何愿意到商城购物的用户都可以免费注册。<br />\n待遇：可以享受注册会员所能购买的产品及服务。\n</p>\n<p>\n	银牌会员：<br />\n条件：商城消费金额达到1000元的会员。<br />\n待遇：购买的产品可以享受相应优惠折扣。<br />\n&nbsp;<br />\n金牌会员：<br />\n条件：商城消费金额达到10000元的会员。<br />\n待遇：购买的产品可以享受相应优惠折扣。<br />\n&nbsp;<br />\n白金会员：<br />\n条件：商城消费金额达到10000元的会员。<br />\n待遇：购买的产品可以享受相应优惠折扣。<br />\n&nbsp;<br />\n注：针对各个级别会员特别声明：<br />\n会员账号禁止转借或转让他人使用，如因转借或转让他人使用所带来的一切后果，商城概不负责。\n</p>\n<p>\n	<br />\n&nbsp;\n</p>',2,'','\0',NULL,NULL,NULL,'会员级别',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (12,'2013-06-24 00:01:08','2013-06-24 00:01:08',NULL,'<p>\n	客户在接受商品订购与送货的同时，有义务遵守以下交易条款。您在商城下订单之前或接受商城送货之前，请您仔细阅读以下条款：\n</p>\n<p>\n	<br />\n1.订购的商品价格以您下订单时价格为准。<br />\n&nbsp;<br />\n2.请清楚准确地填写您的真实姓名、送货地址及联系方式。因如下情况造成订单延迟或无法配送等，商城将不承担责任：<br />\na. 客户提供错误信息和不详细的地址; <br />\nb. 货物送达无人签收，由此造成的重复配送所产生的费用及相关的后果; <br />\nc. 不可抗力，例如：自然灾害、交通戒严、突发战争等。<br />\n&nbsp;<br />\n安全性：\n</p>\n<p>\n	无论您是通过哪种方式支付、购买，我们会保证交易信息的安全，并由商城授权的员工处理您的订单。<br />\n&nbsp;<br />\n隐私权：\n</p>\n<p>\n	我们尊重您的隐私权，在任何情况下，我们都不会将您的个人和订单信息出售或泄露给任何第三方（国家司法机关调取除外）。我们从网站上或电话中得到的所有客户信息仅用来处理您的相关订单。<br />\n&nbsp;<br />\n免责：\n</p>\n<p>\n	如因不可抗力或其它无法控制的原因使商城销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，我们会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失。<br />\n&nbsp;<br />\n客户监督：\n</p>\n<p>\n	我们希望通过不懈努力，为客户提供最佳服务，商城在给客户提供服务的全过程中接受客户的监督。<br />\n&nbsp;<br />\n争议处理：\n</p>\n<p>\n	如果客户与我们之间发生任何争议，可依据当时双方所认定的协议及相关法律进行解决。<br />\n&nbsp;<br />\n我们承诺：<br />\n我们秉承质优价低、放心满意的销售理念为您服务。我们所出售的商品均为正品行货，与您亲临商场选购的商品一样享受相同的质量保证；含有质量保证书的商品按照保证书的承诺执行，其它商品按国家有关规定执行。<br />\n&nbsp;<br />\n特别提示：&nbsp;<br />\n我们保证出货时商品外包装的完好无缺。请您在收到货物时当场仔细检查发票及货品与送货单的商品是否一致，如果发现商品缺少或已破损等情况，请在配送人员还在现场时与我司客服部联系；如果发现邮寄包装破损，货物在运输途中破损等情况，请当场指出并拒收，拒收后请致电我司客服。如您已签收或他人代为签收，则视为商品外包装，商品数量及内容无误，我司将无法受理。\n</p>',1,'','\0',NULL,NULL,NULL,'交易条款',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (13,'2013-06-24 00:01:09','2013-06-24 00:01:09',NULL,'&nbsp;长时间未收到订单可能出现的问题<br />\n&nbsp;<br />\n1.请您确保订单中的收货地址、邮编、电话、Email地址等信息的准确性，以便商品及时、准确地发出；<br />\n&nbsp;<br />\n2.快递送货上门的订单，配送过程中如果我们联络您的时间超过7天未得到回复，此订单将被默认为您已经放弃订购。如果订单的收货地址是固定某个时间段才可接收商品时, 请您在“订单备注”栏中详细注明；<br />\n&nbsp;<br />\n3.支付完成但是遇到收货地址不详、支付金额不足或库存不足的订单，将无法及时为您发出；<br />',1,'','\0',NULL,NULL,NULL,'帮助中心',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (14,'2013-06-24 00:01:10','2013-06-24 00:01:10',NULL,'<p>\n	一、如何获得积分：<br />\n购买带有积分的商品，或者参加送积分的活动，您即可获得积分;<br />\n获得的积分数量：请参照商品详情页展示的积分，最终获得的积分数量以订单结算页显示为准;<br />\n积分可在“会员中心”内查询到;<br />\n如果您退货，则会在退货成功后扣减您此笔交易的积分;\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	二、积分的计算规则：<br />\n获得积分的数量：<br />\n没有积分活动的商品，会获得实际支付金额的1:1比例的积分；<br />\n本商城可能会对促销商品、不同的会员级别在不同时间做积分的活动，比如直接送xxxx积分，或者金级n倍等奖励活动，具体的积分数量，以结算页最终显示为准。不同的活动，享受的积分数量或倍数不同。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	三、积分的使用：<br />\n本商城积分有如下使用途径：<br />\n登录会员中心—在交易信息里有“积分兑换”;<br />\n在积分兑换区里，可以兑换礼券、实物商品、赠品等，内容我们会陆续丰富;\n</p>',4,'','\0',NULL,NULL,NULL,'会员积分',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (15,'2013-06-24 00:01:11','2013-06-24 00:01:11',NULL,'<p>\n	优惠券是本商城在线发放给用户用于抵扣产品金额的优惠券。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	如何获取商城优惠券<br />\n积分兑换：用积分兑换礼券，如每100积分可兑换1元现金券。具体积分可在“会员中心”——“我的积分”中查询；<br />\n现金购买：与在线客户联系，直接用现金购买；<br />\n会员专享：本商城会针对会员做惊喜礼券派赠；\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	优惠券使用规则<br />\n1.每张优惠券都有一定的使用规则，请在使用前仔细阅读该券的使用说明；<br />\n2.每个订单只能使用一张优惠券，一张优惠券只能使用一次；<br />\n3.优惠券只能抵扣货款，不找零，不能抵扣配送费、包装费及其他费用；<br />\n4. 使用优惠券支付的订单，如发生完成订单后退货，优惠券不予兑现，将按照实际支付货款退还；<br />\n5.优惠券细则在法律许可范围内本商城拥有解释权。\n</p>',2,'','\0',NULL,NULL,NULL,'优惠券',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (16,'2013-06-24 00:01:12','2013-06-24 00:01:12',NULL,'<p>\n	1 若订单交易未成功，麻烦申请订单金额的正常退款。退款金额返回到您的账户。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	2 若订单交易成功，通过实名认证的用户，退款金额会以即时到帐方式打入您的支付宝/财付通账号，若是非认证用户，请提供其它已认证的支付宝/财付通账号或银行账号进行退款，或直接退款到会员账户中。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	3 若通过其他方式支付的订单，请您提供接收退款的银行信息，包括完整开户行信息（如：xx省xx市分行xx支行）、银行账号、账户名（姓名），为更快的为您办理退款，请优先提供中国建设银行、中国农业银行或中国工商银行的银行账号。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	4 如果所支付的订单中含有非现金部分（如优惠券、积分等），在退款时，非现金部分不能折现。\n</p>',2,'','\0',NULL,NULL,NULL,'退款注意事项',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (17,'2013-06-24 00:01:13','2013-06-24 00:01:13',NULL,'如果您对本商城有任何建议或不满，请与联系我们，我们将在3个工作日内给予回复，非常感谢对我们商城的督促和支持。 <br />',2,'','\0',NULL,NULL,NULL,'投诉与建议',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (18,'2013-06-24 00:01:14','2013-06-24 00:01:14',NULL,'<p>\n	基于国内诈骗案件频发，有不法分子假借一些正规电子商务营运商（下简称电商）的名义推销、强卖假冒产品（如化妆品）或会员卡等，情节恶劣，防不胜防。本商城提醒您网购时留意以下几点，谨防上当。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	1. 收到货到付款订单，先验货，再付款<br />\n当快递员将商品送到您的手上时，请先进行验货，确认商品信息，并查看商品名称、数量、价格、商家名称与您订购的信息一致后，再签收付款；<br />\n如果您验货时，发现收到的商品包装箱、包装中的商品与自己订购的不相符，请您拒绝签收，或与我们取得联系；\n</p>\n<p>\n	代收说明：如您的商品需要家人或同事代收，请您务必告知以上情况，谨防上当。\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	2. 收到关于投奖、中奖、的电话或短信时，请提高警惕<br />\n如果您收到陌生人的电话或短信，内容包含抽奖、中奖信息时，请与本商城客服取得联系并确认；\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	3. 收到QQ、论坛站内信提示您进行汇款或中奖信息时，请务必与商城客服确认<br />\n商城促销活动、对外公告均可在本商城官网促销页面或网站公告中查看，如果陌生人通过QQ与您联系，提示您进行汇款，或者告诉您中奖的信息，请您联系商城在线客服进行核对，请勿轻信非官方获奖信息！&nbsp;\n</p>',3,'','\0',NULL,NULL,NULL,'防骗提示',3,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (19,'2013-06-24 00:01:15','2013-07-18 14:51:19',NULL,'商城店庆&nbsp;&nbsp; 时间：（2013.4.27至2013.5.23），<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 跨品类满减优惠：满200减40（优惠码不限量），满400减100（优惠码不限量）。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 通过与商城兑换，在结账时输入优惠码，系统将自动扣除满减金额。如果其他促销也需要输入促销优惠码，则不能与本促销共同使用。<br />',3,'','\0','店庆活动','店庆活动','店庆活动','店庆活动 有你更精彩',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (20,'2013-06-24 00:01:16','2013-06-24 00:01:16',NULL,'<p class=\"MsoNormal\">\n	<span> </span> \n</p>\n低价一站到底<br />\n<br />\n4月27日商城开启低价一站到底，一天三场万人抢购，服饰全场满1999减200，满999减100，品牌服装冲锋底价，更有全场满返现金券，部分品类满100就返30元现金券，更多惊喜，尽在4月27日开启！<br />',2,'','\0',NULL,NULL,NULL,'低价一站到底',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (21,'2013-06-24 00:01:17','2013-06-24 00:01:17',NULL,'<p>\n	各位亲爱的顾客：\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 品牌服饰周末耍大牌，为您打造专属于您的男性魅力！\n</p>\n<p>\n	<br />\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 倾情为您打造男士商务、休闲一站式采购的男装盛典，还为您准备以下惊喜：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜1：众多春夏新品首发，尝鲜体验；&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜2：全场1-5折，所有产品赠精美礼盒包装，支持货到付款或快递发货；\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 惊喜3：全场满300元减20元，满400元减30元，满900元减100元\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！\n</p>',3,'','\0',NULL,NULL,NULL,'周末耍大牌',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (22,'2013-06-24 00:01:18','2013-06-24 00:01:18',NULL,'时间：2013-4-27 &nbsp;<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 箱包百万优惠劵免费领啦！20元面额，当现金，无消费限额，即领即用！先领券，再下单直减钱！美旅拉杆箱、大牌ELLE女包、花花公子皮带、威戈电脑包、七匹狼男包。。。<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 下单都用券，直减钱！疯了疯了，还不快抢！<br />\n<br />\n&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：4月27号 9:30---5月27号 9:30<br />\n<br />',2,'','\0',NULL,NULL,NULL,'箱包百万优惠券大派送',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (24,'2013-06-24 00:01:19','2013-07-19 16:47:20',NULL,'<p class=\"MsoNormal\">\n	<span><span></span></span><span style=\"font-family:宋体;\">尊敬的商城会员：</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;\">喜迎五．一大促销活动开始啦！</span><span>10</span><span style=\"font-family:宋体;\">元礼品任你选满百即送！多买多得！</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; <br />\n</span></span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span></span></span><span style=\"font-family:宋体;\">活动规则：</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span>1.</span><span style=\"font-family:宋体;\">此活动仅限玩具类产品（包括益智图书）。</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span>2.</span><span style=\"font-family:宋体;\">单笔订单满</span><span>100</span><span style=\"font-family:宋体;\">元（不包括邮费），本商城儿童玩具</span><span>10</span><span style=\"font-family:宋体;\">以下产品任选</span><span>1</span><span style=\"font-family:宋体;\">件。</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span>3.</span><span style=\"font-family:宋体;\">满</span><span>200</span><span style=\"font-family:宋体;\">可任选</span><span>20</span><span style=\"font-family:宋体;\">元以下产品</span><span>1</span><span style=\"font-family:宋体;\">件。满</span><span>300</span><span style=\"font-family:宋体;\">元可任选</span><span>30</span><span style=\"font-family:宋体;\">元以下产品</span><span>1</span><span style=\"font-family:宋体;\">件，以此类推</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span>4.</span><span style=\"font-family:宋体;\">活动时间为</span><span>4</span><span style=\"font-family:宋体;\">月</span><span>26</span><span style=\"font-family:宋体;\">日</span><span>~6</span><span style=\"font-family:宋体;\">月</span><span>16</span><span style=\"font-family:宋体;\">日</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp; </span>5.</span><span style=\"font-family:宋体;\">最终解释权归本商城所有。</span>\n</p>',2,'','\0',NULL,'欢庆黄金周','欢庆黄金周','欢庆黄金周 10元礼品任你选满百即送！多买多得！',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (25,'2013-06-24 00:01:20','2013-06-24 00:01:20',NULL,'<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\">注册或购买就送</span><span>50</span><span style=\"font-family:宋体;\">积分</span><span><span> <br />\n</span></span>\n</p>\n<p class=\"MsoNormal\">\n	<span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动时间：</span><span>2013</span><span style=\"font-family:宋体;\">年</span><span>4</span><span style=\"font-family:宋体;\">月</span><span>27</span><span style=\"font-family:宋体;\">日至</span><span>2013</span><span style=\"font-family:宋体;\">年</span><span>5</span><span style=\"font-family:宋体;\">月</span><span>27</span><span style=\"font-family:宋体;\">日。</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动规则：</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 活动期间</span><span>,</span><span style=\"font-family:宋体;\">新用户注册和注册用户在商城购物均可获得商城五十积分。（活动期间注册并购买商品的用户只能获得一次五十积分的机会）赠送积分会在活动结束后一周内发放到用户的个人中心</span><span>,</span><span style=\"font-family:宋体;\">请注意查收。如果退货</span><span>,</span><span style=\"font-family:宋体;\">积分会被收回。</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\"><br />\n</span>\n</p>\n<p class=\"MsoNormal\">\n	<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp; 商城将不定期举办积分购购购活动</span><span>,</span><span style=\"font-family:宋体;\">会给新老会员发送消息</span><span>,</span><span style=\"font-family:宋体;\">敬请关注。</span>\n</p>',0,'','\0',NULL,'注册送积分','注册送积分','注册或购买就送50积分',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (26,'2013-06-24 00:01:21','2013-06-24 00:01:21',NULL,'<p>\n	年中大团购 全场3.2折起\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 时间： 2013-01-01\n</p>\n<p>\n	<br />\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 商城推出“年中大团购 底价大决算”活动，一年一次的盛惠，抢到就是赚到！<br />\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动期间，全场商品最低3.2折起！品牌服饰最高直降200元，箱包买一赠一，惊喜连连，底价大放送，抽奖抽到你手软！\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 活动时间：6月26-30日\n</p>\n<p>\n	<br />\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 祝大家购物愉快！',4,'','\0',NULL,NULL,NULL,'年中大团购 全场3.2折起',2,1);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (27,'2013-06-24 00:01:22','2013-07-12 17:45:20',NULL,'<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 爱美的你是否早已按捺不住？五一过后就是热辣的夏天，我们为女性朋友们带来涵盖多种品牌的缤纷大促销，从鞋包到服装一应俱全，全面满足你的购物欲。4月27日至4月30日三天内，光临女人节，就有三重特惠供你选择，满199元减60元、满299元减100元、满499元减180元。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 据介绍，此次中国靓丽女人节力邀众多国际知名品牌，为女性朋友带来一道丰盛的美丽大餐。化妆品品牌雅诗兰黛（ESTEE LAUNDER）、兰寇（Lancme）、资生堂（Shiseido）、玉兰油（OLAY）、欧珀莱（AUPRES）等携手服装品牌欧时力（Ochirly）、埃斯普利特（Esprit）等倾情力减，美颜护肤搭配精致时装，让你惊艳众人；而鞋包品牌比如玖熙（Nine West）、阿迪达斯（Adidas）、蔻驰（Coach）等，也竞相推出促销产品，相信总有一款适合你。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 春天刚过，相信很多女性都在为节后体重增加而烦恼；同时，有很多白领女性年纪轻轻，就已经腰酸背痛。趁此女人节之际，我们特别推出多种运动及户外健身用品，比如阿瑞娜（Arena）、皮尔瑜伽（PierYoga）、狼爪（Jack Wolfskin）等，让女性朋友们走出办公室拥抱自然，远离亚健康，减掉身上赘肉。还等什么？赶快备好行装动起来！\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 秉承“天天低价，正品行货”的承诺，我们在这特殊的节日也为女性朋友们带来丰富、优惠的美丽套餐。精彩五月、缤纷夏日，我们和万千女性一起，共同打造真正靓丽时尚的“女人节”。\n</p>',9,'','\0',NULL,NULL,NULL,'五月靓丽女人节 呵护自己',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (28,'2013-06-24 00:01:23','2013-06-24 00:01:23',NULL,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2009年中，苹果公司市值超越谷歌；2010年5月，超越微软成为全球市值最高的科技公司；2012年8月12日，苹果市值超越石油巨头埃克森美孚，登顶全球市值榜首。一次次不断超越为我们展现的不仅是苹果公司活力与激情、动荡与辉煌相互交织的发展轨迹，更是新兴产业与传统产业之间的博弈，以互联网技术为基础的商业时代已经到来。<br />\n<br />\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; “移动电子商务”、“社交网络”、“4G”、“SoLoMo”……全新的技术和概念串联起了数字化时代下的鲜明特征，也为未来商业发展提供了更多的可能与选择。时代的快速变化总是超出我们的想象。Google推出的Android操作系统及相应手机在全球迅速流行并普及；以Facebook、Twitter、新浪微博等为代表的社交型平台网络也体现出越来越明显的移动化特征；在日本，De NA、Gree等移动社交网站占据了市值排行榜的前列。显而易见，互联网市场的竞争态势已经从企业间竞争逐渐向全产业链竞争开始转移。近日，搜索巨头Google一手举着刚刚收购的摩托罗拉手机，另一只手则紧握社交终端。马云的态度更是异常坚决：“今年淘宝最重要的任务就是把淘宝SNS化。”百度CEO李彦宏也宣称：“百度要大规模的进入SNS领域。”\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的互联网企业在看到社交网络未来发展机遇的同时，也将目光迅速转向到了对移动互联网产业的关注，具有混搭风格的SoLoMo模式则被看成是继PC互联网之后下一个十年的主流发展趋势。在“概念”横行的时代里，电商企业作为互联网生态圈中的又一重要分支，在面对移动互联网这块充满着巨大诱惑和极具挖掘潜力的“蛋糕”时，也纷纷推出了适用于Symbian、Android、iPhone等不同手机平台的移动客户端以完善自身产业链体系。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 中国的移动电子商务目前尚处于起步阶段，有业内人士指出：“移动电子商务尤其是手机购物的发展，首先要依赖于智能手机的普及和网络对于应用的支撑，然后是用户习惯的培养，这些是基础。就目前来看，尽管如今智能手机市场发展迅速，但是普及度仍然不够，并且对于移动网络方面，也仍有待发展和完善。同时，与之相关的配套服务也应同比例提升，毕竟电子商务的实质在于‘商务’。\n</p>\n<p>\n	<br />\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事实上，目前许多互联网企业应对移动互联网趋势的最稳妥做法就是将其内容和应用从PC向手机进行移植，但要真正要得到用户的青睐，完全取决于用户体验效果的成败。“决定电子商务企业成败的核心点只有四个字‘顾客体验’。电子商务作为新型的业态，尤其在中国还远不够成熟。企业需结合其核心能力与上游供应商端及物流端的资源整合，为顾客提供更好的购物体验和价值。模式的创新多半重‘电子’，竞争关键则在于强化每个‘商务’的细节。”<br />\n&nbsp;',5,'','\0',NULL,NULL,NULL,'电子商务未来是否需要“移动”',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (29,'2013-06-24 00:01:24','2013-06-24 00:01:24',NULL,'尊敬的顾客，您好！<br />\n<br />\n&nbsp;&nbsp;&nbsp; 如果您的多个订单被合并发货， 并且您支付了多次运费的， 请在包裹签收7天后致电客服热线400-000-****， 或发邮件到官方邮箱进行登记，我们将在1个工作日内按实际发货情况将多收运费返还到您的商城个人账号。<br />\n<br />\n&nbsp;&nbsp;&nbsp; 特别说明： 收货后7天内因为可能发生退换货，不处理相关运费返还业务。<br />\n<br />\n&nbsp;&nbsp;&nbsp; 祝您工作顺利、生活愉快！<br />\n<br />\n2013年4月27日',3,'','\0',NULL,NULL,NULL,'合并运费返还方案公告',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (30,'2013-06-24 00:01:25','2013-06-24 00:01:25',NULL,'<p>\n	&nbsp;&nbsp;&nbsp; 从今日起，国美在线将启动新一轮价格战。记者发现，当当网、1号店、乐蜂网、聚美优品等二线电商也将4月作为了大促时段。在京东商城、苏宁易购等电商试图盈利的发展转型期，二线电商纷纷造势抢占市场份额。\n</p>\n<p>\n	　　据悉，本次国美电商的“最强店庆月”的跨度长达一个月，并将在本月18日店庆当日达到高峰。据一位接近国美在线的人士透露，国美在线方面希望将“4.18”打造成与淘宝“双11”光棍节、京东商城“6.18”店庆促销一样震动行业的电商促销盛宴。\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 不仅是国美在线，当当网、1号店、乐蜂网和聚美优品等电商企业也纷纷在4月掀起促销狂潮。当当网相关负责人表示，利用春夏这一时间点促销，避开淘宝网的秋冬大促，并打造自己的促销品牌。事实上在经历过去年的大促后，京东商城、苏宁易购等电商巨头不约而同开始弱化价格战，将发展重心回归到盈利能力提升以及对用户体验层面上。因为包括京东商城和苏宁易购在内的大型电商都将今年视做变革之年。<br />\n<br />\n四月电商价格战火重燃 服务为决胜之道<br />\n<br />\n<p>\n	　　进入4月，国美、苏宁电商高举促销让利的大旗，再燃价格战火。而2013一开年，在京东商城内部年会上，京东商城集团创始人兼CEO刘强东发表讲话，阐释京东2013年的“修养生息”战略，并首次指出了京东商城第二个十年的三大发展方向：自营电商、开放服务和数据金融。在2013年围绕美苏之间的首轮价格战来临之时，京东仍旧挂出“免战牌”。由于京东的缺席，原来的“三国杀”变为了“美苏争霸”。\n</p>\n<p>\n	　　有业内人士表示，京东缺席价格战是个好的选择，因为任何一家企业都有自己的问题，京东也不例外。经过六年高速发展的京东，确实需要好好的修养了。人员的扩张带来的问题、生态系统的建设等。刘强东在接受腾讯科技采访时称，京东出现了大公司病的苗头，在业界的声誉没有初创期那么好了。还有人员的扩张，带来了管理的难度。内部的这些问题，远远比价格战重要。把内部的问题梳理、解决好，才能为下一轮的增长打好基础。\n</p>\n<p>\n	　　不过，有分析认为，京东此举并不那么轻松。尽管京东在B2C市场份额占据领先优势，但是在电商混战的状态下，市场格局并没有稳定，未来市场份额排名难以预料。中国电子商务的发展大致可以分为四个阶段：首先是依赖低价格吸引用户的“价格竞争”阶段；其次是通过营销手法诱导用户购买的“营销竞争”阶段；再次是依靠口碑，用货真价实的商品吸引用户多次购买的“品质竞争”阶段；最后，则是更贴近消费者需求、品质更有保证、用户粘性强、品牌美誉度极高，拥有强大品牌吸引力的“品牌竞争”阶段。京东退出价格战，提高自己的服务正是决胜之道。\n</p>\n<p>\n	　　对于爆发的4月“美苏大战”，一定程度上反应了当前行业格局的微妙变化。实际上，去年所发生的京东、国美、苏宁三家电商龙头公司的价格战，将要转变为线上版的“美苏争霸”，无论结果如何，都将对京东现有地位形成一定的威胁。\n</p>\n<p>\n	　　久违的价格战让今年电商市场显得相对平静，“搅局者”腾讯旗下易迅网正欲打破这种局面。近日易迅网宣布从今日开始，针对京东商城、苏宁易购和国美在线三家的商品售价，启动名为“价格终结者”的保价行动，并持续一个月。\n</p>\n<p>\n	　　业内人士表示，历经前期的探索与积累，传统企业电商已经显示出了强大的实力与爆发力，国美苏宁此时趁主要竞争对手休养生息之际，自然不会放过进一步抢占市场份额的机会。目前，低价竞争仍是最有效的手段，因此国美苏宁势必掀起新一轮的价格大战。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　那么，在国美苏宁继续发力挑战电商现有格局的2013年里，京东是否会重回价格战？\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　“在目前家电类电商利润稀薄的状况下，价格战等同于自杀式流血，不可持续。今年电商的主题是通过合理的成本控制，升级营销手段来保持经营利润，促进整个电商行业健康可持续发展。”对于京东“哑火”，新七天电器品牌总监田原认为，京东商城在独立B2C市场上的垄断性优势，已经让其不屑于打价格战。\n</p>\n　　有独立电商观察者对记者表示，包括京东和国美苏宁在内，电商整体还是会保持一个基本低价的态势，但真正的竞争还会是在售后体验上，而售后体验的经验积累和物流体系建设，也绝非一日之功，各大电商还需投入更多精力提升用户体验。<br />\n<br />\n<br />',12,'','\0',NULL,NULL,NULL,'电商变革 电商造节促销欲打翻身仗',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (31,'2013-06-24 00:01:26','2013-07-12 17:45:20',NULL,'酷酷搭配逛街去 时尚美范赚足回头率<br />\n<br />\n　　如何装扮自己，才能赢得路人们的注意呢。对于许许多多的爱美的女性朋友们来说，学习时尚的服饰搭配技巧是非常重要的一个课题。接下来，就让小编来告诉你吧，一定要仔细学习哦，相信一定可以找到属于你自己的搭配风格的。<br />\n&nbsp;<br />\n　　民族风的披肩，喜欢旅游的女孩们，外出穿上这款yy，非常有感觉哦!独具特色的民族风花纹图案，穿上它超级显个性的。内搭最百搭的黑色打底毛衫，下身配搭黑色紧身牛仔裤+皮质过膝长靴，很时髦帅酷哦!',4,'','\0',NULL,NULL,NULL,'酷酷搭配逛街去 时尚美范赚足回头率',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (32,'2013-06-24 00:01:27','2013-06-24 00:01:27',NULL,'google快递<br />\n<br />\n　　今天，Google 宣布了其 Google 购物快递(Shopping Express) 服务正式上线，与其配套的当日送达服务只在美国部分地区试运营。截至目前，已有包括 Target/Walgreens 在内的数十家零售商合作伙伴。<br />\n<br />\n　　此前有媒体猜测，Google 可能会推出 64-69 美元 / 年的价格来同 Amazon 竞争，但就目前的情况看，Google 似乎仍未拿出一个合理定价方案，未来会根据零售商以及首批试用用户数据，制定合理的价格。首批试用者也可以免费享受六个月的当日送达服务。<br />\n<br />\nGoogle快递服务<br />\n<br />\n　　对于普通消费者来说，好处是购物时除了 Amazon，他们又多了一个选择；而商家也会因此带来一批新的用户。<br />\n<br />\n　　自此，Google 又多了一重“电商”的身份，其他在线零售商要小心了，尤其是电商巨头 Amazon。',1,'','\0',NULL,NULL,NULL,'谷歌正式进军电商行业 推购物快递服务',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (33,'2013-06-24 00:01:28','2013-06-24 00:01:28',NULL,'<p>\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 越来越多的70后、80后发现，身边的父母长辈开始聊网购了，甚至有不少人已经能在网上购物。在这一现象的背后，网购已经成为人们主流的消费方式和拉动经济增长的新引擎，国内零售业也由此进入了新旧经济模式转型的关键节点。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　在今年的全国两会上，还有不少50、60后代表饶有兴致地谈起网购经历。就连广大农村地区的居民也加入了电子商务大军，不少农民还扯条网线当上了“网商”，直接把家里的土特产卖到了全国各地。根据中国互联网络信息中心（CNNIC）发布的报告，截至2012年12月底，我国网络购物用户规模达到2.42亿。艾瑞咨询数据显示，2012年中国网络购物市场交易规模达1.3万亿元，在社会消费品总零售额的占比达到6.2%。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　在网购规模逐年扩大的同时，百货商场沦落为“试衣间”的趋势也越来越明显。就连年销售额400多亿、拥有银泰百货等金字招牌的银泰集团董事长沈国军也公开表示：“电子商务发展势不可挡，传统零售业务不变革的话是死路一条。”而在传统零售商尝试转型之前，不少制造商早已加入了网销大军。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　为此电商服务平台为创业者电商提供最好的服务，无论有无开网店的经验，电商服务平台的技术人员都会帮您实现，并将您培养成一名成功的创业者。省钱省力，上手迅速。一个完整的开网店过程：谋划网站功能--找电商服务平台签合同做网站，空间费，带宽费，域名费--网站开发费用--学习网店后台操作--开通支付功能--向网店上传商品--开始运作。\n</p>\n<p>\n	<br />\n</p>\n　　企业尤其是传统企业想要做好电子商务，想要进军电子商务市场，想要在电子商务市场竞争中逆流而上，必要的电子商务力量与支持绝对不能少。',2,'','\0',NULL,NULL,NULL,'创业者电商 促进中国经济生活转型',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (34,'2013-06-24 00:01:29','2013-06-24 00:01:29',NULL,'　　刘女士是经常去马连道，因为她爱喝茶，但是从今年8月份后，她再也不去马连道了，原来是她从网上购茶了，之前刘女士是从来不相信网上购物的，那为什么后来就从网上购物了呢。<br />\n<br />\n　　事情的经过是这样的，今年八月中旬的一天，刘女士又到日子要去马连道买茶了，正准备出门，女儿说，现在网上购物又省心，又省力，何必跑那么远呢，网上有一个专门卖茶的网站叫国茶商城还不错，你可以上去看看，刘女士本来是不相信网上购物的，别看天天上网，也只是聊个天打个字，从来不在网上购物，可这次听女儿说的这么好，正好今天车又限号，她也不想大热天的挤公交，心想就试试吧，她打开国茶商城页面一看，好家伙，品种还很全，自己能见到的茶叶，这茶城里全有，价格也公道，正看着呢，结果瞧见一个茶叶竟然零元销售，刘女士心想估计又是一个不靠谱的网站，反正是零元，试一下吧。就点了购买，完了就关了页面了。之后又坐车去马连道。<br />\n<br />\n　　本来刘女士也不以为意，估计人家网站也不可能零元销售，估计又是骗子网站，可是下午回家后，竟然有人打电话问她是不是在国茶商城定过茶，刘女士有点觉得惊讶了，最让他惊讶的是下午两点竟然有人给他把价值二百多元的茶送过来了，刘女士没掏一分钱。<br />\n<br />\n<p>\n	　　事后刘女士通过问网站配送人员才知道，本来国茶商城在测试阶段，所以有些细节检查的并不仔细，并没有想到会有人去真正的购买，可是没有想到有人下单了，看到定单后，商城的销售人员立即打电话给了领导，领导当时就做出决定：赔钱也要做到诚售，既然标了零元就要做到。这样才有了下午的一幕，最后刘女士一分钱没花买到了价值二百多的六安瓜片。\n</p>\n<p>\n	<br />\n</p>\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 事情传出后，国茶商城被众网友评为了最诚信电商。由此可见信誉、品牌在消费者看来是责任是义务，是商家对待消费者的态度。而对商家而言信誉、诚信则是消费者最好的评价与支持。诚信为本 千古不变。',4,'','\0',NULL,NULL,NULL,'看国茶商城被网友评为最诚信电商之一，言电商信誉、品牌塑造。',1,NULL);
insert  into `xx_article`(`id`,`create_date`,`modify_date`,`author`,`content`,`hits`,`is_publication`,`is_top`,`seo_description`,`seo_keywords`,`seo_title`,`title`,`article_category`,`shop`) values (35,'2013-06-24 00:01:30','2013-06-24 00:01:30',NULL,'<p>\n	　&nbsp; 受全球经济增长迟缓的影响，2012年中国电子商务市场整体增速有所回落，艾瑞咨询数据显示，2012年中国电子商务市场交易规模达8.1万亿元；从市场结构来看，网络购物突破万亿元大关，比较2011年有提升，在线旅游份额保持稳定，而B2B占比下降2个百分点。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　市场规模：2012年中国电子商务市场交易规模8.1万亿元\n</p>\n<p>\n	<br />\n</p>\n　　艾瑞咨询统计数据显示，2012年中国电子商务市场整体交易规模为8.1万亿元，增长27.9%，与2011年32.8%的增速相比，下降了近5个百分点；其中2012Q4整体交易规模为2.4万亿元，环比增长16.2%，同比增长27.5%。<br />\n<p>\n	　　艾瑞咨询分析认为，电子商务市场规模增速有所回落，其原因主要是2012年国际贸易增速回落，欧洲债务危机不断加剧，美国经济复苏缓慢，全球经济收缩步伐加快；此外海关总署最新发布的数据也体现出这个态势，2012年全年中国进出口总额为38667.6亿美元，较2011年增长6.2%，而2011年同期的增速为22.5%，下降16个百分点。艾瑞咨询认为，当前经济环境对企业间电子商务行为产生较大影响，而B2B部分交易规模占电商整体八成以上，B2B市场规模在2012年增速放缓直接影响了整体规模增速。\n</p>\n<p>\n	<br />\n</p>\n<p>\n	　　市场格局：电商频繁促销活动驱动网购市场份额的增长\n</p>\n<p>\n	<br />\n</p>\n　　艾瑞咨询统计数据显示，2012年电子商务市场细分行业结构中，中小企业B2B电子商务占比53.3%，规模以上B2B占28.3%，企业间电子商务合计占81.6%；网络购物交易规模市场份额达到16.0%；在线旅游交易规模占比为2.1%。<br />\n　　艾瑞咨询分析认为，2012年中国网络购物市场份额有所提升，其因素是核心电商企业通过各种形式的促销，深入挖掘网购用户的消费潜力，从而带动了网购市场的快速增长。仅“双十一”仅淘宝就创造了191亿的交易业绩，远超美国2012年“网购星期一”15亿美元交易额水平。未来随着传统企业大规模进入电商行业、移动互联网的快速发展促使移动购物日益便捷，中国网络购物市场整体还将保持较快增长速度。<br />\n　　此外，在线旅游市场虽然占比较低，但近年来受机票、酒店、旅游度假等细分市场不同程度的驱动，一直保持30%以上的增长，逐渐成为电子商务市场重要的组成部分。<br />\n<br />',12,'','\0',NULL,NULL,NULL,'中国电商交易额8.1万亿 网购占比提升',1,NULL);


insert into `xx_promotion`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`end_date`,`introduction`,`is_coupon_allowed`,`is_free_shipping`,`maximum_price`,`maximum_quantity`,`minimum_price`,`minimum_quantity`,`name`,`point_expression`,`price_expression`,`title`,`shop`) values (1,'2013-06-24 00:03:06','2013-06-24 00:03:06',1,'2013-06-24 00:03:06','2015-01-01 00:00:00','<p>
	活动内容：订单商品金额满300元立减10元
</p>
<p>
	参与商品分类：连衣裙、针织衫
</p>
<p>
	说明：参与该活动商品不允许使用优惠券
</p>',0,0,null,null,null,null,'限时抢购',null,'price * 0.9','限时抢购',1);
insert into `xx_promotion`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`end_date`,`introduction`,`is_coupon_allowed`,`is_free_shipping`,`maximum_price`,`maximum_quantity`,`minimum_price`,`minimum_quantity`,`name`,`point_expression`,`price_expression`,`title`,`shop`) values (2,'2013-06-24 00:03:07','2013-06-24 00:03:07',2,null,null,'<p>
	<span style="white-space:normal;">活动内容：</span>订单商品价格满200元赠送双倍<span style="white-space:normal;">积分</span> 
</p>
<p>
	<span style="white-space:normal;">参与商品分类：服饰配件、小西装</span> 
</p>',1,0,null,null,null,null,'双倍积分','point * 2',null,'双倍积分',1);

insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (1,1);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (2,1);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (1,2);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (2,2);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (1,3);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (2,3);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (1,4);
insert into `xx_promotion_member_rank`(`promotions`,`member_ranks`) values (2,4);

insert into `xx_promotion_product_category`(`promotions`,`product_categories`) values (2,4);
insert into `xx_promotion_product_category`(`promotions`,`product_categories`) values (1,11);
insert into `xx_promotion_product_category`(`promotions`,`product_categories`) values (2,14);
insert into `xx_promotion_product_category`(`promotions`,`product_categories`) values (1,21);

insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (1,'2013-06-24 01:00:06','2013-06-24 01:00:06',NULL,50,'头部广告','<div class=\"headerAd\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',320);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (2,'2013-06-24 01:00:07','2013-06-24 01:00:07',NULL,52,'底部广告','<div class=\"footerAd\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',950);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (3,'2013-06-24 01:00:08','2013-06-24 01:00:08',NULL,290,'首页轮播广告','<div id=\"slider\" class=\"slider\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',770);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (4,'2013-06-24 01:00:09','2013-06-24 01:00:09',NULL,106,'首页右侧广告','<div class=\"rightAd\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',230);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (5,'2013-06-24 01:00:10','2013-06-24 01:00:10',NULL,120,'门店头部广告','<div class=\"middleAd\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',950);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (6,'2013-06-24 01:00:11','2013-06-24 01:00:11',NULL,343,'首页热门商品左则广告','[#list adPosition.ads as ad]\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n		[#if ad.url??]\n			<a href=\"${ad.url}\">\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			</a>\n		[#else]\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n		[/#if]\n	[/#if]\n[/#list]',260);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (7,'2013-06-24 01:00:12','2013-06-24 01:00:12',NULL,343,'首页最新商品左则广告','[#list adPosition.ads as ad]\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n		[#if ad.url??]\n			<a href=\"${ad.url}\">\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			</a>\n		[#else]\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n		[/#if]\n	[/#if]\n[/#list]',260);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (8,'2013-06-24 01:00:13','2013-06-24 01:00:13',NULL,300,'会员注册右侧广告','<div class=\"ad\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"text\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					${ad.content}\n				</a>\n			[#else]\n				${ad.content}\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',240);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (9,'2013-06-24 01:00:14','2013-06-24 01:00:14',NULL,330,'会员登录左侧广告','<div class=\"ad\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',500);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (10,'2013-06-24 01:00:08','2013-06-24 01:00:08',NULL,290,'门店首页主题广告','<div id=\"slider\" class=\"slider\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',770);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (11,'2013-06-24 01:00:08','2013-06-24 01:00:08',NULL,290,'商城首页主题广告','<div id=\"slider\" class=\"slider\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',770);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (12,'2013-06-24 01:00:10','2013-06-24 01:00:10',NULL,143,'社区首页促销广告','<div class=\"middleAd\">\n	[#list adPosition.ads as ad]\n		[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n			[#if ad.url??]\n				<a href=\"${ad.url}\">\n					<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n				</a>\n			[#else]\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			[/#if]\n		[/#if]\n	[/#list]\n</div>',950);
insert  into `xx_ad_position`(`id`,`create_date`,`modify_date`,`description`,`height`,`name`,`template`,`width`) values (13,'2013-06-24 01:00:11','2013-06-24 01:00:11',NULL,343,'社区商户分类陈列页左侧促销广告','[#list adPosition.ads as ad]\n	[#if ad.hasBegun() && !ad.hasEnded() && ad.type == \"image\"]\n		[#if ad.url??]\n			<a href=\"${ad.url}\">\n				<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n			</a>\n		[#else]\n			<img src=\"${ad.path}\" width=\"${adPosition.width}\" height=\"${adPosition.height}\" alt=\"${ad.title}\" title=\"${ad.title}\" />\n		[/#if]\n	[/#if]\n[/#list]',230);

insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (1,'2013-06-24 01:00:15','2013-06-24 01:00:15',1,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/header.jpg','正品保障',1,NULL,1,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (2,'2013-06-24 01:00:16','2013-06-24 01:00:16',2,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/footer.jpg','我们的优势',1,NULL,2,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (3,'2013-06-24 01:00:17','2013-06-24 01:00:17',3,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_1.jpg','享受这一刻的舒适',1,NULL,3,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (4,'2013-06-24 01:00:18','2013-06-24 01:00:18',4,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_2.jpg','浪漫时尚季',1,NULL,3,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (5,'2013-06-24 01:00:19','2013-06-24 01:00:19',5,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_3.jpg','伊见清新',1,NULL,3,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (6,'2013-06-24 01:00:20','2013-06-24 01:00:20',6,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_right.jpg','春季新品',1,NULL,4,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (7,'2013-06-24 01:00:21','2013-06-24 01:00:21',7,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_top.jpg','特卖会专场',1,NULL,5,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (8,'2013-06-24 01:00:22','2013-06-24 01:00:22',8,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_hot_product.jpg','热门商品',1,NULL,6,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (9,'2013-06-24 01:00:23','2013-06-24 01:00:23',9,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_new_product.jpg','最新商品',1,NULL,7,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (10,'2013-06-24 01:00:24','2013-06-24 01:00:24',10,NULL,'<dl>\n	<dt>\n		注册即享受\n	</dt>\n	<dd>\n		正品保障、正规发票\n	</dd>\n	<dd>\n		货到付款、会员服务\n	</dd>\n	<dd>\n		自由退换、售后上门\n	</dd>\n</dl>',NULL,NULL,'会员注册',0,NULL,8,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (11,'2013-06-24 01:00:25','2013-06-24 01:00:25',11,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/login.jpg','会员登录',1,NULL,9,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (12,'2013-06-24 01:00:17','2013-06-24 01:00:17',3,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_1.jpg','享受这一刻的舒适',1,NULL,10,1);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (13,'2013-06-24 01:00:21','2013-06-24 01:00:21',7,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_top.jpg','特卖会专场',1,NULL,5,1);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (14,'2013-06-24 01:00:17','2013-06-24 01:00:17',3,NULL,NULL,NULL,'/CMall/upload/image/ad/indexMainAD.gif','冰爽夏季',1,NULL,11,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (15,'2013-06-24 01:00:21','2013-06-24 01:00:21',7,NULL,NULL,NULL,'/CMall/upload/image/ad/area_12.gif','特卖会专场',1,NULL,12,NULL);
insert  into `xx_ad`(`id`,`create_date`,`modify_date`,`orders`,`begin_date`,`content`,`end_date`,`path`,`title`,`type`,`url`,`ad_position`,`shop`) values (16,'2013-06-24 01:00:22','2013-06-24 01:00:22',8,NULL,NULL,NULL,'http://storage.shopxx.net/demo-image/3.0/ad/index_hot_product.jpg','社区促销商品',1,NULL,13,NULL);

-- xx_system_product
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (1,12,11,'test1','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (2,12,11,'test2','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (3,12,11,'test3','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (4,12,11,'test4','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (5,12,12,'test5','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (6,12,12,'test6','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (7,12,12,'test7','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (8,12,12,'test8','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (9,12,14,'test9','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (10,12,21,'test10','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (11,12,21,'test11','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (12,12,21,'test12','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (13,12,21,'test13','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (14,12,21,'test14','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (15,12,22,'test15','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (16,12,22,'test16','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (17,12,22,'test17','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (18,12,31,'test18','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (19,12,13,'test19','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');
-- insert  into `xx_system_product`(`id`,`brand`,`product_category`,`name`,`full_name`,`unit`,`image`,`introduction`,`is_approved`,`create_date`,`modify_date`,`barcode`,`guarantee_date`,`market_date`,`attribute_value0`,`attribute_value1`,`attribute_value10`,`attribute_value11`,`attribute_value12`,`attribute_value13`,`attribute_value14`,`attribute_value15`,`attribute_value16`,`attribute_value17`,`attribute_value18`,`attribute_value19`,`attribute_value2`,`attribute_value3`,`attribute_value4`,`attribute_value5`,`attribute_value6`,`attribute_value7`,`attribute_value8`,`attribute_value9`) values (20,12,13,'test20','CXPRI8DOWCGO2MYI DCNV 9O8HXQBQYSYPC0Q5JLSK7SVVKI3E4W0JGMNDY7OQ4JH4K YXYOR5BRIGQ8PE317TU  83982H6R3 R141SBP 3QEJND5A7AKGWY3GX7E9E 71IRMEEER5B51A7 6EK0TH4OSRANPRFQVQGTLTGCHD0B DTUQRA1T7UP EEL8J 3AQRUH6HWXURP5E2PYENV86U02EEXI7CFGDOB1LH8UH7NO4XON W0U0FY6GEHCL','件','B9CUDIAL63NQV 08AQD R1O929920SH1N85OTC25STT5U1A5GCQP05KLT1X3YDU 4L360S6305PN2T0BJ892O1Y0RTTQ7LA73PDY8G452RP7TQ CXGWLCA9DOHKDVI6Y FMJBXC9ARMN0A055PXP6KXQKE66O2QSE6T4SU7N9TQH81TXW42G1H7HGK422C3J4WCQWVWVL5N2PJX41HESIRAANF7S1CAA3325FQLO6GEICBWHJYHEP2B3K OVD8B','6IYQHCOXUREUPCPGWBQKFHJRATL1W30J68FA9SWN9AXHYM8IYIVTY1GDU4W0AGU4A7GEOBYP QXQ91G8V9SKH7OL2  8 UPWTPBGTV7APB4NQJRL1SXRC6YG5 9TTYX730L0CUS953KF GC9RB JHISLCQC37UL J84RD N432IG6K8HFX 597HDXL8F3XLUIE2JMHF0B4J81168HK52OM5R6Y3HW3K2GGSD9YMQL0JFSFQ3D72T8KOEF1FYOMY',7,'0001-01-01 00:00:01','0001-01-01 00:00:13','FUX8OU8LXDQR402JK5F04K4JO5EY7OXIQDUQEMFOXJC6YHI97HW6XTSO30WH5CBU3SBAW T8L6XCBXEOLKVQ8N7NWEX8UEF50PJHSI0HNH7E2  7VCQLG6J8U8X9HKI05D6N9QNWX5B8QDHJA9BJLFTKV PBWIO7EI9X8886EFQLIR0KADX0GI 01OG N  UPE758M4E94EW7XKKE65DCKW9MVTOVQE98TX2HKPUTHOEBM10DQ3NBQC9YKUHCJT','0001-01-01 00:00:01','0001-01-01 00:00:12','CB97KMBG3O0D901Y0BT315G1DP5V24U6KDOKWVOMARXQG84H6TUQ7TSLGUN69AOXMBT9OF4IG6 H2RV8XQ9C1RC EBG60S3QXCJ0WK3XKB6 89IP00E46DFO2TG5OXMBM8OIUON1D9HFHKVUYAO6J3SJ1TQBU3CRLF4C3CCFBRW1JN9W4VHJAKSVQDBTHTSKM1TXGA92Q7KVGNHNKN94 M8CB68NOT2P6TQN2D0CONIWJTY588IRC6I2RMNR  V','9YD413KM6DF5ACYF G1YLLYXWQS QWNVETE3H5RX8XIUFEO74Y83J8EN778LA7YU NJMHMFSW0X0O7NQH7U 52KDCN5CKL4WK28QESXDUW0WME942FECGA2AXKFRC3DKMX0WWR8WL68B7CJFT7JIVWAOGM7WRHKJGHM55D1NOQ9HR97VIA279M6TBVNACC8FD303NAMWEOXB22LLVT UT0F WL6130JYJK6TDX001H53AKQTJ5E97DBKDCBSDND','XKYAK6S3VCLXUNG6Y50BNLKPX2VH1R7RJ9FPP2OHOO0B63M8HNLP J70MVHF12APT96N4TWWB5C5IJS9JES8RIWR WT3GSC62VHO9B5J7N0G2ME1Y5HM718IG1F0RO9SLESJ4TVES2PDKBQ0MNSN14JJI45YYXPVR V67081M5E8B0UCDI4CL5YSOT3TM63B0NUMMYBO7KDJ4IIR578TPUBRHSNNUGOSQF04X6U93W5WB2ERV72DOGCQJJJO64E','G5OLM6B V3K0WMJKTH90E9RXWOXNLGEI8P9CK 9DXUXQIAP7OP4YFKO4F19X08S4E8KUC8VXX85L9V8SO7XQ8AEMTYTYVJNVDP CAC25TN67JD88J6EFKBJVQLENNEA63IJVMO2L01MTUR3IG7YV8GYMEGIMRP8N2G42RGD0JLXEKVIS6AXK3DSNLLI5O9C1BPE70VRBW2CJ9HHF TBL1QGYLBI4XRP7CWS9TYAL6HUFE89UPMXRY0NO7HE32UQ','9198 D8RMNJFXKP542QKG ES3WCQJQHY0FS GTX7L26MXD6B8S3JXCL55SIP928O1ARYG5NEN7TMIE GKBDI9RW71ALTAMXP1 7EI1RMBQL096SRUV9LAXKCUC Y0GPUPIIBS3IBAV82E98PU5WQIIU9UFIWIML70BJI610DDBPYU8Q0NESK47SWGJH5G8J60EGK6MCTKDIK3PSRCEUMYSFG86J 9FFFYCWVXLG11UHLECN7BHE4I1OFXGOHYC ','ISDK3LYKBGOHH6OAKWJK 2Q62V51CU2BVLVYJBDK31F2WQ105OJL274RP3CFA8IL616 UE64 2HPH0LO70JB B7NBTUC045KS91QVDXW64GOL4G852FDX4WBM0 6O8WJ3CFI29X70MBF6HIBDVBNJUVYGKBF RLGIAMQDF82QWAJO E6BDM623NCMBQR48QXI0509NQ2P7UR4VKQEF129TH YXB0XNO6JAV2R53JAPS00U9L7SJOEFE B0K7MDJ','VG8L2HI8GI6VT7URI4A6A95GE8ECKXBLC Q9N76ACSXKBFM6QM8LJ26FH5IAFQGQ0FYE X LOBBLCHUHS9Q OMTCG4AGSH96V35E7JHL9T8DYBUSKKO015G9KLT H1G1RMS6UP TWDTSOPQ6Y83UDQ74188LN1DHIVG5TVBS59CAE45WOA56S8R0X0WGYW2PS0XCH942M58VHWH3D278T8I095BBFS7V8I47KWK9RW11M3P0L4RUG4J8Y86GGP4','MB1A8XPAXM7PVHHOYDHCRGC20AHN SL2J1PWX862QSO33TIKQEMQP64GH5RRMAQN1DGLC62OR6MH9S8F0H1ONVU5CX60AAL9K9PDU4KR9EKHL 3B02MS OGP4767SOVB7NSHVWAT32X4GKX OP7Y988H2L6I2UIXPLXG0Y82SS2LC7Y0KVEF4QWM0QG87P03H2A608TIK86F 4TOX5ULHUJ0IC62HR6IL7VPV8UY94HG70J6M309AVPCP5G B09','CBKR32TNC01ASEYTX0NS4NT2T347O800S2PPQE5A5BDICB34673 IC691T6OFKPUIGOTUDFPWX4IL089748EBJ098HP83QIW3 BUG4GPFRVQE6KY7CNHEP4VBMMKV65AD9 WFF2 SSQ3E5DQQJI3KYEQGTBPU4C0J1LKBR58BAEU XT3KLFH73PF7VN6TDU20ALSH9K NK0OD79FTJOBNKYHBP5UCEG8I4XY5NBMP4BOK8 1SIWOYG4ATDS TD2','P2V7KXI0C5M9V6A5CRYICTP6 N7S5JGI4RFACQ8CMDTJFCGDREO7AKF1XX3CV5GJ5O5MI9C77UTNTXK BTHF6D4VL913 KWNS0NICUWO5H56JNRWHV2C2H5P1O5V8WP908QRKOMUKGK9J0R2NOBIB LMAIQ3Q2HWL4CT8QWRB9VI4A1H2M93PQ4R7D8M0PF1BQMJVRRM9L63 KM5XE4RHB5AL5AW 8I8TDTFD8WJ6HLRBN96C 7R97OE3YLW0Y9','V6OI5Y7BJ2M1QRMS426Y03993XUP WKSLUS97YKXQYNYFBOXAURBKVQE959DK9QXTIOOQJET3F1OT800G7T7HK92HDD3QHFEFO1TN7AFJTW90MO1UQ1VBXP3IHNLNCE4 VH3 19YPK53607SCY0VNB93SFJUM9URQPI6YOQFU5OQQKFVIG60ANJFF7D322DRKQL1X8ILV2A56XOKKVXD6BK96TCWN6 D0N1YGEU1CTNI89O1DVKCG8TJFAO33L3','A8G8 EOEX KTNETXK487BDT4MO6ROMGMY1Q330DU4U0IIC50GN97W1XBAX6V7WPAE2N5CYX3GS6J6FE5R3W0T21Q02G8U2SS36WFYRXT654SBX30UNXNFKV7FCL7WF1FATCTF7E2C 2 U7CKV35YDUT01KB0XGB 05Q6J4YAVY6U1UOBPYCQMDPT2BAQUS K30W7EMQDCFOWEIA24CFMDSYPJPAGR7WQ5TRKCTDM6DTOP3U3K1883UH59L325NJ','C3UELQ 0QL5QH65KF3GJSRCM80BPU2CXAUP7II4Y9JRFU0Q1PKUBYDA9JFN034A1J0E0S6Q07G9A2XQWFMSOW6XWK9K0PH8IGOY2 9J6LAWS2HTMMF1I401KM2LE HA7P4WYGXAGU7JSKWMHMAW5UEC45MT8 7NY9PBQD SPKJFI 0SO N7D4FOF RTYK9ICB TVNWVPPPINKC2DL6CAQYV76JQGC230GNI6 UD3HC39D16KMN7HCFT32660SLM','S8VD757GH DGG00KFWVPTE H8W3HS5KBXYAJ5CSRFDAALOOI7TFFD6YC8WWE6ISSOE2D76OH73ST82J2W85WTSQRSN47MJGM4JEB4O2A1PBYWWLD2JYPN EP5PCDX50UDBV349XH5QMSLCMDC4 KYVTVKIFLDQM6KHAG1S 4VLOIWX8KF9PEA MKCFIMR18YVTPG8GTSHLTJXNQ4 3U8QA8QTR0GH7M7JWI4IXPTC KE9VAXQRGAX4V1BOO7FUA','JTIMVA8 MQ2RYP911TK7MFCVKTUIKI07NFF TW39 XT9 6R6YEOO7BW5GM57ISH6QMEV6C7C8Q6 CH1TQCNYJM6HNE3MFMS6894EV59E0DLSSQ7YJKWTF6V YYFTGVJNVAV3KI JA92XTLCLQ6IHGIRQGAC8H4A2PXEUQ94S9040QHLK CYM0QJNIJQP7KQQ1F01MVG2HAT5KD3M9IC86P1NR1UJ32JTHBJD9IS5O1RR802GS8ARYW3H48LDC3E','W42SSNQ9F82V4OINGFHH98LL57HWBQ0 D4P6L1PTJHEHG0IQCESB8GVJ3PJUKV XMIBFDMV7S5KCDWQFS179KB97OXQKS 476W7VIBR3E1JKLH1ERIOQGE5M2J8T0EOELV0W0HOWKQMIDC12FRG6NRRHG6IJPUMRGUL4ETOLHUFOGD3HUQ29FR235A9RXHS3F648PFNTGSTQ4YGC77BTLBTGECHR8VQ04525IV8WQYWF8U00NWBTHLI8HNIVO T','USLX2HAH61NG4IRX9M7NM60R16WYPL6MDJBTKC2IS67OL2AJWSJ4297DH92VM3756IHD7DSCUJF0PR7QEJTY6WSKHF KUTSWLYHJEHYUYIALB8Q8WOUPJRY7Y1QBSSBYK5PJQ4FNEKSTGQFI7 I9R49RIL4M3GM6RHEV0AH936RDA0ATSBFRQPNMFJ1DHUU9G9OC3JRUMSY94CP6SLAMESJVLF4NUIMLMWNY2VEF8 1PGKJGYNJJX8PFKR1U8JY','S1TP87B5RJFRGNTRVB7JVPKG0OB0B47GG2QS43C4P7GPQNS7QMOTFI0Q9PF84IKL2SVCBTOMMA7V7P3JN AGYUS4VOQUUB3I0ETSWBROQHOHEE4PT0OPM8KVE5TGN91 DT8D9QHOY7WP4HT59VHV0DKK6C6P06222ITB19DI0J KIXOOTEG2W4I9B6F3O2FASP9Q8DEEF600XROJ159DDFOFR560P3XL07CM0M30HI2W29EB97QQTHVX5I2RDLT','0X4NAIUJO9TQGFTRDH1YWVMW8 551DY6OJVW8US4PACTO1FGAG84AELN3JXWYNVV09W1U  S5XATNWHXOQDX8MBN1CEE84NNXHFYVWWCXQB0PALKO8UEWBQ4M0YN3BYVQR1TU61G8DL401FLL3M18VX6OAJ3IFFQWQ0B5 YPIPT9HONA5K5MYDXXC3OICBSF991HVA9MJP9YRD0P93FELIVAYJB55HQ0VBERYKKKCKP4C 7U56 2GOU57U1M923','75N9H IGKBSVQESHA9I5BDTEOOEE8DQJ8UAMS5CXQDH9WPH4FTA5LT 63MFKLEEST80D016J55 DBVK735GO394BLTEAFQSQSY5SR8RDLBG3N6Q3D98GWT0PRSQECR30FEO1IHW4DENAI1ORR1E8WYLSIYLUX4NUGSAHNVM 4N1VDAEM4 GUXDYJ7HPIMP XX3AEHR4NX4OTMXYOSIJ3S3DFNAIEQPRID2M67TQG8MD2MCMFERHV3D8H044HJLS');


-- -- xx_merechant_product
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (1,1,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (2,2,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (3,3,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (4,4,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (5,5,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (6,6,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (7,7,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (8,8,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (9,9,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (10,10,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (11,11,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (12,12,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (13,13,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (14,14,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (15,15,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (16,16,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (17,17,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (18,18,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (19,19,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');
-- insert  into `xx_merchant_product`(`id`,`system_product`,`merchant`,`stock`,`allocated_stock`,`price`,`create_date`,`modify_date`,`promotion_price`,`sn`,`introduction`,`market_price`,`member_price`,`image`) values (20,20,1,9,5,14.000000,'0001-01-01 00:00:15','0001-01-01 00:00:19',19.000000,'3HR 235Y5H9XS OT2SM3BGX65F8WBAOJ9BY 98Q7QDOKQF0G3WDADLLW3 R08Q7TLYTQ0IEO 9IPQ4AR92OO97 1SBY56OPUFNVWEXB6PR6HI6NN8J03NJIRWKK5XV1FROIIN31BHJWEY3OPAMQOBHV2SYD3IPF18B3V52JFGAU64 AEFM5W9DAPIOXD01I15YTJHI7NIQ4T7JSXAWFFK2B5OYUNP9CHHXUDAJRV3LPMKU086VM9I1XRO3IT2AE','CA2B99J97WSAVQSAE4WXYXPXH4LV A7YTPLBCNWIC31AO5 3H9LEDXB84RKE2ENUTFA7G 41 HFP1ULQEDL23RCRM64NT2RNOROQG183SEANPP6YE2FL3O3W1H48MCRQIL9NGOR87Q17RTRSILLQM8CH6GGO6BIW8GKKUYRIF54BJFYRGTM080GQOK2EIBDBHN60B4WAHV WNVVQUC6WQUB8WUYPVS6MR QETJ9G3U3P2Q51 CTS8NB1033USDE',0.000000,19.000000,'RLNKS5EFDEF5RQA0O2LVYW22Q1HJHG4 KSJBSS9QL1OE2N8RW B591718U24T8O89FVDWX01SUYRCIKIF9AG4EPS10TKLQ0LLG1U6QH4THKLWR7YFJ NB2P4YALF9RR885L9144THW QDOMR1O02 S UQTHVQ0BCSY9UBS3 GATKUA PBT7MO71U VNJ9UN8OPU6B86IB5U1RD5J5EFQBPY295GLIIF6DHFINQTAK8 L2JK3F5UDAEJD0IFTM Y');

-- -- xx_product
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (1,'0001-01-01 00:00:02','2013-07-22 16:12:08',10,16.000000,'test1[S]',7,'http://storage.shopxx.net/demo-image/3.0/201301/3dc28bfe-b4a7-4346-89a1-86b87d229faa-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'2013-07-10 09:01:58',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','1',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',1,'2013-07-10 09:01:58',0,'0001-01-01 00:00:11',12,1,18,1);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (2,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/94aa25f9-f3ef-4f7f-8c7c-197cd04b68ea-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','2',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,2);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (3,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','3',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,3);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (4,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','4',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,4);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (5,'0001-01-01 00:00:02','2013-07-22 16:12:08',6,16.000000,'test5[白色 M]',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','5',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,5);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (6,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','6',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,6);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (7,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','7',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,7);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (8,'0001-01-01 00:00:02','2013-06-27 17:40:32',5,16.000000,'test',7,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'2013-06-27 17:40:31',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','8',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',1,'2013-06-27 17:40:31',0,'0001-01-01 00:00:11',12,1,18,8);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (9,'0001-01-01 00:00:02','2013-07-22 16:29:17',7,16.000000,'test9[黄色 M]',8,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',2,'2013-07-22 16:29:17',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','9',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',1,'2013-07-22 16:29:17',0,'0001-01-01 00:00:11',12,1,18,9);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (10,'0001-01-01 00:00:02','2013-07-22 16:29:17',8,16.000000,'test10[黄色 S]',9,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',3,'2013-07-22 16:29:17',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','10',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',1,'2013-07-22 16:29:17',0,'0001-01-01 00:00:11',12,1,18,10);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (11,'0001-01-01 00:00:02','2013-07-04 10:38:22',8,16.000000,'test11[绿色 XL]',10,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',2,'2013-07-04 10:38:22',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','11',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',2,'2013-07-04 10:38:22',0,'0001-01-01 00:00:11',12,1,18,11);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (12,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','12',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,12);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (13,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','13',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,13);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (14,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','14',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,14);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (15,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/c0ce7a2f-1b1a-4fc6-b098-0dcb54400c9d-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','15',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,15);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (16,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','16',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,16);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (17,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','17',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,17);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (18,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','18',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,18);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (19,'0001-01-01 00:00:02','2013-07-19 16:45:50',5,16.000000,'test19[白色 L]',8,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',2,'2013-07-19 16:45:49',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0.923077,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','19',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',2,'2013-07-19 16:45:49',0,'0001-01-01 00:00:11',12,1,18,19);
-- insert  into `xx_product`(`id`,`create_date`,`modify_date`,`allocated_stock`,`cost`,`full_name`,`hits`,`image`,`introduction`,`is_gift`,`is_list`,`is_marketable`,`is_top`,`keyword`,`market_price`,`memo`,`month_hits`,`month_hits_date`,`month_sales`,`month_sales_date`,`name`,`point`,`price`,`sales`,`score`,`score_count`,`seo_description`,`seo_keywords`,`seo_title`,`sn`,`stock`,`stock_memo`,`total_score`,`unit`,`week_hits`,`week_hits_date`,`week_sales`,`week_sales_date`,`weight`,`shop`,`goods`,`merchant_product`) values (20,'0001-01-01 00:00:02','0001-01-01 00:00:14',5,16.000000,'test',6,'http://storage.shopxx.net/demo-image/3.0/201301/a8db4410-05e5-4dfa-8217-eb885a104af3-thumbnail.jpg','D4FJOKI6YOOPCP1UGHO6AUXNRB O04O6K2 Y6VA9NY1RKKJ7Q6XWVVRWX98KTOO3S07M7ICU4565CR419DT0AD244GRKMD0VPB4ORP8CCICI51QUMN TSYA8RVU0LUY2SOXOAF886QWYW0W99S88  I76SYTDKDAI21SLHA EPE5WYVWKXJNWMH2LSPCYQS76Q PWFY5QLJ8T2HEUFY1 VLT5NULPFEF16DLVKH8QW4XT89GAYRT1EXLXHB0IE2','\0','','','','7FM8U3NMIVLRG M99SN WYAEGFTXLWAGL9WVHVBI6FJDQNR3ORPH8N6S9J 2IYB96LF8DGU8JJ 16YGK3YM PN0P9X33NKWUYK6OT7AM6NRHQATOWFDY6K5FTLFF3UV2P92R927DDAMSIMD33CS3OMA10I6Q HEJRVUEBFKY  7ATB EFUKFEHLCMTE PP4N4J8QPANLLA1K0F U76EAOFL  I5GQ81NIIU7E589EULIQF4JGIT9 69B6QAMREM',12.000000,'3Q 03K48SQT DP0KV5TQGQAPJBVR8JSGPUUYA62K0TL1063JHSCV7557R739J7PTVP198VKTWTBHVN28UDQKCFEMNJMKV32RAK Y74EV2YG4VQEGTDQLNHIYLBVT6OHO54VNHDMPQVAEWWV5WPYHX55ALV TDGX35HPPEVMIMOUEXJID2MRC08DV5 WYEQJNK481AU1N0U VW OEUVB QCE38UCBASU55X AIESKN7A9WEYL9JJV01UJG0TO2TK',1,'0001-01-01 00:00:09',0,'0001-01-01 00:00:09','0C2NCWTBDH8TCKV8H6537YC U8 8OD1KKJB A5IRTXB8NBXNBUBV6VYYWA36JS JCVQYOR3V3093L5N6F0L2G3MTDUJRQU3O49Y JV649S V3MNCDBIF3U1IK6N6OKLP8XC6XON1WS7N17QUAQDB65A8C0JFTT DIL38W5OC4XF6EA2LRM7TR O93H32MH0OED6IK9RVJJWX75 NXUWL 8S0O4YDL9QOQQA33TLOCDPXF 94IJ120PK4KTL79TG',11,4.000000,19,0,13,'3WU0KI34H7BQVXV0EP07P6TRVPUQ1BB8AINWW7G8H3Q2GH3O NEOCNVY8ON3V0KA1O48MCJD5IVH4T20WGMMF180 NU619HYFF7C0IOLP5VQU9 KQMAHXO58B9QAUJMNKS5SQR3ICK7R3KWK3LBUEBQNI2VX TFEIOH63HRJBBKMXVKXLRVFT1VYSK5RTH2WFV1CXJFMXT JVQL3XDE3TF5FG2QK59HHJ5W9J6MEFDRX35ABRMMYGE11UW0CBBG','JFYX81DRSN8LT2DBPH MUHUHVW22RLM03CK32G4789C4GWWT37A50DJXLS49R4G TWW7WG2TJ 2 P1S3DHAV2DHLNEPAKJPSUWUS9RFEM9EF0GG9JLB L J6D4OH71XX056QTMPH4H70 MO59VL0C7 2NFYMVC5ORHN6FRWFA7CLCLOGSOBO8JHI3VAMUSQ28STK2HFB0WGA W0K2EI3C14IXWBRM6JW7 7JUM02U47G MQQRI6LUBEV14MLTTQ','N8Y5UNMNPSFT3VH0FRV26AF53XBGS4REH21NRRHH3IPPNB8PTV4WIM16F1NFX0D2G BA1D14W0BAOEQ9F H9TU17DK19TX5C1W8Y9XDR 0HADWU9SR4V BDHBIT F5HGSAOCQVETDPS6IMEJKFLBNI MVCTIF1MVG4VVCN X8V77KG38LRWW1XOES27I1YPE0YKQOSW3VR6FP9ISU2ER326 Y9MDAAS3GUR 0RSLS6HONX6WH4VRCH1QGY2CRGU','20',11,'LA8SEYUL 2GQK9FAWAM67SAIUW0 Y4RWUODJD UR6EOU6WG8MWYQMSAQFC6G0UEDQNC23G7KUXRA4FCW A54A00RNHCW4A KSRM99Q6Q82NDUM0Y6Y 8RX8J23C39XF  GC CF2F1 1CRLGMX5X IBVIHRMV8HTIPU86TGFDCO8J5NTL8W2B 81N8UE0SXFOPVRT11VSNW7A8HG4M267G0YI0JEEMJOH4A W9M9IV7J04 V1YANO5903XQ3Y9W3',12,'BHPJ4E5SNEN54JBKK8UMMMGDNJ568 05P295QPK51DA7QIG N00YEC04O9GFLHB VPKUT6US944GJ6HXWDFKCOB3TKMGMWVR 3NXWFEOI5QAT21LTVM3O9IY5BAKODNX PJIS949TOTW1VBNRS45V0CVL04XH53BMK9MMLKB0I1H3E34WYJ9MV1CUUWNYM76EEY8SHO4N871 OMH2YIS01EBENBRBFJ5LKR8X6093X0L4UPJ  M3CSP2GW55384',8,'0001-01-01 00:00:18',0,'0001-01-01 00:00:11',12,1,18,20);

-- xx_product_display_category
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (1,NULL,1,'0001-01-01 00:00:04','0001-01-01 00:00:11','出租装',NULL,NULL,NULL,0,',',NULL,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (2,NULL,1,'0001-01-01 00:00:04','0001-01-01 00:00:11','演出服',NULL,NULL,NULL,1,',1,',1,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (3,12,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','表演服',NULL,NULL,NULL,1,',1,',1,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (4,13,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test1',NULL,NULL,NULL,1,',1,',1,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (5,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','TEST一',NULL,NULL,NULL,0,',',NULL,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (6,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (8,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (9,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (10,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (11,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (12,NULL,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16',NULL,NULL,NULL,1,',5,',5,'\0');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (15,22,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11_1',NULL,NULL,NULL,2,',5,6,',6,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (16,21,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11_2',NULL,NULL,NULL,2,',5,6,',6,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (17,31,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11_3',NULL,NULL,NULL,2,',5,6,',6,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (18,25,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11_4',NULL,NULL,NULL,2,',5,6,',6,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (19,26,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test11_5',NULL,NULL,NULL,2,',5,6,',6,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (20,11,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12_1',NULL,NULL,NULL,2,',5,8,',8,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (21,33,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12_2',NULL,NULL,NULL,2,',5,8,',8,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (22,34,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12_3',NULL,NULL,NULL,2,',5,8,',8,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (23,35,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12_4',NULL,NULL,NULL,2,',5,8,',8,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (24,36,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test12_5',NULL,NULL,NULL,2,',5,8,',8,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (25,42,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13_1',NULL,NULL,NULL,2,',5,9,',9,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (26,43,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13_2',NULL,NULL,NULL,2,',5,9,',9,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (27,44,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13_3',NULL,NULL,NULL,2,',5,9,',9,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (28,45,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13_4',NULL,NULL,NULL,2,',5,9,',9,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (29,46,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test13_5',NULL,NULL,NULL,2,',5,9,',9,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (30,52,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14_1',NULL,NULL,NULL,2,',5,10,',10,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (31,53,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14_2',NULL,NULL,NULL,2,',5,10,',10,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (32,54,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14_3',NULL,NULL,NULL,2,',5,10,',10,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (33,55,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14_4',NULL,NULL,NULL,2,',5,10,',10,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (34,56,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test14_5',NULL,NULL,NULL,2,',5,10,',10,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (35,62,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15_1',NULL,NULL,NULL,2,',5,11,',11,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (36,63,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15_2',NULL,NULL,NULL,2,',5,11,',11,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (37,64,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15_3',NULL,NULL,NULL,2,',5,11,',11,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (38,65,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15_4',NULL,NULL,NULL,2,',5,11,',11,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (39,66,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test15_5',NULL,NULL,NULL,2,',5,11,',11,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (40,72,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16_1',NULL,NULL,NULL,2,',5,12,',12,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (41,73,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16_2',NULL,NULL,NULL,2,',5,12,',12,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (42,74,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16_3',NULL,NULL,NULL,2,',5,12,',12,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (43,75,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16_4',NULL,NULL,NULL,2,',5,12,',12,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (44,76,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','test16_5',NULL,NULL,NULL,2,',5,12,',12,'');
-- insert  into `xx_product_display_category`(`id`,`product_category`,`merchant_category`,`create_date`,`modify_date`,`name`,`seo_description`,`seo_keywords`,`seo_title`,`grade`,`tree_path`,`parent`,`is_leaf`) values (109,14,1,'2013-07-05 00:00:00','2013-07-05 00:00:00','关羽服',NULL,NULL,NULL,2,',1,2,',2,'');

-- -- xx_product_tag
-- insert  into `xx_product_tag`(`products`,`tags`) values (1,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (4,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (8,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (9,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (10,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (11,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (12,1);
-- insert  into `xx_product_tag`(`products`,`tags`) values (2,2);
-- insert  into `xx_product_tag`(`products`,`tags`) values (9,2);
-- insert  into `xx_product_tag`(`products`,`tags`) values (10,2);
-- insert  into `xx_product_tag`(`products`,`tags`) values (11,2);
-- insert  into `xx_product_tag`(`products`,`tags`) values (12,2);
-- insert  into `xx_product_tag`(`products`,`tags`) values (13,2);

-- xx_merchant_admin role
insert into `xx_merchant_admin`(`id`,`merchant`,`create_date`,`modify_date`,`username`,`password`,`name`,`login_ip`,`login_failure_count`,`login_date`,`locked_date`,`is_locked`,`is_enabled`,`is_system`,`email`,`department`) values (4,1,'2013-07-10 14:15:40','2013-07-10 14:15:40','test','21232f297a57a5a743894a0e4a801fc3',null,null,1,null,null,0,1,1,'test',null);
insert into `xx_merchant_role`(`id`,`merchant`,`name`,`is_system`,`description`,`modify_date`,`create_date`) values (1,1,'test_role',1,null,'2013-07-12 00:00:00','2013-07-12 00:00:00');
insert into `xx_merchant_admin_role`(`merchant_admins`,`merchant_roles`) values (4,1);
insert into `xx_merchant_role_authority`(`merchant_role`,`authorities`) values (1,'madmin:merchantProduct')
, (1,'madmin:shop')
, (1,'madmin:shopProduct')
, (1,'madmin:order')
, (1,'madmin:payment')
, (1,"madmin:refunds")
, (1,"madmin:shipping")
, (1,'madmin:admin')
, (1,'madmin:role');

insert  into `xx_delivery_area`(`areas`,`shops`) values (1,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (2,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (3,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (4,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (5,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (18,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (19,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (20,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (21,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (35,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (36,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (37,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (38,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (39,1);
insert  into `xx_delivery_area`(`areas`,`shops`) values (40,1);

update xx_merchant_product set sn="12", is_exist = true;
update xx_system_product set barcode="a1234", full_name="full_name";
