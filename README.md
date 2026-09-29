# SI252 强化学习课程作业（2026 年秋季学期）

本目录用于整理 **2026 年秋季学期 SI252 Reinforcement Learning（强化学习）课程作业**，包含 LaTeX 作业模板及其编译配置。

## 文件说明

| 文件 / 目录 | 用途 |
| --- | --- |
| `HW-Template` | LaTeX 作业模板，文件名没有 `.tex` 扩展名，可直接编译 |
| `Makefile` | 编译 PDF、清理中间文件 |
| `build/` | 编译生成的 PDF 和中间文件 |

模板已设置封面、页眉页脚、正文页码、题目编号和跨页提示，并加载数学公式、表格、TikZ 绘图及算法伪代码所需的宏包。原始模板正文为空，直接编译时只生成封面。

## 编译方法

需要安装 `make`、`latexmk` 和包含 `pdflatex` 的 LaTeX 发行版，以及模板使用的宏包，例如 `fancyhdr`、`extramarks`、`needspace`、`tikz`、`algorithm` 和 `algpseudocode`。

在本目录执行：

```bash
make
```

生成的文件为 `build/HW-Template.pdf`。修改源文件并保存后，再次执行 `make` 即可。`latexmk` 会根据需要自动重复编译，更新交叉引用等内容。

清理命令：

```bash
make clean      # 清理中间文件，保留 PDF
make distclean  # 清理中间文件和 PDF
```

## 使用模板

### 1. 填写封面信息

在 `HW-Template` 的 `Homework Details` 部分，修改以下命令最后一组大括号中的内容：

```latex
\newcommand{\hmwkTitle}{Homework 1}
\newcommand{\hmwkClass}{SI252 Reinforcement Learning}
\newcommand{\hmwkDueDate}{September 30, 2026}
\newcommand{\hmwkAuthorName}{Your Name}
\newcommand{\hmwkAuthorID}{Your Student ID}
```

| 命令 | 内容 |
| --- | --- |
| `\hmwkTitle` | 作业标题 |
| `\hmwkClass` | 课程名称 |
| `\hmwkDueDate` | 截止日期 |
| `\hmwkAuthorName` | 姓名 |
| `\hmwkAuthorID` | 学号 |

截止时间 `22:59` 单独写在 `\title{...}` 的封面定义中。每次使用模板时，按实际作业要求更新标题、日期和时间。

### 2. 添加题目和答案

在文件末尾的 `\hypersetup{pageanchor=true}` 后面、`\end{document}` 前面添加正文。保留已有的封面和页码设置。

下面的示例可以直接粘贴到该位置，再替换题干和答案：

```latex
\begin{homeworkProblem}
    Write the first problem statement here.

    \solution

    \subpart{(a)}
    Write your reasoning here.
    An inline formula looks like $x \in \RR$.

    A displayed formula looks like:
    \[
        \E[X] = \sum_{i=1}^{n} p_i x_i.
    \]

    \subpart{(b)}
    You can write a derivation with aligned equations:
    \begin{align*}
        (a+b)^2
        &= (a+b)(a+b) \\
        &= a^2 + 2ab + b^2.
    \end{align*}
\end{homeworkProblem}

\begin{homeworkProblem}
    Write the second problem statement here.

    \solution

    Write your answer here.
\end{homeworkProblem}
```

每个 `homeworkProblem` 环境对应一道大题，自动编号为 **Problem 1、Problem 2……**。增加题目时，复制整个环境即可。正文页码从 1 开始，封面不显示页码。

需要指定题号时，使用可选参数。例如下面的题目编号为 5，后续题目从 6 继续：

```latex
\begin{homeworkProblem}[5]
    Write the problem statement here.

    \solution

    Write your answer here.
\end{homeworkProblem}
```

### 3. 使用小题标题和数学命令

| 写法 | 用途 |
| --- | --- |
| `\solution` | 输出加粗的 `Solution` 标题 |
| `\subpart{(a) Explanation}` | 输出自定义小题标题 |
| `\part{}` | 自动输出 `Part A`、`Part B` 等；每道大题重新编号 |
| `$ ... $` | 行内公式 |
| `\[ ... \]` | 独立成行、不编号的公式 |
| `align*` 环境 | 多行公式；用 `&` 对齐，用 `\\` 换行 |
| `\E`、`\Var`、`\Cov`、`\Bias` | 期望、方差、协方差、偏差符号 |
| `\PP`、`\RR` | 黑板体 P、R |
| `\ind` | 加粗的 1，可用于指示函数 |
| `\deriv{f(x)}` | 对 x 求导的表达式 |
| `\pderiv{x}{f(x,y)}` | 对 x 求偏导的表达式 |
| `\dx` | 积分中的微分符号 dx |

数学命令需要放在数学模式中，例如 `$\Var(X)$` 或 `\[ \Var(X) = \E[X^2] - \E[X]^2. \]`。

模板中的 `\part` 不会显示其大括号内的文字，因此使用 `\part{}` 即可；需要自定义标题文字时，使用 `\subpart{...}`。

正文中空一行表示新段落，`%` 后面的内容是注释，不会出现在 PDF 中。当前模板默认面向英文作业，直接输入中文前需要额外配置中文支持。

## 为不同作业创建独立目录

为每次作业创建一个目录，并将模板和 `Makefile` 一起复制进去。例如，在本目录下创建 `HW1`：

```bash
mkdir HW1
cp HW-Template Makefile HW1/
cd HW1
```

编辑 `HW1/` 中的 `HW-Template`，填写个人信息、题目和答案。保留文件名 `HW-Template`，即可在 `HW1/` 下直接编译：

```bash
make
```

生成的 PDF 位于 `HW1/build/HW-Template.pdf`。在 `HW1/` 下清理时，也可以直接执行：

```bash
make clean      # 清理当前作业的中间文件，保留 PDF
make distclean  # 清理当前作业的中间文件和 PDF
```

后续作业可按同样方式创建 `HW2/`、`HW3/` 等目录。每个目录都有自己的模板、`Makefile` 和 `build/`，可以独立编辑和编译，无需指定 `SOURCE`。
