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

### MySQL 函数

> MySQL 中提供了大量函数来简化用户对数据库的操作，比如字符串的处理、日期的运算、数值的运算等。
>
> 使用函数可以大大提高SELECT语句操作数据库的能力，同时也给数据的转换和处理提供了方便。（在 sql 中使用函数）
>
> 函数只是对查询结果中的数据进行处理，不会改变数据库中数据表的值。MySQL 中的函数主要分为单行函数和多行函数两大类，

> PS：除了多行函数（max,min,count,sum,avg），都是单行函数

``` mysql
-- 函数举例：
select empno,ename,lower(ename),upper(ename),sal from emp;
-- 函数的功能：封装了特定的一些功能，我们直接拿过来使用，可以实现对应的功能
-- 函数作用：为了提高select的能力
-- 注意：函数没有改变数据自身的值，而是在真实数据的上面进行加工处理，展示新的结果而已。
select max(sal),min(sal),count(sal),sum(sal),avg(sal) from emp;
-- 函数的分类：
-- lower(ename),upper(ename) ：改变每一条结果，每一条数据对应一条结果  -- 单行函数
-- max(sal),min(sal),count(sal),sum(sal),avg(sal):多条数据，最终展示一个结果  -- 多行函数
```

#### 单行函数

``` mysql
  -- 单行函数包含：
  -- 1.字符串函数
  select ename,length(ename),substring(ename,2,3) from emp;
  -- substring字符串截取，2:从字符下标为2开始，3：截取长度3    （下标从1开始）
  -- 2.数值函数
  select abs(-5),ceil(5.3),floor(5.9),round(3.14) from dual; -- dual实际就是一个伪表 
  select abs(-5) 绝对值,ceil(5.3) 向上取整,floor(5.9) 向下取整,round(3.14) 四舍五入;  -- 如果没有where条件的话，from dual可以省略不写
  select ceil(sal) from emp;
  select 10/3,10%3,mod(10,3) ;
  -- 3.日期与时间函数 
  select * from emp;
  select curdate(),curtime() ; -- curdate()年月日 curtime()时分秒
  select now(),sysdate(),sleep(3),now(),sysdate() from dual; -- now(),sysdate() 年月日时分秒
  insert into emp values (9999,'lili','SALASMAN',7698,now(),1000,null,30);
  -- now()可以表示年月日时分秒，但是插入数据的时候还是要参照表的结构的
  desc emp;
  
  -- 4.流程函数
  -- if相关
  select empno,ename,sal,if(sal>=2500,'高薪','底薪') as '薪资等级' from emp; -- if-else 双分支结构
  select empno,ename,sal,comm,sal+ifnull(comm,0) from emp; -- 如果comm是null，那么取值为0 -- 单分支
  select nullif(1,1),nullif(1,2) from dual; --  如果value1等于value2，则返回null，否则返回value1  
  -- case相关：
  -- case等值判断
  select empno,ename,job,
  case job 
   when 'CLERK' then '店员'
   when 'SALESMAN'  then '销售'
   when 'MANAGER' then '经理'
   else '其他'
  end '岗位',
  sal from emp;
  -- case区间判断:
  select empno,ename,sal,
  case 
   when sal<=1000 then 'A'
   when sal<=2000 then 'B'
   when sal<=3000 then 'C'
   else 'D'
  end '工资等级',
  deptno from emp;
  from emp;
  -- 5.JSON函数  
  -- 6.其他函数
  select database(),user(),version() from dual;
```

**字符串函数 （String StringBuilder）**

> 单行函数是指对每一条记录输入值进行计算，并得到相应的计算结果，然后返回给用户

> 常用的单行函数主要包括字符串函数、数值函数、日期与时间函数、流程函数以及其他函数。

| 函数                            | 描述                                  |
|-------------------------------|-------------------------------------|
| CONCAT(str1, str2, ···, strn) | 将str1、str2···strn拼接成一个新的字符串         |
| INSERT(str, index, n, newstr) | 将字符串str从第index位置开始的n个字符替换成字符串newstr |
| LENGTH(str)                   | 获取字符串str的长度                         |
| LOWER(str)                    | 将字符串str中的每个字符转换为小写                  |
| UPPER(str)                    | 将字符串str中的每个字符转换为大写                  |
| LEFT(str, n)                  | 获取字符串str最左边的n个字符                    |
| RIGHT(str, n)                 | 获取字符串str最右边的n个字符                    |
| LPAD(str, n, pad)             | 使用字符串pad在str的最左边进行填充，直到长度为n个字符为止    |
| RPAD(str, n, pad)             | 使用字符串pad在str的最右边进行填充，直到长度为n个字符为止    |
| LTRIM(str)                    | 去除字符串str左侧的空格                       |
| RTRIM(str)                    | 去除字符串str右侧的空格                       |
| TRIM(str)                     | 去除字符串str左右两侧的空格                     |
| REPLACE(str,oldstr,newstr)    | 用字符串newstr替换字符串str中所有的子字符串oldstr    |
| REVERSE(str)                  | 将字符串str中的字符逆序                       |
| STRCMP(str1, str2)            | 比较字符串str1和str2的大小                   |
| SUBSTRING(str,index,n)        | 获取从字符串str的index位置开始的n个字符            |

**数值函数 （Math）**

| 函数                       | 描述                     |
|--------------------------|------------------------|
| ABS(num)                 | 返回num的绝对值              |
| CEIL(num)                | 返回大于num的最小整数（向上取整）     |
| FLOOR(num)               | 返回小于num的最大整数（向下取整）     |
| MOD(num1, num2)          | 返回num1/num2的余数（取模）     |
| PI()                     | 返回圆周率的值                |
| POW(num,n)/POWER(num, n) | 返回num的n次方              |
| RAND(num)                | 返回0~1之间的随机数            |
| ROUND(num, n)            | 返回x四舍五入后的值，该值保留到小数点后n位 |
| TRUNCATE(num, n)         | 返回num被舍去至小数点后n位的值      |

**日期与时间函数**

| 函数                                                                   | 描述                           |
|----------------------------------------------------------------------|------------------------------|
| CURDATE()                                                            | 返回当前日期                       |
| CURTIME()                                                            | 返回当前时间                       |
| NOW()                                                                | 返回当前日期和时间                    |
| SYSDATE()                                                            | 返回该函数执行时的日期和时间               |
| DAYOFYEAR(date)                                                      | 返回日期date为一年中的第几天             |
| WEEK (date)/ WEEKOFYEAR (date)                                       | 返回日期date为一年中的第几周             |
| DATE_FORMAT(date, format)                                            | 返回按字符串format格式化后的日期date      |
| DATE_ADD(date, INTERVAL expr unit)/ADDDATE(date, INTERVAL expr unit) | 返回date加上一个时间间隔后的新时间值         |
| DATE_SUB(date, INTERVAL expr unit)/SUBDATE(date, INTERVAL expr unit) | 返回date减去一个时间间隔后的新时间值         |
| DATEDIFF(date1, date2)                                               | 返回起始日期date1与结束日期date2之间的间隔天数 |

**流程函数(IF SWITCH )**

| 间隔类型                                                                                           | 描述                                         |
|------------------------------------------------------------------------------------------------|--------------------------------------------|
| IF(condition, t, f)                                                                            | 如果条件condition为真，则返回t，否则返回f                 |
| IFNULL(value1, value2)                                                                         | 如果value1不为null，则返回value1，否则返回value2        |
| NULLIF(value1, value2)                                                                         | 如果value1等于value2，则返回null，否则返回value1        |
| `CASE value WHEN   [value1] THEN result1 [WHEN [value2] THEN result2 ...] [ELSE result] END`   | 如果value等于value1，则返回result1，···，否则返回result  |
| `CASE WHEN [condition1] THEN result1 [WHEN [condition2] THEN   result2 ...] [ELSE result] END` | 如果条件condition1为真，则返回result1，···，否则返回result |

**JSON函数**

| 函数              | 描述                |
|-----------------|-------------------|
| JSON_APPEND()   | 在JSON文档中追加数据      |
| JSON_INSERT ()  | 在JSON文档中插入数据      |
| JSON_REPLACE () | 替换JSON文档中的数据      |
| JSON_REMOVE ()  | 从JSON文档的指定位置移除数据  |
| JSON_CONTAINS() | 判断JSON文档中是否包含某个数据 |
| JSON_SEARCH()   | 查找JSON文档中给定字符串的路径 |

**其他函数**

| 函数                    | 描述                    |
|-----------------------|-----------------------|
| DATABASE()            | 返回当前数据库名              |
| VERSION()             | 返回当前MySQL的版本号         |
| USER()                | 返回当前登录的用户名            |
| INET_ATON(IP)         | 返回IP地址的数字表示           |
| INET_NTOA             | 返回数字代表的IP地址           |
| PASSWORD(str)         | 实现对字符串str的加密操作        |
| FORMAT(num, n)        | 实现对数字num的格式化操作，保留n位小数 |
| CONVERT(data,   type) | 实现将数据data转换成type类型的操作 |

#### 多行函数

``` mysql
-- 多行函数：
select max(sal),min(sal),count(sal),sum(sal),sum(sal)/count(sal),avg(sal) from emp;
select * from emp;
-- 多行函数自动忽略null值
select max(comm),min(comm),count(comm),sum(comm),sum(comm)/count(comm),avg(comm) from emp;
-- max(),min(),count()针对所有类型   sum(),avg() 只针对数值型类型有效
select max(ename),min(ename),count(ename),sum(ename),avg(ename) from emp;
-- count --计数   
-- 统计表的记录数：方式1：
select * from emp;
select count(ename) from emp;
select count(*) from emp;
-- 统计表的记录数：方式2
select 1 from dual;
select 1 from emp;
select count(1) from emp;
```

| 函数      | 描述          |
|---------|-------------|
| COUNT() | 统计表中记录的数目   |
| SUM()   | 计算指定字段值的总和  |
| AVG()   | 计算指定字段值的平均值 |
| MAX()   | 统计指定字段值的最大值 |
| MIN()   | 统计指定字段值的最小值 |

> 多行函数是指对一组数据进行运算，针对这一组数据（多行记录）只返回一个结果，也称为分组函数。

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

##### 使用函数

``` mysql
-- 函数举例：
select empno,ename,lower(ename),upper(ename),sal from emp;
-- 函数的功能：封装了特定的一些功能，我们直接拿过来使用，可以实现对应的功能
-- 函数作用：为了提高select的能力
-- 注意：函数没有改变数据自身的值，而是在真实数据的上面进行加工处理，展示新的结果而已。
select max(sal),min(sal),count(sal),sum(sal),avg(sal) from emp;
-- 函数的分类：
-- lower(ename),upper(ename) ：改变每一条结果，每一条数据对应一条结果  -- 单行函数
-- max(sal),min(sal),count(sal),sum(sal),avg(sal):多条数据，最终展示一个结果  -- 多行函数
```

##### group by 分组

``` mysql
select * from emp;
-- 统计各个部门的平均工资 
select deptno,avg(sal) from emp; -- 字段和多行函数不可以同时使用
select deptno,avg(sal) from emp group by deptno; -- 字段和多行函数不可以同时使用,除非这个字段属于分组
select deptno,avg(sal) from emp group by deptno order by deptno desc;
-- 统计各个岗位的平均工资
select job,avg(sal) from emp group by job;
select job,lower(job),avg(sal) from emp group by job;
```

##### having 分组后筛选

``` mysql
-- 统计各个部门的平均工资 ,只显示平均工资2000以上的  - 分组以后进行二次筛选 having
select deptno,avg(sal) from emp group by deptno having avg(sal) > 2000;
select deptno,avg(sal) 平均工资 from emp group by deptno having 平均工资 > 2000;
select deptno,avg(sal) 平均工资 from emp group by deptno having 平均工资 > 2000 order by deptno desc;
-- 统计各个岗位的平均工资,除了MANAGER
-- 方法1：
select job,avg(sal) from emp where job != 'MANAGER' group by job;
-- 方法2：
select job,avg(sal) from emp group by job having job != 'MANAGER' ;
-- where在分组前进行过滤的，having在分组后进行后滤。
```

#### 单表查询总结

- select语句总结

``` mysql
select column, group_function(column)
from table
[where condition]
[group by  group_by_expression]
[having group_condition]
[order by column];
```

> **注意**：顺序固定，不可以改变顺序

- select语句的执行顺序
  - > from--where -- group by– select - having -- order by

``` mysql
-- 单表查询练习：
-- 列出工资最小值小于2000的职位
select job,min(sal)
from emp
group by job
having min(sal) < 2000 ;
-- 列出平均工资大于1200元的部门和工作搭配组合
select deptno,job,avg(sal)
from emp
group by deptno,job
having avg(sal) > 1200
order by deptno;
-- 统计[人数小于4的]部门的平均工资。 
select deptno,count(1),avg(sal)
from emp
group by deptno
having count(1) < 4
-- 统计各部门的最高工资，排除最高工资小于3000的部门。
select deptno,max(sal)
from emp 
group by deptno
having max(sal) >= 3000;
```

#### 多表

- 99语法
  - 连接查询需要使用join关键字实现
  - 提供了多种连接查询的类型： cross natural using on
- 92语法

##### 99语法：交叉连接，自然连接，内连接查询

``` mysql
-- 查询员工的编号，姓名，部门编号：
select * from emp;
select empno,ename,deptno from emp;
-- 查询员工的编号，姓名，部门编号,部门名称：
select * from emp; -- 14条记录
select * from dept; -- 4条记录 
-- 多表查询 ：
-- 交叉连接：cross join
select * 
from emp
cross join dept; -- 14*4 = 56条 笛卡尔乘积 ： 没有实际意义，有理论意义
select * 
from emp
join dept; -- cross 可以省略不写，mysql中可以，oracle中不可以
-- 自然连接：natural join 
-- 优点：自动匹配所有的同名列 ,同名列只展示一次 ，简单
select * 
from emp
natural join dept;
select empno,ename,sal,dname,loc 
from emp
natural join dept;
-- 缺点： 查询字段的时候，没有指定字段所属的数据库表，效率低
-- 解决： 指定表名：
select emp.empno,emp.ename,emp.sal,dept.dname,dept.loc,dept.deptno
from emp
natural join dept;
-- 缺点：表名太长
-- 解决：表起别名
select e.empno,e.ename,e.sal,d.dname,d.loc,d.deptno
from emp e
natural join dept d;
-- 自然连接 natural join 缺点：自动匹配表中所有的同名列，但是有时候我们希望只匹配部分同名列：
-- 解决： 内连接 - using子句：
select * 
from emp e
inner join dept d -- inner可以不写
using(deptno) -- 这里不能写natural join了 ,这里是内连接
-- using缺点：关联的字段，必须是同名的 
-- 解决： 内连接 - on子句：
select * 
from emp e
inner join dept d
on (e.deptno = d.deptno);
-- 多表连接查询的类型： 1.交叉连接  cross join  2. 自然连接  natural join  
-- 3. 内连接 - using子句   4.内连接 - on子句
-- 综合看：内连接 - on子句
select * 
from emp e
inner join dept d
on (e.deptno = d.deptno)
where sal > 3500;
-- 条件：
-- 1.筛选条件  where  having
-- 2.连接条件 on,using,natural 
-- SQL99语法 ：筛选条件和连接条件是分开的
```

##### 99语法：外连接查询

``` mysql
  -- inner join - on子句： 显示的是所有匹配的信息
  select * 
  from emp e
  inner join dept d
  on e.deptno = d.deptno;
  select * from emp;
  select * from dept;
  -- 问题：
  -- 1.40号部分没有员工，没有显示在查询结果中
  -- 2.员工scott没有部门，没有显示在查询结果中
  -- 外连接：除了显示匹配的数据之外，还可以显示不匹配的数据
  -- 左外连接： left outer join   -- 左面的那个表的信息，即使不匹配也可以查看出效果
  select * 
  from emp e
  left outer join dept d
  on e.deptno = d.deptno;
  -- 右外连接： right outer join   -- 右面的那个表的信息，即使不匹配也可以查看出效果
  select * 
  from emp e
  right outer join dept d
  on e.deptno = d.deptno;
  -- 全外连接  full outer join -- 这个语法在mysql中不支持，在oracle中支持 -- 展示左，右表全部不匹配的数据 
  -- scott ，40号部门都可以看到
  select * 
  from emp e
  full outer join dept d
  on e.deptno = d.deptno;
  -- 解决mysql中不支持全外连接的问题：
  select * 
  from emp e
  left outer join dept d
  on e.deptno = d.deptno
  union -- 并集 去重 效率低
  select * 
  from emp e
  right outer join dept d
  on e.deptno = d.deptno;
  select * 
  from emp e
  left outer join dept d
  on e.deptno = d.deptno
  union all-- 并集 不去重 效率高
  select * 
  from emp e
  right outer join dept d
  on e.deptno = d.deptno;
  -- mysql中对集合操作支持比较弱，只支持并集操作，交集，差集不支持（oracle中支持）
  -- outer可以省略不写
```

##### 99语法：三表连接查询

``` mysql
  -- 查询员工的编号、姓名、薪水、部门编号、部门名称、薪水等级
  select * from emp;
  select * from dept;
  select * from salgrade;
  select e.ename,e.sal,e.empno,e.deptno,d.dname,s.* 
  from emp e
  right outer join dept d
  on e.deptno = d.deptno
  inner join salgrade s 
  on e.sal between s.losal and s.hisal
```

##### 99语法：自连接查询

``` mysql
  -- 查询员工的编号、姓名、上级编号,上级的姓名
  select * from emp;
  select e1.empno 员工编号,e1.ename 员工姓名,e1.mgr 领导编号,e2.ename 员工领导姓名
  from emp e1
  inner join emp e2
  on e1.mgr = e2.empno;
  -- 左外连接：
  select e1.empno 员工编号,e1.ename 员工姓名,e1.mgr 领导编号,e2.ename 员工领导姓名
  from emp e1
  left outer join emp e2
  on e1.mgr = e2.empno; 
```

##### 92语法：多表查询

``` mysql
  -- 查询员工的编号，员工姓名，薪水，员工部门编号，部门名称：
  select e.empno,e.ename,e.sal,e.deptno,d.dname
  from emp e,dept d
  -- 相当于99语法中的cross join ,出现笛卡尔积，没有意义
  select e.empno,e.ename,e.sal,e.deptno,d.dname
  from emp e,dept d
  where e.deptno = d.deptno;
  -- 相当于99语法中的natural join 
  -- 查询员工的编号，员工姓名，薪水，员工部门编号，部门名称，查询出工资大于2000的员工
  select e.empno,e.ename,e.sal,e.deptno,d.dname
  from emp e,dept d
  where e.deptno = d.deptno and e.sal > 2000;
  -- 查询员工的名字，岗位，上级编号，上级名称（自连接）：
  select e1.ename,e1.job,e1.mgr ,e2.ename 
  from emp e1,emp e2
  where e1.mgr = e2.empno;
  -- 查询员工的编号、姓名、薪水、部门编号、部门名称、薪水等级
  select e.empno,e.ename,e.sal,e.deptno,d.dname,s.grade 
  from emp e,dept d,salgrade s
  where e.deptno = d.deptno and e.sal >= s.losal and e.sal <= s.hisal;
  -- 总结：
  -- 1.92语法麻烦 
  -- 2.92语法中 表的连接条件 和  筛选条件  是放在一起的没有分开
  -- 3.99语法中提供了更多的查询连接类型：cross,natural,inner,outer
```

#### 子查询

#### 不相关子查询

> 子查询可以独立运行，称为不相关子查询。

##### 单行子查询

``` mysql
  -- 单行子查询：
  -- 查询工资高于平均工资的雇员名字和工资。
  select ename,sal
  from emp
  where sal > (select avg(sal) from emp);
  -- 查询和CLARK同一部门且比他工资低的雇员名字和工资。
  select ename,sal
  from emp
  where deptno = (select deptno from emp where ename = 'CLARK') 
        and 
        sal < (select sal from emp where ename = 'CLARK')
  -- 查询职务和SCOTT相同，比SCOTT雇佣时间早的雇员信息  
  select * 
  from emp
  where job = (select job from emp where ename = 'SCOTT') 
        and 
        hiredate < (select hiredate from emp where ename = 'SCOTT')
```

##### 多行子查询

``` mysql
  -- 多行子查询：
  -- 【1】查询【部门20中职务同部门10的雇员一样的】雇员信息。
  -- 查询雇员信息
  select * from emp;
  -- 查询部门20中的雇员信息
  select * from emp where deptno = 20;-- CLERK,MANAGER,ANALYST
  -- 部门10的雇员的职务：
  select job from emp where deptno = 10; -- MANAGER,PRESIDENT,CLERK
  -- 查询部门20中职务同部门10的雇员一样的雇员信息。
  select * from emp 
  where deptno = 20 
  and job in (select job from emp where deptno = 10)
  -- > Subquery returns more than 1 row
  select * from emp 
  where deptno = 20 
  and job = any(select job from emp where deptno = 10)
  -- 【2】查询工资比所有的“SALESMAN”都高的雇员的编号、名字和工资。
  -- 查询雇员的编号、名字和工资
  select empno,ename,sal from emp
  -- “SALESMAN”的工资：
  select sal from emp where job = 'SALESMAN'
  -- 查询工资比所有的“SALESMAN”都高的雇员的编号、名字和工资。
  -- 多行子查询：
  select empno,ename,sal 
  from emp 
  where sal > all(select sal from emp where job = 'SALESMAN');
  -- 单行子查询：
  select empno,ename,sal 
  from emp 
  where sal > (select max(sal) from emp where job = 'SALESMAN');
  -- 【3】查询工资低于任意一个“CLERK”的工资的雇员信息。  
  -- 查询雇员信息
  select * from emp;
  -- 查询工资低于任意一个“CLERK”的工资的雇员信息
  select * 
  from emp
  where sal < any(select sal from emp where job = 'CLERK')
  and job != 'CLERK'
  -- 单行子查询：
  select * 
  from emp
  where sal < (select max(sal) from emp where job = 'CLERK')
  and job != 'CLERK'
```

#### 相关子查询

> 相关子查询：子查询不可以独立运行，并且先运行外查询，再运行子查询

- 不相关的子查询优缺点：
  - 好处：简单 功能强大（一些使用不相关子查询不能实现或者实现繁琐的子查询，可以使用相关子查询实现）
  - 缺点：稍难理解

``` mysql
  -- 【1】查询最高工资的员工  （不相关子查询）
  select * from emp where sal = (select max(sal) from emp)
  -- 【2】查询本部门最高工资的员工   （相关子查询）
  -- 方法1：通过不相关子查询实现：
  select * from emp where deptno = 10 and sal = (select max(sal) from emp where deptno = 10)
  union
  select * from emp where deptno = 20 and sal = (select max(sal) from emp where deptno = 20)
  union
  select * from emp where deptno = 30 and sal = (select max(sal) from emp where deptno = 30)
  -- 缺点：语句比较多，具体到底有多少个部分未知
  -- 方法2： 相关子查询
  select * from emp e where sal = (select max(sal) from emp where deptno = e.deptno) order by deptno
  -- 【3】查询工资高于其所在岗位的平均工资的那些员工  （相关子查询）
  -- 不相关子查询：
  select * from emp where job = 'CLERK' and sal >= (select avg(sal) from emp where job = 'CLERK')
  union ......
  -- 相关子查询：
  select * from emp e where sal >= (select avg(sal) from emp e2 where e2.job = e.job)
```

### 数据库对象

#### 事务

> 事务（Transaction）是用来维护数据库完整性的，它能够保证一系列的MySQL操作要么全部执行，要么全不执行。

- 事务的概念

> 事务（Transaction）指的是一个操作序列，该操作序列中的多个操作要么都做，要么都不做，是一个不可分割的工作单位，是数据库环境中的逻辑工作单位，由DBMS（数据库管理系统）中的事务管理子系统负责事务的处理。
>
> 目前常用的存储引擎有InnoDB（MySQL5.5以后默认的存储引擎）和MyISAM（MySQL5.5之前默认的存储引擎），其中InnoDB支持事务处理机制，而MyISAM不支持。

- 事务的特性
  - 原子性（Atomicity）
  - 隔离性（Isolation）
    - 未提交读（Read uncommitted）
    - 提交读（read committed）
    - 可重复读（repeatable read）
    - 串行化（Serializable）
  - 持久性（Durability）
  - 一致性（Consistency）
    - 在事务开始之前和事务结束以后，数据库的完整性没有被破坏。这表示写入的资料必须完全符合所有的预设约束、触发器、级联回滚等。

``` mysql
  -- 创建账户表：
  create table account(
          id int primary key auto_increment,
          uname varchar(10) not null,
          balance double
  );
  -- 查看账户表：
  select * from account;
  -- 在表中插入数据：
  insert into account values (null,'丽丽',2000),(null,'小刚',2000);
  -- 丽丽给小刚 转200元：
  update account set balance = balance - 200 where id = 1;
  update account set balance = balance + 200 where id = 2;
  -- 默认一个DML语句是一个事务，所以上面的操作执行了2个事务。
  update account set balance = balance - 200 where id = 1;
  update account set balance = balance2 + 200 where id = 2;
  -- 必须让上面的两个操作控制在一个事务中：
  -- 手动开启事务：
  start transaction;
  update account set balance = balance - 200 where id = 1;
  update account set balance = balance + 200 where id = 2;
  -- 手动回滚：刚才执行的操作全部取消：
  rollback;
  -- 手动提交：
  commit;
  -- 在回滚和提交之前，数据库中的数据都是操作的缓存中的数据，而不是数据库的真实数据
```

#### 事务并发问题

##### 脏读（ Dirty read）

> **读到其他事务未提交的数据**

> 当一个事务正在访问数据并且对数据进行了修改，而这种修改还没有提交到数据库中，这时另外一个事务也访问了这个数据，然后使用了这个数据。
>
> 因为这个数据是还没有提交的数据，那么另外一个事务读到的这个数据是“脏数据”，依据“脏数据”所做的操作可能是不正确的。

##### 不可重复读 Unrepeatableread）

> 读到其他事务修改之后提交的数据

> 在一个事务内多次读同一数据。在这个事务还没有结束时，另一个事务也访问该数据。那么，在第一个事务中的两次读数据之间，由于第二个事务的修改导致第一个事务两次读取的数据可能不太一样。
> 这就发生了在一个事务内两次读到的数据是不一样的情况，因此称为不可重复读。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230306211049.png)

##### 幻读（ Phantom read ）

> **读到其他事务添加的新数据**

> 幻读与不可重复读类似。
>
> 它发生在一个事务（T1）读取了几行数据，接着另一个并发事务（T2）插入了一些数据时。在随后的查询中，第一个事务（T1）就会发现多了一些原本不存在的记录，就好像发生了幻觉一样，所以称为幻读。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20230306212057.png)

- 不可重复度和幻读**区别**
  - 不可重复读的重点是修改，幻读的重点在于新增或者删除。


- 解决不可重复读的问题只需锁住满足条件的行，解决幻读需要锁表

#### 事务隔离级别

> 事务的隔离级别用于决定如何控制并发用户读写数据的操作。数据库是允许多用户并发访问的，如果多个用户同时开启事务并对同一数据进行读写操作的话，有可能会出现脏读、不可重复读和幻读问题，所以MySQL中提供了四种隔离级别来解决上述问题。

> 事务的隔离级别从低到高依次为READ UNCOMMITTED、READ COMMITTED、REPEATABLE READ以及SERIALIZABLE，隔离级别越低，越能支持高并发的数据库操作。

| 隔离级别             | 脏读  | 不可重复读 | 幻读  |
|------------------|-----|-------|-----|
| READ UNCOMMITTED | √   | √     | √   |
| READ COMMITTED   | ×   | √     | √   |
| REPEATABLE READ  | ×   | ×     | √   |
| SERIALIZABLE     | ×   | ×     | ×   |  

> **PS**：√ 代表会出现问题 ， ×代表不会出现问题 = 解决问题

``` mysql
  -- 查看默认的事务隔离级别  MySQL默认的是repeatable read  
  select @@transaction_isolation;  
  -- 设置事务的隔离级别   （设置当前会话的隔离级别）
  set session transaction isolation level read uncommitted;  
  set session transaction isolation level read committed;  
  set session transaction isolation level repeatable read;  
  set session transaction isolation level serializable;  
  start transaction ;
  select * from account where id = 1;
```

#### 视图

> 视图（view）是一个从单张或多张基础数据表或其他视图中构建出来的虚拟表。
>
> 同基础表一样，视图中也包含了一系列带有名称的列和行数据，但是数据库中只是存放视图的定义，也就是动态检索数据的查询语句，
> 而并不存放视图中的数据，这些数据依旧存放于构建视图的基础表中，只有当用户使用视图时才去数据库请求相对应的数据，即视图中的数据是在引用视图时动态生成的。
>
> 因此视图中的数据依赖于构建视图的基础表，如果基本表中的数据发生了变化，视图中相应的数据也会跟着改变。

> **PS**:视图本质上就是：一个查询语句，是一个虚拟的表，不存在的表，你查看视图，其实就是查看视图对应的sql语句

**视图的好处**


> 简化用户操作：视图可以使用户将注意力集中在所关心地数据上，而不需要关心数据表的结构、与其他表的关联条件以及查询条件等。
> 对机密数据提供安全保护：有了视图，就可以在设计数据库应用系统时，对不同的用户定义不同的视图，避免机密数据（如，敏感字段“salary”）出现在不应该看到这些数据的用户视图上。
>
> 这样视图就自动提供了对机密数据的安全保护功能

``` mysql
  -- 创建/替换单表视图：
  create or replace view myview01
  as
  select empno,ename,job,deptno 
  from emp
  where deptno = 20
  with check option;
  -- 查看视图：
  select * from myview01;
  -- 在视图中插入数据：
  insert into myview01 (empno,ename,job,deptno) values (9999,'lili','CLERK',20);
  insert into myview01 (empno,ename,job,deptno) values (8888,'nana','CLERK',30);
  insert into myview01 (empno,ename,job,deptno) values (7777,'feifei','CLERK',30); 
  -- > 1369 - CHECK OPTION failed 'mytestdb.myview01'
  -- 创建/替换多表视图：
  create or replace view myview02
  as 
  select e.empno,e.ename,e.sal,d.deptno,d.dname
  from emp e
  join dept d
  on e.deptno = d.deptno
  where sal > 2000 ;
  select * from myview02;
  -- 创建统计视图：
  create or replace view myview03
  as
  select e.deptno,d.dname,avg(sal),min(sal),count(1)
  from emp e
  join dept d
  using(deptno)
  group by e.deptno ;
  select * from myview03;
  -- 创建基于视图的视图：
  create or replace view myview04
  as
  select * from myview03 where deptno = 20;
  select * from myview04;
```

#### 存储过程

> - 什么是存储过程(Stored Procedure)
>
> 通过前面章节的学习，我们已经知道SQL是一种非常便利的语言。从数据库抽取数据，或者对特定的数据集中更新时，都能通过简洁直观的代码实现。
>
> 但是这个所谓的“简洁”也是有限制，SQL基本是一个命令实现一个处理，是所谓的非程序语言。
>
> 在不能编写流程的情况下，所有的处理只能通过一个个命令来实现。当然，通过使用连接及子查询，即使使用SQL的单一命令也能实现一些高级的处理，但是，其局限性是显而易见的。例如，在SQL中就很难实现针对不同条件进行不同的处理以及循环等功能。
>
> 这个时候就出现了存储过程这个概念，简单地说，存储过程就是数据库中保存(Stored)
> 的一系列SQL命令（Procedure）的集合。也可以将其看作相互之间有关系的SQL命令组织在一起形成的一个小程序。
>
> - 存储过程的优点
>
> 1) 提高执行性能。存储过程执行效率之所高，在于普通的SQL语句，每次都会对语法分析，编译，执行，而存储过程只是在第一次执行语法分析，编译，执行，以后都是对结果进行调用。
>
> 2) 可减轻网络负担。使用存储过程，复杂的数据库操作也可以在数据库服务器中完成。只需要从客户端(或应用程序)
     > 传递给数据库必要的参数就行，比起需要多次传递SQL命令本身，这大大减轻了网络负担。
> 3) 可将数据库的处理黑匣子化。应用程序中完全不用考虑存储过程的内部详细处理，只需要知道调用哪个存储过程就可以了

``` mysql
  -- 定义一个没有返回值 存储过程
  -- 实现：模糊查询操作：
  select * from emp where ename like '%A%';
  create procedure mypro01(name varchar(10))
  begin
          if name is null or name = "" then
                  select * from emp;
          else
      select * from emp where ename like concat('%',name,'%');
          end if;	
  end;
  -- 删除存储过程：
  drop procedure mypro01;
  -- 调用存储过程：
  call mypro01(null);
  call mypro01('R');
  -- 定义一个  有返回值的存储过程：
  -- 实现：模糊查询操作：
  -- in 参数前面的in可以省略不写
  -- found_rows()mysql中定义的一个函数，作用返回查询结果的条数
  create procedure mypro02(in name varchar(10),out num int(3))
  begin
          if name is null or name = "" then
                  select * from emp;
          else
      select * from emp where ename like concat('%',name,'%');
          end if;	
          select found_rows() into num;
  end;
  -- -- 调用存储过程：
  call mypro02(null,@num);
  select @num;
  call mypro02('R',@aaa);
  select @aaa;
```



