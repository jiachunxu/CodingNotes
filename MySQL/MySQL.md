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
> 常见的非关系型数据库管理系统有Memcached、MongoDB，redis，HBase等。

## MySQL约束

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

### 数据库表

> 表（Table）是数据库中数据存储最常见和最简单的一种形式，数据库可以将复杂的数据结构用较为简单的二维表来表示。二维表是由行和列组成的，分别都包含着数据

> 每个表都是由若干行和列组成的，在数据库中表中的行被称为记录，表中的列被称为是这些记录的字段。

> 记录也被称为一行数据，是表里的一行。在关系型数据库的表里，一行数据是指一条完整的记录。

> 

























