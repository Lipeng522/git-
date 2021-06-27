------------------------------------------------------
######                  git命令                  ######
------------------------------------------------------
-- 产看版本信息
git --version

-- 全局用户名配置
git config --global user.name "用户名"

-- 全局邮箱设置
git config --global user.email "邮箱地址"

-- 配置信息查询
git config --list

-- 仓库初始化，在文件夹下执行该命令，即可将该文件设置成git本地仓库
git  init

-- 仓库文件的三个状态：已修改、已提交、已暂存

-- 仓库状态查看，能够看到工作目录和暂存区的文件状态
git status

-- 文件提交到暂存区，可以用“.”实现本次仓库的全部提交
git add 文件名

-- 提交到本地仓库
git commit -m '备注'

-- 暂存区提交的文件撤销
git restore --staged 'file'  -- 选择性的把暂存区的数据移出
git reset HEAD 'file'  -- 取消上一次的操作，可以取消commit，无法选择性移出文件

-- 不经过暂存区直接提交,-add -m合并后为-am
git commit -am 'comment'

-- 本地库和提交文件的区别
git diff HEAD -- 文件名

-- 查看提交日志信息
git log  -- 查看详细信息
git log --pretty=oneline  -- 按行展示
git reflog -- 查看全部版本的提交日志
git log --graph --pretty=oneline -- 图表的方式查看日志

-- 版本回退
git reset --hard HEAD^  回退1个版本
git reset --hard HEAD~2 回退到指定的版本
git reset --hard '唯一标识' 回退和前进到指定版本

-- 查看git 仓库的文件
git ls-files

-- 拉取本地库文件
git checkout 'file_name'

-- 文件删除
git add + commit -- 通过提交的方式删除仓库的文件
git rm 'file_name' -- 通过rm指定删除本地库的文件，操作目录也会删除

-- 生成ssh key
ssh-keygen -t -rsa -C 'github邮箱' -- win10不行的话尝试如下命令
ssh-keygen -C"github邮箱"
到指定的文件夹下既可以看到产生的公私钥

-- 检查测试链接命令
ssh -T git@github.com

-- 本地仓库分支名称修改，新版本无master，只有main，需要保证一致
git branch -m 'master' 'main'




------------------------------------------------------
######                  github                  ######
------------------------------------------------------
-- 克隆github上的项目到本地
code --> download zip.file -- 下载zip的方式
git clone 'git地址' -- 克隆项目的方式下载
git clone 'ssh地址' -- 配置了公钥之后，可以使用ssh的方式下载，速度和安全性更高

-- 远程创建仓库
github上直接创建新的仓库

-- 绑定远程仓库
git remote add origin git@github.com:Lipeng522/git_study_note.git

-- 推送到远程主干分支上
git push -u origin main

-- 远程仓库属性查看
git remote 


-- git分支操作
-- 切换到指定分支
git checkout branch  

-- 新建分支并切换到新建分支 
git checkout -b new_branch  

-- 删除指定分支
git branch -d branch   

-- 查看所有分支给i他

-- 合并分支，只能通过main分支合并其他子分支
git merge branch 

-- 重新命名分支，如果新分支已经存在，则需要使用-M强制重命名，否则使用-m进行重命名 
git branch -m|-M old_branch new_branch

-- 在分支下提交的文件不会在main下出现，需要切换到main，然后合并分支


-- 分支Push和pull操作
-- 查看本地和远程分支
git branch -a

-- 推送本地分支到远程
git push origin branch_name

-- 删除远程分支（本地分支依然保留）
git push origin :remote_branch

-- 拉取远程指定分支，并在本地创建分支
git checkout -b local_branch origin/remote_branch

-- 获取远程分支最新状态



-- 多人协同开发的冲突（多人对文件开发产生的冲突）
-- 1、先拉取代码
git pull  -- 先解决冲突，重新提交

-- 2、push上去
git push



-- 标签管理tag
-- 新建标签默认为head
git tag tag_name
git tag tag_name '唯一标识'
git tag -a v0.99 -m '先行版' '唯一标识'

-- 添加标签并指定标签的描述说明
git tag -a tag_name -m 'xxx'

-- 查看所有的标签
git tag

-- 删除一个本地标签
git tag -d tag_name

-- 推送本地标签到远程
git push origin tag_name

-- 推送全部未推送过的本地标签到远程
git push origin --tags

-- 删除一个远程标签
git push origin :refs/tags/tag_name
