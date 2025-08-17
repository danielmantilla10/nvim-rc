# (Neo)VIM CPH
This is a Vim/NeoVim extension designed specially for Competitive Programmers, It's like CPH in VS-Code, this extension allows you to give something as input to a program and an expected output, and then see if your program is able to determine the correct output in a determinated time (the limit time is set to 5.0s, but you can see how time your program used in all of its execution)

## Requirements:
Vim/NeoVim

OS: Linux

Python3 installed

git (for the installation process)

## How to setup
First clone this repository, using following commands:

If the ~/.config/nvim folder doesn't exist create it with: 

```Shell
mkdir ~/.config/nvim
```


Then:

```Shell
git clone https://github.com/danielmantilla10/CPH-Vim ~/.config/nvim/

```

#### If you're using Neovim with an init.lua file as config file
In the 10th line of the lua/daniel/cph.lua file you need to change every aparition of "daniel/" with your user name, it should look like this:

```Lua
map ("n" , "<F9>" , [[:!echo ''%:p:r''\n'/home/Your-user/.config/nvim/lua/cph/test'\n'' | cat | python3 /home/Your-user/.config/nvim/lua/cph/grader/checker.py <CR>]])
```

Add this to your init.lua:

```Lua
require ('daniel/cph') 
```


#### If you're using Vim or you're using NeoVim with a vimrc as configuration file, add the next 3 lines to your vimrc, changing <your-user> with your username:
```Vimscript
nnoremap <F9> :!echo ''%:p:r''\n'/home/<your-user>/.config/nvim/lua/cph/test'\n'' | cat | python3 /home/<your-user>/.config/nvim/lua/cph/grader/checker.py <CR>

nnoremap <F10> :h<CR>:e~/.config/nvim/lua/cph/test/temp<CR>:term ~/.config/nvim/lua/cph/test/./main -res<CR>i

nnoremap <F11> :h<CR>:e~/.config/nvim/lua/cph/test/temp<CR>:term ~/.config/nvim/lua/cph/test/./main -nor<CR>i
```

## How to use:
Press <F11> in normal mode to add new test cases, pressing <F10> will make the same but will delete all previous testcases, once in the prompt type or paste the input and output, when you end to type or paste the input and output of a testcase, type '-' (without the quotes) and enter, if you typed all the inputs or outputs, type '--' (without the quotes) and enter

All the testcases's inputs goes first, then the expected outputs

For compiling and testing some code, press <F9> in normal mode, that will compile the code and tell you the veredict of each test case

If you find any issue please make me know in the issues section

### If you want to compile by yourself the C++ codes:
```Shell
cd ~/.config/nvim/lua/cph/test/
make default
```

#### Troubleshooting
#### In Input/Output section:
std::bad_alloc: You can fix it by giving at least a character in each input/output
