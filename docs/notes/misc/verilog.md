# Verilog

## *模块结构*

![](/assets/image-20251117215236588.png)

**1.** 2选1多路选择器的Verilog描述

```verilog
module Mux21a (a,b,s,y);
    input a,b,s;
    output y;
    assign y=(s?a:b);
endmodule
```

**2.**边沿D触发器的描述

``` verilog
module DFF1 (CLK,D,Q);
    output Q;
    input CLK,D;
    reg Q;
    always @(posedge CLK)
        Q<=D;
endmodule    
```

- **模块说明部分**

  ![image-20251117220008267.png](/assets/image-20251117220008267.png)

![image-20251117220053943.png](/assets/image-20251117220053943.png)

**3.**

``` verilog
module full_adder (A,B,CIN,S,COUT);
    input [3:0] A,B;
    input CIN;
    output reg [3:0] S;		//位宽为4位
    output COUT;
```

> 位宽不做说明默认1位
>
> 数据类型不做说明默认为wire 类型

## assign语句

> 被称为连续赋值语句

**基本用法** :

==assign 赋值目标 = 表达式;==       *赋值目标必须是wire类型* 

``` verilog
assign y=a;
assign y=a&b;
```

![](/assets/image-20251117221002122.png)

![](/assets/image-20251117221133799.png)

**1.** **算术型**

![](/assets/image-20251117221228021.png)

**2.** **逻辑型**

![](/assets/image-20251117221414370.png)

![image-20251117221453849.png](/assets/image-20251117221453849.png)

**3.** **关系型**

![](/assets/image-20251117221654344.png)

**4.** **等价型**

![](/assets/image-20251117221757427.png)

![image-20251117221821228.png](/assets/image-20251117221821228.png)

**5.** **按位运算型**

![](/assets/image-20251117221940655.png)

![image-20251117221950194.png](/assets/image-20251117221950194.png)

![](/assets/image-20251117222014619.png)

**6.** **缩减运算型**

![](/assets/image-20251117222203210.png)

![image-20251117222213327.png](/assets/image-20251117222213327.png)

**7.** **移位运算型**

![](/assets/image-20251117222322286.png)

![image-20251117222331316.png](/assets/image-20251117222331316.png)

**8.** **拼接复制运算型**

![](/assets/image-20251117222459077.png)

![image-20251117222518670.png](/assets/image-20251117222518670.png)

**9.条件运算符**

![](/assets/image-20251117222621063.png)

## **always语句块**

> always 语句块又称为过程块

*基本格式*

==always @(敏感信号条件表)==

​				==各类顺序语句；==

```verilog
例：always @ (posedge CLK)		//posedge是上升沿
    	Q=D;
```

> **赋值目标必须定义成reg类型**

- 边沿敏感  ：

  - （posedge 信号名） 上升沿

  - （negedge 信号名） 下降沿

    ​		

- 电平敏感：

  - （信号名列表）  信号列表的任一个信号发生变化

    例：(a,b,c)/(a or b or c)

**除了使用表达式赋值外，always语句块还可以使用if,case等行为描述语句**

``` verilog
module DFF2 (CLK,D,Q,RST,EN)
    input CLK,D,RST,EN;
    output Q;
    reg Q;
    always @(posedge CLK or negedge RST)
        begin//always语句块中如果有多条赋值语句要用begin and 包括起来
            if(!RST) Q<=0;
            else if(EN) Q<=D；
                end			//begin end 之间是顺序执行语句
   endmodule
                
```

- 阻塞赋值（常见组合电路）		**设A，B同时由0变1，激活前M1=0，M2=0，Q=0**

  ``` verilog
  always @(A,B)
      begin
          M1=A;		//计算A，直接把A赋值给M1=1；
          M2=B&M1;	//计算B&M1=1，直接赋值给M2；
          Q=M1|M2;	//计算M1|M2=1，直接赋值给Q；
      end
  ```

  

- 非阻塞赋值（常见时序电路）

  ``` verilog
  always @(A,B)
      begin
          M1<=A;		//计算A=1，B&M2=0，M1|M2=0；
          M2<=B&M2;	//分别赋值给M1=1，M2=0，Q=0；
          Q<=M1|M2;
      end
  ```

  > 不在一个always语块中同时使用阻塞赋值和非阻塞赋值

## 底层模块和门原语调用

![image-20251118081139198.png](/assets/image-20251118081139198.png)

![](/assets/image-20251118081226718.png)

![](/assets/image-20251118081244794.png)

- 端口映射方法

  - 端口名关联法：

    - （.底层端口名（外接信号名1）,.底层端口2名（外接信号名2),...)

      **因为有名字对应，不用按照底层模块的端口信号列表顺序**

  - 位置关联法（不用这种）：

    - （外接信号名1，外接信号名2，...）

      **必须严格按照底层模块的端口信息列表顺序书写**

      

### 门原语

> verilog提供已经设计好的门，可69以直接调用，不用再进行功能描述

**门原语调用格式：** 门原语名   实例名   （端口连接）

​		例：and(out,in1,in2)	![](/assets/image-20251118082213428.png)  

## Verilog 中的数据类型

### 线网类（net类）

![image-20251118082454495.png](/assets/image-20251118082454495.png)

连续赋值或门原语赋值或例化语句赋值

### 变量类（variable)

![](/assets/image-20251118082510016.png)



过程赋值

## 数字表示格式

- 无符号数表示方式：

  ​		`位宽` + `'` + `进制` + `数字`（格式示意：如 `2'b00`）

  ​		例：2’ b00  -> $(00) _2$/       5' d8->    $(01000)_2$ 

- 有符号数的表示方式：

  ​			`位宽` + `'` + `sb` + `数字`（格式示意：如 `8'sb10111011`）

  ​		例：8‘ sb10111011  ->  (-69)10  

​	

## 逻辑值

![](/assets/image-20251118083343523.png)

## if语句

![image-20251118083417340.png](/assets/image-20251118083417340.png)

## case 语句

![image-20251118083847488.png](/assets/image-20251118083847488.png)

## 语言描述风格

- 结构化描述
- 数据流级描述
- 行为级描述

## 其他规定

1. 关键字
2. 标识符：用户自定义的信号名和模块名等 不能与关键字冲突
3. 文件取名和存盘： .v
4. 注释： //   单行注释          /.    段注释      ./