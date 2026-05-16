# Python程序设计基础笔记
## 一、参考资料
- 《Python编程:从入门到实践》
- 《Python中文指南》：https://python.iswbm.com/
- 《人工智能(第3版)》附录A
- Python官方网站：https://www.python.org
- 菜鸟教程Python3：https://www.runoob.com/python3/python3-tutorial.html
- Python标准库参考：https://pymotw.com/

## 二、Python环境配置
### 2.1 Conda环境管理
conda是跨语言的编程环境管理工具，推荐安装Miniconda，适配系统版本如下：
| 平台 | 安装包版本 |
| :--- | :--- |
| Windows | Miniconda3 Windows 64-bit |
| macOS Intel | Miniconda3 macOS Intel x86 64-bit bash/pkg |
| macOS M系列 | Miniconda3 macOS Apple M1 64-bit bash/pkg |
| Linux | Miniconda3 Linux 64-bit / Linux-s390x 64-bit |

安装验证：安装完成后重启终端，输入`conda`，若输出命令帮助信息则安装成功。

### 2.2 常用Conda命令
| 命令 | 功能 |
| :--- | :--- |
| `conda env list` | 查看所有conda环境列表 |
| `conda create –n env_id python=3.9` | 创建python3.9版本的虚拟环境，env_id为环境名 |
| `conda activate env_id` | 激活指定的虚拟环境 |
| `conda deactivate` | 退出当前虚拟环境 |

### 2.3 编辑器/IDE
- **PyCharm**：分为社区版（免费）和专业版，官方下载地址：http://www.jetbrains.com/pycharm/download/
- **VS Code**：免费开源，支持Git、调试与扩展，下载地址：https://code.visualstudio.com/

## 三、初识Python
### 3.1 Python核心特点
- 语法简洁清晰，贴近自然语言，开发效率高
- 动态类型语言，变量无需提前声明类型
- 拥有完善的AI开发生态，核心库包括：
  - 数值计算：numpy、scipy、pandas
  - 机器学习：scikit-learn
  - 深度学习：pytorch、tensorflow、keras
  - 文本挖掘：gensim
- 核心应用场景：人工智能、云计算、大数据、网络爬虫、自动化运维、Web开发、科学计算等

### 3.2 Hello World程序
```python
# 单行注释
'''
多行注释（三个单引号）
'''
"""
多行注释（三个双引号）
"""
# 核心代码
print("Hello World!")
```

**运行方式**：
1. 命令行直接运行Python语句
2. 命令行运行`.py`文件
3. 文本编辑器/IDE中运行`.py`文件

### 3.3 变量
- 变量定义：Python为动态类型，无需声明类型，直接赋值即可
  ```python
  message = "Hello World!"
  print(message)
  ```
- 变量名命名规则：
  1. 只能包含字母、数字和下划线
  2. 不能以数字开头，不能包含空格
  3. 禁止使用Python关键字和内置函数名作为变量名

### 3.4 输入与输出
1. **print输出函数**
   - 可接收一个或多个参数，默认多个参数用空格分隔，输出后默认换行
   - `sep`参数：指定多个输出内容的分隔符
   - `end`参数：指定输出结束的字符，指定输出结束的字符  print()会默认自动换行 是因为end的默认参数为\n
   ```python
   message_1 = "Hello World!"
   message_2 = 2025
   print(message_1, message_2)  # 输出：Hello World! 2025
   print(message_1, message_2, sep= "AI", end="SYSU")  # 输出：Hello World!AI2025SYSU
   ```

2. **input输入函数**
   - 可选参数为提示字符串，返回值为字符串类型
   ```python
   message_2 = input("Please enter a message:\n")
   print("Greeting: Hello!", message_2)
   ```

## 四、简单数据类型
### 4.1 核心基础类型
| 类型 | 说明 |
| :--- | :--- |
| 数字 | 整数(int)、浮点数(float)、布尔值(bool) |
| 字符串(str) | 单引号/双引号包裹的字符序列 |
| 空值 | None，代表空对象 |

### 4.2 数字类型操作
1. **基础运算符**
   | 运算符 | 功能 | 示例 | 结果 |
   | :--- | :--- | :--- | :--- |
   | + | 加 | 2+3 | 5 |
   | - | 减 | 5-2 | 3 |
   | * | 乘 | 3*4 | 12 |
   | / | 除（结果为浮点数） | 3/2 | 1.5 |
   | // | 整除（向下取整） | 3//2 | 1 |
   | ** | 幂运算 | 3**2 | 9 |
   | % | 取模（求余数） | 5%3 | 2 |

2. **常用函数**
   - 四舍五入：`round(x, k)`，保留k位小数
   - 绝对值：`abs(a)`
   - 最大值/最小值：`max(a,b)` / `min(a,b)`
   - math模块函数：需先`import math`，包括向下取整`math.floor(a)`、向上取整`math.ceil(a)`

3. **赋值运算符**
   | 运算符 | 描述 | 等效表达式 |
   | :--- | :--- | :--- |
   | = | 简单赋值 | `c = a + b` |
   | += | 加法赋值 | `c += a` → `c = c + a` |
   | -= | 减法赋值 | `c -= a` → `c = c - a` |
   | *= | 乘法赋值 | `c *= a` → `c = c * a` |
   | /= | 除法赋值 | `c /= a` → `c = c / a` |
   | %= | 取模赋值 | `c %= a` → `c = c % a` |
   | **= | 幂赋值 | `c **= a` → `c = c ** a` |
   | //= | 整除赋值 | `c //= a` → `c = c // a` |

   > ⚠️ 注意：Python中没有`++`、`--`自增/自减运算符
   
4. **保留小数位** 

   使用`:.nf`格式，`n`为要保留的小数位数，会自动四舍五入

   ```python
   pi=3.1415926
   #保留两位小数
   print(f"{pi:2f}") #输出3.14
   ```

### 4.3 字符串类型操作
1. **基础定义**
   - 单引号/双引号均可包裹字符串，可灵活嵌套避免转义
   ```python
   s1 = "I told my friend, \"Python is my favorite language!\""
   s2 = 'I told my friend, "Python is my favorite language!"'
   print(s1 == s2)  # 输出 True
   ```

2. **基础操作**
   - 拼接：`+` 运算符
   - 重复拼接：`*` 运算符
   ```python
   first_name = "Zhiqi"
   last_name = "Lei"
   name = first_name + " " + last_name  # 拼接
   print("haha" * 5)  # 重复输出 hahahahahahahahahaha
   ```

3. **大小写转换**
   | 方法 | 功能 |
   | :--- | :--- |
   | `title()` | 每个单词首字母大写 |
   | `lower()` | 所有字母转为小写 |
   | `upper()` | 所有字母转为大写 |

4. **空白处理**
   | 方法 | 功能 |
   | :--- | :--- |
   | `strip()` | 删除字符串前后的空白字符（空格、换行、制表符） |
   | `rstrip()` | 删除字符串末尾的空白字符 |
   | `lstrip()` | 删除字符串开头的空白字符 |

5. **分割与替换**
   - 分割：`split(分隔符)`，按指定符号分割字符串，返回列表
   - 替换：`replace(旧字符, 新字符)`，替换字符串中指定内容
   ```python
   sentence = "Life is short, you need Python."
   print(sentence.split()  # 按空格分割
   print(sentence.split(",")  # 按逗号分割
   print(sentence.replace("short", "long")  # 替换内容
   ```

6. **类型转换**
   - 格式：`目标类型(变量)`，常用`int()`、`float()`、`str()`
   > ⚠️ 注意：数值与字符串直接拼接会报错，需先将数值转为字符串
   
7. **字符串处理**

   `import string`

   > str.maketrans() 详解

   ```python
   # 创建转换表
   trans_table = str.maketrans(x, y=None, z=None)
   
   # 配合 translate() 执行替换
   new_str = 原字符串.translate(trans_table)
   ```

   ①maketrans的返回值为dict，内容为{要替换的字符: 目标字符}

   ②参数包括xyz

   ​	1.x可以是字符串（要替换的内容）也可以是字典（要替换的内容以及替换成什么）

   ​    2.y是字符串，若x是字典则y=None，x是字符串则y代表替换成的字符，要与x的长度一致

   ​	3.z表示需要直接删除的字符

   > string.puctuation   python 自带的所有标点符号的集合

   ```
   !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~
   ```

   > str.translate() 详解

   是Python中**批量替换/删除字符串**中多个字符 的方法

   ```python
   新字符串 = 原字符串.translate(转换表)
   ```

   - 参数：传入字符映射表（通过**str.maketrans()**实现）
   - 返回：新字符串 源字符串不改变
   - 是maketrans()的具体实现

## 五、控制结构
### 5.1 代码块与缩进
- Python通过**缩进**控制代码块，而非C++的花括号`{}`
- 缩进量需统一（推荐4个空格），分支/循环结束后需取消缩进，否则会触发语法错误

### 5.2 核心运算符
1. **比较运算符**
   | 运算符 | 描述 |
   | :--- | :--- |
   | == | 等于，比较对象值是否相等 |
   | != | 不等于 |
   | > | 大于 |
   | < | 小于 |
   | >= | 大于等于 |
   | <= | 小于等于 |

2. **逻辑运算符**
   | 运算符 | 逻辑表达式 | 描述 |
   | :--- | :--- | :--- |
   | and | x and y | 布尔与，x为False则返回x，否则返回y的计算值 |
   | or | x or y | 布尔或，x为True则返回x，否则返回y的计算值 |
   | not | not x | 布尔非，x为True返回False，x为False返回True |

### 5.3 分支结构（if-elif-else）
语法格式：
```python
if condition_A:
    # 条件A成立执行
    do something
elif condition_B:
    # 条件B成立执行
    do something
else:
    # 所有条件不成立执行
    do something
```

> 注意事项：
> 1. 关键字为`elif`，而非`else if`
> 2. 条件无需用括号包裹，`if/elif/else`末尾必须加冒号
> 3. 分支内部代码必须缩进

示例：
```python
age = 12
if age < 4:
    price = 0
elif age < 18:
    price = 5
elif age < 65:
    price = 10
else:
    price = 5
print("Your admission cost is $" + str(price) + ".")
```

### 5.4 循环结构
1. **while循环**
   语法：满足条件时持续循环，直到条件不成立
   ```python
   while condition:
       do something
       # 循环控制
       if break_condition:
           break  # 终止整个循环
       if continue_condition:
           continue  # 跳过本次循环剩余代码，进入下一轮循环
   ```

   示例（1-100求和）：
   ```python
   s = 0
   i = 1
   while i <= 100:
       s += i
       i += 1
   print(s)  # 输出 5050
   ```

2. **for循环**
   配合`range()`遍历序列，`range()`用法：
   - `range(stop)`：生成0到stop-1的整数序列，步长1
   - `range(start, stop[, step])`：生成start到stop-1的序列，步长为step

   示例（1-100求和）：
   ```python
   s = 0
   for i in range(1, 101):
       s += i
   print(s)  # 输出 5050
   ```

## 六、复杂数据结构与操作
### 6.1 列表（list）
1. **基础定义**
   - 有序元素序列，用方括号`[]`包裹，元素间用逗号分隔
   - 列表内元素可包含不同数据类型
   ```python
   bicycles = ["trek", "cannondale", "redline", "specialized"]
   l = ["abc", 123, 4.5, True, None]  # 多类型元素
   ```

2. **元素访问**
   - 下标索引：从0开始，负数索引代表从末尾倒数（-1为最后一个元素）
   ```python
   print(bicycles[0])  # 第一个元素
   print(bicycles[-1])  # 最后一个元素
   ```

3. **元素增删改**
   - 修改：直接通过下标赋值 `list[index] = 新值`
   - 添加：`append(元素)` 末尾添加；`insert(位置, 元素)` 指定位置插入
   - 删除：`del list[index]` 按索引删除；`pop(index)` 弹出指定位置元素；`remove(元素值)` 按值删除

4. **列表常用操作**
   | 操作 | 方法/函数 | 说明 |
   | :--- | :--- | :--- |
   | 长度 | `len(list)` | 返回列表元素个数 |
   | 翻转 | `list.reverse()` | 原地翻转列表，永久修改 |
   | 排序 | `list.sort()` | 原地永久排序，`reverse=True` 降序 |
   | 临时排序 | `sorted(list)` | 返回排序后的新列表，不修改原列表 |
   | 切片 | `list[start:stop:step]` | 截取子列表，start/stop/step均可省略 |

   切片示例：
   ```python
   players = ['charles', 'martina', 'michael', 'florence', 'eli']
   print(players[0:3])  # 前3个元素
   print(players[-3:])  # 最后3个元素
   print(players[::2])  # 步长2，隔一个取一个
   ```

5. **列表赋值与复制**
   - 直接赋值：`b = a`，仅传递引用，a和b指向同一块内存，修改b会影响a
   - 浅复制：`b = a[:]` 或 `copy.copy(a)`，复制外层列表，内层嵌套对象仍为引用
   - 深复制：`copy.deepcopy(a)`，完全复制所有层级的对象，修改新列表不影响原列表
   > 需先`import copy` 才能使用复制函数

6. **核心运算符**
   - 成员运算符：`in` / `not in`，判断元素是否在列表中
   - 身份运算符：
     | 运算符 | 核心作用 | 与==的区别 |
     | :--- | :--- | :--- |
     | is | 判断两个变量是否引用同一个内存对象 | 对比内存地址`id()` |
     | == | 判断两个变量的值是否相等 | 对比对象的内容值 |

### 6.2 元组（tuple）
- 不可变的列表，用圆括号`()`包裹，元素无法直接修改
- 若需修改元组，可先转为列表，修改后再转回元组
- 尝试直接修改元组元素会触发`TypeError`
```python
dimensions = (200, 50)
# dimensions[0] = 100 会报错
# 转为列表修改
dimensions = list(dimensions)
dimensions[0] = 100
dimensions = tuple(dimensions)
```

### 6.3 集合（set）
- 无序、不重复的元素序列，核心场景为元素去重
```python
a = [1, 4, 2, 1, 2]
print(list(set(a))  # 输出 [1,2,4]
```

### 6.4 字典（dict）
1. **基础定义**
   - 键值对（key-value）结构，用花括号`{}`包裹，键值对间用逗号分隔
   - 键必须是不可变类型（字符串、数字、元组），且不可重复；值可以是任意类型
   ```python
   alien_0 = {'color': 'green', 'points': 5}
   ```

2. **基础操作**
   - 访问值：`dict[key]` 或 `dict.get(key)`
   - 修改/添加：`dict[key] = 新值`，键存在则修改，不存在则新增
   - 删除：`del dict[key]` 删除指定键值对

3. **字典遍历**
   ```python
   favorite_languages = {'jen': 'python', 'sarah': 'c', 'edward': 'ruby', 'phil': 'python'}
   # 遍历键值对
   for name, language in favorite_languages.items():
       print(name.title() + "'s favorite language is " + language.title() + ".")
   # 遍历所有键
   for name in favorite_languages.keys():
       print(name.title()
   # 遍历所有值
   for language in favorite_languages.values():
       print(language.title()
   ```

## 七、函数与类
### 7.1 函数
1. **函数定义与调用**
   - 用`def`关键字定义，格式：`def 函数名(形参列表):`，末尾加冒号，函数体缩进
   - 调用：`函数名(实参列表)`
   ```python
   # 无参函数
   def greet_user():
       print("Hello!")
   greet_user()

   # 带参函数
   def greet_user(username):
       print("Hello, " + username.title() + "!")
   greet_user('zachary')
   ```

2. **返回值**
   - 用`return`关键字返回结果，可返回单个值、多个值、列表、字典等任意类型
   - 多个返回值会以元组形式返回
   ```python
   def get_formatted_name(first_name, last_name):
       return first_name.title(), last_name.title()

   def build_person(first_name, last_name, age=''):
       person = {'first': first_name, 'last_name': last_name}
       if age:
           person['age'] = age
       return person
   ```

3. **参数传递规则**
   - 位置实参：按形参顺序传递实参
   - 关键字实参：指定形参名传递，无需考虑顺序
   - 默认值参数：形参设置默认值，需放在参数列表末尾
   ```python
   def describe_pet(pet_name, animal_type='dog'):
       print("\nI have a " + animal_type + ".")
       print("The " + animal_type + "'s name is " + pet_name.title() + ".")

   # 位置实参
   describe_pet('harry', 'cat')
   # 默认值参数
   describe_pet('willie')
   # 关键字实参
   describe_pet(animal_type='dog', pet_name='willie')
   ```

4. **不定长参数**
   - `*形参`：接收任意数量的位置实参，封装为元组
   - `**形参`：接收任意数量的关键字实参，封装为字典
   ```python
   # 任意数量位置参数
   def make_pizza(*toppings):
       print("\nMaking a pizza ...")
       for topping in toppings:
           print("- " + topping)

   # 任意数量关键字参数
   def build_profile(first, last, **user_info):
       profile = {}
       profile['first_name'] = first
       profile['last_name'] = last
       for key, value in user_info.items():
           profile[key] = value
       return profile
   ```

5. **注意事项**
   - 列表、字典等可变类型传入函数，函数内对其修改会永久影响原对象
   - 若需避免修改原列表，可传递切片副本`list[:]`

### 7.2 类（面向对象编程）
1. **类的定义**
   - 用`class`关键字定义，格式：`class 类名:`
   - 构造方法`__init__()`：创建对象时自动调用，首尾各两个下划线
   - `self`：所有方法的第一个参数，指代对象自身，通过`self.`访问属性和方法
   ```python
   class Dog():
       # 构造方法
       def __init__(self, name, age):
           # 定义属性
           self.name = name
           self.age = age

       # 定义方法
       def sit(self):
           print(self.name.title() + " is now sitting.")

       def roll_over(self):
           print(self.name.title() + " rolled over!")
   ```

2. **对象的创建与使用**
   ```python
   # 创建对象
   my_dog = Dog('willie', 6)
   # 访问属性
   print(my_dog.name.title()
   # 调用方法
   my_dog.sit()
   my_dog.roll_over()
   ```

3. **访问权限**
   
   - Python默认属性/方法为公有
- 变量/函数名**前**加**两个下划线`__`**，则变为私有，外部无法直接访问
  
4. **继承**
   - 子类继承父类的所有属性和方法，格式：`class 子类名(父类名):`
   - `super()`函数：指向父类，可调用父类的构造方法和方法
   - 子类可重写父类的方法，也可新增专属的属性和方法
   ```python
   # 父类Car
   class Car():
       def __init__(self, make, model, year):
           self.make = make
           self.model = model
           self.year = year

       def get_descriptive_name(self):
           long_name = str(self.year) + " " + self.make + " " + self.model
           return long_name.title()

   # 子类ElectricCar继承Car
   class ElectricCar(Car):
       def __init__(self, make, model, year):
           # 调用父类构造方法
           super().__init__(make, model, year)

       # 重写父类方法
       def get_descriptive_name(self):
           return "Electric " + super().get_descriptive_name()

   # 创建子类对象
   my_tesla = ElectricCar('tesla', 'model s', 2016)
   print(my_tesla.get_descriptive_name()
   ```

## 八、文件与异常
### 8.1 文件操作
1. **文件读取**
   - 推荐使用`with`关键字，会自动关闭文件，无需手动调用`close()`
   - 读取整个文件：`read()`方法
   - 逐行读取：`readlines()`方法，返回行内容的列表
   ```python
   # 读取整个文件
   with open('pi_digits.txt') as file_object:
       contents = file_object.read()
       print(contents)

   # 逐行读取
   with open('pi_digits.txt') as file_object:
       for line in file_object.readlines():
           print(line.rstrip()
   ```

2. **文件写入**
   `open()`函数的第二个参数为打开模式，常用模式：
   
   | 模式 | 说明 |
   | :--- | :--- |
   | 'r' | 只读模式（默认） |
   | 'w' | 纯写入模式，文件存在则清空原有内容，不存在则新建 |
| 'a' | 追加模式，文件存在则在末尾追加内容，不存在则新建 |
   
> 注意：只能将字符串写入文件，如需换行需手动添加`\n`

   示例：
   ```python
   # 写入文件，以’w‘方式打开文件只能写不能.read()
   filename = 'programming.txt'
   with open(filename, 'w') as file_object:
       file_object.write("I love programming.\n")
    file_object.write("I love creating new games.\n")
   
   # 追加内容
   with open(filename, 'a') as file_object:
       file_object.write("I also love finding meaning in large datasets.\n")
   ```

### 8.2 异常处理
Python使用`try-except`代码块处理异常，避免程序崩溃，语法：
```python
try:
    # 可能触发异常的代码
    待执行代码
except 异常类型:
    # 触发对应异常时执行
    异常处理代码
else:
    # try代码块无异常时执行
    正常执行代码
```

常用异常处理示例：
1. **ZeroDivisionError（除零错误）**
   ```python
   first_number = input("\nFirst number: ")
   second_number = input("Second number: ")
   try:
       answer = int(first_number) / int(second_number)
   except ZeroDivisionError:
       pass  # 空语句，不执行任何操作
   else:
       print(answer)
   ```

2. **FileNotFoundError（文件不存在错误）**
   ```python
   filename = 'alice.txt'
   try:
       with open(filename) as f_obj:
           contents = f_obj.read()
   except FileNotFoundError:
       print("Sorry, the file " + filename + " does not exist.")
   ```

## 九、模块与库
### 9.1 模块的导入
模块是`.py`后缀的文件，包含函数、类等代码，导入方式：
| 导入方式 | 语法 | 调用方式 |
| :--- | :--- | :--- |
| 导入整个模块 | `import 模块名` | `模块名.函数名/类名` |
| 导入模块指定内容 | `from 模块名 import 函数名/类名` | 直接使用`函数名/类名` |
| 模块别名 | `import 模块名 as 别名` | `别名.函数名/类名` |
| 函数/类别名 | `from 模块名 import 函数名 as 别名` | 直接使用`别名` |
| 导入模块所有内容 | `from 模块名 import *` | 直接使用函数名/类名（不推荐，易冲突） |

### 9.2 模块主函数规范
- `if __name__ == '__main__':` 代码块内的内容，仅在直接运行该.py文件时执行，被其他模块导入时不会执行
- 模块的测试代码需写在该代码块内，避免导入时自动执行
```python
def swap(a, b):
    return b, a

# 仅直接运行该文件时执行
if __name__ == '__main__':
    a = 224
    b = 'Good day!'
    print(a, b)
    a, b = swap(a, b)
    print(a, b)
```

### 9.3 第三方包安装
- 使用`pip`工具安装，命令：`pip install 包名`
- 同时安装Python2和Python3，使用`pip3 install 包名`
- 常用第三方包：
  - 交互式编程：jupyter notebook
  - 数值计算与可视化：numpy、scipy、pandas、matplotlib
  - 机器学习：scikit-learn
  - 深度学习：pytorch、tensorflow、keras
  - 文本挖掘：genism



## 十、正则表达式

#### 1. 原始字符串 `r''`

- 作用：让字符串里的 `\` 不被当作转义字符，**写正则必加**
- 对比：
  - 普通字符串：`'\\d'`
  - 原始字符串：`r'\d'`

#### 2. 常用模块方法

```python
import re
```

| 方法                          | 作用                         |
| ----------------------------- | ---------------------------- |
| `re.findall(pattern, text)`   | 返回所有匹配结果的列表       |
| `re.search(pattern, text)`    | 查找第一个匹配，返回匹配对象 |
| `re.match(pattern, text)`     | 只从**开头**匹配             |
| `re.sub(pattern, repl, text)` | 替换匹配内容                 |
| `re.split(pattern, text)`     | 按规则分割字符串             |

匹配对象常用：

- `obj.group()`：获取匹配内容
- `obj.group(1)`：获取第 1 个分组内容

#### 3. 基础元字符

| 符号     | 含义                       |
| -------- | -------------------------- |
| `.`      | 任意单个字符（不含换行）   |
| `\d`     | 数字 0-9                   |
| `\D`     | 非数字                     |
| `\w`     | 字母、数字、下划线         |
| `\W`     | 非字母数字下划线           |
| `\s`     | 空白（空格、换行、制表符） |
| `\S`     | 非空白                     |
| `[abc]`  | a 或 b 或 c                |
| `[^abc]` | 不是 a/b/c                 |
| `[0-9]`  | 同 \d                      |
| `[a-z]`  | 小写字母                   |

#### 4. 量词（控制出现次数）

| 符号    | 含义        |
| ------- | ----------- |
| `*`     | 0 次或多次  |
| `+`     | 1 次或多次  |
| `?`     | 0 次或 1 次 |
| `{n}`   | 正好 n 次   |
| `{n,}`  | 至少 n 次   |
| `{n,m}` | n ~ m 次    |

#### 5. 边界与逻辑

| 符号 | 含义           |      |
| ---- | -------------- | ---- |
| `^`  | 字符串开头     |      |
| `$`  | 字符串结尾     |      |
| `    | `              | 或   |
| `()` | 分组，提取数据 |      |

#### 6. 贪婪与非贪婪

- **贪婪（默认）**：`.*` 尽可能多匹配
- **非贪婪**：`.*?` 尽可能少匹配

示例：

```python
re.findall(r'<div>.*?</div>', html)
```

#### 7. 常用修饰符

| 修饰符 | 作用              |
| ------ | ----------------- |
| `re.I` | 忽略大小写        |
| `re.S` | 让 `.` 匹配换行符 |

使用：

```python
re.findall(r'python', text, re.I)
```

#### 8. 高频示例

- 手机号：`r'1[3-9]\d{9}'`
- 提取数字：`r'\d+'`
- 邮箱：`r'\w+@\w+.\w+'`
- 替换数字：`re.sub(r'\d+', '*', text)`
- 分组提取：`r'姓名：(\w+)，年龄：(\d+)'`

Python API 调用核心学习笔记

## 十一、API 调用

> 核心定义：Python API 调用是通过 HTTP 协议，用代码实现跨服务 / 跨程序的标准化数据交互，是 Python 网络开发、数据采集、第三方服务对接的核心能力，99% 业务场景配合 JSON 数据处理使用。

### 11.1前置基础与环境准备

####  必须掌握的 HTTP 核心基础

#### 核心请求方法（高频 4 种）

| 方法       | 核心用途        | 核心特点                                     |
| ---------- | --------------- | -------------------------------------------- |
| **GET**    | 数据查询 / 获取 | 参数拼在 URL，无请求体，可直接通过浏览器访问 |
| **POST**   | 数据提交 / 新增 | 参数放在请求体，适合敏感数据、大批量数据传输 |
| **PUT**    | 数据全量更新    | 提交完整新数据，覆盖服务端原有内容           |
| **DELETE** | 数据删除        | 移除服务端指定资源                           |

#### 必记 HTTP 状态码

- 2xx：请求成功（200 = 通用成功，201 = 资源创建成功）
- 4xx：客户端错误（400 = 参数错误，401 = 鉴权失败，403 = 禁止访问，404 = 接口不存在）
- 5xx：服务端错误（500 = 服务内部报错，503 = 服务暂不可用）

#### 接口核心组成

1. **接口地址（URL）**：API 的唯一访问入口，由官方接口文档提供
2. **请求头（Headers）**：声明数据格式、鉴权信息、客户端身份等
3. **请求体（Body）**：POST/PUT 请求的核心提交数据，主流为 JSON 格式
4. **响应体（Response）**：服务端返回的结果，主流为 JSON 格式

### 1.2 环境安装

- 核心依赖：`requests`（Python API 调用行业通用首选，替代内置 urllib，语法极简）

```bash
# 安装依赖
pip install requests
```

- 配套内置库：`json`（Python 原生自带，无需安装，用于 JSON 数据的解析与生成）

```python
# 导入验证
import requests
import json
```

## 二、基础 API 调用实操（全量代码可直接运行）

### 2.1 基础 GET 请求（无参数）

适用场景：获取无筛选条件的公开数据

```python
import requests

# 1. 定义接口地址
url = "https://jsonplaceholder.typicode.com/posts/1"

# 2. 发送GET请求，完成API调用
response = requests.get(url=url)

# 3. 结果校验与数据解析
if response.status_code == 200:
    # 核心：一键将JSON响应转为Python字典
    data = response.json()
    print("请求成功：", data)
else:
    print(f"请求失败，状态码：{response.status_code}")
```

#### 响应对象高频核心属性

| 属性                   | 核心用途                                          |
| ---------------------- | ------------------------------------------------- |
| `response.status_code` | 获取 HTTP 状态码，快速判断请求结果                |
| `response.json()`      | 一键将 JSON 响应体转为 Python 字典 / 列表（推荐） |
| `response.text`        | 获取响应原始字符串，排查非 JSON 格式返回内容      |
| `response.url`         | 查看最终请求地址，排查参数拼接问题                |

### 2.2 带参数的 GET 请求

适用场景：带筛选条件的数据查询（分页、关键词、ID 筛选等）

> 推荐使用`params`参数，自动处理 URL 编码，避免手动拼接导致的语法错误，会自动加在url后面作为参数

```python
import requests

url = "https://jsonplaceholder.typicode.com/posts"

# 定义查询参数
params = {
    "userId": 1,
    "_page": 1,
    "_limit": 3
}

# 发送带参数的GET请求
response = requests.get(url=url, params=params)

if response.status_code == 200:
    print("最终请求地址：", response.url)
    data = response.json()
    print(f"共获取到{len(data)}条数据", data)
```

### 2.3 基础 POST 请求（JSON 格式提交）

适用场景：数据提交、新增、登录等 90% 的业务场景

> `json`参数自动完成两个操作：Python 字典转 JSON 字符串、自动添加`Content-Type: application/json`请求头

```python
import requests

url = "https://jsonplaceholder.typicode.com/posts"

# 定义要提交的JSON数据
post_data = {
    "title": "Python API教程",
    "body": "零基础API学习笔记",
    "userId": 1
}

# 发送POST请求
response = requests.post(url=url, json=post_data)

if response.status_code == 201: # 201=创建成功，POST接口常用状态码
    data = response.json()
    print("提交成功：", data)
else:
    print(f"请求失败，状态码：{response.status_code}，错误信息：{response.text}")
```

#### 关键区分：`json` vs `data` 参数

| 参数       | 适用场景                           | 核心效果                                                     |
| ---------- | ---------------------------------- | ------------------------------------------------------------ |
| `json=xxx` | 提交 JSON 格式数据（90% 业务场景） | 自动转 JSON 字符串，自动添加`application/json`请求头         |
| `data=xxx` | 提交表单格式数据                   | 转为`key=value`格式，请求头为`application/x-www-form-urlencoded` |

## 三、生产环境进阶核心能力

### 3.1 API 鉴权（商用接口必备）

鉴权（Authentication + Authorization）核心是「验证身份+校验权限」，本质是服务器确认“你是谁”“你有资格访问吗”，防止接口被非法调用、数据被泄露。

核心逻辑：客户端发起请求时，携带「身份凭证」（如API Key、Token），服务器校验凭证的有效性、权限范围，通过则返回数据，失败则返回 401（身份无效）或 403（权限不足）。

以下3种是API开发中最常用的鉴权方式，优先遵循接口文档要求，实操代码可直接复用，重点掌握前2种（覆盖95%以上商用场景）。

#### 1. API Key 鉴权（最常用，门槛最低）

\#### 核心原理

服务器给合法用户/开发者分配一个「唯一的字符串密钥（API Key）」，客户端每次请求时，将密钥携带在请求头或URL参数中，服务器收到后对比校验：密钥存在且有效，则允许访问；否则返回401错误。

\#### 适用场景

第三方公开接口（如天气、地图接口）、无需登录的只读接口、后端服务之间的调用（无用户登录场景）。

\#### 两种实操方式（优先选方式1，更安全）

```python
# 方式1：API Key放在请求头中（推荐，安全性更高，避免密钥暴露在URL中）
url = "https://api.example.com/data"
headers = {
    "API-Key": "你的API密钥",  # 密钥字段名以接口文档为准，常见如API-Key、X-API-Key
    "User-Agent": "Python/3.9"  # 可选，部分接口要求携带客户端身份
}
response = requests.get(url=url, headers=headers)

# 方式2：API Key放在URL参数中（不推荐，密钥会暴露在请求地址中，易泄露）
params = {"api_key": "你的API密钥", "keyword": "test"}  # 参数名以文档为准，常见如api_key、key
response = requests.get(url=url, params=params)
```

\#### 避坑要点

- 密钥不要硬编码在代码中（尤其是公开代码），建议用环境变量、配置文件管理（如config.py），避免泄露。
- 如果密钥泄露，立即在接口平台吊销旧密钥、生成新密钥，防止被非法调用。
- 部分接口会限制API Key的调用频率（如每分钟100次），超出限制会返回429状态码，需遵守频率限制。

#### 2. Bearer Token 鉴权（登录场景首选，安全性高）

\#### 核心原理

基于“登录-获取凭证-使用凭证”的流程：客户端先通过登录接口（输入账号密码），向服务器申请「临时凭证（Token）」；后续调用需要权限的接口时，携带该Token，服务器校验Token的有效性、过期时间，通过则允许访问。

Token是临时的，有过期时间（如2小时、1天），过期后需重新登录获取，比API Key更安全（泄露后影响范围小）。

\#### 适用场景

用户登录后的接口（如个人信息查询、订单管理、数据提交），需要区分不同用户权限的场景（如普通用户、管理员）。

\#### 完整实操流程（含Token获取、携带、过期处理）

```python
import requests

# 1. 第一步：调用登录接口，获取Token（核心步骤）
login_url = "https://example.com/api/login"
login_data = {"username": "你的账号", "password": "你的密码"}  # 账号密码字段以接口文档为准
login_res = requests.post(login_url, json=login_data)

# 校验登录是否成功，提取Token
if login_res.status_code == 200:
    # 提取Token（字段名以接口文档为准，常见如access_token、token）
    # 注意：不同接口返回格式不同，需对应修改（如login_res.json()["token"]）
    token = login_res.json()["data"]["access_token"]
    
    # 2. 第二步：携带Token，调用需要鉴权的接口
    # 核心：Token放在Authorization请求头中，格式固定为 Bearer + 空格 + Token
    headers = {"Authorization": f"Bearer {token}"}
    # 调用个人信息接口（需要鉴权）
    user_res = requests.get("https://example.com/api/user/info", headers=headers)
    
    # 校验鉴权是否成功
    if user_res.status_code == 200:
        print("鉴权成功，个人信息：", user_res.json()
    elif user_res.status_code == 401:
        print("Token无效或已过期，请重新登录")
    elif user_res.status_code == 403:
        print("Token有效，但无权限访问该接口")
else:
    print(f"登录失败：{login_res.text}")
```

\#### 避坑要点

- Token格式必须正确：`Authorization: Bearer 你的Token`（Bearer后面有一个空格，少写会导致鉴权失败）。
- Token有过期时间，需在代码中处理“Token过期”场景（如捕获401错误，自动重新登录获取新Token）。
- Token不要存储在前端（如网页Cookie），后端调用时存储在内存或安全的配置中，避免泄露。

#### 3. Basic Auth 基础鉴权（简单但安全性低，少用）

\#### 核心原理

将「账号:密码」拼接成字符串，用Base64编码后，携带在Authorization请求头中，服务器收到后解码，校验账号密码的正确性。

特点：实现简单，但账号密码仅做Base64编码（不是加密），明文可反向解码，安全性极低，仅适用于内部测试、非敏感接口。

\#### 适用场景

内部测试接口、无敏感数据的简单接口，不推荐用于生产环境（尤其是公开接口）。

\#### 实操代码（两种写法，效果一致）

```python
import requests
from requests.auth import HTTPBasicAuth

url = "https://example.com/api/basic-auth"

# 写法1：使用requests内置的HTTPBasicAuth（推荐，自动处理编码）
response = requests.get(url=url, auth=HTTPBasicAuth("你的账号", "你的密码")

# 写法2：手动编码，手动设置请求头（了解即可，无需手动写）
import base64
auth_str = "你的账号:你的密码"
# Base64编码（注意：需先转成bytes类型，再编码）
auth_code = base64.b64encode(auth_str.encode("utf-8").decode("utf-8")
headers = {"Authorization": f"Basic {auth_code}"}  # 格式固定为 Basic + 空格 + 编码后的字符串
response = requests.get(url=url, headers=headers)

# 校验鉴权结果
if response.status_code == 200:
    print("鉴权成功：", response.json()
else:
    print("鉴权失败：账号密码错误")
```

\#### 避坑要点

- 生产环境尽量不用，若必须使用，需配合HTTPS协议（加密传输），避免账号密码被拦截。
- 编码后的字符串可反向解码（如在线Base64解码工具），不要在公开网络中传输。

\#### 三种鉴权方式对比（快速选型）

| 鉴权方式     | 安全性 | 适用场景                     | 核心优势           |
| ------------ | ------ | ---------------------------- | ------------------ |
| API Key      | 中等   | 公开接口、后端间调用         | 简单、易实现       |
| Bearer Token | 高     | 用户登录后接口、敏感数据接口 | 临时有效、安全可控 |
| Basic Auth   | 低     | 内部测试、非敏感接口         | 实现极简           |

\#### 常见鉴权错误及解决方法

- 401 Unauthorized：身份凭证无效（如API Key错误、Token过期/无效、账号密码错误）→ 检查凭证是否正确、是否过期，重新获取凭证。
- 403 Forbidden：身份凭证有效，但无权限访问 → 检查账号/凭证的权限范围，联系接口提供方开通权限。
- 请求无响应/报错：检查鉴权字段名、格式是否符合接口文档（如Token的Bearer前缀、API Key的字段名）。

鉴权是服务端的访问权限校验，核心 3 种实现方式（以接口文档要求为准）

#### 1. API Key 鉴权（最常用）

```python
# 方式1：API Key放在请求头中（推荐，安全性更高）
url = "https://api.example.com/data"
headers = {
    "API-Key": "你的API密钥",
    "User-Agent": "Python/3.9"
}
response = requests.get(url=url, headers=headers)

# 方式2：API Key放在URL参数中
params = {"api_key": "你的API密钥", "keyword": "test"}
response = requests.get(url=url, params=params)
```

#### 2. Bearer Token 鉴权（登录场景首选）

```python
import requests

# 1. 调用登录接口获取Token
login_url = "https://example.com/api/login"
login_data = {"username": "你的账号", "password": "你的密码"}
login_res = requests.post(login_url, json=login_data)

if login_res.status_code == 200:
    # 提取Token（字段名以接口文档为准）
    token = login_res.json()["data"]["access_token"]
    
    # 2. 携带Token调用需要鉴权的接口
    headers = {"Authorization": f"Bearer {token}"}
    user_res = requests.get("https://example.com/api/user/info", headers=headers)
    print(user_res.json()
```

#### 3. Basic Auth 基础鉴权

```python
import requests
from requests.auth import HTTPBasicAuth

url = "https://example.com/api/basic-auth"
# 简写方式：auth=("账号", "密码")，效果完全一致
response = requests.get(url=url, auth=HTTPBasicAuth("账号", "密码")
```

### 3.2 会话保持 Session

适用场景：多次请求需要共用 Cookie、请求头，避免重复传参

```python
import requests

# 创建会话对象
session = requests.Session()

# 全局统一设置请求头，所有请求自动携带
session.headers.update({
    "User-Agent": "Python/3.9",
    "Content-Type": "application/json"
})

# 登录后，会话自动保存返回的Cookie
session.post("https://example.com/api/login", json={"username": "test", "password": "123456"})

# 后续请求无需重复设置头信息、Cookie
user_info = session.get("https://example.com/api/user/info")
order_list = session.get("https://example.com/api/order/list")

# 用完关闭会话
session.close()
```

### 3.3 超时控制与完整异常处理

> 生产环境必加！无超时控制会导致代码无限卡死，无异常处理会导致程序直接崩溃

```python
import requests

url = "https://jsonplaceholder.typicode.com/posts/1"

try:
    # timeout=(连接超时5秒, 读取超时10秒)
    response = requests.get(url=url, timeout=(5, 10)
    # 状态码4xx/5xx时主动抛出异常
    response.raise_for_status()
    
    # 解析数据
    data = response.json()
    print("请求成功", data)

# 精准捕获各类异常，快速定位问题
except requests.exceptions.ConnectTimeout:
    print("错误：服务端连接超时，请检查网络或接口地址")
except requests.exceptions.ReadTimeout:
    print("错误：服务端响应超时，请稍后重试")
except requests.exceptions.ConnectionError:
    print("错误：网络异常或接口地址不存在")
except requests.exceptions.HTTPError as e:
    print(f"HTTP错误：{e}，状态码：{response.status_code}")
except requests.exceptions.JSONDecodeError:
    print(f"JSON解析失败，原始响应内容：{response.text}")
except Exception as e:
    print(f"未知错误：{e}")
```

### 3.4 重试机制

应对网络波动、接口限流等偶发失败，实现自动重试，推荐使用`tenacity`库

```bash
# 安装依赖
pip install tenacity
import requests
from tenacity import retry, stop_after_attempt, wait_fixed, retry_if_exception_type

# 重试配置：最多重试3次，每次间隔2秒，仅网络/超时异常触发重试
@retry(
    stop=stop_after_attempt(3),
    wait=wait_fixed(2),
    retry=retry_if_exception_type((requests.exceptions.ConnectionError, requests.exceptions.Timeout)
)
def get_api_data():
    url = "https://jsonplaceholder.typicode.com/posts/1"
    response = requests.get(url=url, timeout=(5, 10)
    response.raise_for_status()
    return response.json()

# 函数调用
try:
    data = get_api_data()
    print("请求成功", data)
except Exception as e:
    print(f"重试3次后仍失败：{e}")
```

## 四、配套 JSON 数据处理核心（API 必用）

### 4.1 核心定义

JSON 是互联网 API 数据传输的事实标准，Python JSON 处理的核心，是**实现 JSON 格式与 Python 原生数据类型的互相转换**，完成 API 数据的解析与提交。

### 4.2 核心操作（内置 json 库）

| 操作类型     | 核心方法       | 功能说明                                                 |
| ------------ | -------------- | -------------------------------------------------------- |
| **反序列化** | `json.loads()` | JSON 字符串 → Python 字典 / 列表（解析 API 返回数据）    |
| **反序列化** | `json.load()`  | 本地 JSON 文件 → Python 字典 / 列表                      |
| **序列化**   | `json.dumps()` | Python 字典 / 列表 → 标准 JSON 字符串（向 API 提交数据） |
| **序列化**   | `json.dump()`  | Python 字典 / 列表 → 写入本地 JSON 文件                  |

### 4.3 类型对应关系

| JSON 类型            | Python 类型          |
| -------------------- | -------------------- |
| object（对象）       | dict（字典）         |
| array（数组）        | list（列表）         |
| string（字符串）     | str（字符串）        |
| 数字（整数）         | int（整型）          |
| 数字（小数）         | float（浮点型）      |
| true/false（布尔值） | True/False（布尔值） |
| null（空值）         | None（空值）         |

### 4.4 常用代码示例

```python
import json

# 1. 解析API返回的JSON字符串
json_str = '{"name": "张三", "age": 20, "is_student": true}'
# JSON字符串 → Python字典
py_dict = json.loads(json_str)
print(py_dict["name"]) # 输出：张三

# 2. Python字典转JSON字符串（用于API提交）
py_data = {"title": "API教程", "content": "学习笔记"}
# ensure_ascii=False 解决中文乱码，indent=2 格式化输出
json_str = json.dumps(py_data, ensure_ascii=False, indent=2)
print(json_str)
```

## 五、避坑指南与最佳实践

1. **接口文档优先**：所有调用严格遵循官方接口文档，包括参数名、大小写、请求头、鉴权方式
2. **敏感信息安全**：API Key、Token、账号密码禁止硬编码在代码中，建议通过环境变量 / 配置文件管理
3. **遵守频率限制**：严格遵循接口的 QPS / 调用频率限制，避免被封禁 IP
4. **编码问题处理**：中文乱码优先设置`ensure_ascii=False`、`response.encoding = "utf-8"`
5. **JSON 语法规范**：JSON 字符串必须用双引号，布尔值为小写`true/false`，空值为`null`，注意与 Python 语法区分
6. **生产环境必加项**：超时控制、异常捕获、重试机制、日志记录

## 六、通用 API 调用模板（可直接复用）

```python
import requests
import json
from tenacity import retry, stop_after_attempt, wait_fixed, retry_if_exception_type

# 全局配置
API_BASE_URL = "https://api.example.com"
API_KEY = "你的API密钥"
TIMEOUT = (5, 10)
MAX_RETRY = 3
RETRY_INTERVAL = 2

# 统一默认请求头
DEFAULT_HEADERS = {
    "User-Agent": "Python-API-Client/1.0",
    "Content-Type": "application/json",
    "API-Key": API_KEY
}

# 统一重试装饰器
def api_retry(func):
    @retry(
        stop=stop_after_attempt(MAX_RETRY),
        wait=wait_fixed(RETRY_INTERVAL),
        retry=retry_if_exception_type((requests.exceptions.ConnectionError, requests.exceptions.Timeout)
    )
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    return wrapper

# 通用GET请求封装
@api_retry
def api_get(path, params=None):
    url = f"{API_BASE_URL}{path}"
    response = requests.get(
        url=url,
        headers=DEFAULT_HEADERS,
        params=params,
        timeout=TIMEOUT
    )
    response.raise_for_status()
    return response.json()

# 通用POST请求封装
@api_retry
def api_post(path, data=None):
    url = f"{API_BASE_URL}{path}"
    response = requests.post(
        url=url,
        headers=DEFAULT_HEADERS,
        json=data,
        timeout=TIMEOUT
    )
    response.raise_for_status()
    return response.json()

# 调用示例
if __name__ == "__main__":
    try:
        # GET请求示例
        user_data = api_get("/user/info", params={"userId": 1})
        print("用户数据：", user_data)
        
        # POST请求示例
        submit_result = api_post("/post/add", data={"title": "测试", "content": "学习笔记"})
        print("提交结果：", submit_result)
    except Exception as e:
        print(f"接口调用失败：{e}")
```