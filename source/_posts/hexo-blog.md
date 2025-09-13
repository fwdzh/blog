---
title: Hello Hexo
date: 2025-09-13 11:12:50
tags:
  - hexo
---

我可能是摘抄一些教程。看 [hexo.io](https://hexo.io/zh-cn/docs/) 的评论区，好多人说官方文档写得不好。hhh，我看着学习一下吧，感觉还是知道了很多以前不知道的东西。

## 一些废话

大概去年的11月我弄了一个 hexo 博客，然后写了差不多两个月，就隐藏 github 目录了。其实也写了挺多，但是当时感觉写博客有点麻烦，速度跟不上，就放弃了。

然后今年寒假，看了一下 MkDocs material 博客，于是自己弄了一个，到今天已经写了很多篇了，我的 github 也因此多了很多 contribution。但是时间长了就感觉 MkDocs material 实际上不是特别适合做博客，因为本来就是像 wiki, 文档啥的才会用得更多一点。比如博客不显示发布时间，没有一个文章列表而是需要自己排列，不过这也是有点。

总之就是感觉各有各的好处吧，我觉得同时有 hexo 博客和 MkDocs material 博客也是一个很合理的事情，毕竟写博客重要的不是在什么平台，而是写的内容本身。你也可以弄十个博客，今天发到这个，明天发到那个。反正只需要把文件多复制几份就行。

我之前主要是觉得 hexo 博客发博客很麻烦，要输好几个命令，

```powershell
hexo clean
hexo generate
hexo deploy
```

虽然可以简写成 `hexo c && hexo g && hexo d` ，但我是个嫌 git push 太麻烦要输入三个命令的人，于是我在常用的目录加了 ps 和 bash 文件，以便我在 windows 和 linux 上一个命令就可以完成 git push。以前的我不知道这个。

还有难受的地方就是，文章开头必须加 front-matter，需要数学公式也必须再加点东西，当时我感觉很难受，可能当时我没习惯用 hexo new 命令生成文章，而且还有模板可以用啊。

然后就是感觉构建有点慢之类的，虽然用了 MkDocs 之后我感觉很爽，配置很简单，每次只需 git push 就行，可以自定义文章的位置，本地甚至可以不需要环境。但是现在看来，hexo 其实也可以做到很好，弄个 github action 不就好了。

## 安装 hexo

hexo 需要 [node.js](https://nodejs.org)，建议下载较新的版本的。

如果没有 [git](https://git-scm.com/)，也需要安装一下，我们将使用 git 来部署页面。

安装完 node.js 后，运行以下命令安装 hexo:

```bash
npm install -g hexo-cli
```

安装完成后，可以找一个你喜欢的文件夹，在文件夹内打开终端，运行以下命令

```bash
hexo init
npm install
```

`hexo init` 会将当前文件夹初始化为一个 hexo 文件夹，`npm install` 会为我们下载需要的一些文件。

初始化完成后，这个文件夹下会多出一些文件。

<label style= "color: red">对了，如果有 vscode的话，可以在 vscode 中打开文件夹</label>，因为又有终端又可以看文件，感觉可能方便一些。在 vscode 中，按 `ctrl + ~` 可以打开终端。

现在，运行 `hexo server` 命令。

```bash
hexo server
```

如果你看到大概这样的内容，那说明已经初始化成功了。

[![pVWyZHP.png](https://s21.ax1x.com/2025/09/13/pVWyZHP.png)](https://imgse.com/i/pVWyZHP)

按住 ctrl 然后单击链接就可以在浏览器打开了，这时候你应该可以看到有一篇默认的文章。

## 部署页面

如果你没有用过 github 你需要先注册账号，这里因为要使用 github pages 功能，所以无法使用 gitee 代替，之前好像有 gitee pages，但是我没咋了解，现在好像早用不了了。

```bash
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"
```

如果你没有运行过以上两个命令，运行一下，填你的 github 用户名和邮箱。

然后你可能需要一些魔法，可能还需要改一下 github 的代理，比如遇到什么 443 失败啥的可能。都可以在网上找到对应的解决办法。

### 新建目录

在 [github](https://github.com/new) 新建一个目录，不要勾添加 `readme.md`，加了也行但是可能会不太一样。

把下面的链接中的 username 和 repo 改成你自己的 github 用户名和项目名字，你建完 github 目录之后应该就有这个链接，可以直接复制过来。

```
git init
git remote add origin https://github.com/username/repo.git
git branch -M main
git add .
git commit -m "first commit"
git push -u origin main
```

运行上面的命令之后，刷新浏览器，你应该就可以在你的 github 目录里看到你的博客的文件夹了。

### 部署github pages

先去 github 项目里的设置里，找到 pages，然后把 `Build and deployment` 下面的 `Source` 改成 `GitHub Actions` 。

我们需要在项目的根目录下建一个 `.github/workflows/pages.yml`，开始时这些文件夹都没有的，外面那个文件加就是叫 `.github` 哈，不要去掉那个点。

官方文档里给的这个文件是错的，我贴进去运行报错了。原因好像是把 landscape 当成 jecklly 的主题了，这个是 hexo 的默认主题，然后让 gpt 帮我改了一下，也有点不对，又让 deepseek 改了一下。

以下是我的配置，已构建成功，大家可以先用 `node -v` 查看自己的 node 的版本，如果不是 22，可以把 22 改成自己的版本的最前面的数字。

然后自定义域名那一行，大家如果没有自己的域名，可以不需要管。

```yml
# .github/workflows/pages.yml
name: Hexo GitHub Pages Deploy

on:
  push:
    branches: [ main ]
  workflow_dispatch:  # 允许手动触发

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # 1️⃣ 拉取仓库（包含子模块）
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
          fetch-depth: 0

      # 2️⃣ 设置 Node.js
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: "22"
          cache: 'npm'

      # 3️⃣ 安装依赖（使用 package-lock.json 确保一致性）
      - name: Install Dependencies
        run: |
          npm ci --prefer-offline
          npm install hexo-cli -g

      # 4️⃣ 构建网站
      - name: Build Hexo Site
        run: |
          hexo clean
          hexo generate
          touch ./public/.nojekyll
          # echo "example.com" > ./public/CNAME # 自定义域名
      # 5️⃣ 上传产物
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

运行以下命令将文件推送到 github

```bash
git add .
git commit -m "..."
git push
```

以后每次修改了目录想更新都会需要这三个命令，不过后面可以简单一些。

运行之后，访问 用户名.github.io/项目名，就可以访问页面了，不过需要等待构建成功。如果你的项目名正好是 用户名.github.io，那么可以直接通过 用户名.github.io 来访问。大多数人会把博客的项目名叫这个，大家也可以修改成这个。

然后就可以正常写博客发博客了。

## 写博客

一般会使用 markdown 来写博客，其实就很简单，跟 word 差不多的嘛，啥东西不会写了就问一问 deepseek 和 gpt 就好了。

推荐使用 typora 和 vscode 来写，typora 正版需要付费，但可以找到一些特殊版本，vscode 是免费的但是需要安装插件才能预览。

具体的 markdown 语法啥的就不介绍了。

我们的 hexo 博客，发布的博客都需要存放在 source/_post 文件夹下，由于博客需要有时间，标题等信息，我们需要在 .md 文件的开头加入 front-matter

```markdown
---
title: Hello world
date: 2025-09-13 11:12:50
tags:
  - 原神
---
```

大概像这样的，title 和 date 应该是必填的，tags 可选，如果每次要敲这个肯定很麻烦。

我们可以使用 `hexo new "标题"` 来新建博客，标题不需要带后缀名 `.md` ，当然也可以不用命令来建博客。用这个命令只是会给我们自动加 title 和 date，并且把文件放在 source/_post 下，自己建文件然后加个 front-matter 再放到那个目录下也是一样的。

hexo new 可以指定路径，hexo new "文章标题" --path "自定义目录/文件名"，

```bash
hexo new "abc" --path a/abc.md
```

这会在 source/_post/a/ 目录下创建 abc.md，这里文件名不必和 new 后面的字符串相同。

scaffolds/post.md 的内容就是每次 hexo new 命令后给文件填充的内容，可以自己修改哦。

写文章时可以输入 `hexo server` 命令，在浏览器中预览博客，基本上改了博客就会改，但如果改了配置文件，可能就需要重新运行 `hexo server` 了。

## 使用 PS 和 Bash

如果你也嫌每次提交都需要三个命令太长了

```bash
git add .
git commit -m "..."
git push
```

那我们可以写一个 ps 或者 sh 脚本来帮我们做这个事情，我们每次就只需要输入一行代码，比如 `.\push.ps1 "msg"` 或者 `./push.sh` 。

这个事情可以交给 gpt 或 deepseek 解决，如果它们连这种事情做不好，也没有存在的必要了hhh，虽然我也不会，每次都是问。

这个是 ps1，让 gpt 写的，在 windows 下用这个，想要自定义 msg 信息可以自己改。

如果你用 windows，在项目根目录下新建一个 push.ps1 文件，每次要更新博客，只需要输入就可以更新博客。

```bash
./push.ps1
```

如果想 commit，就用 `./push.ps1 "xxx"`。

```powershell
# push.ps1
# 自动提交并推送 Git 仓库，commit message 可选且带时间戳

param(
    [string]$msg = ""  # 默认空
)

# 获取当前时间
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 生成最终 commit message
if ([string]::IsNullOrWhiteSpace($msg)) {
    $commitMessage = "Auto commit at $timeStamp"
} else {
    $commitMessage = "$msg (at $timeStamp)"
}

# 添加所有修改的文件
git add .

# 提交
git commit -m $commitMessage

# 推送到默认远程和分支
git push
```

如果你用 linux

```bash
#!/bin/bash
# push.sh
# 自动提交并推送 Git 仓库，可选自定义 commit message + 时间戳

# 读取第一个参数作为 msg，如果没输入就空
msg="$1"

# 获取当前时间
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# 生成 commit message
if [ -z "$msg" ]; then
    commit_message="Auto commit at $timestamp"
else
    commit_message="$msg (at $timestamp)"
fi

# 添加所有修改
git add .

# 提交
git commit -m "$commit_message"

# 推送
git push
```

## 更换 Butterfly 主题

大家可以去 [hexo-theme-butterfly](https://github.com/jerryc127/hexo-theme-butterfly) 查看官方文档，这个文档应该还是做得很好的。 

由于不知道换啥主题，我就先换这个吧，因为听得比较多，然后我才发现，我之前不就是用的这个主题吗？也没事了，不知道为啥，现在就感觉设置这些很简单了，去年真的是感觉看文档都看不明白。现在感觉跟着文档弄，不懂的问问 gpt啥的，应该能解决 99% 的问题了。

在项目根目录下运行

```bash
git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
```

然后去 `_config.yml` 找到 theme，修改为 butterfly。

```yml
theme: butterfly
```

安装所需依赖，--save 参数可以将安装的依赖自动写入 packages.json，使得 npm run 命令可以下载需要的依赖。

```bash
npm install hexo-renderer-pug hexo-renderer-stylus --save
```

运行 hexo server 查看是否更换成功，提交代码即可完成更换。

其实也挺简单的呀，很方便，可能是我去年太。。。
