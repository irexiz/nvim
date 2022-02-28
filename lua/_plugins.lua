local fn = vim.fn
local install_path = fn.stdpath('data')..'/home/iz/.local/nvim/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- LSP
    use 'neovim/nvim-lspconfig' 
    use 'hrsh7th/nvim-cmp' 
    use 'hrsh7th/cmp-nvim-lsp' 
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'simrat39/rust-tools.nvim' 
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip' 
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'weilbith/nvim-code-action-menu'

    -- GUI enhancements
    use 'machakann/vim-highlightedyank'
    use 'andymass/vim-matchup'
    use 'chriskempson/base16-vim'
    use 'scrooloose/nerdtree'
    use 'scrooloose/nerdcommenter'
    use 'tpope/vim-surround'
    use 'justinmk/vim-sneak'
    use 'jiangmiao/auto-pairs'
    use 'godlygeek/tabular'
    use 'ap/vim-buftabline'
    use 'tpope/vim-fugitive'

    -- Fuzzy finder
    use 'airblade/vim-rooter'
    use {'junegunn/fzf', rtp = { '~/.fzf' }, run = {'./install --all' }}
    use 'junegunn/fzf.vim'

    -- Syntactic language support
    use 'cespare/vim-toml'
    use 'stephpy/vim-yaml'
    use 'dag/vim-fish'
    use 'plasticboy/vim-markdown'
    use 'sheerun/vim-polyglot'
    use 'kabbamine/yowish.vim'
    use 'morhetz/gruvbox'

    -- Debuggers
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
end)
