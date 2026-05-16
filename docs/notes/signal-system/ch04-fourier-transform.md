# 第四章：连续时间傅里叶变换

## 4.0 引言

- **学习目标**：理解连续时间傅里叶变换（CTFT）的定义、物理意义与基本性质，并学会用它分析 LTI 系统。
- **为什么要学**：第三章的傅里叶级数适用于周期信号，但很多实际信号是非周期的。CTFT 将非周期信号映射为连续频谱，形成更普适的频域分析工具。
- **关键思想**：把非周期信号视为周期无限大的周期信号，观察傅里叶级数在周期趋于无限大时如何演变成积分形式。

## 4.1 从傅里叶级数到傅里叶变换

### 4.1.1 周期延拓的思路

- 对一个非周期信号 $x(t)$，构造周期为 $T$ 的延拓信号 $x_T(t)$：
  $$
  x_T(t) = \sum_{n=-\infty}^{\infty} x(t - nT).
  $$
- 当 $T \to \infty$ 时，$x_T(t)$ 在有限区间内逐渐接近原信号 $x(t)$。
- 这一步将离散频谱问题转为连续频谱问题：
  - 周期信号的傅里叶频谱由离散谐波组成；
  - 非周期信号的傅里叶频谱是连续的。

### 4.1.2 定义与推导

- 对长度为 $T$ 的周期信号 $x_T(t)$，傅里叶级数为：
  $$
  x_T(t) = \sum_{k=-\infty}^{\infty} a_k e^{j k \omega_0 t}, \qquad \omega_0 = \frac{2\pi}{T}.
  $$
  
- 系数为：
  $$
  a_k = \frac{1}{T} \int_{-T/2}^{T/2} x_T(t) e^{-j k \omega_0 t} \, dt.
  $$
  
- 对非周期信号，取 $T \to \infty$：
  - $\omega_0 \to 0$；
  - $k \omega_0$ 变为连续变量 $\omega$；
  - 离散求和变为积分。
  
- 令
  $$
  X(j\omega) = \int_{-\infty}^{\infty} x(t) e^{-j\omega t} \, dt,
  $$
  ​																			频谱密度函数|分析公式（获得x(t)的频谱）
  
  则对应的反变换为
  $$
  x(t) = \frac{1}{2\pi} \int_{-\infty}^{\infty} X(j\omega) e^{j\omega t} \, d\omega.
  $$
  ​																				综合公式

![image-20260509114826565.png](/assets/image-20260509114826565.png)

### 4.1.3 公式意义

- $X(j\omega)$ 是 $x(t)$ 的频域表示，表明每个频率 $\omega$ 的复幅值。
- CTFT 与傅里叶级数的关系：傅里叶级数系数相当于对频域连续函数 $X(j\omega)$ 的等间隔采样。
- 这就是从“离散频谱”到“连续频谱”的自然过渡。

## 4.2 傅里叶变换的收敛条件

### 4.2.1 平方可积条件

- 若 $x(t)$ 满足
  $$
  \int_{-\infty}^{\infty} |x(t)|^2 \, dt < \infty,
  $$
  则称其平方可积。
- 该条件保证信号能量有限，通常为 CTFT 存在的充分条件。
- 物理意义：能量有限的信号在频域有有限能量，频谱不会发散。

### 4.2.2 Dirichlet 条件

- Dirichlet 条件是另一个充分条件：
  1. $\int_{-\infty}^{\infty} |x(t)| \, dt < \infty$；
  2. 任意有限区间内 $x(t)$ 只有有限个极值点，且极值有限
  3. 任意有限区间内 $x(t)$ 只有有限个间断点，间断值有限。
- 满足 Dirichlet 条件，则 $X(j\omega)$ 存在，且反变换在连续点收敛到 $x(t)$，在间断点收敛到左右极限平均。

### 4.2.3 Gibbs 现象

- 当 $x(t)$ 存在间断时，其频谱的部分和反变换会在间断点附近产生振荡，称为 Gibbs 现象。
- 原因：有限频率带宽相当于对反变换积分进行了截断，导致时间域边缘效应。
- 结论：Gibbs 现象不会消失，但振荡区域宽度会随带宽增加而变窄。

## 4.3 常见信号的傅里叶变换对

### 4.3.1 基本变换对

1. 单位冲激：
   $$
   \delta(t) \leftrightarrow 1.
   $$
   解释：冲激含有所有频率成分，幅度均为 1。

2. 直流信号：
   $$
   1 \leftrightarrow 2\pi \delta(\omega).
   $$
   解释：直流仅含零频分量。

3. 复指数：
   $$
   e^{j \omega_0 t} \leftrightarrow 2\pi \delta(\omega - \omega_0).
   $$
   解释：单频信号在频域为单个冲激。

### 4.3.2 常见时域函数

4. 矩形脉冲：
   $$
   x(t) = \begin{cases}1, & |t| < \frac{T}{2} \\\\ 0, & |t| > \frac{T}{2} \end{cases}
   \quad \to \quad
   X(j\omega) = \frac{\sin(\omega T / 2)}{\omega / 2}.
   $$
   说明：时域宽度 $T$ 与频域主瓣宽度成反比。

5. 单边指数：
   $$
   x(t) = e^{-a t} u(t) \quad \to \quad X(j\omega) = \frac{1}{a + j\omega}, \qquad \operatorname{Re}(a) > 0.
   $$
   说明：对应一个一阶低通滤波器响应。

6. 高斯信号：
   $$
   x(t) = e^{-a t^2} \quad \to \quad X(j\omega) = \sqrt{\frac{\pi}{a}} e^{-\omega^2 / (4a)}.
   $$
   说明：高斯函数在时域和频域都是高斯，表现出最紧凑的时频特性。

## 4.4 周期信号的傅里叶变换

- 纯周期信号不满足普通 CTFT 的绝对收敛条件，但可以通过傅里叶级数和冲激谱得到频域表示。
- 若周期信号 $x(t)$ 的傅里叶级数为
  $$
  x(t) = \sum_{k=-\infty}^{\infty} a_k e^{j k \omega_0 t},
  $$
  则其频域表示为
  $$
  X(j\omega) = 2\pi \sum_{k=-\infty}^{\infty} a_k \delta(\omega - k \omega_0).
  $$
- 结论：周期信号的频谱由离散冲激组成，冲激位置对应谐波频率。

### 4.4.1 典型例子

- $\cos \omega_0 t \leftrightarrow \pi [\delta(\omega - \omega_0) + \delta(\omega + \omega_0)]$。
- $\sin \omega_0 t \leftrightarrow j\pi [\delta(\omega + \omega_0) - \delta(\omega - \omega_0)]$。
- 均匀冲激串 $\sum_{n} \delta(t - nT) \leftrightarrow \frac{2\pi}{T} \sum_{k} \delta(\omega - k \omega_0)$。

## 4.5 连续时间傅里叶变换的性质

### 4.5.1 线性

- 若 $y(t) = a x_1(t) + b x_2(t)$，则
  $$
  Y(j\omega) = a X_1(j\omega) + b X_2(j\omega).
  $$
- 说明：这是傅里叶变换最基本的性质，直接来源于积分的线性。

### 4.5.2 时移

- 若 $y(t) = x(t - t_0)$，则
  $$
  Y(j\omega) = e^{-j\omega t_0} X(j\omega).
  $$
- 证明思路：替换积分变量 $\tau = t - t_0$。
- 说明：时移不改变频谱幅度，仅增加相位因子。

### 4.5.3 共轭与对称性

- 若 $x^*(t) \leftrightarrow X^*(-j\omega)$，则：
  - 实信号 $x(t)$ 的频谱满足 $X(-\omega) = X^*(\omega)$。
  - 实偶信号对应实偶频谱；实奇信号对应虚奇频谱。
- 说明：这使得实信号的幅度谱是偶函数，相位谱是奇函数。

### 4.5.4 微分与积分

- 时域微分：若 $y(t) = \frac{d}{dt} x(t)$，则
  $$
  Y(j\omega) = j\omega X(j\omega).
  $$
- 时域积分：若 $y(t) = \int_{-\infty}^{t} x(\tau) d\tau$，则
  $$
  Y(j\omega) = \frac{1}{j\omega} X(j\omega) + \pi X(0) \delta(\omega).
  $$
- 说明：微分增强高频，积分增强低频。

### 4.5.5 尺度变换

- 若 $y(t) = x(a t)$，则
  $$
  Y(j\omega) = \frac{1}{|a|} X\left(j \frac{\omega}{a}\right).
  $$
- 说明：时域压缩对应频域展宽；时域展开对应频域压缩。

### 4.5.6 对偶性

- 若 $x(t) \leftrightarrow X(j\omega)$，则
  $$
  X(j t) \leftrightarrow 2\pi x(-\omega).
  $$
- 说明：时域和频域互为对偶，有时可以将已知变换对“交换”使用。

### 4.5.7 Parseval 定理

- 若 $x(t) \leftrightarrow X(j\omega)$，则
  $$
  \int_{-\infty}^{\infty} |x(t)|^2 dt = \frac{1}{2\pi} \int_{-\infty}^{\infty} |X(j\omega)|^2 d\omega.
  $$
- 说明：时域能量等于频域能量，$|X(j\omega)|^2$ 为能量谱密度。

## 4.6 卷积性质与 LTI 系统分析

- **卷积特性**：若 $y(t) = x(t) * h(t)$，则
  $$
  Y(j\omega) = X(j\omega) H(j\omega).
  $$
- 解释：时域卷积对应频域乘积，因而 LTI 系统分析在频域中更简单。
- **分析流程**：
  1. 计算输入信号的频谱 $X(j\omega)$；
  2. 求出系统频率响应 $H(j\omega)$；
  3. 计算输出频谱 $Y(j\omega) = X(j\omega) H(j\omega)$；
  4. 反变换得到输出 $y(t)$。

## 4.7 相乘性质与调制

- 时域信号相乘对应频域卷积：
  $$
  Y(j\omega) = \frac{1}{2\pi} X_1(j\omega) * X_2(j\omega).
  $$
- 在调制中，$m(t) \cos \omega_c t$ 的频谱是原频谱沿载频移动的结果：
  $$
  Y(j\omega) = \frac{1}{2} [M(j(\omega - \omega_c) + M(j(\omega + \omega_c)].
  $$
- 说明：这就是幅度调制的频域解释。

## 4.8 由线性常系数微分方程表征的系统

- 设 LTI 系统由微分方程描述：
  $$
  \sum_{k=0}^{N} a_k \frac{d^k y(t)}{dt^k} = \sum_{m=0}^{M} b_m \frac{d^m x(t)}{dt^m}.
  $$
- 对两边做傅里叶变换：
  $$
  \sum_{k=0}^{N} a_k (j\omega)^k Y(j\omega) = \sum_{m=0}^{M} b_m (j\omega)^m X(j\omega).
  $$
- 得到频率响应：
  $$
  H(j\omega) = \frac{Y(j\omega)}{X(j\omega)} = \frac{\sum_{m=0}^{M} b_m (j\omega)^m}{\sum_{k=0}^{N} a_k (j\omega)^k}.
  $$
- 说明：频率响应是系统性质的有理函数，极点决定稳定性，零点决定频率选择性。

## 4.9 本章小结

- CTFT 是对非周期信号的频谱分析工具，将时域信号映射为连续频域函数。
- 通过周期延拓可理解傅里叶级数与傅里叶变换之间的联系。
- 了解收敛条件与 Gibbs 现象，有助于判断傅里叶变换是否可用。
- 常见变换对和性质是计算频域表达式的核心工具。
- 卷积与相乘性质是 LTI 系统与调制分析的基础。
