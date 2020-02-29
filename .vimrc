"文字コード
set fenc=utf-8
"タブ幅
set tabstop=4
" use tabs instead spaces
set expandtab
" 行番号の表示
set number
" タイトル表示
set title
"インクリメントサーチ
set incsearch
"検索ワードハイライト
set hlsearch
"大文字、小文字の区別をしない
set ignorecase
"大文字が含まれている場合は区別する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"
set nowrap
"対応するカッコを表示
set showmatch matchtime=1
"Yを行位置から末尾までのコピーに変更
nnoremap Y y$
"非表示文字の可視化
set list
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-,nbsp:%,trail:■
"ヤンクでクリップポードにコピー
set guioptions+=a
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" シンタックスハイライト
syntax on
" コマンドラインの履歴を10000件保存する
set history=10000
" 入力中のコマンドをステータスに表示する
set showcmd
" 現在の行を強調表示（縦）
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" スマートインデント
set smartindent
"オートインデント
set autoindent
" スマートインデント時の挿入幅
set shiftwidth=4
" ビープ音を可視化
set visualbell
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile

" 列を強調表示
set cursorcolumn

"カラースキーマの適用
"colorscheme japanesque

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif
