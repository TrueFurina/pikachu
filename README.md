<div align="center">
  <h1>⚡ Pikachu 漏洞靶场 <sup>定制版</sup></h1>
  <p>
    <strong>开箱即用 · 一键启动 · 覆盖 16+ 常见 Web 漏洞</strong>
  </p>
  <p>
    <a href="https://github.com/TrueFurina/pikachu"><img src="https://img.shields.io/github/stars/TrueFurina/pikachu?style=flat&logo=github&label=Stars" alt="GitHub Stars"/></a>
    <a href="https://github.com/TrueFurina/pikachu"><img src="https://img.shields.io/github/forks/TrueFurina/pikachu?style=flat&logo=github&label=Forks" alt="GitHub Forks"/></a>
    <img src="https://img.shields.io/badge/PHP-7.4-blue?logo=php" alt="PHP"/>
    <img src="https://img.shields.io/badge/MySQL-5.7-blue?logo=mysql" alt="MySQL"/>
    <img src="https://img.shields.io/badge/Docker-支持-brightgreen?logo=docker" alt="Docker"/>
    <img src="https://img.shields.io/badge/Windows-一键启动-yellow?logo=windows" alt="Windows"/>
    <img src="https://img.shields.io/badge/license-MIT-green" alt="License"/>
  </p>
  <p>
    <a href="#-快速启动"><b>🚀 快速启动</b></a> •
    <a href="#-包含的漏洞"><b>📋 漏洞列表</b></a> •
    <a href="#-目录结构"><b>📁 目录结构</b></a> •
    <a href="#-学习资源"><b>📚 学习资源</b></a>
  </p>
</div>

---

## 👋 这是什么？

> **Pikachu（定制版）** 是基于经典 Pikachu 漏洞靶场二次优化的**增强版本**，不是原始版。
>
> ✅ 原版所有漏洞完整保留  
> ✅ 提供 **Docker Compose 支持**（一行命令启动，无需配环境）  
> ✅ 提供 **Windows 一键启动脚本**（已装 PHPStudy 的用户双击即用）  
> ✅ 优化数据库配置，首次访问自动引导安装

如果你刚开始学 Web 安全、准备渗透测试面试、或者需要一个稳定的漏洞练习环境，这个项目就是为你准备的。

---

## ✨ 为什么选择这个版本？

| 特性 | 本版（定制版） | 原版 |
|------|:-----------:|:---:|
| 🐳 Docker 一行命令启动 | ✅ **支持** | ❌ 无 |
| 🪟 Windows 双击 .bat 启动 | ✅ **支持**（需先装 PHPStudy） | ❌ 需手动配环境 |
| 🖱️ 启动无需打开 PHPStudy 面板 | ✅ 双击 .bat 即可 | ❌ 每次需手动操作面板 |
| 🔧 数据库首次访问自动初始化 | ✅ 自动引导安装 | ❌ 需手动改 config + 导 SQL |
| 🆓 完全免费开源 | ✅ MIT 协议 | ✅ 同 |

---

## 🧩 包含的漏洞

| 漏洞类型 | 说明 | 难度 |
|---------|------|:---:|
| 🔓 **暴力破解** (Brute Force) | 登录接口暴力破解测试 | ⭐ |
| 🐚 **XSS 跨站脚本** | 反射型、存储型、DOM 型 | ⭐⭐ |
| 🔗 **CSRF 跨站请求伪造** | GET/POST 型 CSRF | ⭐⭐ |
| 💉 **SQL 注入** | 数字型、字符型、搜索型、POST 注入等 | ⭐⭐ |
| 🖥️ **RCE 远程命令执行** | 命令执行与代码执行 | ⭐⭐⭐ |
| 📁 **文件包含** | 本地/远程文件包含 | ⭐⭐ |
| ⬇️ **不安全文件下载** | 任意文件下载 | ⭐ |
| ⬆️ **不安全文件上传** | 前端/后端/Content-Type 绕过 | ⭐⭐⭐ |
| 🔑 **越权漏洞** | 水平/垂直越权 | ⭐⭐ |
| 📂 **目录遍历** | 路径穿越漏洞 | ⭐ |
| 👁️ **敏感信息泄露** | 敏感信息直接暴露 | ⭐ |
| 🔄 **PHP 反序列化** | 反序列化漏洞利用 | ⭐⭐⭐ |
| 📦 **XXE** | XML 外部实体注入 | ⭐⭐⭐ |
| 🔀 **不安全的 URL 重定向** | 开放重定向 | ⭐ |
| 🌐 **SSRF** | 服务端请求伪造 | ⭐⭐⭐ |
| 🛠️ **管理工具** | XSS 管理后台（钓鱼/捞 Cookie/键盘记录） | ⭐⭐ |

> 💡 每个漏洞都有不同子场景，页面右上角 **"提示"** 可查看帮助。

---

## 🚀 快速启动

> 💡 以下 3 种方式，根据你的情况选一种即可。**前提条件各不相同，选最适合你的。**

---

### ⭐ 推荐：Docker（前提：需先装 Docker）

```bash
# 1️⃣ 下载
git clone https://github.com/TrueFurina/pikachu.git
cd pikachu

# 2️⃣ 启动（首次自动拉取镜像，之后秒开）
docker compose up -d
```

浏览器访问 **http://127.0.0.1/pikachu/** → 点击"初始化安装" → 🎯 开练！

| 前提条件 | 说明 |
|---------|------|
| ✅ 需要安装 Docker | 下载 [Docker Desktop](https://www.docker.com/products/docker-desktop/)（约 5 分钟装好） |
| ✅ 安装后无需再装 PHP/MySQL/Apache | 镜像自带完整环境 |
| ✅ 任何系统通用 | Windows / Mac / Linux 都行 |

---

### 🪟 Windows 已装 PHPStudy 的用户：双击 .bat 一键启动

> **前提：已安装 PHPStudy，且安装在 D 盘。** 如果装在其他盘，需要手动改一下脚本路径。

| 前提条件 | 说明 |
|---------|------|
| ✅ 需要安装 PHPStudy | 下载 [phpstudy.net](https://www.xp.cn/download.html)（约 5 分钟装好） |
| ✅ 需要把本项目放到 `WWW` 目录 | 见下方第一步 |
| ✅ 装好后**不需要打开 PHPStudy 面板** | 脚本直接调用引擎，双击即用 |
| ✅ **后续每次启动**只需双击 .bat | 无需再开面板 |

| 脚本 | 功能 |
|------|------|
| `start_pikachu.bat` 🚀 | **一键启动** — 自动检测并启动 MySQL、Apache，打开浏览器进入靶场 |
| `stop_pikachu.bat` 🛑 | **安全关闭** — 自动关闭 MySQL 和 Apache |

```batch
① 第一次：把 pikachu 文件夹放到 D:\phpstudy_pro\WWW\
② 以后每次：双击 start_pikachu.bat
③ 脚本自动启动 Apache + MySQL
④ 浏览器自动打开 → http://127.0.0.1:8885/
⑤ 首次访问 → 点击"初始化安装" → 开练！🎯
```

> ⚠️ 如果你的 PHPStudy 安装在**非 D 盘**，右键编辑 `start_pikachu.bat`，把第 12 行 `PHPSTUDY_ROOT` 改成你的实际路径。

---

### 🔧 手动搭建（PHPStudy / XAMPP / LNMP 通用）

1. 把 `pikachu` 文件夹放到 Web 根目录
2. 修改 `inc/config.inc.php` 中的数据库连接信息
3. 导入数据库：`mysql -u root -p < pikachu.sql`
4. 访问 `http://127.0.0.1/pikachu/` → 点击"初始化安装"

---

## 👶 新手小白从零开始配置指南

> 如果你连 Docker 和 PHPStudy 都没有，**按下面 6 步走，15 分钟搞定**。

### 📦 第一步：下载安装 PHPStudy

PHPStudy 是一个集成了 Apache、MySQL、PHP 的集成环境，我们用它来运行靶场。

1. 打开浏览器，访问 https://www.xp.cn/download.html
2. 下载 **Windows 版**（选择推荐版本，约 200MB）
3. 双击安装包安装，安装路径选择 **`D:\phpstudy_pro`**（默认即可）
4. 安装完成后**不需要打开** PHPStudy 面板，直接关掉它

> ✅ 安装后，`D:\phpstudy_pro\Extensions\` 目录下就会有 Apache 和 MySQL 了

### 📥 第二步：下载本项目

**方式 A：下载 ZIP（推荐新手）**

1. 打开 https://github.com/TrueFurina/pikachu
2. 点击绿色按钮 **「Code」→「Download ZIP」**
3. 解压 ZIP，把里面的 `pikachu` 文件夹复制到 `D:\phpstudy_pro\WWW\`

**方式 B：使用 Git（有基础的用户）**

```bash
git clone https://github.com/TrueFurina/pikachu.git
```
然后把 `pikachu` 文件夹放到 `D:\phpstudy_pro\WWW\`

### 🚀 第三步：一键启动靶场

1. 进入 `D:\phpstudy_pro\WWW\pikachu\` 文件夹
2. **双击** `start_pikachu.bat`
3. 会弹出一个黑色命令行窗口，自动启动 Apache 和 MySQL
4. 看到 **「✅ 启动完成」** 就说明成功了

> 💡 如果弹出错误，确认一下你的 PHPStudy 是否安装在 D 盘。
> 如果不是，右键编辑 `start_pikachu.bat`，把第 12 行的 `D:\phpstudy_pro` 改成你的实际路径。

### 🌐 第四步：初始化数据库

1. 打开浏览器，访问 **http://127.0.0.1:8885/**
2. 页面会提示 **"数据库连接失败，是否初始化安装？"**
3. 点击 **「初始化安装」** 或 **「安装/初始化」** 按钮
4. 等待几秒，显示 **「安装成功」** 即可

### 🎯 第五步：开始练习

回到首页 http://127.0.0.1:8885/，你会看到 16 种漏洞的导航菜单：
- 点击任意漏洞即可开始练习
- 页面右上角 **「提示」** 按钮会告诉你这个漏洞怎么利用
- 配合 **Burp Suite** 等工具效果更佳

### 🛑 第六步：用完怎么关闭

- 双击 `stop_pikachu.bat` 即可安全关闭 Apache 和 MySQL
- 或者直接关掉黑色命令行窗口也行
- **下次再用**：双击 `start_pikachu.bat` 就行了，不用重复前面的步骤

---

## 📸 截图

> *（欢迎 PR 贡献截图！）*

| 首页 | 漏洞列表 | SQL 注入 |
|:---:|:-------:|:--------:|
| 首页概览 | 16 种漏洞导航 | SQL 注入练习页 |

---

## 📁 目录结构

```
pikachu/
├── inc/                    # 核心配置（数据库、函数）
│   ├── config.inc.php      # 数据库连接配置
│   ├── function.php        # 公共函数
│   └── uploadfunction.php  # 文件上传处理
├── vul/                    # 🎯 漏洞模块（核心目录）
├── pkxss/                  # XSS 管理后台（钓鱼/捞 Cookie）
├── assets/                 # 静态资源（CSS/JS/图片）
├── test/                   # 测试工具
├── wiki/                   # Wiki 文档
├── install.php             # 数据库初始化安装
├── index.php               # 首页入口
├── pikachu.sql             # 数据库备份
├── Dockerfile              # Docker 构建
├── docker-compose.yml      # Docker Compose
├── start_pikachu.bat       # 🚀 Windows 一键启动
└── stop_pikachu.bat        # 🛑 Windows 一键关闭
```

---

## 🛠️ 环境要求

| 依赖 | 版本 | 说明 |
|------|:---:|------|
| PHP | 7.0+ | 推荐 7.4 |
| MySQL | 5.6+ | 推荐 5.7 |
| Web 服务器 | Apache / Nginx | 支持 URL 重写 |
| Docker | 20.10+ | 仅 Docker 方式需要 |

---

## 📚 学习资源

- [SEED Labs 网络安全实验](https://github.com/seed-labs/seed-labs) — 系统化的网络安全实验
- [OWASP Top 10](https://owasp.org/www-project-top-ten/) — OWASP 十大 Web 安全风险
- [PortSwigger Web Security Academy](https://portswigger.net/web-security) — 在线交互式 Web 安全练习
- [Burp Suite 官方文档](https://portswigger.net/burp/documentation) — 渗透测试神器使用指南

---

## 🤝 如何贡献

- ⭐ **点个 Star** — 让更多人发现这个项目
- 🐛 **提 Issue** — 发现问题或建议
- 📝 **提 PR** — 修复 bug、增加漏洞场景、完善文档
- 💬 **分享给同学** — 一起练渗透

---

## ⚠️ 安全声明

> **本靶场仅供网络安全学习与测试使用，请勿用于非法用途。**
>
> 使用本软件产生的任何法律问题由使用者自行承担。

---

## 📄 许可证

本项目基于 **MIT 许可证** 开源，详见 [LICENSE](LICENSE) 文件。

---

<div align="center">
  <br/>
  <a href="https://github.com/TrueFurina/pikachu">
    <img src="https://img.shields.io/github/stars/TrueFurina/pikachu?style=for-the-badge&logo=github&label=⭐ 给个 Star 支持一下" alt="Star"/>
  </a>
  <br/><br/>
  <sub>Built with ❤️ for the security community</sub>
  <br/>
  <sub>Pikachu 定制版 — 不是原版，胜在开箱即用 🚀</sub>
</div>