
-- 顾客表
create table BS_CUSTOMER(
  CUSTOMER_ID   NUMBER(8) primary key,
  CUSTOMER_NAME VARCHAR2(32) not null,
  CUSTOMER_SEX  VARCHAR2(8) not null,
  ID_CARD       VARCHAR2(32) not null,
  PHONE_NUMBER  VARCHAR2(32) not null,
  CREATE_DATE   DATE not null,
  state         VARCHAR2(1) not null,
  remarks       VARCHAR2(255)
);

create sequence BS_CUSTOMER$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;


-- 房间表
create table BS_ROOM(
  ROOM_ID       NUMBER(8) primary key,
  ROOM_NUMBER   NUMBER(8) not null,
  ROOM_TYPE     NUMBER(8) not null,
  ROOM_STATE    VARCHAR2(1) not null,
  state         VARCHAR2(1) not null,
  remarks       VARCHAR2(255)
);

create sequence BS_ROOM$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 房间类型表
create table BS_ROOM_TYPE(
  ROOM_TYPE_ID       NUMBER(8) primary key,
  ROOM_TYPE_NAME     VARCHAR2(32) not null,
  ROOM_TYPE_PRICE    NUMBER(8) not null,
  ROOM_TYPE_DEPOSIT  NUMBER(8) not null,
  state              VARCHAR2(1) not null,
  remarks            VARCHAR2(255)
);

create sequence BS_ROOM_TYPE$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 预订
create table BS_BOOK(
  BOOK_ID         NUMBER(8) primary key,
  CUSTOMER_ID     NUMBER(8) not null,
  BOOK_NAME       VARCHAR2(32) not null,
  PHONE_NUMBER    VARCHAR2(32) not null,
  CREATE_DATE     DATE not null,
  CHECKIN_DATE    DATE not null,
  CHECKOUT_DATE   DATE not null,
  PEOPLE_NUMBER   NUMBER(8) not null,
  OTHER_MEMBER_ID VARCHAR2(256),
  OPERATE_NAME    VARCHAR2(32) not null,
  BOOK_STATE      VARCHAR2(1) not null,
  state           VARCHAR2(1) not null,
  remarks         VARCHAR2(255)
);

create sequence BS_BOOK$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 预订房间表
create table BS_BOOK_ROOM(
  BOOK_ROOM_ID  NUMBER(8) primary key,
  BOOK_ID       NUMBER(8) not null,
  ROOM_NUMBER   NUMBER(8) not null,
  CHECKIN_DATE  DATE  not null,
  CHECKOUT_DATE DATE  not null,
  BOOK_STATE    VARCHAR2(1)  not null,
  OPERATE_NAME  VARCHAR2(32)  not null,
  state         VARCHAR2(1)  not null,
  remarks       VARCHAR2(255)
);

create sequence BS_BOOK_ROOM$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 订单表
create table BS_ORDER(
  ORDER_ID      NUMBER(8) primary key,
  CUSTOMER_ID   NUMBER(8) not null,
  CUSTOMER_NAME VARCHAR2(32) not null,
  CREATE_DATE   DATE not null,
  CHECKIN_DATE  DATE not null,
  CHECKOUT_DATE DATE not null,
  ROOM_COUNT    VARCHAR2(8) not null,
  PEOPLE_COUNT  VARCHAR2(8) not null,
  CHECKOUT      VARCHAR2(1) not null,
  OTHER_MEMBER  VARCHAR2(256),
  OPERATE_NAME  VARCHAR2(32) not null,
  state         VARCHAR2(1) not null,
  remarks       VARCHAR2(255)
);

create sequence BS_ORDER$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 房间订单表
create table BS_ORDER_ROOM(
  ORDER_ROOM_ID     NUMBER(8) primary key,
  ORDER_ID          NUMBER(8) not null,
  ROOM_NUMBER       NUMBER(8) not null,
  CHECKIN_DATE      DATE not null,
  CHECKOUT_DATE     DATE not null,
  GUARANTEE_DEPOSIT NUMBER(8) not null,
  PAYMENG           VARCHAR2(1) not null,
  EXPENDITURE       NUMBER(8) not null,
  OPERATE_NAME      VARCHAR2(32) not null,
  state             VARCHAR2(1) not null,
  remarks           VARCHAR2(255)
);

create sequence BS_ORDER_ROOM$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 退房表
create table BS_CHECKOUT(
  CHECKOUT_ID           NUMBER(8) primary key,
  ORDER_ID              NUMBER(8) not null,
  GUARANTEE_DEPOSIT_ALL NUMBER(8) not null,
  EXPENDITURE_ALL       NUMBER(8) not null,
  PAYMENT_AMOUNT        NUMBER(8) not null,
  NONPAYMENT_AMOUNT     NUMBER(8) not null,
  CREATE_DATE           DATE not null,
  OPERATE_NAME          VARCHAR2(32) not null,
  state                 VARCHAR2(1) not null,
  remarks               VARCHAR2(255)
);

create sequence BS_CHECKOUT$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 员工表
create table BS_STAFF(
  staff_id   NUMBER(8) not null,
  staff_name VARCHAR2(32) not null,
  staff_sex  VARCHAR2(8),
  staff_tel  VARCHAR2(32) not null,
  staff_addr VARCHAR2(256),
  staff_pwd  VARCHAR2(32) not null,
  state      VARCHAR2(1),
  remarks    VARCHAR2(255)
);

create sequence BS_STAFF$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 角色表
create table BS_ROLE(
  role_id   NUMBER(8) not null,
  role_name VARCHAR2(256) not null,
  role_desc VARCHAR2(256),
  state     VARCHAR2(1),
  remarks   VARCHAR2(256)
);

create sequence BS_ROLE$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 员工角色表
create table BS_STAFF_ROLE(
  staff_role_id NUMBER(8) not null,
  staff_id      NUMBER(8) not null,
  role_id       NUMBER(8) not null,
  state         VARCHAR2(1),
  remarks       VARCHAR2(255)
);

create sequence BS_STAFF_ROLE$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 菜单表
create table BS_MENU(
  menu_id        NUMBER(8) not null,
  menu_code      VARCHAR2(256),
  menu_name      VARCHAR2(50) not null,
  menu_type		 VARCHAR2(1) not null,
  menu_parent_id NUMBER(8) not null,
  state          VARCHAR2(1),
  remarks        VARCHAR2(255)
);

create sequence BS_MENU$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 角色菜单表
create table BS_ROLE_MENU(
  role_menu_id   NUMBER(8) not null,
  role_id        NUMBER(8) not null,
  menu_id        NUMBER(8) not null,
  state          VARCHAR2(1),
  remarks        VARCHAR2(255)
);

create sequence BS_ROLE_MENU$SEQ
minvalue 100
maxvalue 99999999
start with 100
increment by 1
cache 200;

-- 错误码
create table BS_ERROE_CODE(
  RES_KEY     VARCHAR2(20) primary key,
  ZH_CN       VARCHAR2(255) not null,
  STATE       VARCHAR2(1) not null,
  REMARKS     VARCHAR2(20) not null
);




-- 员工
insert into bs_staff (STAFF_ID, STAFF_NAME, STAFF_SEX, STAFF_TEL, STAFF_ADDR, STAFF_PWD, STATE, REMARKS)
values (1, 'admin', '男', '15512345678', 'hhxy', '123456', 'U', null);

insert into bs_staff (STAFF_ID, STAFF_NAME, STAFF_SEX, STAFF_TEL, STAFF_ADDR, STAFF_PWD, STATE, REMARKS)
values (2, 'qindb', '男', '15812345678', 'hhxy', '123456', 'U', null);

-- 角色
insert into bs_role (ROLE_ID, ROLE_NAME, ROLE_DESC, STATE, REMARKS)
values (1, 'admin', '管理员', 'U', '管理员权限');

insert into bs_role (ROLE_ID, ROLE_NAME, ROLE_DESC, STATE, REMARKS)
values (2, '普通用户', '普通用户', 'U', '普通用户');

-- 员工角色
insert into bs_staff_role (STAFF_ROLE_ID, STAFF_ID, ROLE_ID, STATE, REMARKS)
values (1, 1, 1, 'U', null);

insert into bs_staff_role (STAFF_ROLE_ID, STAFF_ID, ROLE_ID, STATE, REMARKS)
values (2, 2, 2, 'U', null);

-- 菜单
insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (1, 'safeManage', '权限管理', 'M', 0, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (2, 'staff', '用户管理', 'I', 1, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (3, 'role', '角色管理', 'I', 1, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (4, 'menu', '菜单管理', 'I', 1, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (5, 'roomManagement', '房间管理', 'M', 0, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (6, 'room', '房间设置', 'I', 5, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (7, 'roomType', '房间类型设置', 'I', 5, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (8, 'registrationManagement', '住宿管理', 'M', 0, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (9, 'usableRoom', '房间查询', 'I', 8, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (10, 'customer', '顾客登记', 'I', 8, 'U', null);

insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (11, 'book', '预订管理', 'I', 8, 'U', null);
 
insert into bs_menu (MENU_ID, MENU_CODE, MENU_NAME, MENU_TYPE, MENU_PARENT_ID, STATE, REMARKS)
values (12, 'order', '订单管理', 'I', 8, 'U', null);


-- 角色菜单
insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (1, 1, 1, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (2, 1, 2, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (3, 1, 3, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (4, 1, 4, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (5, 1, 5, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (6, 1, 6, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (7, 1, 7, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (8, 1, 8, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (9, 1, 9, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (10, 1, 10, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (11, 1, 11, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (12, 1, 12, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (13, 2, 8, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (14, 2, 9, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (15, 2, 10, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (16, 2, 11, 'U', null);

insert into bs_role_menu (ROLE_MENU_ID, ROLE_ID, MENU_ID, STATE, REMARKS)
values (17, 2, 12, 'U', null);

-- 房间类型
insert into bs_room_type (ROOM_TYPE_ID, ROOM_TYPE_NAME, ROOM_TYPE_PRICE, ROOM_TYPE_DEPOSIT, STATE, REMARKS)
values (3, '单人间', 100, 50, 'U', null);

insert into bs_room_type (ROOM_TYPE_ID, ROOM_TYPE_NAME, ROOM_TYPE_PRICE, ROOM_TYPE_DEPOSIT, STATE, REMARKS)
values (4, '双人间', 150, 100, 'U', null);

insert into bs_room_type (ROOM_TYPE_ID, ROOM_TYPE_NAME, ROOM_TYPE_PRICE, ROOM_TYPE_DEPOSIT, STATE, REMARKS)
values (5, '三人间', 200, 150, 'U', null);

-- 房间
insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (7, 101, 3, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (8, 102, 3, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (9, 103, 3, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (10, 201, 4, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (11, 202, 4, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (12, 203, 4, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (13, 301, 5, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (14, 302, 5, '1', 'U', null);

insert into bs_room (ROOM_ID, ROOM_NUMBER, ROOM_TYPE, ROOM_STATE, STATE, REMARKS)
values (15, 303, 5, '1', 'U', null);


-- 错误码
insert into bs_error_code (RES_KEY, ZH_CN, STATE, REMARKS)
values ('PYS0100301', '传入数据为空!', 'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100302', '保存失败!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100303', '修改失败!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100304', '删除失败!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100305', '传入数据不符合规范!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100307', '删除数据不存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100308', '数据未更改!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100309', '重置密码失败!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100310', '密码修改失败!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100311', '原密码不正确!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100312', '名称已存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100313', '编码已存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100314', '编码和名称已存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100315', '排序值已存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100316', '参数值已存在!',  'U', 'qindb');

insert into bs_error_code (RES_KEY, ZH_CN,  STATE, REMARKS)
values ('PYS0100317', '参数编号已存在!',  'U', 'qindb');

insert into bs_error_code(RES_KEY, ZH_CN, STATE, REMARKS)
values ('PYS0100318', '权限不足!', 'U', 'qindb');

insert into bs_error_code(RES_KEY, ZH_CN, STATE, REMARKS)
values ('PYS0100320', '会话失效!', 'U', 'qindb');

insert into bs_error_code(RES_KEY, ZH_CN, STATE, REMARKS)
values ('PYS0100321', '用户名不存在!', 'U', 'qindb');

insert into bs_error_code(RES_KEY, ZH_CN, STATE, REMARKS)
values ('PYS0100322', '密码不正确!', 'U', 'qindb');

