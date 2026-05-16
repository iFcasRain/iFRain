# CSS

## 简介

> CSS全名是Cascading Style Sheets `层叠样式表`

用于定义网页样式和布局的样式表语言

![](/assets/image-20260414082642486.png)

## CSS语法

CSS通常由选择器，属性，属性值组成，多个规则可以组合在一起，以便同时应用多个样式

```css
选择器{
    属性1：属性值1；
    属性2：属性值2；
}
```

- 选择器的声明里可以写无数条属性
- 声明的每一行属性，都要用**英文分号**结尾
- 声明的所有属性和值都是以键值对这种形式出现的；

```CSS
p{
    color: blue;
    font-size: 16px;
}
```

## CSS 导入方式

- 内部样式

- 外部样式

- 内联样式

  ```CSS
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>CSS导入方式</title>
      <link rel="stylesheet" href="./css/style.css">
      <style>
          p{
              color : blue;
              font-size: 16px;
          }
  
      </style>
  </head>
  <body>
      <p>这是一个应用了内部样式的文本</p>
      <h1 style="color:red;font-size:30px;">这是一个一级标题使用内联样式</h1>
      <h2>外部样式</h2>
  </body>
  </html>
  ```

## 选择器

> 允许你针对特定元素或一组元素定义样式

- 元素选择器
- 类选择器
- ID选择器
- 通用选择器
- 子元素选择器
- 后代选择器
- 并集选择器
- 伪类选择器

