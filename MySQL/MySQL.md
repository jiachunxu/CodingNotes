# MySQL

[MySQL8 下载地址](https://dev.mysql.com/downloads/windows/installer/8.0.html)

## 数据库基本概念

### 数据库

> 数据库（ Database，DB ）指的是以一定格式存放、能够实现多个用户共享、与应用程序彼此独立的数据集合。

### 数据库管理系统

> 数据库管理系统（Database Management System, DBMS）是用来定义和管理数据的软件。
>
> 如何科学的组织和存储数据，如何高效的获取和维护数据，如何保证数据的安全性和完整性，这些都需要靠数据库管理系统完成。
>
> 目前，比较流行的数据库管理系统有：Oracle、MySQL、SQL、Server、DB2 等。

### 数据库应用程序

> 数据库应用程序（Database Application System，DBAS）是在数据库管理系统基础上，使用数据库管理系统的语法，开发的直接面对最终用户的应用程序

### 数据库管理员

> 数据库管理员（ Database Administrator，DBA）是指对数据库管理系统进行操作的人员，其主要负责数据库的运营和维护。

### 最终用户

> 最终用户（ User ）指的是数据库应用程序的使用者。用户面向的是数据库应用程序（通过应用程序操作数据），并不会直接与数据库打交道。

### 数据库系统

> 数据库系统（ Database System，DBS ）一般是由数据库、数据库管理系统、数据库应用程序、数据库管理员和最终用户构成。
> 其中 DBMS 是数据库系统的基础和核心。

## 数据库类型

### 关系型数据库

> 关系型数据库模型是将复杂的数据结构用较为简单的二元关系（二维表）来表示。
> 在该类型数据库中，对数据的操作基本上都建立在一个或多个表格上，我们可以采用结构化查询语言（SQL）对数据库进行操作。
> 关系型数据库是目前主流的数据库技术，其中具有代表性的数据库管理系统有：Oracle、DB2、SQL、Server、MySQL 等。

> **PS**：关系=二维表

### 非关系型数据库 ( NOSQL )

> NOSQL（Not Only SQL）泛指非关系型数据库。
> 关系型数据库在超大规模和高并发的web2.0纯动态网站已经显得力不从心，暴露了很多难以克服的问题。
> NOSQL数据库的产生就是为了解决大规模数据集合多重数据种类带来的挑战，尤其是大数据应用难题。
> 常见的非关系型数据库管理系统有 Memcached、MongoDB，redis，HBase 等。

## MySQL 表的完整性约束

> 为防止不符合规范的数据存入数据库，在用户对数据进行插入、修改、删除等操作时，
>
> MySQL 提供了一种机制来检查数据库中的数据是否满足规定的条件，以保证数据库中数据的准确性和一致性，这种机制就是完整性约束。
>
> MySQL 中主要支持以下几种种完整性约束，如表所示。 其中 Check 约束是 MySQL8 中提供的支持

| 约束条件           | 约束描述                   |
|----------------|------------------------|
| PRIMARY KEY    | 主键约束，约束字段的值可唯一地标识对应的记录 |
| NOT NULL       | 非空约束，约束字段的值不能为空        |
| UNIQUE         | 唯一约束，约束字段的值是唯一的        |
| CHECK          | 检查约束，限制某个字段的取值范围       |
| DEFAULT        | 默认值约束，约束字段的默认值         |
| AUTO_INCREMENT | 自动增加约束，约束字段的值自动递增      |
| FOREIGN KEY    | 外键约束，约束表与表之间的关系        |

### 约束分类 (作用上)

- 表级约束
  - 可以约束表中任意一个或多个字段。与列定义相互独立，不包含在列定义中；与定义用‘，’分隔；必须指出要约束的列的名称；
- 列级约束
  - 包含在列定义中，直接跟在该列的其它定义之后 ，用空格分隔；不必指定列名；

### 主键约束

> 主键约束( PRIMARY KEY，缩写 PK ),其作用是约束表中的某个字段可以唯一标识一条记录。使用主键约束可以快速查找表中的记录。
>
> 设置为主键的字段取值不能重复(唯一)，也不能为空(非空)，否则无法唯一标识一条记录。
>
> 主键可以是单个字段，也可以是多个字段组合。对于单字段主键的添加可使用表级约束，也可以使用列级约束；而对于多字段主键的添加只能使用表级约束。

### 非空约束

> 非空约束( NOT NULL，缩写 NK )规定了一张表中指定的某个字段的值不能为空 ( NULL )。
>
> 设置了非空约束的字段，在插入的数据为 NULL 时，数据库会提示错误，导致数据无法插入。
>
> 无论是单个字段还是多个字段非空约束的添加只能使用列级约束 ( 非空约束无表级约束 )

- 为已存在表中的字段添加非空约束

``` mysql
alter table student8 modify stu_sex varchar(1) not null;
```

- 使用 ALTER TABLE 语句删除非空约束

``` mysql
alter table student8 modify stu_sex varchar(1) null;
```

### 唯一约束

> 唯一约束（ UNIQUE, 缩写 UK ）规定了一张表中指定的某个字段的值不能重复。
>
> 无论单个字段还是多个字段唯一约束的添加均可使用列级约束和表级约束

### 检查约束

> 检查约束（ CHECK ）用来限制某个字段的取值范围，可以定义为列级约束，也可以定义为表级约束。MySQL8 开始支持检查约束。

### 默认值约束

> 默认值约束（ DEFAULT ）用来规定字段的默认值。如果某个被设置为 DEFAULT 约束的字段没插入具体值，那么该字段的值将会被默认值填充。
>
> 默认值约束的设置与非空约束一样，也只能使用列级约束。

### 字段值自动增加约束

> 自增约束（ AUTO_INCREMENT ）可以使表中某个字段的值自动增加。一张表中只能有**一个**
> 自增长字段，并且该字段必须定义了约束（该约束可以是主键约束、唯一约束以及外键约束），
> 如果自增字段没有定义约束，数据库则会提示“Incorrect table definition; there can be only one auto column and it must be
> defined as a key”错误。
>
> 由于自增约束会自动生成唯一的ID，所以自增约束通常会配合主键使用，并且只适用于整数类型。一般情况下，设置为自增约束字段的值会从1开始，每增加一条记录，该字段的值加1。
>
> 如果主键没有设定值，或者用null.default都可以完成主键自增的效果

- 为已存在表中的字段添加自增约束

``` mysql
/* 创建表 student11 */
 create table student11 (
   stu_id int(10) primary key,
   stu_name varchar(3),
   stu_sex varchar (1)
);
/* 为 student11 表中的主键字段添加自增约束 */
alter table student11 modify stu_id int(10) auto_increment;
```

- 使用ALTER TABLE语句删除自增约束

``` mysql
alter table studen11 modify stu_id int(10);
```

## 非外键约束

``` mysql
/*
建立一张用来存储学生信息的表
字段包含学号、姓名、性别，年龄、入学日期、班级，email等信息
约束：
建立一张用来存储学生信息的表
字段包含学号、姓名、性别，年龄、入学日期、班级，email等信息
【1】学号是主键 = 不能为空 +  唯一 ，主键的作用：可以通过主键查到唯一的一条记录【2】如果主键是整数类型，那么需要自增
【3】姓名不能为空
【4】Email唯一
【5】性别默认值是男
【6】性别只能是男女
【7】年龄只能在18-50之间
*/
-- 创建数据库表：
create table t_student(
        sno int(6) primary key auto_increment, 
        sname varchar(5) not null, 
        sex char(1) default '男' check(sex='男' || sex='女'),
        age int(3) check(age>=18 and age<=50),
        enterdate date,
        classname varchar(10),
        email varchar(15) unique
);
-- 添加数据：
--  1048 - Column 'sname' cannot be null 不能为null
-- 3819 - Check constraint 't_student_chk_1' is violated. 违反检查约束

insert into t_student values (1,'张三','男',21,'2023-9-1','java01班','zs@126.com');

-- 1062 - Duplicate entry '1' for key 't_student.PRIMARY' 主键重复
-- 1062 - Duplicate entry 'ls@126.com' for key 't_student.email' 违反唯一约束

insert into t_student values (2,'李四','男',21,'2023-9-1','java01班','ls@126.com');
insert into t_student values (3,'露露','男',21,'2023-9-1','java01班','ls@126.com');
-- 如果主键没有设定值，或者用null.default都可以完成主键自增的效果
insert into t_student (sname,enterdate) values ('菲菲','2029-4-5');
insert into t_student values (null,'小明','男',21,'2023-9-1','java01班','xm@126.com');
insert into t_student values (default,'小刚','男',21,'2023-9-1','java01班','xg@126.com');
-- 如果sql报错，可能主键就浪费了，后续插入的主键是不连号的，我们主键也不要求连号的
insert into t_student values (null,'小明','男',21,'2023-9-1','java01班','oo@126.com');
-- 查看数据：
select * from t_student;


-- 删除表：
drop table t_student;
-- 创建数据库表：
create table t_student(
        sno int(6) auto_increment, 
        sname varchar(5) not null, 
        sex char(1) default '男',
        age int(3),
        enterdate date,
        classname varchar(10),
        email varchar(15),
        constraint pk_stu primary key (sno),  -- pk_stu 主键约束的名字
        constraint ck_stu_sex check (sex = '男' || sex = '女'),
        constraint ck_stu_age check (age >= 18 and age <= 50),
        constraint uq_stu_email unique (email)
);
-- 添加数据：
insert into t_student values (1,'张三','男',21,'2023-9-1','java01班','zs@126.com');
-- > 3819 - Check constraint 'ck_stu_sex' is violated.
-- > 3819 - Check constraint 'ck_stu_age' is violated.
-- > 1062 - Duplicate entry 'zs@126.com' for key 't_student.uq_stu_email'
insert into t_student values (3,'李四','男',21,'2023-9-1','java01班','zs@126.com');
-- 查看数据：
select * from t_student;


-- 在创建表以后添加约束


-- 删除表：
drop table t_student;
-- 创建数据库表：
create table t_student(
        sno int(6), 
        sname varchar(5) not null, 
        sex char(1) default '男',
        age int(3),
        enterdate date,
        classname varchar(10),
        email varchar(15)
);
-- > 1075 - Incorrect table definition; there can be only one auto column and it must be defined as a key
-- 错误的解决办法：就是auto_increment去掉
-- 在创建表以后添加约束：
alter table t_student add constraint pk_stu primary key (sno) ; -- 主键约束
alter table t_student modify sno int(6) auto_increment; -- 修改自增条件
alter table t_student add constraint ck_stu_sex check (sex = '男' || sex = '女');
alter table t_student add constraint ck_stu_age check (age >= 18 and age <= 50);
alter table t_student add constraint uq_stu_email unique (email);
-- 查看表结构：
desc t_student;

```

## 外键约束

> 外键约束（ FOREIGN KEY，缩写FK）是用来实现数据库表的参照完整性的。
>
> 外键约束可以使两张表紧密的结合起来，特别是针对修改或者删除的级联操作时，会保证数据的完整性。

``` mysql
-- 先创建父表：班级表：
create table t_class(
        cno int(4) primary key auto_increment,
        cname varchar(10) not null,
        room char(4)
)
-- 添加班级数据：
insert into t_class values (null,'java001','r803');
insert into t_class values (null,'java002','r416');
insert into t_class values (null,'大数据001','r103');
-- 可以一次性添加多条记录：
insert into t_class values (null,'java001','r803'),(null,'java002','r416'),(null,'大数据001','r103');
-- 查询班级表：
select * from t_class;
-- 学生表删除：
drop table t_student;
-- 创建子表,学生表：
create table t_student(
        sno int(6) primary key auto_increment, 
        sname varchar(5) not null, 
        classno int(4)  -- 取值参考t_class表中的cno字段，不要求字段名字完全重复，但是类型长度定义 尽量要求相同。
);
-- 添加学生信息：
insert into t_student values (null,'张三',1),(null,'李四',1),(null,'王五',2);
-- 查看学生表：
select * from t_student;
-- 出现问题：
-- 1.添加一个学生对应的班级编码为4：
insert into t_student values (null,'丽丽',4);
-- 2.删除班级2：
delete from t_class where cno = 2;
-- 出现问题的原因：
-- 因为你现在的外键约束，没用语法添加进去，现在只是逻辑上认为班级编号是外键，没有从语法上定义
-- 解决办法，添加外键约束：
-- 注意：外键约束只有表级约束，没有列级约束：
create table t_student(
        sno int(6) primary key auto_increment, 
        sname varchar(5) not null, 
        classno int(4),-- 取值参考t_class表中的cno字段，不要求字段名字完全重复，但是类型长度定义 尽量要求相同。
                                constraint fk_stu_classno foreign key (classno) references t_class (cno)
);
create table t_student(
        sno int(6) primary key auto_increment, 
        sname varchar(5) not null, 
        classno int(4)
);
-- 在创建表以后添加外键约束：
alter table t_student add constraint fk_stu_classno foreign key (classno) references t_class (cno)
-- 上面的两个问题都解决了：
-- 添加学生信息：
-- > 1452 - Cannot add or update a child row: a foreign key constraint fails (`mytestdb`.`t_student`, CONSTRAINT `fk_stu_classno` FOREIGN KEY (`classno`) REFERENCES `t_class` (`cno`))
insert into t_student values (null,'张三',1),(null,'李四',1),(null,'王五',2);
-- 删除班级1：
-- 2.删除班级2：
insert into t_student values (null,'张三',3),(null,'李四',3),(null,'王五',3);
-- > 1451 - Cannot delete or update a parent row: a foreign key constraint fails (`mytestdb`.`t_student`, CONSTRAINT `fk_stu_classno` FOREIGN KEY (`classno`) REFERENCES `t_class` (`cno`))
delete from t_class where cno = 3;
```

### 外键策略

- 策略1：no action 不允许操作
- 策略2：cascade 级联操作：操作主表的时候影响从表的外键信息
- 策略3：set null 置空操作
- **注意** : 策略2 级联操作 和 策略2 的 删除操作 可以混着使用：

``` mysql
-- 学生表删除：
  drop table t_student;
  -- 班级表删除：
  drop table t_class;
  -- 注意：先删除从表，再删除主表。
  -- 先创建父表：班级表：
  create table t_class(
          cno int(4) primary key auto_increment,
          cname varchar(10) not null,
          room char(4)
  )
  -- 可以一次性添加多条记录：
  insert into t_class values 
      (null,'java001','r803'),
      (null,'java002','r416'),
      (null,'大数据001','r103');
  -- 添加学生表，添加外键约束：
  create table t_student(
          sno int(6) primary key auto_increment, 
          sname varchar(5) not null, 
          classno int(4),-- 取值参考t_class表中的cno字段，不要求字段名字完全重复，但是类型长度定义 尽量要求相同。
                                  constraint fk_stu_classno foreign key (classno) references t_class (cno)
  );
  -- 可以一次性添加多条记录：
  insert into t_student values 
      (null,'张三',1),
      (null,'李四',1),
      (null,'王五',2),
      (null,'朱六',3);
  -- 查看班级表和学生表：
  select * from t_class;
  select * from t_student;
  -- 删除班级2：如果直接删除的话肯定不行因为有外键约束：
  -- 加入外键策略：
  -- 策略1：no action 不允许操作
  -- 通过操作sql来完成：
  -- 先把班级2的学生对应的班级 改为null 
  update t_student set classno = null where classno = 2;
  -- 然后再删除班级2：
  delete from t_class where cno = 2;
  -- 策略2：cascade 级联操作：操作主表的时候影响从表的外键信息：
  -- 先删除之前的外键约束：
  alter table t_student drop foreign key fk_stu_classno;
  -- 重新添加外键约束：
  alter table t_student add constraint fk_stu_classno foreign key (classno) references t_class (cno) on update cascade on delete cascade;
  -- 试试更新：
  update t_class set cno = 5 where cno = 3;
  -- 试试删除：
  delete from t_class where cno = 5;
  -- 策略3：set null  置空操作：
  -- 先删除之前的外键约束：
  alter table t_student drop foreign key fk_stu_classno;
  -- 重新添加外键约束：
  alter table t_student add constraint fk_stu_classno foreign key (classno) references t_class (cno) on update set null on delete set null;
  -- 试试更新：
  update t_class set cno = 8 where cno = 1;
  -- 注意：
  -- 1. 策略2 级联操作  和  策略2 的  删除操作  可以混着使用：
  alter table t_student add constraint fk_stu_classno foreign key (classno) references t_class (cno) on update cascade on delete set null ;
  -- 2.应用场合：
  -- （1）朋友圈删除，点赞。留言都删除  --  级联操作
  -- （2）解散班级，对应的学生 置为班级为null就可以了，-- set null

```

## MySQl 命令

- 登录的命令

``` mysql
 mysql -hlocalhost -uroot –p
```

- 访问数据库

``` mysql
  show databases;
  use mysql;
  show tables;
```

- 退出数据库

``` mysql
  quit
  exit
  \q
```

- 设置密码永不过期

``` mysql
alter user 'root'@'localhost' identified by 'root' password expire never;
```

- 设置加密规则为mysql_native_password

``` mysql
alter user 'root'@'localhost' identified with mysql_native_password by 'root';
```

# SQL语言

> SQL（ Structured Query Language ）是结构化查询语言的简称，它是一种数据库查询和程序设计语言。
>
> 在数据库管理系统中，使用SQL语言来实现数据的存取、查询、更新等功能。
>
> SQL 是一种非过程化语言，只需提出“做什么”，而不需要指明“怎么做”。


> SQL 是由 IBM 公司在 1974 ~ 1979 年之间根据 E.J.Codd 发表的关系数据库理论为基础开发的，其前身是 “SEQUEL”，后更名为 SQL。
>
> 由于 SQL 语言具有集数据查询、数据操纵、数据定义和数据控制功能于一体，类似自然语言、简单易用以及非过程化等特点，得到了快速的发展，
>
> 并于1986年10月，被美国国家标准协会（American National Standards Institute，ANSI）采用为关系数据库管理系统的标准语言，
> 后为国际标准化组织（International Organization for Standardization，ISO）采纳为国际标准。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230301212814.png)

## SQL 语言分为五个部分

- 数据查询语言（Data Query Language，DQL）
  - SELECT
  - FROM
  - WHERE

---

- 数据操作语言（Data Manipulation Language，DML）
  - INSERT：增加数据
  - UPDATE：修改数据
  - DELETE：删除数据

---

- 数据定义语言（Data Definition Language，DDL）
  - CREATE：创建数据库对象
  - ALTER：修改数据库对象
  - DROP：删除数据库对象

--- 

- 数据控制语言（Data Control Language，DCL）
  - GRANT：授予用户某种权限
  - REVOKE：回收授予的某种权限

--- 

- 事务控制语言（Transaction Control Language，TCL）
  - START TRANSACTION：开启事务
  - COMMIT：提交事务
  - ROLLBACK：回滚事务
  - SET TRANSACTION：设置事务的属性

### 数据库表列类型

- 整数类型

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230228233532.png)

> MySQL支持选择在该类型关键字后面的括号内指定整数值的显示宽度(例如，INT(4))。
>
> 显示宽度并不限制可以在列内保存的值的范围，也不限制超过列的指定宽度的值的显示
>
> 主键自增：不使用序列，通过auto_increment，要求是整数类型

- 浮点数类型

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230228233731.png)

> 需要注意的是与整数类型不一样的是，浮点数类型的宽度不会自动扩充。
>
> score double(4,1)--小数部分为1位，总宽度4位，并且不会自动扩充。

- 字符串类型

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230301192256.png)

> CHAR 和 VARCHAR 类型相似，均用于存于较短的字符串，主要的不同之处在于存储方式。CHAR类型长度固定，VARCHAR类型的长度可变。
>
> 因为 VARCHAR 类型能够根据字符串的实际长度来动态改变所占字节的大小，这样可以大大地节约磁盘空间、提高存储效率。
>
> CHAR 和 VARCHAR 表示的是字符的个数，而不是字节的个数

- 日期和时间类型

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230301192426.png)

> TIMESTAMP 类型的数据指定方式与 DATETIME 基本相同，两者的不同之处在于以下几点：
> - (1) 数据的取值范围不同，TIMESTAMP 类型的取值范围更小。
> - (2) 如果我们对TIMESTAMP类型的字段没有明确赋值，或是被赋与了 NULL 值，MySQL 会自动将该字段赋值为系统当前的日期与时间。
> - (3) TIMESTAMP 类型还可以使用 CURRENT_TIMESTAMP 来获取系统当前时间。
> - (4) TIMESTAMP 类型有一个很大的特点，那就是时间是根据时区来显示的。例如，在东八区插入的 TIMESTAMP 数据为 2017-07-11 16:
    43:25，
    在东七区显示时，时间部分就变成了15:43:25，在东九区显示时，时间部分就变成了17:43:25。

### DDL (建表,建库)

> 表（Table）是数据库中数据存储最常见和最简单的一种形式，数据库可以将复杂的数据结构用较为简单的二维表来表示。二维表是由行和列组成的，分别都包含着数据

> 每个表都是由若干行和列组成的，在数据库中表中的行被称为记录，表中的列被称为是这些记录的字段。

> 记录也被称为一行数据，是表里的一行。在关系型数据库的表里，一行数据是指一条完整的记录。

#### 创建数据库

``` mysql
CREATE DATABASE databasename;

CREATE DATABASE IF NOT EXISTS test_db_char
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_bin;
```

#### 创建数据库表

``` mysql
  -- 这是一个单行注释
  /*
  多行注释
  */
  /*
  建立一张用来存储学生信息的表
  字段包含学号、姓名、性别，年龄、入学日期、班级，email等信息
  */
  -- 创建数据库表：
  create table t_student(
      sno int(6), -- 6显示长度 
      sname varchar(5), -- 5个字符
      sex char(1),
      age int(3),
      enterdate date,
      classname varchar(10),
      email varchar(15)
  );
  -- 查看表的结构：展示表的字段详细信息
  desc t_student;
  -- 查看表中数据：
  select * from t_student;
  -- 查看建表语句：
  show create table t_student;
  /*
  CREATE TABLE `t_student` (
    `sno` int DEFAULT NULL,
    `sname` varchar(5) DEFAULT NULL,
    `sex` char(1) DEFAULT NULL,
    `age` int DEFAULT NULL,
    `enterdate` date DEFAULT NULL,
    `classname` varchar(10) DEFAULT NULL,
    `email` varchar(15) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci
  */
  
  
  -- 添加一张表：快速添加：结构和数据跟t_student 都是一致的
  create table t_student2
  as
  select * from t_student;
  
  
  -- 快速添加，结构跟t_student一致，数据没有：
  create table t_student3
  as
  select * from t_student where 1=2;
  
  -- 快速添加：只要部分列，部分数据：
  create table t_student4
  as
  select sno,sname,age from t_student where sno = 2;

  -- 删除数据操作 :清空数据
  delete from t_student;
  truncate table t_student;
```

### delete 和 truncate 的区别

> 从最终的结果来看，虽然使用 TRUNCATE 操作和使用 DELETE 操作都可以删除表中的全部记录

> - DELETE 为数据操作语言 DML；TRUNCATE 为数据定义语言 DDL。
> - DELETE 操作是将表中所有记录一条一条删除直到删除完；TRUNCATE 操作则是保留了表的结构，重新创建了这个表
    所有的状态都相当于新表。因此，TRUNCATE 操作的效率更高。
> - DELETE 操作可以回滚；TRUNCATE 操作会导致隐式提交，因此不能回滚。
> - DELETE 操作执行成功后会返回已删除的行数（如删除4行记录，则会显示“Affected rows：4”）；截断操作不会返回已删除的行量，结果通常是“Affected
    rows：0”。DELETE操作删除表中记录后，再次向表中添加新记录时，对于设置有自增约束字段的值会从删除前表中该字段的最大值加1开始自增；TRUNCATE操作则会重新从1开始自增。

### DDL (数据表 增, 删, 改 字段, 删表)

``` mysql
-- 查看数据：
select * from t_student;
-- 修改表的结构：
-- 增加一列：
alter table t_student add score double(5,2) ; -- 5:总位数  2：小数位数 
update t_student set score = 123.5678 where sno = 1 ;
-- 增加一列（放在最前面）
alter table t_student add score double(5,2) first;
-- 增加一列（放在sex列的后面）
alter table t_student add score double(5,2) after sex;
-- 删除一列：
alter table t_student drop score;
-- 修改一列：
alter table t_student modify score float(4,1); -- modify修改是列的类型的定义，但是不会改变列的名字
alter table t_student change score score1 double(5,1); -- change修改列名和列的类型的定义
-- 删除表：
drop table t_student;
```

### DML (增, 删, 改, 数据)

> **注意事项**
> - int 宽度是显示宽度，如果超过，可以自动增大宽度 int底层都是4个字节
> - 时间的方式多样  '1256-12-23'  "1256/12/23"  "1256.12.23"
> - 字符串不区分单引号和双引号
> - 如何写入当前的时间 now() , sysdate() , CURRENT_DATE()
> - char varchar 是字符的个数，不是字节的个数，可以使用 binary，varbinary 表示定长和不定长的字节个数。
> - 如果不是全字段插入数据的话，需要加入字段的名字
> - 关键字，表名，字段名不区分大小写
> - 默认情况下，内容不区分大小写
> - 删除操作 from 关键字不可缺少
> - 修改，删除数据别忘记加限制条件

``` mysql
-- 查看表记录：
select * from t_student;
-- 在t_student数据库表中插入数据：
insert into t_student values (1,'张三','男',18,'2022-5-8','软件1班','123@126.com');
insert into t_student values (10010010,'张三','男',18,'2022-5-8','软件1班','123@126.com');
insert into t_student values (2,'张三','男',18,'2022.5.8','软件1班','123@126.com');
insert into t_student values (2,"张三",'男',18,'2022.5.8','软件1班','123@126.com');
insert into t_student values (7,"张三",'男',18,now(),'软件1班','123@126.com');
insert into t_student values (9,"易烊千玺",'男',18,now(),'软件1班','123@126.com');
insert into t_student (sno,sname,enterdate) values (10,'李四','2023-7-5');

-- 修改表中数据
update t_student set sex = '女' ;
update t_student set sex = '男' where sno = 10 ;
UPDATE T_STUDENT SET AGE = 21 WHERE SNO = 10;
update t_student set CLASSNAME = 'java01' where sno = 10 ;
update t_student set CLASSNAME = 'JAVA01' where sno = 9 ;
update t_student set age = 29 where classname = 'java01';
-- 删除操作：
delete from t_student where sno = 2;
```

### DQL (数据查询)

#### 单表

``` mysql
  -- 对emp表查询：
  select * from emp; -- *代表所有数据
  
  -- 显示部分列：
  select empno,ename,sal from emp;
  
  -- 显示部分行：where子句
  select * from emp where sal > 2000;
  
  -- 显示部分列，部分行：
  select empno,ename,job,mgr from emp where sal > 2000;
  
  -- 起别名：
  select empno 员工编号,ename 姓名,sal 工资 from emp; -- as 省略，''或者""省略了
  -- as alias 别名
  select empno as 员工编号,ename as 姓名,sal as 工资 from emp;
  select empno as '员工编号',ename as "姓名",sal as 工资 from emp;
  
  -- > 1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '编号,ename as "姓 名",sal as 工资 from emp' at line 1
  -- 错误原因：在别名中有特殊符号的时候，''或者""不可以省略不写
  select empno as 员工 编号,ename as "姓 名",sal as 工资 from emp;
  
  -- 算术运算符：
  select empno,ename,sal,sal+1000 as '涨薪后',deptno from emp where sal < 2500;
  select empno,ename,sal,comm,sal+comm from emp;  -- ？？？后面再说
  -- 去重操作：
  select job from emp;
  select distinct job from emp;
  select job,deptno from emp;
  select distinct job,deptno from emp; -- 对后面的所有列组合 去重 ，而不是单独的某一列去重
  -- 排序：
  select * from emp order by sal; -- 默认情况下是按照升序排列的
  select * from emp order by sal asc; -- asc 升序，可以默认不写
  select * from emp order by sal desc; -- desc 降序
  select * from emp order by sal asc ,deptno desc; -- 在工资升序的情况下，deptno按照降序排列

```

##### where 子句

``` mysql
-- 查看emp表：
select * from emp;
-- where子句：将过滤条件放在where子句的后面，可以筛选/过滤出我们想要的符合条件的数据：
-- where 子句 + 关系运算符
select * from emp where deptno = 10;
select * from emp where deptno > 10;
select * from emp where deptno >= 10;
select * from emp where deptno < 10;
select * from emp where deptno <= 10;
select * from emp where deptno <> 10;
select * from emp where deptno != 10;
select * from emp where job = 'CLERK'; 
select * from emp where job = 'clerk'; -- 默认情况下不区分大小写 
select * from emp where binary job = 'clerk'; -- binary区分大小写
select * from emp where hiredate < '1981-12-25';
-- where 子句 + 逻辑运算符：and 
select * from emp where sal > 1500 and sal < 3000;  -- (1500,3000)
select * from emp where sal > 1500 && sal < 3000; 
select * from emp where sal > 1500 and sal < 3000 order by sal;
select * from emp where sal between 1500 and 3000; -- [1500,3000]
-- where 子句 + 逻辑运算符：or
select * from emp where deptno = 10 or deptno = 20;
select * from emp where deptno = 10 || deptno = 20;
select * from emp where deptno in (10,20);
select * from emp where job in ('MANAGER','CLERK','ANALYST');
-- where子句 + 模糊查询：
-- 查询名字中带A的员工  -- %代表任意多个字符 0,1,2，.....
select * from emp where ename like '%A%' ;
-- -任意一个字符
select * from emp where ename like '__A%' ;
-- 关于null的判断：
select * from emp where comm is null;
select * from emp where comm is not null;
-- 小括号的使用  ：因为不同的运算符的优先级别不同，加括号为了可读性
select * from emp where job = 'SALESMAN' or job = 'CLERK' and sal >=1500; -- 先and再or  and > or
select * from emp where job = 'SALESMAN' or (job = 'CLERK' and sal >=1500); 
select * from emp where (job = 'SALESMAN' or job = 'CLERK') and sal >=1500;

```

#### 多表






