<div align="center">
  <h1>⚡ Pikachu 漏洞靶场</h1>
  <p>
    <strong>一个包含常见 Web 安全漏洞的渗透测试练习平台</strong>
  </p>
  <p>
    <img src="https://img.shields.io/badge/PHP-7.4-blue?logo=php" alt="PHP"/>
    <img src="https://img.shields.io/badge/MySQL-5.7-blue?logo=mysql" alt="MySQL"/>
    <img src="https://img.shields.io/badge/Docker-支持-brightgreen?logo=docker" alt="Docker"/>
    <img src="https://img.shields.io/badge/license-MIT-green" alt="License"/>
  </p>
</div>

---

## 📖 简介

> "如果你想搞懂一个漏洞，比较好的方法是：你可以自己先制造出这个漏洞（用代码编写），然后再利用它，最后再修复它。"

**Pikachu** 是一个带有漏洞的 Web 应用系统，包含了常见的 Web 安全漏洞，适合 Web 渗透测试初学者进行练习。

---

## 🧩 包含的漏洞类型

| 漏洞类型 | 说明 | 难度 |
|---------|------|------|
| 🔓 **暴力破解** (Burte Force) | 登录接口暴力破解测试 | ⭐ |
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

> 💡 每个漏洞都设计了不同的子场景，点击页面右上角 **"提示"** 可查看帮助信息。

---

## 🚀 快速启动

### ⭐ 推荐：Docker Compose（最快）

```bash
# 克隆仓库
git clone https://github.com/<你的用户名>/<仓库名>.git
cd pikachu

# 一键启动
docker compose up -d

# 访问靶场
# 首次访问自动跳转安装页面 → 点击"初始化安装"即可
```

> 打开浏览器访问 **http://127.0.0.1/pikachu/**

### 🐳 Docker 命令行

```bash
# 使用已有镜像
docker run -d -p 8765:80 8023/pikachu-expect:latest

# 或本地构建
docker build -t pikachu .
docker run -d -p 8080:80 pikachu
```

### 🪟 PHPStudy / XAMPP（Windows）

#### 方式 A：一键启动（推荐 PHPStudy 用户）

本仓库自带 **批处理脚本**，双击即可一键启动靶场，无需手动操作：

| 脚本 | 功能 |
|------|------|
| `start_pikachu.bat` 🚀 | **一键启动** — 自动检测并启动 MySQL + Apache，打开浏览器访问靶场 |
| `stop_pikachu.bat` 🛑 | **安全关闭** — 自动关闭 MySQL 和 Apache 服务 |

**启动流程（`start_pikachu.bat`）：**
```
① 检查 MySQL 是否运行 → 未运行则自动启动
② 检查 Apache 是否运行 → 未运行则自动启动
③ 等待 5 秒服务就绪
④ 显示服务状态（运行中/未启动）
⑤ 自动打开浏览器进入 http://127.0.0.1/pikachu/
```

> ⚠️ 注意：脚本路径写死了 `D:\phpstudy_pro`，如果你的 PHPStudy 装在其他位置，需要手动修改脚本中的 `PHPSTUDY_ROOT` 路径。

#### 方式 B：手动搭建

1. 将 `pikachu` 文件夹放到 Web 根目录
2. 修改 `inc/config.inc.php` 中的数据库连接配置
3. 导入数据库：`mysql -u root -p < pikachu.sql`
4. 访问 `http://127.0.0.1/pikachu/` → 点击"初始化安装"

---

## 📁 目录结构

```
pikachu/
├── inc/                    # 核心配置文件
│   ├── config.inc.php      # 数据库连接配置
│   ├── function.php        # 公共函数
│   └── uploadfunction.php  # 文件上传处理
├── vul/                    # 漏洞模块（核心）
├── pkxss/                  # XSS 管理后台
├── assets/                 # 静态资源（CSS/JS/图片）
├── test/                   # 测试工具
├── wiki/                   # Wiki 文档
├── install.php             # 数据库初始化安装
├── index.php               # 首页入口
├── header.php              # 公共头部
├── footer.php              # 公共底部
├── pikachu.sql             # 数据库备份文件
├── Dockerfile              # Docker 构建文件
├── docker-compose.yml      # Docker Compose 配置
├── start_pikachu.bat       # 启动脚本（PHPStudy）
└── stop_pikachu.bat        # 停止脚本（PHPStudy）
```

---

## 🛠️ 环境要求

| 依赖 | 版本 | 说明 |
|------|------|------|
| PHP | 7.0+ | 推荐 7.4 |
| MySQL | 5.6+ | 推荐 5.7 |
| Web 服务器 | Apache / Nginx | 支持 URL 重写即可 |
| Docker | 20.10+ | 仅 Docker 方式需要 |

---

## 📚 学习资源

- [SEED Labs 网络安全实验](https://github.com/seed-labs/seed-labs) — 更系统的网络安全实验集合
- [OWASP Top 10](https://owasp.org/www-project-top-ten/) — OWASP 十大 Web 安全风险
- [PortSwigger Web Security Academy](https://portswigger.net/web-security) — 在线 Web 安全练习

---

## ⚠️ 安全声明

> **本靶场仅供网络安全学习与测试使用，请勿用于非法用途。**
>
> 使用本软件产生的任何法律问题由使用者自行承担。

---

## 📄 许可证

本项目基于 MIT 许可证开源，详情请查看 [LICENSE](LICENSE) 文件。

---

<div align="center">
  <sub>⭐ 如果这个项目对你有帮助，欢迎 Star 支持！</sub>
  <br/>
  <sub>Built with ❤️ for the security community</sub>
</div>