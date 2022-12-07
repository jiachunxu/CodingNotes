
# Java


## 标志符

- 标识符：读音 biao zhi fu
- 什么是标识符？包，类，变量，方法.....等等,只要是起名字的地方,那个名字就是标识符
- 标识符定义规则：
  - 1.四个可以（组成部分）：数字，字母，下划线_，美元符号$ 注意：字母概念比较宽泛，指的是英文字母，汉字，日语，俄语...... 一般起名字尽量使用英文字母
  - 2.两个不可以：不可以以数字开头，不可以使用java中的关键字
  - 3.见名知意：增加可读性
  - 4.大小写敏感：  `int a ; int A;`
  - 5.遵照驼峰命名：
    - 类名：首字母大写，其余遵循驼峰命名
    - 方法名，变量名：首字母小写，其余遵循驼峰命名
    - 包名：全部小写，不遵循驼峰命名
  - 6.长度无限制，但是不建议太长

## 关键字

关键字：被JAVA语言赋予了特殊含义，用作专门用途的单词

特点：JAVA中所有关键字都为小写

官网:<https://docs.oracle.com/javase/tutorial/java/nutsandbolts/_keywords.html>
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/关键字1.png)
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/关键字2.png)


---

# 1 数据类型

## 1.1 常量

> 在Java语言中，主要是利用关键字final来定义一个常量。 常量一旦被初始化后不能再更改其值。

> 为了更好的区分和表述，一般将1、2、3、’a’、’b’、true、false、”helloWorld”等称为**字面常量**， 
> 而使用final修饰的PI等称为**符号常量**（字符常量）。

> 注意：逻辑常量就两个值，一个是true，一个是false

## 1.2 变量

- 变量声明格式：
  > ` type varName [=value][,varName[=value]...];`[ ]中的内容为可选项，即可有可无
  `    int     age = 19 , age2 = 90 ; int  age,age2;`
- 变量的声明：
	- （1）定义一个变量，没有给变量进行赋值，变量相当于没有定义：
	- （2）变量如果没有进行赋值的话，那么使用的时候会出错
- 变量的赋值: `int age = 10;`
	- 变量的值可以更改：
	- 变量不可以重复定义：
- 变量的作用域：作用域指的就是作用范围，有效作用范围就是离它最近的{}

## 1.3 基本数据类型

> Java是一种强类型语言，每个变量都必须声明其数据类型。

> Java的数据类型可分为两大类：基本数据类型`（primitive data type）`和引用数据类型`（reference data type）`。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/数据类型.png)

### 1.3.1 整数类型

    十进制整数，如：99, -500, 0

    八进制整数，要求以 0 开头，如：015

    十六进制数，要求 0x 或 0X 开头，如：0x15

    二进制：要求0b或者0B开头，如：0b11

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/进制表.png)

### 1.3.2 整型数据类型：

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/整型数据类型.png)

```     
    //定义整数类型的变量：
    //给变量赋值的时候，值可以为不同进制的：
    int num1 = 12 ;     //默认情况下赋值就是十进制的情况
    int num2 = 012;     //前面加上0，这个值就是八进制的
    int num3 = 0x12;    //前面加上0x或者0X，这个值就是十六进制的
    int num4 = 0b10;    //前面加上0b或者0B,这个值就是二进制的
    //定义byte类型的变量：
    byte b = 126;       //定义了一个byte类型的变量，名字叫b，赋值为12
    //注意：超范围的赋值会报错。
    short s = 30000;    //报错
    
    int i = 1234;
    //整数类型默认就是int类型的，所以12345678910是一个int类型的数，对于int类型来说，它超出范围了
    //要想把一个数给long类型变量，那么后面加上L(推荐)或者l就可以了
    long num5 = 12345678910L;
    //注意：只有这个数超出int类型的范围了后面才需要加上L，否则无需加L也可以赋值给long类型：
    long num6 = 12;
```

### 1.3.3 浮点类型

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/浮点类型.png)

> （1）十进制数形式

    3.14       314.0      0.314

> （2）科学记数法形式

```  
    314e2      314E2 (E的大小写没有区分)    314E-2
    double  f = 314e2;  //314*10^2-->31400.0
    double  f2 = 314e-2; //314*10^(-2)-->3.14
```

> **float类型又被称作单精度类型**，尾数可以精确到7位有效数字

> **double**表示这种类型的数值精度约是float类型的两倍，又被称作**双精度类型**，绝大部分应用程序都采用double类型。

> float类型的数值有一个后缀F或者f ，没有后缀F/f的浮点数值默认为double类型。 
> 
> 也可以在浮点数值后添加后缀D或者d， 以明确其为double类型。

```  
    //浮点类型的常量有两种形式：
    //十进制形式：
    double num1 = 3.14;
    //科学计数法形式：
    double num2 = 314E-2;
    //浮点类型的变量：
    //注意：浮点型默认是double类型的，要想将一个double类型的数赋给float类型，必须后面加上F或者f
    float f1 = 3.14234567898623F;
    //注意：double类型后面可以加D或者d，但是一般我们都省略不写
    double d1 = 3.14234567898623D;
    //注意：我们最好不要进行浮点类型的比较：
    float f2 = 0.3F;
    double d2 = 0.3;
    /*
    区别：
    = 赋值运算：  将等号右侧的值赋给等号左侧
    == 判断==左右两侧的值是否相等  ：结果要么相等 要么不相等
    ==运算符的结果就是要么是true，要么是false
    */
```

#### 字符类型

``` 
char a='我';
char b='B';
char c='c';
```

【1】Java中使用单引号来表示字符常量，字符型在内存中占2个字节。char 类型用来表示在Unicode编码表中的字符。Unicode编码被设计用来处理各种语言的文字，它占2个字节，可允许有65536个字符。

【2】转义字符：
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/转义字符.png)

【3】ASCII表：
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/ASCII表.png)

#### 编码和字符集

> 编码是信息从一种形式或格式转换为另一种形式的过程，也称为计算机编程语言的代码简称编码。用预先规定的方法将文字、数字或其它对象编成数码，或将信息、数据转换成规定的电脉冲信号。编码在电子计算机、电视、遥控和通讯等方面广泛使用。编码是信息从一种形式或格式转换为另一种形式的过程。解码，是编码的逆过程。

**由权威机构形成的编码表才可以称之为：字符集**

| ASCII     | 英文字符集       | 用一个字节的7位表示     |
| :---      |    :----:      |          ---: |
| IOS8859-1 | 西欧字符集       | 用一个字节的8位表示   |
| GB2312    | 简体中文字符集| 最多使用两个字节编码|
| Unicode   |国际通用字符集| |

UTF标准：

三种编码方案： UTF-8，UTF-16,UTF-32

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/utf8.png)
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/utf8_2.png)

#### 布尔类型

```  
    //创建一个布尔类型的变量：
    boolean flag1 = true;
    boolean flag2 = false;
    boolean flag3 = 5==9; //false
    boolean flag4 = 5<9;  //true
```

### 基本数据类型的转换

```  
    //类型转换的两种形式：
    double d = 6;   //int-->double  自动类型转换
    int i = (int)6.5;   //double--->int  强制类型转换 （强转）
    //在同一个表达式中，有多个数据类型的时候，应该如何处理：
    //多种数据类型参与运算的时候，整数，浮点，字符类型都可以参与运算，
    //唯独布尔类型不可以参与运算。
    double d2 = 12+1294L+8.5F+3.81+'a'+true;
    double d2 = 12+1294L+8.5F+3.81+'a';

    类型级别：(从低到高的)
    byte,short,char-->int--->long--->float--->double
    当一个表达式中有多种数据类型的时候，要找出当前表达式中级别最高的那个类型，然后
    其余的类型都转换为当前表达式中级别最高的类型进行计算。
    double d2 = 12+1294L+8.5F+3.81+'a';
    double d2 = 12.0+1294.0+8.5+3.81+97.0
    int i2 = (int)(12+1294L+8.5F+3.81+'a');

    /*
    在进行运算的时候：
    左=右  : 直接赋值
    左<右  ：强转
    左>右  ：直接自动转换
    */
    //以下情况属于特殊情形：对于byte，short，char类型来说，
    //只要在他们的表数范围中，赋值的时候就不需要进行
    //强转了直接赋值即可。
    byte b = 12;
    byte b2 = (byte)270;
```

## 运算符

> Java 语言支持如下运算符：

- 算术运算符 +，-，*，/，%，++（自增），--（自减）
- 赋值运算符 =
- 扩展赋值运算符 +=，-=，*=，/=
- 关系运算符 >，<，>=，<=，==，!=
- 逻辑运算符 &，|，&&，||，!，^
- 位运算符 &，|，^，~ ， >>，<<，>>> (了解！！！)
- 条件运算符(三目运算符) ? :

### 位运算符

- `<< 左移 :   3 << 2 = 12 ; -3 << 2 = -12`
- `>> 有符号右移 : 6 >> 2 = 1 ; -6 >> 2 = -2`
- `>>> 无符号右移 : 6 >>> 2 = 1 ; -6 >>> 2 = 1073741822(X)`
- `& 与 : 6 & 3 = 2`
- `| 或 : 6 | 3 = 7`
- `^ 异或 : 6 ^ 3 = 5`
- `~ 反 : ~6 = -7`

```
PS：
byte类型的表数范围的 -128是怎么算出来的 
127： 01111111
-128：  10000000
一看就是个负数
减1：    01111111
取反：   10000000  ---> 2^7  = 128
加负号：  -128
```

### 运算符总结

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/运算符1.png)
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/运算符2.png)
![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/运算符3.png)

### 运算符优先级

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/运算符优先级.png)

## 流程控制

- 流程控制的作用： 用来控制程序中各语句执行顺序的语句，可以把语句组合成能完成一定功能的小逻辑模块。
- 控制语句的分类： 顺序、选择和循环。

  “顺序结构”代表“先执行a，再执行b”的逻辑。

  “条件判断结构”代表“如果…，则…”的逻辑。

  “循环结构”代表“如果…，则再继续…”的逻辑。

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/流程控制.png)

### 分支结构

- 单分支
  ```
    if(布尔表达式){
    语句块
    }
  if语句对布尔表达式进行一次判定，若判定为真，则执行{}中的语句块，
  否则跳过该语句块。
  ```

- 多分支
  ```
    if(布尔表达式1) {
            语句块1;
    } else if(布尔表达式2) {
            语句块2;
    }......
    else if(布尔表达式n){
            语句块n;
    } else {
            语句块n+1;
    }
  当布尔表达式1为真时，执行语句块1；否则，判断布尔表达式2，当布尔表达式2为真时，执行语句块2；
  否则，继续判断布尔表达式3······；如果1~n个布尔表达式均判定为假时，则执行语句块n+1
  ```
- 双分支
  ```
    if(布尔表达式){
    语句块1
    }else{
    语句块2
    }
  当布尔表达式为真时，执行语句块1，否则，执行语句块2。
  ```
- switch多分支结构
    ```
      switch (表达式) {
      case 值1:
         语句序列1;
         [break];
      case 值2:
         语句序列2;
         [break];
        … … …      … …
      [default:默认语句;]
      }
  switch语句会根据表达式的值从相匹配的case标签处开始执行，
  一直执行到break语句处或者是switch语句的末尾。
  如果表达式的值与任一case值不匹配，
  则进入default语句（如果存在default语句的情况）。
  根据表达式值的不同可以执行许多不同的操作。
  switch语句中case标签在JDK1.5之前必须是整数（long类型除外）
  或者枚举，不能是字符串，在JDK1.7之后允许使用字符串(String)。
  大家要注意，当布尔表达式是等值判断的情况，
  可以使用if-else if-else多分支结构或者switch结构，
  如果布尔表达式区间判断的情况，
  则只能使用if-else if-else多分支结构。
    ```

### 循环结构

- while
    ```
    while (布尔表达式) {
            循环体;
    }
  ```

- do while
    ```
  do {
            循环体;
    } while(布尔表达式) ;
  ```

- for
    ```
    for (初始表达式; 布尔表达式; 迭代因子) {
          循环体;
    }
  ```

#### 循环关键字

- **break 停止循环**

``` 
//break带标签的使用
public class Test {
    public static void main(String[] args) {
        outer:
        //----》定义标签结束的位置
        for (int i = 1; i <= 100; i++) {
            System.out.println(i);
            while (i == 36) {
                break outer;    //----》根据标签来结束循环
            }
        }
    }
}
```

- **continue 结束本次循环，继续下一次循环**

``` 
//continue带标签的使用
public class Test {
    public static void main(String[] args) {

        outer:
        for (int i = 1; i <= 100; i++) {
            while (i == 36) {
                continue outer;  //1-100没有36
            }
            System.out.println(i);
        }
    }
}
```

- **return 跟循环无关 结束当前方法**

## 方法的定义/调用/重载

- 什么是方法？ 方法(method)就是一段用来完成特定功能的代码片段，类似于其它语言的函数(function)。 方法用于定义该类或该类的实例的行为特征和功能实现。
  方法是类和对象行为特征的抽象。方法很类似于面向过程中的函数。面向过程中，函数是最基本单位，整个程序由一个个函数调用组成。面向对象中，整个程序的基本单位是类，方法是从属于类和对象的。
- 方法声明格式：

```
[修饰符1  修饰符2  …]  返回值类型    方法名(形式参数列表){
        Java语句；… … …
}
```

- 方法的调用方式

```
对象名.方法名(实参列表)
```

**方法的详细说明**

> 形式参数：在方法声明时用于接收外界传入的数据。

> 实参：调用方法时实际传给方法的数据。

> 返回值：方法在执行完毕后返还给调用它的环境的数据。

> 返回值类型：事先约定的返回值的数据类型，如无返回值，必须显示指定为为void。

**方法重载**

- 方法的重载：在同一个类中，方法名相同，形参列表不同的多个方法，构成了方法的重载。

- 方法的重载只跟：方法名和形参列表有关，与修饰符，返回值类型无关。
- 注意：形参列表不同指的是什么？
	- 个数不同 add()   add(int num1)   add(int num1,int num2)
	- 顺序不同 add(int num1,double num2)   add(double num1,int num2)
	- 类型不同 add(int num1)   add(double num1)

## 数组

数组的初始化方式总共有三种：

- 静态初始化 : `int[] arr = {12,23,45}; int[] arr = new int[]{12,23,45};`
- 动态初始化 : `int[] arr ; arr = new int[3]:; arr[0] = 12;`
- 默认初始化 : `int[] arr = new int[3]; // 数组有默认的初始化值`

### 详述main方法

【1】main方法：程序的入口，在同一个类中，如果有多个方法，那么虚拟机就会识别main方法，从这个方法作为程序的入口

【2】main方法格式严格要求：

```
public static void main(String[] args){}

public static --->修饰符

void --->代表方法没有返回值 对应的类型void

main --->见名知意名字

String[] args  --->形参 
```

【3】问题：程序中是否可以有其他的方法也叫main方法？ 可以，构成了方法的重载。

**可变参数**

``` 
        1.可变参数：作用提供了一个方法，参数的个数是可变的,解决了部分方法的重载问题
        int...num
        double...num
        boolean...num

        2.可变参数在JDK1 .5之后加入的新特性
        3.方法的内部对可变参数的处理跟数组是一样
        4.可变参数和其他数据一起作为形参的时候，可变参数一定要放在最后
        5.我们自己在写代码的时候，建议不要使用可变参数。
```

**Arrays工具类**

```
int[] arr = {1,3,7,2,4,8};
//toString:对数组进行遍历查看的，返回的是一个字符串，这个字符串比较好看
Arrays.toString(arr);

//sort：排序 -->升序
Arrays.sort(arr);

//binarySearch:二分法查找：找出指定数组中的指定元素对应的索引：
//这个方法的使用前提：一定要查看的是一个有序的数组：
Arrays.binarySearch(arr,4)

//copyOf:完成数组的复制：
int[] newArr = Arrays.copyOf(arr2,4);

//copyOfRange:区间复制
int[] newArr2 = Arrays.copyOfRange(arr2,1,4);   //[1,4)-->1,2,3位置

 //equals:比较两个数组的值是否一样：
int[] arr3 = {1,3,7,2,4,8};
int[] arr4 = {1,3,7,2,4,8};
Arrays.equals(arr3,arr4);   //true

//fill：数组的填充：
int[] arr5 = {1,3,7,2,4,8};
Arrays.fill(arr5,10);

```

### 二维数组

``` 
public class TestArray15 {
    public static void main(String[] args) {
        //定义一个二维数组：
        int[][] arr = new int[3][];
        //本质上定义了一个一维数组，长度为3

        int[] a1 = {1, 2, 3};
        arr[0] = a1;

        arr[1] = new int[]{4, 5, 6, 7};

        arr[2] = new int[]{9, 10};
    }
}

```

## 面向对象

### 面向对象的三个阶段

- 面向对象分析OOA -- Object Oriented Analysis
- 面向对象设计OOD -- Object Oriented Design
- 面向对象编程OOP -- Object Oriented Programming

### 局部变量和成员变量的区别

- 区别1：代码中位置不同
  > 成员变量：类中方法外定义的变量
  >
  > 局部变量：方法中定义的变量 代码块中定义的变量
- 区别2：代码的作用范围
  > 成员变量：当前类的很多方法
  >
  > 局部变量：当前一个方法（当前代码块）

- 区别3：是否有默认值
  > 成员变量：有
  >
  > 局部变量：没有

- 区别3：是否有默认值
  > 成员变量：有
  >
  > 局部变量：没有

- 区别4：是否要初始化
  > 成员变量：不需要，不建议初始化，后续使用的时候再赋值即可
  >
  > 局部变量：一定需要，不然直接使用的时候报错

- 区别5：内存中位置不同
  > 成员变量：堆内存
  >
  > 局部变量：栈内存

- 区别6：是否有默认值
  > 成员变量：有
  >
  > 局部变量：没有

- 区别7：作用时间不同
  > 成员变量：当前对象从创建到销毁
  >
  > 局部变量：当前方法从开始执行到执行完毕

### 构造器

``` 
public class Person {
    //构造器：没有任何参数的构造器我们叫做：空参构造器--》空构造器
    public Person() {
        /*age = 19;
        name = "lili";
        height = 169.5;*/
    }

    //属性：
    String name;
    int age;
    double height;

    //方法：
    public void eat() {
        System.out.println("我喜欢吃饭");
    }
}
```

``` 
  //创建一个Person类的具体的对象/实例/实体：
  /*
  创建对象的过程：
  1.第一次遇到Person的时候，进行类的加载（只加载一次）
  2.创建对象，为这个对象在堆中开辟空间
  3.为对象进行属性的初始化动作
  new 关键字实际上是在调用一个方法，这个方法叫构造方法（构造器）
  调用构造器的时候，如果你的类中没有写构造器，那么系统会默认给你分配一个构造器，只是我们看不到罢了。
  可以自己显式 的将构造器编写出来：
  构造器的格式：
  [修饰符] 构造器的名字(){
  }
  构造器和方法的区别：
  1.没有方法的返回值类型
  2.方法体内部不能有return语句
  3.构造器的名字很特殊，必须跟类名一样
  构造器的作用：不是为了创建对象，因为在调用构造器之前，这个对象就已经创建好了，并且属性有默认的初始化的值。
  调用构造器的目的是给属性进行赋值操作的。
  注意：我们一般不会在空构造器中进行初始化操作，因为那样的话每个对象的属性就一样了。
  实际上，我们只要保证空构造器的存在就可以了，里面的东西不用写
   */
```

#### 构造器重载

``` 
public class Person {
    //属性：
    String name;
    int age;
    double height;

    //空构造器
    public Person() {
    }

    public Person(String name, int age, double height) {
        //当形参名字和属性名字重名的时候，会出现就近原则：
        //在要表示对象的属性前加上this.来修饰 ，因为this代表的就是你创建的那个对象
        this.name = name;
        this.age = age;
        this.height = height;
    }

    public Person(String a, int b) {
        name = a;
        age = b;
    }

    //方法：
    public void eat() {
        System.out.println("我喜欢吃饭");
    }
}
```

> 1.一般保证空构造器的存在，空构造器中一般不会进行属性的赋值操作
>
> 2.一般我们会重载构造器，在重载的构造器中进行属性赋值操作
>
> 3.在重载构造器以后，假如空构造器忘写了，系统也不会给你分配默认的空构造器了，那么你要调用的话就会出错
>
> 4.当形参名字和属性名字重名的时候，会出现就近原则：在要表示对象的属性前加上this.来修饰 ，因为this代表的就是你创建的那个对象

### 关键字 this static

#### this

> 创建对象的过程：
>
> （1）在第一次遇到一个类的时候，对这个类要进行加载，只加载一次。
>
> （2）创建对象，在堆中开辟空间
>
> （3）对对象进行初始化操作，属性赋值都是默认的初始值。
>
> （4）new关键字调用构造器，执行构造方法，在构造器中对属性重新进行赋值

> this 指代的就是当前对象
---
> this关键字 用法：

- （1）this 可以修饰属性：
  > 当属性名字和形参发生重名的时候，或者属性名字和局部变量重名的时候，会发生就近原则，所以如果直接使用变量名字就指的是离的近的那个形参或者局部变量，这时候如果想要表示属性，在前面要加：this.修饰,

  > 如果不发生重名问题的话，实际上你要是访问属性也可以省略this.

- （2）this 修饰方法：
  > 在同一个类中，方法可以互相调用，this.可以省略不写。
- （3）this 修饰构造器：
  > 同一个类中的构造器可以相互用this调用，注意：this修饰构造器必须放在第一行

#### static

> static可以修饰：属性，方法，代码块，内部类。

> static修饰属性：
>
> （1）在类加载的时候一起加载入方法区中的静态域中
>
> （2）先于对象存在
>
> （3）访问方式： 对象名.属性名 类名.属性名（推荐）

> static修饰属性的应用场景：
>
> 所有对象共用 --> 这个情况下，就可以用static修饰的属性

> 属性：
>
> 静态属性 （类变量）
>
> 非静态属性（实例变量）
---
> static修饰方法

- 1.static和public都是修饰符，并列的没有先后顺序，先写谁后写谁都行
- 2.在静态方法中不能访问非静态的属性
- 3.在静态方法中不能访问非静态的方法
- 4.在静态方法中不能使用this关键字
- 5.非静态的方法可以用对象名.方法名去调用
- 6.静态的方法可以用 对象名.方法名去调用 也可以 用 类名.方法名 （推荐）

### 代码块

> 【1】类的组成：属性，方法，构造器，代码块，内部类

> 【2】代码块分类：普通块，构造块，静态块，同步块（多线程）

``` 
public class Test {
    //属性
    int a;
    static int sa;
    //方法
    public void a(){
        System.out.println("-----a");
        {
            //普通块限制了局部变量的作用范围
            System.out.println("这是普通块");
            System.out.println("----000000");
            int num = 10;
            System.out.println(num);
        }
        
    }
    public static void b(){
        System.out.println("------b");
    }
    //构造块
    {
        System.out.println("------这是构造块");
    }
    //静态块
    static{
        System.out.println("-----这是静态块");
        //在静态块中只能方法：静态属性，静态方法
        System.out.println(sa);
        b();
    }
    //构造器
    public Test(){
        System.out.println("这是空构造器");
    }
    public Test(int a){
        this.a = a;
    }
    //这是一个main方法，是程序的入口：
    public static void main(String[] args) {
        Test t = new Test();
        t.a();
        Test t2 = new Test();
        t2.a();
    }
}
```

**总结**
> 代码块执行顺序：
>
> 最先执行静态块，只在类加载的时候执行一次，所以一般以后实战写项目：创建工厂，数据库的初始化信息都放入静态块。 一般用于执行一些全局性的初始化操作。
>
>再执行构造块，（不常用）
>
> 再执行构造器，
>
> 再执行方法中的普通块。

### 包 import

> **包的作用**： 为了解决重名问题（实际上包对应的就是盘符上的目录） 解决权限问题


> **包名定义**：
> （1）名字全部小写
>
> （2）中间用.隔开
>
> （3）一般都是公司域名倒着写 ： com.jd   com.msb
>
> （4）加上模块名字：com.jd.login    com.jd.register
>
> （5）不能使用系统中的关键字：
>
> （6）包声明的位置一般都在非注释性代码的第一行：


> **导包**：就是为了进行定位

> **总结**：
>
> （1）使用不同包下的类要需要导包： import **.*.*; 例如：import java.util.Date;
>
> （2）在导包以后，使用其他包下同名的类，就必须要手动自己写所在的包。 例如:java.sql.Date(1000L)
>
> （3）同一个包下的类想使用不需要导包，可以直接使用。
>
> （4）在java.lang包下的类，可以直接使用无需导包：
>
> （5）IDEA中导包快捷键：alt+enter, 也可以自己设置自动导包
>
> （6）可以直接导入*：例如:java.util.*;


> 在Java中的导包没有包含和被包含的关系：设置目录平级的格式（不是包含和被包含的显示）

> **静态导入**
>
> 静态导入：
> import static java.lang.Math.*;
>
> 导入：java.lang下的Math类中的所有静态的内容
>
> System.out.println(random());
>
> System.out.println(PI);
>
> System.out.println(round(5.6));
>
> 在静态导入后，同一个类中有相同的方法的时候，会优先走自己定义的方法。

### 面向对象三大特性 : 封装,继承,多态

- 封装(Encapsulation)
  > 程序设计追求“高内聚，低耦合”。
  >
  > 高内聚:类的内部数据操作细节自己完成，不允许外部干涉;
  >
  > 低耦合:仅对外暴露少量的方法用于使用。
  >
  > 隐藏对象内部的复杂性，只对外公开简单的接口。便于外界调用，从而提高系统的可扩展性、可维护性。
  >
  > 封装的好处： 提高代码的安全性

  > 进行封装：
  >
  >（1）将属性私有化，被private修饰 --> 加入权限修饰符,一旦加入了权限修饰符，外部不可以随意的获取这个属性
  >
  > （2）提供public修饰的方法让别人来访问/使用
  >
  > （3）即使外界可以通过方法来访问属性了，但是也不能随意访问，可以加入 限制条件。
  >
  >> 实际开发中，方法一般会写成 setter，getter方法：


- 继承(Inheritance):
  > 继承 就是 is - a 的关系
  >
  > 需要注意的点：父类private修饰的内容，子类实际上也继承，只是因为封装的特性阻碍了直接调用，但是提供了间接调用的方式，可以间接调用。
  >
  > **总结**：
  >
  > （1）继承关系 ：父类/基类/超类 -->  子类/派生类; 子类 extends 父类
  >
  > （2）继承的好处：
  >
  > - > 1.提高了代码的复用性，
  > - > 2.便于代码的扩展
  > - > 3.为了以后多态的使用。是多态的前提。
  >
  > （3）父类private修饰的内容，子类也继承过来了。
  >
  > （4）一个父类可以有多个子类。
  >
  > （5）一个子类只能有一个直接父类。 但是可以间接的继承自其它类。
  >
  > （6）继承具有传递性：Object类是所有类的根基父类。所有的类都直接或者间接的继承自Object。

#### 权限修饰符

>
> 一般属性：用private修饰 ，方法：用public修饰
>
> ![权限修饰符](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/权限修饰符.png)

#### 方法的重写

>
> 重写： 发生在子类和父类中，当子类对父类提供的方法不满意的时候，要对父类的方法进行重写。
>
> 重写格式要求：子类的方法名字和父类必须一致，参数列表（个数，类型，顺序）也要和父类一致。
>
> 重载和重写的区别：
>
> 重载：在同一个类中，当方法名相同，形参列表不同的时候 多个方法构成了重载
>
> 重写：在不同的类中，子类对父类提供的方法不满意的时候，要对父类的方法进行重写。
>
>![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/重载和重写.png)

#### super

> super:指的是： 父类的
>
> super可以修饰属性，可以修饰方法；
>
> 在子类的方法中，可以通过 super.属性 super.方法 的方式，显示的去调用父类提供的属性，方法。在通常情况下，super.可以省略不写：
>
>**在特殊情况下**
>
> 当子类和父类的属性重名时，你要想使用父类的属性，必须加上修饰符super.，只能通过super.属性来调用
>
> 当子类和父类的方法重名时，你要想使用父类的方法，必须加上修饰符super.，只能通过super.方法来调用
>
> 在这种情况下，super.就**不可以省略**不写

> **super修饰构造器**：
>
> 其实我们平时写的构造器的第一行都有：super()  -->作用：调用父类的空构造器，只是我们一般都省略不写
>
>所有构造器的第一行默认情况下都有super()
>
> > 但是一旦你的构造器中显示的使用super调用了父类构造器，那么这个super()就不会给你默认分配了。
> >
> >如果构造器中没有显示的调用父类构造器的话，那么第一行都有super(),可以省略不写
>
> 在构造器中，super调用父类构造器和this调用子类构造器只能存在一个，两者不能共存
>
> 因为super修饰构造器要放在第一行，this修饰构造器也要放在第一行：

#### Object类

> 所有类都直接或间接的继承自Object类，Object类是所有Java类的根基类。
>
> 也就意味着所有的Java对象都拥有Object类的属性和方法。
>
> 如果在类的声明中未使用extends关键字指明其父类，则默认继承Object类。


> toString的作用就是对对象进行“自我介绍”，一般子类对父类提供的toString都不满意，都要进行重写
>
> equals方法: 这个方法提供了对对象的内容是否相等 的一个比较方式，对象的内容指的就是属性。
>
> > 父类Object提供的equals就是在比较==地址，没有实际的意义，我们一般不会直接使用父类提供的方法，而是在子类中对这个方法进行重写。

#### instanceof

>
> a instanceof b
>
> 判断 **a对象** 是否是 **b类** 的实例，如果是返回 true, 如果不是返回 false
>

#### 类和类的关系

- 多态(Polymorphism)
  > 多态跟属性无关，多态指的是方法的多态，而不是属性的多态。

  > 多态就是多种状态：同一个行为，不同的子类表现出来不同的形态。
  >
  > 多态指的就是同一个方法调用，然后由于对象不同会产生不同的行为。

  > **多态的好处**
  >
  > 提高代码的扩展性，符合面向对象的设计原则：开闭原则。
  >
  > 开闭原则：指的就是扩展是 开放的，修改是关闭的。
  >
  > 注意：多态可以提高扩展性，但是扩展性没有达到最好，以后我们会学习 反射

  > **多态的要素**
  >
  > 一，继承：Cat extends Animal ,Pig extends Animal, Dog extends Animal
  >
  > 二，重写：子类对父类的方法shout()重写
  >
  > 三，父类引用指向子类对象：

>
>

``` 
    Animal an = new Pig();
    // 左侧：编译期的类型
    // 右侧：运行期的类型
    
    Pig p = new Pig();
    Animal an = p;      //转型：向上转型
    //加入转型的代码：
    //将Animal转为Pig类型：
    Pig pig = (Pig)an ; //转型：向下转型
```

### final

> **修饰变量**:final修饰一个变量，变量的值不可以改变，这个变量也变成了一个字符常量，约定俗称的规定：名字大写
>
> final修饰引用数据类型，那么地址值就不可以改变

> **修饰方法**；final修饰方法，那么这个方法不可以被该类的子类重写

> **修饰类**:final修饰类，代表没有子类，该类不可以被继承
>
> 一旦一个类被final修饰，那么里面的方法也没有必要用final修饰了（final可以省略不写）

> 案例:JDK提供的Math类
>
> Math类没有子类，不能被其他类继承
>
> 里面的属性全部被final修饰，方法也是被final修饰的，只是省略不写了,原因：子类没有必要进行重写。
>
> 外界不可以创建对象:构造器被私有化(private)
>
> Math类中的所有的属性，方法都被static修饰,不用创建对象去调用，只能通过类名.属性名 类名.方法名 去调用

### 抽象类，抽象方法

> **抽象类作用**：在抽象类中定义抽象方法，目的是为了为子类提供一个通用的模板，子类可以在模板的基础上进行开发，先重写父类的抽象方法，然后可以扩展子类自己的内容。抽象类设计避免了子类设计的随意性，通过抽象类，子类的设计变得更加严格，进行某些程度上的限制。 使子类更加的通用。

- 一个方法的方法体去掉，然后被abstract修饰，那么这个方法就变成了一个抽象方法
- 一个类中如果有方法是抽象方法，那么这个类也要变成一个抽象类。
- 一个抽象类中可以有0-n个抽象方法
- 抽象类可以被其他类继承
- 一个类继承一个抽象类，那么这个类可以变成抽象类
- 一般子类不会加abstract修饰，一般会让子类重写父类中的抽象方法
- 子类继承抽象类，就必须重写全部的抽象方法
- 子类如果没有重写父类全部的抽象方法，那么子类也可以变成一个抽象类。
- 抽象类不可以创建对象
- 多态的写法：父类引用指向子类对象

**面试题**：

> （1）抽象类不能创建对象，那么抽象类中是否有构造器？
>
> 抽象类中一定有构造器。构造器的作用 给子类初始化对象的时候要先super调用父类的构造器。

> （2）抽象类是否可以被final修饰？
>
> 不能被final修饰，因为抽象类设计的初衷就是给子类继承用的。要是被final修饰了这个抽象类了，就不存在继承了，就没有子类。

### 接口

> 接口声明格式

```
[访问修饰符]  interface 接口名   [extends  父接口1，父接口2…]  {
         常量定义；       
         方法定义；
}
```

- 1.类是类，接口是接口，它们是同一层次的概念。
- 2.接口中没有构造器
- 3.接口如何声明：interface
- 4.在JDK1.8之前，接口中只有两部分内容：
  > 1）常量：固定修饰符：public static final
  >
  > 2）抽象方法：固定修饰符：public abstract
  >
  > 注意：修饰符可以省略不写
- 5.类和接口的关系是什么？ 实现关系 类实现接口 implements
- 6.一旦实现一个接口，那么实现类要重写接口中的全部的抽象方法
- 7.如果没有全部重写抽象方法，那么这个类可以变成一个抽象类
- 8.java只有单继承，java还有多实现
- 9.写法：先继承 再实现
- 10.接口不能创建对象
- 11.接口指向实现类 --->多态
- 12.接口中常量如何访问 : 接口.常量名

> 接口的作用是什么？
>
> 定义规则，只是跟抽象类不同地方在哪？它是接口不是类。
>
> 接口定义好规则之后，实现类负责实现即可。

> 继承：子类对父类的继承 | “is-a”的关系
>
> 实现：实现类对接口的实现 | “has-a”的关系

> 多态的应用场合：
>
> （1）父类当做方法的形参，传入具体的子类的对象
>
> （2）父类当做方法的返回值，返回的是具体的子类的对象
>
> （3）接口当做方法的形参，传入具体的实现类的对象
>
> （4）接口当做方法的返回值，返回的是具体的实现类的对象

> 接口和抽象类的区别

> **抽象类**:
> - 1、抽象类使用abstract修饰;
> - 2、抽象类不能实例化，即不能使用new关键字来实例化对象;
> - 3、含有抽象方法（使用abstract关键字修饰的方法)的类是抽象类，必须使用abstract关键字修饰;
> - 4、抽象类可以含有抽象方法，也可以不包含抽象方法，抽象类中可以有具体的方法;
> - 5、如果一个子类实现了父类(抽象类)的所有抽象方法，那么该子类可以不必是抽象类，否则就是抽象类;
> - 6、抽象类中的抽象方法只有方法体，没有具体实现;
>
> **接口**
>
> - 1、接口使用interface修饰;
> - 2、接口不能被实例化;
> - 3、一个类只能继承一个类，但是可以实现多个接口;
> - 4、接口中方法均为抽象方法;
> - 5、接口中不能包含实例域或静态方法(静态方法必须实现，接口中方法是抽象方法，不能实现)

### 内部类

- 成员内部类
	- 非静态的成员内部类
	- 静态成员内部类
- 局部内部类
	- 匿名内部类

---

> 成员内部类

``` 
  /**
 * 1.类的组成：属性，方法，构造器，代码块（普通块，静态块，构造块，同步块），内部类
 * 2.一个类TestOuter的内部的类SubTest叫内部类， 内部类 ：SubTest  外部类：TestOuter
 * 3.内部类：成员内部类 (静态的，非静态的) 和  局部内部类（位置：方法内，块内，构造器内）
 * 4.成员内部类:
 *      里面属性，方法，构造器等
 *      修饰符：private，default，protect，public，final,abstract
 */
public class TestOuter {
    //非静态的成员内部类：
    public class D{
        int age = 20;
        String name;
        public void method(){
            //5.内部类可以访问外部类的内容
            /*System.out.println(age);
            a();*/
            int age = 30;
            //8.内部类和外部类属性重名的时候，如何进行调用：
            System.out.println(age);//30
            System.out.println(this.age);//20
            System.out.println(TestOuter.this.age);//10
        }
    }
    //静态成员内部类：
    static class E{
        public void method(){
            //6.静态内部类中只能访问外部类中被static修饰的内容
            /*System.out.println(age);
            a();*/
        }
    }
    //属性：
    int age = 10;
    //方法：
    public void a(){
        System.out.println("这是a方法");
        {
            System.out.println("这是一个普通块");
            class B{
            }
        }
        class A{
        }
        //7.外部类想要访问内部类的东西，需要创建内部类的对象然后进行调用
        D d = new D();
        System.out.println(d.name);
        d.method();
    }
    static{
        System.out.println("这是静态块");
    }
    {
        System.out.println("这是构造块");
    }
    //构造器：
    public TestOuter(){
        class C{
        }
    }
    public TestOuter(int age) {
        this.age = age;
    }
}
class Demo{
    //这是一个main方法，是程序的入口：
    public static void main(String[] args) {
        //创建外部类的对象：
        TestOuter to = new TestOuter();
        to.a();
        //9.创建内部类的对象：
        //静态的成员内部类创建对象：
        TestOuter.E e = new TestOuter.E();
        //非静态的成员内部类创建对象：
        //错误：TestOuter.D d = new TestOuter.D();
        TestOuter t = new TestOuter();
        TestOuter.D d = t.new D();
    }
}    
```

---

> 局部内部类

``` 
public class TestOuter {
    //1.在局部内部类中访问到的变量必须是被final修饰的
    public void method(){
        final int num = 10;
        class A{
            public void a(){
                //num = 20;
                System.out.println(num);
            }
        }
    }
    //2.如果类B在整个项目中只使用一次，那么就没有必要单独创建一个B类，使用内部类就可以了
    public Comparable method2(){
        class B implements Comparable{
            @Override
            public int compareTo(Object o) {
                return 100;
            }
        }
        return new B();
    }
    public Comparable method3(){
        //3.匿名内部类
        return new Comparable(){
            @Override
            public int compareTo(Object o) {
                return 200;
            }
        };
    }
    public void teat(){
        Comparable com = new Comparable(){
            @Override
            public int compareTo(Object o) {
                return 200;
            }
        };
        System.out.println(com.compareTo("abc"));
    }
}
```

## 异常

> “异常三连” try-catch-finally

> 捕获异常： try-catch

> 原理：
>
> 把可能出现异常的代码放入try代码块中，然后将异常封装为对象，被catch后面的()中的那个异常对象接收
>
> 接收以后：执行catch后面的{}里面的代码，然后try-catch后面的代码，该怎么执行就怎么执行。

> 详细说一下：
>
> （1）try中没有异常，catch中代码不执行。
>
> （2）try中有异常，catch进行捕获：
> - 如果catch中异常类型和你出的异常类型匹配的话：走catch中的代码 > 进行捕获
> - 如果catch中异常类型和你出的异常类型不匹配的话：不走catch中的代码 >没有捕获成功，程序相当于遇到异常了，中断了，后续代码不执行

> 注意：
>
> （1）try中如果出现异常，然后用catch捕获成功的话，那么try中后续的代码是不会执行的。
>
> （2）如果catch捕获异常成功，那么try-catch后面的代码该执行还是执行没有影响。

### catch中如何处理异常

> catch(Exception ex)
>
> 第一种处理：什么都不写，什么都不做
>
> 第二种处理：输出自定义异常信息
>
> System.out.println("对不起，你的代码有问题！");
>
> 第三种处理：打印异常信息：
>
> (1) 调用toString方法，显示异常的类名（全限定路径）
>
> System.out.println(ex);
>
> System.out.println(ex.toString());
>
> (2) 显示异常描述信息对应的字符串，如果没有就显示null
>
> System.out.println(ex.getMessage());
>
> (3) 显示异常的堆栈信息：将异常信息捕获以后，在控制台将异常的效果给我们展示出来，方便我们查看异常
>
> ex.printStackTrace();
>
> 第四种处理：抛出异常：
>
> throw ex;

### try-catch-finally

【1】在什么情况下，try-catch后面的代码不执行？

- （1）throw抛出异常的情况
- （2）catch中没有正常的进行异常捕获
- （3）在try中遇到return

【2】怎么样才可以将 try-catch后面的代码必须执行？

- 只要将必须执行的代码放入finally中，那么这个代码无论如何一定执行。

【3】return和finally执行顺序？

- 先执行finally最后执行return

【4】什么代码会放在finally中呢？

- 关闭数据库资源，关闭IO流资源，关闭socket资源。

【5】有一句话代码很厉害，它可以让finally中代码不执行!

- System.exit(0); 终止当前的虚拟机执行

### 多重catch

【1】try中出现异常以后，将异常类型跟catch后面的类型依次比较，按照代码的顺序进行比对，执行第一个与异常类型匹配的catch语句

【2】一旦执行其中一条catch语句之后，后面的catch语句就会被忽略了！

【3】在安排catch语句的顺序的时候，一般会将特殊异常放在前面（并列），一般化的异常放在后面。 先写子类异常，再写父类异常。

【4】在JDK1.7以后，异常新处理方式：可以并列用|符号连接：

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221116215154.png)

### 异常的分类

- Object
	- Throwable
		- Error
		- Exception
			- 检查异常
				- IllegalAccessException
				- ClassNotFoundException
				- InstantiationException
			- 运行时异常
				- NullPinterException
				- ArraylndexOutOfBoundsException

### throw 和 throws 的区别

- 位置不同：
	- throw：方法内部
	- throws: 方法的签名处，方法的声明处

- 内容不同：
	- throw+异常对象（检查异常，运行时异常）
	- throws+异常的类型（可以多个类型，用，拼接）

- 作用不同：
	- throw：异常出现的源头，制造异常。
	- throws:在方法的声明处，告诉方法的调用者，这个方法中可能会出现我声明的这些异常。

### 重载和重写的异常

![](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221116221016.png)

### 自定义异常

- 自定义的异常可以继承：运行时异常

> 如果继承的是运行时异常，那么在使用的时候无需额外处理

``` 
public class MyException extends RuntimeException {
    
    static final long serialVersionUID = -70348971907L;
    
    public MyException(){
    }
    public MyException(String msg){
        super(msg);
    }
}
```

- 也可以继承检查异常：

> 如果继承的是检查异常，那么使用的时候需要try-catch捕获或者throws向上抛

``` 
public class MyException extends Exception {
    static final long serialVersionUID = -70348971907L;
    public MyException(){
    }
    public MyException(String msg){
        super(msg);
    }
}

```

## 常用类

### 包装类

- 自动装箱 自动拆箱 是从JDK1.5以后新出的特性
- 自动装箱 自动拆箱 ：将基本数据类型和包装类进行快速的类型转换。

### 日期相关类

#### java.util.Date

``` 
//java.util.Date:
Date d = new Date();
System.out.println(d.toGMTString());//过期方法，过时方法，废弃方法。
System.out.println(d.toLocaleString());
System.out.println(d.getYear());//120+1900=2020
System.out.println(d.getMonth());//5 :返回的值在 0 和 11 之间，值 0 表示 1 月。
//返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。
System.out.println(d.getTime());//1592055964263
System.out.println(System.currentTimeMillis());
/*
（1）疑问：以后获取时间差用：getTime()还是currentTimeMillis()
答案：currentTimeMillis()-->因为这个方法是静态的，可以类名.方法名直接调用
（2）public static native long currentTimeMillis();
本地方法
为什么没有方法体？因为这个方法的具体实现不是通过java写的。
（3）这个方法的作用：
一般会去衡量一些算法所用的时间
 */
```

#### java.sql.Date

``` 
//java.sql.Date:
Date d = new Date(1592055964263L);
System.out.println(d);
/*
(1)java.sql.Date和java.util.Date的区别：
java.util.Date：年月日  时分秒
java.sql.Date：年月日
(2)java.sql.Date和java.util.Date的联系：
java.sql.Date(子类) extends java.util.Date （父类）
 */
//java.sql.Date和java.util.Date相互转换：
//【1】util--->sql:
java.util.Date date = new Date(1592055964263L);//创建util.Date的对象
//方式1：向下转型
Date date1 = (Date) date;
/*
父类：Animal 子类：Dog
Animal an = new Dog();
Dog d = (Dog)an;
 */
//方式2：利用构造器
Date date2 = new Date(date.getTime());
//【2】sql-->util:
java.util.Date date3 = d;
//[3]String--->sql.Date:
Date date4 =  Date.valueOf("2019-3-8");
```

#### SimpleDateFormat

- String---java.util.Date 类型转换

>
> 分解：
> - String--->java.sql.Date
> - java.sql.Date--->java.util.Date

``` 
//（1）String--->java.sql.Date
java.sql.Date date = java.sql.Date.valueOf("2015-9-24");
//（2）java.sql.Date--->java.util.Date
java.util.Date date2 = date;
System.out.println(date2.toString());
```

> 字符串的格式只能是年-月-日拼接的形式，换成其它类型，就会出现异常

- 引入 SimpleDateFormat

``` 
//日期转换：
//SimpleDateFormat(子类) extends DateFormat（父类是一个抽象类）
//格式化的标准已经定义好了：
DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String--->Date
try {
	Date d = df.parse("2019-4-6 12:23:54");
	System.out.println(d);
} catch (ParseException e) {
	e.printStackTrace();
}
//Date--->String
String format = df.format(new Date());
System.out.println(format);
Date date = new Date();
```

![日期格式](https://raw.githubusercontent.com/jiachunxu/Pic/main/imgs/20221116223043.png)

#### Calendar

``` 
//Calendar是一个抽象类，不可以直接创建对象
//GregorianCalendar()子类 extends Calendar（父类是一个抽象类）
Calendar cal = new GregorianCalendar();
Calendar cal2 = Calendar.getInstance();
System.out.println(cal);
//常用的方法：
// get方法，传入参数：Calendar中定义的常量
System.out.println(cal.get(Calendar.YEAR));
System.out.println(cal.get(Calendar.MONTH));
System.out.println(cal.get(Calendar.DATE));
System.out.println(cal.get(Calendar.DAY_OF_WEEK));
System.out.println(cal.getActualMaximum(Calendar.DATE));//获取当月日期的最大天数
System.out.println(cal.getActualMinimum(Calendar.DATE));//获取当月日期的最小天数
// set方法：可以改变Calendar中的内容
cal.set(Calendar.YEAR,1990);
cal.set(Calendar.MONTH,3);
cal.set(Calendar.DATE,16);
System.out.println(cal);
//String--->Calendar:
//分解：
//String--->java.sql.Date:
java.sql.Date date = java.sql.Date.valueOf("2020-4-5");
//java.sql.Date-->Calendar:
cal.setTime(date);
System.out.println(cal);
```

#### LocalDate/LocalTime/LocalDateTime JDK1.8新增

``` 
//1.完成实例化：
//方法1：now()--获取当前的日期，时间，日期+时间
LocalDate localDate = LocalDate.now();
System.out.println(localDate);
LocalTime localTime = LocalTime.now();
System.out.println(localTime);
LocalDateTime localDateTime = LocalDateTime.now();
System.out.println(localDateTime);
//方法2：of()--设置指定的日期，时间，日期+时间
LocalDate of = LocalDate.of(2010, 5, 6);
System.out.println(of);
LocalTime of1 = LocalTime.of(12, 35, 56);
System.out.println(of1);
LocalDateTime of2 = LocalDateTime.of(1890, 12, 23, 13, 24, 15);
System.out.println(of2);
//LocalDate,LocalTime用的不如LocalDateTime多
//下面讲解用LocalDateTime：
//一些列常用的get***
System.out.println(localDateTime.getYear());//2020
System.out.println(localDateTime.getMonth());//JUNE
System.out.println(localDateTime.getMonthValue());//6
System.out.println(localDateTime.getDayOfMonth());//14
System.out.println(localDateTime.getDayOfWeek());//SUNDAY
System.out.println(localDateTime.getHour());//22
System.out.println(localDateTime.getMinute());//22
System.out.println(localDateTime.getSecond());//6
//不是set方法，叫with
//体会：不可变性
LocalDateTime localDateTime2 = localDateTime.withMonth(8);
System.out.println(localDateTime);
System.out.println(localDateTime2);
//提供了加减的操作：
//加：
LocalDateTime localDateTime1 = localDateTime.plusMonths(4);
System.out.println(localDateTime);
System.out.println(localDateTime1);
//减：
LocalDateTime localDateTime3 = localDateTime.minusMonths(5);
System.out.println(localDateTime);
System.out.println(localDateTime3);
```

#### DateTimeFormatter

- 重点

``` 
//自定义的格式。如: ofPattern( "yyyy-MM-dd hh:mm:ss") ---》重点，以后常用
DateTimeFormatter df3 = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
//LocalDateTime-->String:
LocalDateTime now2 = LocalDateTime.now();
String format = df3.format(now2);
System.out.println(format);//2020-06-15 03:22:03
//String--->LocalDateTime
TemporalAccessor parse2 = df3.parse("2020-06-15 03:22:03");
System.out.println(parse2);
```

- 演示

``` 
//格式化类：DateTimeFormatter
//方式一:预定义的标准格式。如: ISO_LOCAL_DATE_TIME;ISO_LOCAL_DATE;IS0_LOCAL_TIME
DateTimeFormatter df1 = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
//df1就可以帮我们完成LocalDateTime和String之间的相互转换：
//LocalDateTime-->String:
LocalDateTime now = LocalDateTime.now();
String str = df1.format(now);
System.out.println(str);//2020-06-15T15:02:51.29
//String--->LocalDateTime
TemporalAccessor parse = df1.parse("2020-06-15T15:02:51.29");
System.out.println(parse);
//方式二:本地化相关的格式。如: oflocalizedDateTime()
//参数：FormatStyle.LONG / FormatStyle.MEDIUM / FormatStyle.SHORT
//FormatStyle.LONG :2020年6月15日 下午03时17分13秒
//FormatStyle.MEDIUM: 2020-6-15 15:17:42
//FormatStyle.SHORT:20-6-15 下午3:18
DateTimeFormatter df2 = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT);
//LocalDateTime-->String:
LocalDateTime now1 = LocalDateTime.now();
String str2 = df2.format(now1);
System.out.println(str2);
//String--->LocalDateTime
TemporalAccessor parse1 = df2.parse("20-6-15 下午3:18");
System.out.println(parse1);
```

#### Math类

- 直接使用，无需导包
- final修饰类，这个类不能被继承
- 构造器私有化，不能创建Math类的对象
- Math内部的所有的属性，方法都被static修饰：类名.直接调用，无需创建对象

```
//常用属性：
System.out.println(Math.PI);//π
//常用方法：
System.out.println("随机数："+Math.random());//[0.0,1.0)
System.out.println("绝对值："+Math.abs(-80));
System.out.println("向上取值："+Math.ceil(9.1));
System.out.println("向下取值："+Math.floor(9.9));
System.out.println("四舍五入："+Math.round(3.5));
System.out.println("取大的那个值："+Math.max(3, 6));
System.out.println("取小的那个值："+Math.min(3, 6));
```

#### Random类

```
//返回带正号的 double 值，该值大于等于 0.0 且小于 1.0。
System.out.println("随机数："+Math.random());
//学习Random类
//（1）利用带参数的构造器创建对象：
Random r1 = new Random(System.currentTimeMillis());
int i = r1.nextInt();
System.out.println(i);
//（2）利用空参构造器创建对象：
Random r2 = new Random();//表面是在调用无参数构造器，实际底层还是调用了带参构造器
System.out.println(r2.nextInt(10));//在 0（包括）和指定值（不包括）之间均匀分布的 int 值。
System.out.println(r2.nextDouble());//在 0.0 和 1.0 之间均匀分布的 double 值。
```

#### String类

- 直接使用，无需导包
- String类不可以被继承，不能有子类
- 字符串是不可变的
- String底层是一个char类型的数组

> 构造器：底层就是给对象底层的value数组进行赋值操作

```
//通过构造器来创建对象：
String s1 = new String();
String s2 = new String("abc");
String s3 = new String(new char[]{'a','b','c'});
```

> 常用方法

```
String s4 = "abc";
System.out.println("字符串的长度为："+s4.length());
String s5 = new String("abc");
System.out.println("字符串是否为空："+s5.isEmpty());
System.out.println("获取字符串的下标对应的字符为："+s5.charAt(1));
//字符串的截取：
String s10 = "abcdefhijk";
System.out.println(s10.substring(3));
System.out.println(s10.substring(3, 6));//[3,6)
//字符串的合并/拼接操作：
System.out.println(s10.concat("pppp"));
//字符串中的字符的替换：
String s11 = "abcdeahija";
System.out.println(s11.replace('a', 'u'));
//按照指定的字符串进行分裂为数组的形式：
String s12 = "a-b-c-d-e-f";
String[] strs = s12.split("-");
System.out.println(Arrays.toString(strs));
//转大小写的方法：
String s13 = "abc";
System.out.println(s13.toUpperCase());
System.out.println(s13.toUpperCase().toLowerCase());
//去除收尾空格：
String s14 = "    a  b  c    ";
System.out.println(s14.trim());
//toString()
String s15 = "abc";
System.out.println(s15.toString());
//转换为String类型：
System.out.println(String.valueOf(false));
```

> equals方法

```
String s6 = new String("abc");
String s7 = new String("abc");
System.out.println(s6.equals(s7));//true
```

> compareTo方法

```
String s8 = new String("abc");
String s9 = new String("abc");
System.out.println(s8.compareTo(s9));//0
```

#### StringBuilder，StringBuffer

```
//创建StringBuilder的对象：
StringBuilder sb3 = new StringBuilder();
//表面上调用StringBuilder的空构造器，实际底层是对value数组进行初始化，长度为16
StringBuilder sb2 = new StringBuilder(3);
//表面上调用StringBuilder的有参构造器，传入一个int类型的数，实际底层就是对value数组进行初始化，长度为你传入的数字
StringBuilder sb = new StringBuilder("abc");
System.out.println(sb.append("def").append("aaaaaaaa").append("bbb").append("ooooooo").toString());;
//链式调用方式：return this
```
# 泛型(Generic)
- JDK1.5以后
- 泛型实际就是 一个<>引起来的 参数类型，这个参数类型  具体在使用的时候才会确定具体的类型。
- 使用了泛型以后，可以确定集合中存放数据的类型，在编译时期就可以检查出来。
- 使用泛型你可能觉得麻烦，实际使用了泛型才会简单，后续的遍历等操作简单。
- 泛型的类型：都是引用数据类型，不能是基本数据类型。
- ArrayList<Integer> al = new ArrayList<Integer>();
- 在JDK1.7以后可以写为：ArrayList<Integer> al = new ArrayList<>();  
- <>   钻石运算符

## 泛型方法
> 方法的泛型的参数类型要和当前的类的泛型无关

> 泛型方法对应的那个泛型参数类型和当前所在的这个类是否是泛型类，泛型是啥无关

> 泛型方法定义的时候，前面要加上<T>

> 原因：如果不加的话，会把T当做一种数据类型，然而代码中没有T类型那么就会报错

> T的类型是在调用方法的时候确定的

> 泛型方法可以是静态方法

## 泛型参数存在继承的情况
> A和B是子类父类的关系，但是`G<A>`和`G<B>`不存在继承关系的。是并列关系。

## 泛型参数通配符
>  A 和 B是子类父类的关系，`G<A>`和`G<B>`不存在子类父类关系，是并列的

> 加入通配符？后，`G<?>`就变成了 `G<A>`和`G<B>`的父类

> 不能随意添加数据
```
ArrayList<?> objects = new ArrayList<>();
objects.add(12);//报错
```
## 泛型受限
- 泛型的上限
  > List<? extends Person> 相当于 List<? extends Person>是List<Person>的父类，是List<Person的子类>的父类


- 泛型的下限
  >List<? super Person> 相当于 List<? super Person>是List<Person>的父类，是List<Person的父类>的父类


# 集合

- Collection
	- List
		- ArrayList
		- LinkedList
	- Set
		- HashSet
		- TreeSet

- Map
	- HashMap
	- TreeMap

## Collection集合的遍历

```
public static void main(String[] args) {
    Collection col = new ArrayList();
    col.add(18);
    col.add(12);
    col.add(11);
    col.add(17);
    col.add("abc");
    col.add(9.8);
    //对集合遍历（对集合中元素进行查看）
    //方式1：普通for循环
    /*for(int i= 0;i<col.size();i++){
        col.get(i);
    }*/
    //方式2：增强for循环
    for(Object o:col){
        System.out.println(o);
    }
    System.out.println("------------------------");
    //方式3：iterator()
    Iterator it = col.iterator();
    while(it.hasNext()){
        System.out.println(it.next());
    }
}
```

### List接口

- ArrayList
- Vector
- LinkedList


### Set 接口
- HashSet
- LinkedHashSet

## Map 接口
- HashMap
- TreeMap






















