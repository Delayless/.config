插入模式下的快捷键
CTRL + o 	// 执行单次命令操作
CTRL + h 	// 删除光标前的一个字符
CTRL + w 	// 删除光标前的一个单词
CTRL + u 	// 删除当前行的所有字符
CTRL + t 	// 当前行首插入一个位移宽度的缩进
CTRL + d 	// 当前行首删除一个位移宽度的缩进

常用的 Terminal 命令
查找关键字
grep "oh my zsh" ~/Dropbox/**/*.md
grep "padding-top" $(grep -rl "#content" **/*.scss)   // 查找目录底下包含所有 #content 的字符和 "padding-top" 的文件


常用的 oh my zsh 命令
zsh_stats	// 查看前 20 条常用命令
d 		// 该终端下所有访问过的目录，选取数字，直接进入
take 		// 新建目录，并进入目录
clipcopy & clippaste 	// 剪切板操作, clipcopy + file name


You can press 1 followed by Ctrl+G to see the full path of the current file.
Pressing only Ctrl+G shows the path relative to Vim's current working directory.
In insert mode, type Ctrl-r then % to insert the name of the current file.
你可以按1，然后按Ctrl+G，查看当前文件的完整路径。只按Ctrl+G显示的是相对于Vim当前工作目录的路径。在插入模式下，键入Ctrl-r然后键入%来插入当前文件的名称。



Add # using mark 批量增加 # 在行首
In vi:
ma      // Go to top of block and mark it with letter a.
mb      // Go to bottom of block and mark it with letter b
Then do

:'a,'b s!^!#!
