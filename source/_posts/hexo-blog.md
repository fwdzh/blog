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

