# HTML 

> HTML 全称是 Hypertext Markup Language(超文本标记语言)

## 标签

HTML 通过一系列的`标签（元素）`来定义文本、图像、链接

`标签`是由尖括号包围的关键字

`标签`通常成对存在，包括**开始标签**和**结束标签**（也称为**双标签**），内容位于这两个标签之间：

```html
<p> 这是一个段落 </p>
<h1> 这是一个标题 </h1>
<a href="#">这是一个超链接</a>
```

除了双标签，也存在单标签，如：

```html
<input type="text">
<br>    换行
<hr>	分割线
```

> 单标签用于没有内容的元素，双标签用于有内容的元素

## 文件结构

```html
<!--这里放置文档的元信息-->
<!DOCTYPE html>  告诉浏览器这是html
<html>	文档起始点 最外层容器
    <head>
        
    </head>
    <body>
        
    </body>
</html>
```
## 常用文本标签

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html练习</title>
</head>
<body>
    <h1>一级标题标签</h1>
    <h2>二级标题标签</h2>
    <h3>三级标题标签</h3>
    <h4>四级标题标签</h4>
    <h5>五级标题标签</h5>
    <h6>六级标题标签</h6>
    <p>这是一个段落标签</p>
    <p>更改文本样式：<b>文本加粗</b>
                    <i>斜体</i>
                    <u>下划线</u>
                    <s>删除线</s>
    </p>
    <!--以下为无序列表，包裹着几个li 标签-->
    <ul>
        <li>无序列表元素1</li>
        <li>无序列表元素2</li>
        <li>无序列表元素3</li>
    </ul>
    <!--以下为有序列表，包裹着几个li 标签-->
    <ol>
        <li>有序列表元素1</li>
        <li>有序列表元素2</li>
        <li>有序列表元素3</li>
    </ol>
     <!--以下为表格标签-->
     <table border="1"><!--border是table标签的属性-->
        <!--行标签用tr表示，table row-->
             <!--列标题用th表示，table header-->
            <tr>
             <th>列标题1</th>
             <th>列标题2</th>
             <th>列标题3</th>
            </tr>
             <!--列的内容用td表示，table data-->
            <tr>
                <td>元素1</td>
                <td>元素2</td> 
                <td>元素3</td>  
            </tr> 
             <tr>
                <td>11</td>
                <td>22</td> 
                <td>33</td>  
            </tr> 
     </table>
</body>
</html>
```

## 属性

> 用于定义元素的行为和外观，以及与其他元素的关系

基本语法：

```html
<开始标签 属性名="属性值">
```

- 每个HTML元素可以具有不同属性

  ```html
  <p id="describe" class="section">这是一个段落标签</p>
  <a href="http...">这是一个超链接</a>
  ```

- 属性名称不区分大小写，属性值对大小写敏感

  ```html
  <img src="example.jpg" alt="">
  <img sRc="Example.jpg" alt="">
  <img Src="example.jpg" alt="">
  ```

- 适用于大多数HTML元素的属性
  - **class** 为HTML元素定义一个或多个类名（类名从样式文件引入）
  - **id**    定义元素唯一的id
  - **style** 规定元素的行内样式
  

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML 属性</title>
</head>
<body>
    <!--href属性用来指向超链接链接的网址
        target决定了新网页的打开方式-->
    <a href="http://baidu.com">这是一个超链接</a>
    <br><!--换行-->
    <a href="http://baidu.com" target="_blank">第二个超链接</a>
    <hr><!--分割线-->
    <img src="..." alt="" width="" height=""><!--src是图片路径，alt是当图片无法显示时的替换文本-->
</body>
</html>
```

## 块元素与行内元素

### 块元素

> 块级元素通常用于组织和布局页面的主要结构和内容，例如段落、标题、列表、表格等。它们用于创建页面的主要部分，将内容分割成逻辑块

- 块级元素通常从新行开始，并占据整行的宽度，因此在页面上会呈现为一块独立的内容块
- 可以包含其他块级元素和行内元素
- 常见的块级元素包括 div、p、h1～h6 等

### 行内元素

> 行内元素通常用于添加文本样式或为文本中的一部分应用样式，它们可以在文本中插入小的元素，例如超链接、强调文本等

- 常见的行内元素有 span、a、strong、em、img 等



## 表单

```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML表单</title>
</head>
<body>
    <form action="#">  <!--action里放URL往哪里提交东西 submit-->
            <label for="username">用户名</label>   <!--lable是input 专属的修饰，也可以用span-->
            <input type="text" id="username"  placeholder="请输入内容">
            <br><br>
            <label for="pwd">密码</label>   <!--lable加for属性可以链接到指定id的input-->
            <input type="password" id="pwd" placeholder="请输入密码"><br><br>
            <label>性别</label>
            <input type="radio" name="gender"> 男
            <input type="radio" name="gender"> 女   <!--input radio加一个name 属性可以实现单选-->
            <br><br>
            <lable for="hobby">爱好：</lable> <br><!--checkbox实现多选-->
            <input type="checkbox" id="hobby" >1
            <input type="checkbox" id="hobby" >2
            <input type="checkbox" id="hobby" >3
            <input type="checkbox" id="hobby" >4
            <br><br>
            <input type="submit" value="更新"><!--value起到一个赋初值的作用-->
    </form>
</body>
</html>
```

