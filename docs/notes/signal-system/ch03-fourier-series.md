# 信号与系统 第三章：周期信号的傅里叶级数表示

---

## 3.1 引言

### 信号分解对“基本信号”的要求

1. **本身简单**，且 LTI 系统对它的响应容易求得；
2. **具有普遍性**，能构成相当广泛的信号。

### 傅里叶分析方法的基础

- 周期信号可分解为**复指数信号**的线性组合；
- LTI 系统对复指数信号的响应具有特别简单的形式。

### 基本思想（LTI）

若能把任意输入分解成基本信号的线性组合，则系统响应是对应响应的线性组合：

$$
x(t)=\sum_i a_i x_i(t)\quad\Rightarrow\quad y(t)=\sum_i a_i y_i(t)
$$

离散形式同理。

### 两类常用基本信号

- **复指数信号** 与 **单位冲激/脉冲信号** $\delta(t)$、$\delta[n]$。
- **上章（时域）**：以冲激为基，卷积分析系统。
- **本章（频域）**：以复指数为基，傅里叶级数分析。

### 时域：冲激分解与卷积（复习）

**分解：**

$$
x[n]=\sum_{k=-\infty}^{\infty}x[k]\delta[n-k],\qquad
x(t)=\int_{-\infty}^{\infty}x(\tau)\delta(t-\tau)\,\mathrm{d}\tau
$$

**LTI 输出（卷积）：**

$$
y[n]=\sum_{k=-\infty}^{\infty}x[k]h[n-k],\qquad
y(t)=\int_{-\infty}^{\infty}x(\tau)h(t-\tau)\,\mathrm{d}\tau
$$

---

## 3.2 LTI 系统对复指数信号的响应

### 特征函数与特征值

对输入 $e^{st}$（连续）或 $z^n$（离散），LTI 系统的输出为同一复指数乘以常数：

**连续：**

$$
y(t)=\int_{-\infty}^{\infty}e^{s(t-\tau)}h(\tau)\,\mathrm{d}\tau
=e^{st}\underbrace{\int_{-\infty}^{\infty}h(\tau)e^{-s\tau}\,\mathrm{d}\tau}_{H(s)}
=H(s)e^{st}
$$

**离散：**

$$
y[n]=\sum_{k=-\infty}^{\infty}z^{n-k}h[k]
=z^n\underbrace{\sum_{k=-\infty}^{\infty}h[k]z^{-k}}_{H(z)}
=H(z)z^n
$$

**定义：** 若 $y = \lambda x$，则 $x$ 为**特征函数**，$\lambda$ 为**特征值**。

$e^{st}$、$z^n$ 是一切 LTI 系统的特征函数；$H(s)$、$H(z)$ 为相应特征值。

$$
H(s)=\int_{-\infty}^{\infty}h(t)e^{-st}\,\mathrm{d}t,\qquad
H(z)=\sum_{n=-\infty}^{\infty}h[n]z^{-n}
$$

### 由线性叠加得到任意频率分量响应

若

$$
x(t)=\sum_k a_k e^{s_k t},\qquad x[n]=\sum_k a_k z_k^n
$$

则

$$
e^{s_k t}\to H(s_k)e^{s_k t},\qquad z_k^n\to H(z_k)z_k^n
$$

$$
y(t)=\sum_k a_k H(s_k)e^{s_k t},\qquad
y[n]=\sum_k a_k H(z_k)z_k^n
$$

### 指向傅里叶工具

先考虑 $s=\mathrm{j}\omega$（连续），$z=e^{\mathrm{j}\omega}$（离散），即 $e^{\mathrm{j}\omega t}$、$e^{\mathrm{j}\omega n}$。

- **傅里叶级数**：表示**周期**信号；
- **傅里叶变换**（后文）：表示**周期与非周期**信号。

---

## 3.3 连续时间周期信号的傅里叶级数

### 一、CTFS 形式

**成谐波关系**的复指数集 $e^{\mathrm{j}k\omega_0 t}$，$k=0,\pm1,\pm2,\ldots$。各分量周期为 $\dfrac{2\pi}{|k\omega_0|}$，**公共基波周期**为

$$
T=\frac{2\pi}{|\omega_0|}
$$

**傅里叶级数（综合式）：**

$$
x(t)=\sum_{k=-\infty}^{\infty}a_k e^{\mathrm{j}k\omega_0 t}
$$

- $a_k$：**傅里叶级数系数**；
- $k=0$：直流分量；$k=\pm1$：一次谐波；$k=\pm2$：二次谐波；依此类推。

**记法：** $x(t) \overset{\text{FS}}{\longleftrightarrow} a_k$（“FS”可省略）。

### 例：有限项级数

设

$$
x(t)=\sum_{k=-3}^{3}a_k e^{\mathrm{j}k2\pi t}
$$

其中 $a_0=1$，$a_{\pm1}=\dfrac{1}{4}$，$a_{\pm2}=\dfrac{1}{2}$，$a_{\pm3}=\dfrac{1}{3}$。用欧拉公式化简得

$$
x(t)=1+\frac{1}{2}\cos 2\pi t+\cos 4\pi t+\frac{2}{3}\cos 6\pi t
$$

<img src="/assets/image-20260506110002272.png" alt="image-20260506110002272" style="zoom:67%;" />

### 二、频谱概念

各谐波仅系数与频率不同，可用**线段高度**表示 $|a_k|$（或复数 $a_k$），横轴为 $k$ 或 $k\omega_0$，得到**频谱图（条线图）**，即**频域表示**。

例：$\cos\omega_0 t=\dfrac{1}{2}e^{\mathrm{j}\omega_0 t}+\dfrac{1}{2}e^{-\mathrm{j}\omega_0 t}$，在 $k=\pm1$ 处幅度均为 $\dfrac{1}{2}$。

<img src="/assets/image-20260506110153543.png" alt="image-20260506110153543" style="zoom:67%;" />

### 系数为复数时

分别画 **幅度谱** $|a_k|$ 与 **相位谱** $\angle a_k$。

**例：**

$$
x(t)=1+\sin\omega_0 t+2\cos\omega_0 t+\cos\left(2\omega_0 t+\frac{\pi}{4}\right)
$$

<img src="/assets/image-20260506111652833.png" alt="image-20260506111652833" style="zoom:67%;" />

### 三、系数的确定

**简单情形（三角组合）：**

- $x(t)=\cos\omega_0 t$ $\Rightarrow$ $a_{\pm1}=\dfrac{1}{2}$；
- $x(t)=\cos\omega_0 t+2\cos3\omega_0 t$ $\Rightarrow$ $a_{\pm1}=\dfrac{1}{2}$，$a_{\pm3}=1$。

**例：** $x(t)=\cos4\pi t+2\sin8\pi t$，取 $\omega_0=4\pi$，$T=\dfrac{1}{2}$，可得 $a_0=0$，$a_{\pm1}=\dfrac{1}{2}$，$a_2=\dfrac{1}{\mathrm{j}}$，$a_{-2}=-\dfrac{1}{\mathrm{j}}$，其余为 $0$。

### 一般推导（正交性）

若 $x(t)=\displaystyle\sum_{k=-\infty}^{\infty}a_k e^{\mathrm{j}k\omega_0 t}$，$\omega_0=\dfrac{2\pi}{T}$，两边乘 $e^{-\mathrm{j}n\omega_0 t}$ 在一周期内积分，利用

$$
\int_0^T e^{\mathrm{j}(k-n)\omega_0 t}\,\mathrm{d}t=
\begin{cases}
0,&k\neq n\\[4pt]
T,&k=n
\end{cases}
$$

得 **分析公式：**

$$
a_n=\frac{1}{T}\int_T x(t)e^{-\mathrm{j}n\omega_0 t}\,\mathrm{d}t
$$

积分区间任取一个完整周期即可。特别地，

$$
a_0=\frac{1}{T}\int_T x(t)\,\mathrm{d}t
$$

为一周期的平均值，即**直流分量**。

要求哪个系数就乘对应的 $e^{-\mathrm{j}n\omega_0 t}$使得除了$a_n$外的系数所在项积分结果为0

### 例：周期矩形脉冲

脉宽 $2T_1$，周期 $T$，幅度 $1$，占空比 $\dfrac{2T_1}{T}$。

$$
a_k=\frac{1}{T}\int_{-T_1}^{T_1}e^{-\mathrm{j}k\omega_0 t}\,\mathrm{d}t
=\frac{2\sin(k\omega_0 T_1)}{k\omega_0 T}
=\frac{2T_1}{T}\cdot\frac{\sin(k\omega_0 T_1)}{k\omega_0 T_1}
=\frac{2T_1}{T}\,\mathrm{Sa}\!\left(k\pi\frac{2T_1}{T}\right)
$$

其中 $\omega_0=\dfrac{2\pi}{T}$。

**抽样函数：**

$$
\mathrm{Sa}(x)=\frac{\sin x}{x},\qquad
\mathrm{sinc}(x)=\frac{\sin\pi x}{\pi x}
$$

二者零点位置不同（$\mathrm{Sa}$ 在 $x=\pm n\pi$；$\mathrm{sinc}$ 在 $x=\pm n$）。占空比变化时，谱线包络相同但采样密度与幅度尺度改变（课件图）。

<img src="/assets/image-20260506114351061.png" alt="image-20260506114351061" style="zoom:67%;" />

---

## 3.4 连续时间傅里叶级数的收敛

### 一、最佳近似（能量最小）

用有限项 $x_N(t)=\displaystyle\sum_{k=-N}^{N}a_k e^{\mathrm{j}k\omega_0 t}$ 近似 $x(t)$，误差 $e_N(t)=x(t)-x_N(t)$，一周期的误差能量

$$
E_N=\int_T |e_N(t)|^2\,\mathrm{d}t
$$

要使 $E_N$ 最小（习题 3.66），系数必须取为上面的傅里叶系数公式——故在**最小误差能量意义**下，傅里叶级数是周期信号的**最佳近似**。

### 二、收敛的两层含义

1. 系数 $a_k$ 是否存在？
2. 级数是否收敛到 $x(t)$？

**平方可积：** 若 $\displaystyle\int_T|x(t)|^2\,\mathrm{d}t<\infty$，则 $a_k$ 必存在；此时 $x(t)$ 与其傅里叶级数在能量意义上无差别。

**Dirichlet 条件（充分条件之一）：**

1. **绝对可积：** $\displaystyle\int_T|x(t)|\,\mathrm{d}t<\infty$（可推出 $|a_k|$ 有界）；
2. 任一有限区间内**有限个极值**，且极值有限；
3. 任一有限区间内**有限个间断**，且间断处函数值有限。

**结论：** 满足 Dirichlet 条件时，在连续点傅里叶级数等于 $x(t)$；在跳跃间断点收敛到**左右极限的平均**。平方可积与 Dirichlet 两组条件**不等价**，但均为收敛的**充分条件**。

<img src="/assets/image-20260506151743009.png" alt="image-20260506151743009" style="zoom:67%;" />

### 三、Gibbs 现象

对有跳跃间断且满足 Dirichlet 的信号，傅里叶部分和在间断附近出现振荡与**超量**；超量幅度**不随项数 $N$ 增大而消失**，仅振荡频率升高并向间断点压缩，所占能量减小。均方意义下仍收敛。

<img src="/assets/image-20260506152344705.png" alt="image-20260506152344705" style="zoom:67%;" />

<img src="/assets/image-20260506152355624.png" alt="image-20260506152355624" style="zoom:67%;" />



---

## 3.6 离散时间周期信号的傅里叶级数

### 一、DTFS

成谐波复指数 $e^{\mathrm{j}\frac{2\pi}{N}kn}$，每个序列周期为 $N$，**仅有 $N$ 个独立**基序列。

**综合式：**

$$
x[n]=\sum_{k=\langle N\rangle}a_k e^{\mathrm{j}\frac{2\pi}{N}kn}
$$

$\displaystyle\sum_{k=\langle N\rangle}$ 表示任取连续 $N$ 个 $k$（一个周期）求和。$a_k$ 为 **DTFS 系数**。

### 二、系数的确定

**三角组合例：** $x[n]=\cos(\pi n/8)+\cos(\pi n/4+\pi/4)$，周期 $N=16$，$\omega_0=\pi/8$，展开后读出 $a_k$，注意 $a_{k+N}=a_k$ 的周期性。

<img src="/assets/image-20260506161942456.png" alt="image-20260506161942456" style="zoom:67%;" />

**一般推导：** 乘 $e^{-\mathrm{j}\frac{2\pi}{N}rn}$ 并对 $n$ 在一个周期求和，利用正交性得
$$
a_k=\frac{1}{N}\sum_{n=\langle N\rangle}x[n]e^{-\mathrm{j}\frac{2\pi}{N}kn}
$$

显然 **$a_{k+N}=a_k$**，即系数也以 $N$ 为周期，**独立系数只有 $N$ 个**。

### 例：周期方波序列

在 $|n|\le N_1$ 上为 $1$，周期 $N$。经几何级数求和可得（$k$ 非 $N$ 的整数倍等情形）：

$$
a_k=\frac{1}{N}\frac{\sin\left[\frac{\pi}{N}k(2N_1+1)\right]}{\sin\left(\frac{\pi}{N}k\right)},\quad k\neq 0,\pm N,\ldots
$$

当 $k=rN$ 时，$a_k=\dfrac{2N_1+1}{N}$。

固定脉宽、增大 $N$ 时，频域取样更密（课件对比图）。

### 三、DTFS 的收敛

DTFS 是**有限项**和，求 $a_k$ 也是有限和，**无收敛问题**，**无 Gibbs 现象**。

---

## 3.8 傅里叶级数与 LTI 系统

$H(s)$、$H(z)$ 称**系统函数**。令 $s=\mathrm{j}\omega$、$z=e^{\mathrm{j}\omega}$ 得**频率响应**：

$$
H(\mathrm{j}\omega)=\int_{-\infty}^{\infty}h(t)e^{-\mathrm{j}\omega t}\,\mathrm{d}t,\qquad
H(e^{\mathrm{j}\omega})=\sum_{n=-\infty}^{\infty}h[n]e^{-\mathrm{j}\omega n}
$$

$H(e^{\mathrm{j}\omega})$ 对 $\omega$ 以 $2\pi$ 为周期。

**周期输入通过 LTI：**
$$
x(t)=\sum_{k=-\infty}^{\infty}a_k e^{\mathrm{j}k\omega_0 t}
\quad\Rightarrow\quad
y(t)=\sum_{k=-\infty}^{\infty}a_k H(\mathrm{j}k\omega_0)\,e^{\mathrm{j}k\omega_0 t}
$$

$$
x[n]=\sum_{k=\langle N\rangle}a_k e^{\mathrm{j}\frac{2\pi}{N}kn}
\quad\Rightarrow\quad
y[n]=\sum_{k=\langle N\rangle}a_k H\!\left(e^{\mathrm{j}\frac{2\pi}{N}k}\right)e^{\mathrm{j}\frac{2\pi}{N}kn}
$$

**结论：** 输出仍为同周期信号；**频率响应**对各谐波分量作**不同加权**。

**例：** $h[n]=\alpha^n u[n]$（$|\alpha|<1$），$x[n]=\cos\!\left(\dfrac{2\pi}{N}n\right)$。
$$
x[n]=\frac{1}{2}e^{\mathrm{j}\frac{2\pi}{N}n}+\frac{1}{2}e^{-\mathrm{j}\frac{2\pi}{N}n},\quad
a_1=a_{-1}=\frac{1}{2}
$$

$$
H(e^{\mathrm{j}\omega})=\sum_{n=0}^{\infty}\alpha^n e^{-\mathrm{j}\omega n}=\frac{1}{1-\alpha e^{-\mathrm{j}\omega}}
$$

代入 $\omega=\pm\dfrac{2\pi}{N}$ 叠加得 $y[n]$（课件完整代入式）。

---

## 3.9 滤波

**滤波：** 改变各频率分量相对大小，或去除某些频率。

- **频率成形滤波器**：改变频谱形状；
- **频率选择性滤波器**：某些频率基本无失真通过，另一些显著衰减。

**例：** 音响中的可调滤波器、均衡器；**微分器** $H(\mathrm{j}\omega)=\mathrm{j}\omega$（幅度 $|\omega|$，相位 $\pm\pi/2$）；图像二维微分突出边缘。

系统的频率响应 \($H(j\omega)$\) 会对每个频率分量 \($X(j\omega)$\) 进行加权：$\omega$越大，分量被放大的越厉害

**低通 LPF：** 通低频、阻高频。**离散** $|H(e^{\mathrm{j}\omega})|$ 具有 **$2\pi$ 周期性**：$H(e^{\mathrm{j}\omega})=H(e^{\mathrm{j}(\omega+2\pi)})$。

**高通 HPF、带通 BPF：** 图示幅度特性；带通可由 **LP 与 HP 级联**，当 $\omega_{cl}>\omega_{ch}$ 时构成 BPF。

**二维图像 Demo：** 水平/垂直方向分别做 LP/HP/BP，得到不同边缘与纹理效果。深入理解需结合**非周期**信号的频谱（傅里叶变换）。

**理想滤波器：** 通带内增益为 $1$，阻带为 $0$。**理想低通**连续：
$$
H(\mathrm{j}\omega)=\begin{cases}1,&|\omega|\le\omega_c\\0,&|\omega|>\omega_c\end{cases}
$$

离散在 $[-\pi,\pi]$ 上类似定义，并周期延拓。**理想高通、带通**（上下截止 $\omega_{c1},\omega_{c2}$）

---

## 3.10 微分方程描述的连续时间滤波器举例

### 一、RC 低通（电容电压输出）

$$
RC\frac{\mathrm{d}v_c(t)}{\mathrm{d}t}+v_c(t)=v_s(t)
$$

令 $v_s(t)=e^{\mathrm{j}\omega t}$，$v_c(t)=H(\mathrm{j}\omega)e^{\mathrm{j}\omega t}$，得

$$
H(\mathrm{j}\omega)=\frac{1}{1+RC\mathrm{j}\omega},\quad
|H(\mathrm{j}\omega)|=\frac{1}{\sqrt{1+(RC\omega)^2}},\quad
\angle H(\mathrm{j}\omega)=-\arctan(RC\omega)
$$

分式复数的模等于模的分式，幅角等于上面复数的幅角减去下面的

### 二、RC 高通（电阻电压输出）

$$
RC\frac{\mathrm{d}v_r(t)}{\mathrm{d}t}+v_r(t)=RC\frac{\mathrm{d}v_s(t)}{\mathrm{d}t},\qquad
G(\mathrm{j}\omega)=\frac{RC\mathrm{j}\omega}{1+RC\mathrm{j}\omega}
$$

且 $H(\mathrm{j}\omega)e^{\mathrm{j}\omega t}+G(\mathrm{j}\omega)e^{\mathrm{j}\omega t}=e^{\mathrm{j}\omega t}$（分压关系）。

---

## 3.11 差分方程描述的离散时间滤波器举例

### 一、一阶递归

$y[n]-ay[n-1]=x[n]$，$x[n]=e^{\mathrm{j}\omega n}$ $\Rightarrow$

$$
H(e^{\mathrm{j}\omega})=\frac{1}{1-a e^{-\mathrm{j}\omega}}
$$

$a=0.6$ 时近似低通；$a=-0.6$ 时近似高通（课件幅度/相位图）。

### 二、非递归：移动平均

**三点：**

$$
y[n]=\frac{1}{3}\bigl(x[n-1]+x[n]+x[n+1]\bigr),\quad
h[n]=\frac{1}{3}\bigl(\delta[n-1]+\delta[n]+\delta[n+1]\bigr)
$$

$$
H(e^{\mathrm{j}\omega})=\frac{1}{3}+\frac{2}{3}\cos\omega
$$

**$N+M+1$ 点：**

$$
y[n]=\frac{1}{N+M+1}\sum_{k=-N}^{M}x[n-k]
$$

$$
H(e^{\mathrm{j}\omega})=\frac{1}{N+M+1}\,e^{\mathrm{j}\omega(N-M)/2}\,
\frac{\sin\!\bigl[\omega(N+M+1)/2\bigr]}{\sin(\omega/2)}
$$

$N+M+1$ 增大时主瓣变窄（课件对比 $33$ 与 $65$）。

### 三、差分高通

$$
y[n]=\frac{1}{2}\bigl(x[n]-x[n-1]\bigr),\quad
h[n]=\frac{1}{2}\bigl(\delta[n]-\delta[n-1]\bigr)
$$

$$
H(e^{\mathrm{j}\omega})=\frac{1}{2}\bigl(1-e^{-\mathrm{j}\omega}\bigr)=\mathrm{j}e^{-\mathrm{j}\omega/2}\sin\frac{\omega}{2},\quad
|H(e^{\mathrm{j}\omega})|=\left|\sin\frac{\omega}{2}\right|
$$



---

## 本章小结（课件）

1. $e^{st}$、$z^n$ 是一切 LTI 系统的**特征函数**；特征值即**系统函数** $H(s)$、$H(z)$，刻画系统特性。
2. 建立用**傅里叶级数**表示周期信号的方法，即把周期信号写成 $e^{\mathrm{j}k\omega_0 t}$ 或 $e^{\mathrm{j}k\omega_0 n}$ 的线性组合（频域分解）。
3. 在此基础上，LTI 对周期信号的响应由 **$H(\mathrm{j}\omega)$** 或 **$H(e^{\mathrm{j}\omega})$** 对各谐波加权描述。
4. **滤波器**：低通、高通、带通及其理想与实际实现（电路与差分方程）。


