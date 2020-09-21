#  _               _
# | |__   __ _ ___| |__
# | '_ \ / _` / __| '_ \
# | |_) | (_| \__ \ | | |
# |_.__/ \__,_|___/_| |_|

#Search h files
find_h() { find . -type f -name \*.h -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search c files
find_c() { find . -type f -name \*.c -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search cpp files
find_cpp() { find . -type f -name \*.cpp -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search fdf files
find_fdf() { find . -type f -name \*.fdf -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search stb files
find_stb() { find . -type f -name \*.stb -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search meta files
find_meta() { find . -type f -name \*.meta -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
find_make() { find . -type f -name \*akefile -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
find_cmake() { find . -type f -name \CMakeLists.txt -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search txt files
find_text() { find . -type f -name \*.txt -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Search for any file with a certain name
find_any() { find . -type f -name \* -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
find_file() { find . -type f -name $1 -not -path "./packages/*" -print; }
#Search for xml file
find_xml() { find . -type f -name \*.xml -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
find_type() { find . -type f -name $2 -not -path "./packages/*" -type $1 -print; }
find_d() { find . -type f -name $1 -type d -not -path "./packages/*" -print; }
find_dir() { find . -type f -name $1 -type d -not -path "./packages/*" -print; }
#Search for a lua file
find_lua() { find . -type f -name \*.lua -not -path "./packages/*" -exec grep -I $1 {} \; -print; }
#Searches for a cpp file and displays only the name not context
find_cpp_quiet() { find . -type f -name \*.cpp -not -path "./packages/*" -exec grep -q -I $1 {} \; -print; }
find_any_quiet() { find . -type f -name \* -not -path "./packages/*" -exec grep -q -I $1 {} \; -print; }
#Search the current directory for any file containing arg[1] and replace with arg[2]
replace_all() { find ./ -type f -readable -writable -exec sed -i "s/$1/$2/g" {} \; -print; }
#Search the current directory for a file of arg[1] type to replace arg[2] with arg[3]
replace_type() { find ./ -name \*.$1 -exec sed -i "s/$2/$3/g" {} \; -print; }

#ls after a cd
function cd {
   builtin cd "$@" && ls
}

#A E S T H E T I C S
COLOR1="\[\033[1;32m\]"
COLOR2="\[\033[0;96m\]"
COLOR3="\[\033[1;32m\]"
COLOR4="\[\033[1;37m\]"
COLOR5="\[\033[0;30m\]"

PS1="$COLOR3($COLOR2\u@\h$COLOR3)-($COLOR2\w$COLOR3)$COLOR1\n$COLOR2$ $COLOR3)"
LS_COLORS=$LS_COLORS:'di=01;36' 
#-($COLOR1\@$COLOR2 $COLOR1\d$COLOR2)  not neccesary right now since time is different

if [ "$UID" = "0" ];
then
   # I am root
   COLOR2="\[\033[0;31m\]"
fi

export PS1

#Who needs emacs?
alias emacs='nvim'
alias vim='nvim'
alias eclipse='/usr/local/eclipse/eclipse &'
#clears screen
alias cls='clear'
#confirmation on remove with just rm
alias rm='rm -i'
#confirmation on copy with just cp
alias cp='cp -i'
alias wget='wget -q'
#confirmation of mv with just mv
alias mv='mv -i'
alias mi='make -j5 install'
alias mc='make -j5 clean'
alias mm='make -j5 move'
alias modshellscripts='find . -type f -name "*.sh" -exec chmod 555 {} \;'
alias find_Any='find_any'
#Typos
alias dc='cd';
alias ls='ls --color=always'
#ssh shortcuts
#quick documents cd
alias vcts_all='cd /mnt/c/Users/cholmes/VCTS_ALL'
alias vcts_cds='cd /mnt/c/Users/cholmes/VCTS_CDS'
alias vcts_sgs='cd /mnt/c/Users/cholmes/VCTS_SGS'
alias vcts_ios='cd /mnt/c/Users/cholmes/IOS'
alias system_control='cd /mnt/c/Users/cholmes/SystemControl'
alias workspace='cd /mnt/c/Users/cholmes/Workspace'
alias cmakeclean='rm -f CMakeCache.txt rm -rf CMakeFiles rm -f *.sln'
export TERM=linux
