export EDITORP=vim #エディタをvimに設定
export LANG=ja_JP.UTF-8 #文字コードをUTF-8に設定



# history
HISTFILE=~/work/dotfils/zsh/.zsh_hist
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history #ヒストリに実行時間も保存
setopt hist_ignore_dups #直前と同じコマンドはヒストリに追加しない
# 同時に起動しているzshの間でhistoryを共有する
setopt share_history
# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンドをhistoryに残さない
setopt hist_ignore_space
# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 高機能なワイルドカード展開を使用する
setopt extended_glob
# cd無しでもディレクトリ移動
setopt auto_cd
# コマンドのスペルミスを指摘
setopt correct


# vim like
bindkey -v

setopt correct
# 候補一覧
setopt auto_list
zstyle ':completion:*:default' menu select=1

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk


# Two regular plugins loaded without tracking.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Default thema
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Completions for docker, jq, etc..
zinit light zdharma/fast-syntax-highlighting

# Completion Path
fpath=(/usr/local/share/zsh-completions $fpath)

zinit light b4b4r07/enhancd

autoload -U compinit
compinit -u

function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


zinit light m4i/cdd

autoload -Uz compinit
compinit
. ~/.zinit/plugins/m4i---cdd/cdd


chpwd() { 
    ls -ltrG
    _cdd_chpwd
}
