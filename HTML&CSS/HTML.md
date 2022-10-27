## HTML的标准结构

```html

<html lang="zh-CN">
<head>
    <title>标题</title>
</head>
<body>
    第一个html....
</body>
</html>
```

## HTML的标签

|标签|作用|
|---|---|
|`<html> </html>` |定义 HTML 文档 |
|`<head> </head>` | 定义文档的头部 |
|`<body> </body>` | 用户可以看到的内容 |

## head中可用标签

```html

<html lang="zh-CN">
<!--
        head标签中：放入：页面的配置信息
        head标签中可以加入：
        <title>、<meta>、<link>、<style>、 <script>、 <base>。
-->
<head>
    <!--页面标题-->
    <title>百度一下，你就知道</title>
    <!--设置页面的编码，防止乱码现象
            利用meta标签，
            charset="utf-8" 这是属性，以键值对的形式给出  k=v a=b 
            告诉浏览器用utf-8来解析这个html文档
    -->
    <meta charset="utf-8"/><!--简写-->
    <!--繁写形式：（了解）-->
    <!--<meta http-equiv="content-type" content="text/html;charset=utf-8" />-->
    <!--页面刷新效果-->
    <!--<meta http-equiv="refresh" content="3;https://www.baidu.com" />-->
    <!--页面作者-->
    <meta name="author" content="msb;213412@qq.com"/>
    <!--设置页面搜索的关键字-->
    <meta name="keywords" content="马士兵教育;线上培训;架构师课程"/>
    <!--页面描述-->
    <meta name="description" content="马士兵教育详情页"/>
    <!--link标签引入外部资源-->
    <link rel="shortcut icon" href="https://www.baidu.com/favicon.ico" type="image/x-icon"/>
</head>
<!--
        body标签中：放入：页面展示的内容
-->
<body>
    this is a html...你好
</body>
</html>
```

## body中可用标签

### 文本标签

```html

<body>
    <!--文本标签-->
    <!--下面的文字就是普通的文本，文本编辑器中的任何效果：比如空格，换行 都不影响页面，
            页面想要实现效果 必须通过标签来实现
    -->
    媒体：为人父母，要不要“持证上岗”？
    <!--标题标签
        h1-h6  字号逐渐变小，每个标题独占一行，自带换行效果
        h7之后都属于无效标签，但是浏览器也不会报错，而是以普通文本的形式进行展现
    -->
    <h1>媒体：为人父母，要不要“持证上岗”？</h1>
    <!--横线标签
        width:设置宽度
        300px ：固定宽度
        30%：页面宽度的百分比，会随着页面宽度的变化而变化
        align：设置位置  left ,center,right    默认不写的话就是center居中效果
    -->
    <hr width="300px" align="center"/>
    <hr width="30%" align="center"/>

    <!--段落标签：
    段落效果：段落中文字自动换行，段落和段落之间有空行
    -->
    <p></p>
    <!--加粗倾斜下划线-->
    <b>加粗</b>
    <i>倾斜</i>
    <u>下划线</u>
    <i><u><b>加粗倾斜下划线</b></u></i>
    <!--一箭穿心-->
    <del>你好 你不好</del>
    <!--预编译标签：在页面上显示原样效果-->
    <pre>
            public static void main(String[] args){
                    System.out.println("hello msb....");
            }
        </pre>
    <!--换行-->
    5月26日，“建议父母持合格父母证上岗”冲上微博<br/>热搜，迅速引发热议。在正在召开的全国两会上，全国政
    <!--字体标签-->
    <font color="#397655" size="7" face="萝莉体 第二版">建议父母持合格父母证上岗</font>

</body>

```

### 实体字符

![](imgs/实体字符.png)

### 多媒体标签

```html

<body>
    <!--图片
    src:引入图片的位置
            引入本地资源
            引入网络资源
    width:设置宽度
    height:设置高度
    注意:一般高度和宽度只设置一个即可，另一个会按照比例自动适应
    title:鼠标悬浮在图片上的时候的提示语，默认情况下（没有设置alt属性） 图片如果加载失败那么提示语也是title的内容
    alt:图片加载失败的提示语
    -->
    <!-- 现在已经不建议使用 <embed> 标签了，可以使用 <img>、<iframe>、<video>、<audio> 等标签代替。 -->
    <img src="https://static.runoob.com/images/runoob-logo.png" width="300px" title="这是一个美女小姐姐" alt="图片加载失败"/>
    <embed type="image/jpg" src="https://static.runoob.com/images/runoob-logo.png" width="258" height="39">

    <!--音频-->
    <!-- <embed> 标签是 HTML 5 中的新标签。-->
    <!--        <embed src="music/我要你.mp3"></embed>-->

    <br/>
    <!--视频-->
    <embed type="video/webm" src="https://www.runoob.com/try/demo_source/movie.mp4" width="400" height="300">
    <embed src="https://www.runoob.com/try/demo_source/movie.mp4" width="400" height="300"
    "></embed>
</body>

```

### 超链接

```html

<body>
    <!--超链接标签：作用：实现页面的跳转功能
        href:控制跳转的目标位置
        target:_self 在自身页面打开 （默认效果也是在自身页面打开）    _blank 在空白页面打开
    -->
    <a href="https://www.baidu.com" target="_self">这是一个超链接04</a>
    <a href="https://www.baidu.com" target="_blank">这是一个超链接05</a>

    <a href="https://www.baidu.com" target="_blank">
        <img src="https://static.runoob.com/images/runoob-logo.png" alt="失败显示"/>
    </a>
</body>

```

#### 设置锚点

```html

<body>
    <a name="1F"></a>
    <h1>手机</h1>
    <p>华为p40</p>
    <p>华为p40</p>
    <a name="2F"></a>
    <h1>化妆品</h1>
    <p>大宝</p>
    <p>大宝</p>
    <a name="3F"></a>
    <h1>母婴产品</h1>
    <p>奶粉</p>
    <p>奶粉</p>
    <a name="4F"></a>
    <h1>图书</h1>
    <p>thinking in java</p>
    <p>thinking in java</p>
    <a href="#1F">手机</a>
    <a href="#2F">化妆品</a>
    <a href="#3F">母婴产品</a>
    <a href="#4F">书籍</a>
</body>

```

**设置锚点**

```html

<body>
    <a href="设置锚点.html#3F">超链接</a>
</body>

```

### 列表标签

```html

<body>
    <!--无序列表:
            type:可以设置列表前图标的样式   type="square"
            如果想要更换图标样式，需要借助css技术： style="list-style:url(img/act.jpg) ;"
    -->
    <h1>起床以后需要做的事</h1>
    <ul type="square">
        <li>睁眼</li>
        <li>穿衣服</li>
        <li>上厕所</li>
        <li>吃早饭</li>
        <li>洗漱</li>
        <li>出门</li>
    </ul>
    <!--有序列表:
            type:可以设置列表的标号：1,a,A,i,I
            start:设置起始标号
    -->
    <h1>学习java的顺序</h1>
    <ol type="A" start="3">
        <li>JavaSE</li>
        <li>ORACLE</li>
        <li>MYSQL</li>
        <li>HTML</li>
        <li>CSS</li>
        <li>JS</li>
    </ol>

</body>


```

### 表格标签

```html

<body>
    <!--表格：4行4列
        table:表格
        tr:行
        td:单元格
        th:特殊单元格：表头效果：加粗，居中
        默认情况下表格是没有边框的，通过属性来增加表框：
        border:设置边框大小
        cellspacing：设置单元格和边框之间的空隙
        align="center"  设置居中
        background 设置背景图片 background="img/ss.jpg"
        bgcolor :设置背景颜色
        rowspan:行合并
        colspan：列合并
    -->
    <table border="1px" cellspacing="0px" width="400px"
    " bgcolor="darkseagreen">
    <tr bgcolor="bisque">
        <th>学号</th>
        <th>姓名</th>
        <th>年纪</th>
        <th>成绩</th>
    </tr>
    <tr>
        <td align="center">1001</td>
        <td>丽丽</td>
        <td>19</td>
        <td rowspan="3">90.5</td>
    </tr>
    <tr>
        <td colspan="2" align="center">2006</td>
        <td>30</td>
    </tr>
    <tr>
        <td>3007</td>
        <td>小明</td>
        <td>18</td>
    </tr>
    </table>
</body>
```

### 框架标签

#### 内嵌框架

```html

<iframe src=" URL "></iframe>

<iframe src="书籍导航页面.html" height="700px" width="30%"></iframe>
<!--内嵌框架-->
<iframe name="iframe_my" width="67%" height="700px" src="img/think in java.jpg"></iframe>
```

#### 框架集合

> frameset 元素可定义一个框架集。它被用来组织多个窗口（框架）。每个框架存有独立的文档。在其最简单的应用中，frameset 元素仅仅会规定在框架集中存在多少列或多少行。您必须使用 cols 或 rows 属性。 里面如果只有一个框架用frame标签,如果多个框架用frameset标签,用cols 或 rows进行行，列的切割
>

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<!--框架集合：和body是并列的概念，不要将框架集合放入body中-->
<frameset rows="20%,*,30%">
    <frame/>
    <frameset cols="30%,40%,*">
        <frame/>
        <frame src="index.html"/>
        <frame/>
    </frameset>
    <frameset cols="50%,*">
        <frame/>
        <frame/>
    </frameset>
</frameset>
</html>
```

### form表单

       