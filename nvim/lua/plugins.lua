local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)

	use { "wbthomason/packer.nvim" }
	use { "nvim-lua/plenary.nvim" }
	use { 'nvim-lua/popup.nvim' }
	use { "neovim/nvim-lspconfig" }
	use { 'glepnir/lspsaga.nvim'} 

	use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
	use { 'stevearc/aerial.nvim' }
	use { 'stevearc/dressing.nvim'}

	--[[ use {'rmagatti/auto-session',
	  config = function()
	    require('plugins.auto-session')
	  end
	}
	use {'rmagatti/session-lens',
	  requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
	  config = function()
	    require('plugins.session-lens')
	  end
	} ]]


	use { "nvim-lua/lsp-status.nvim" }
	use { "nvim-lua/lsp_extensions.nvim" }

	use { "kyazdani42/nvim-web-devicons"}
	use { "yamatsum/nvim-nonicons"}

	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { "hrsh7th/nvim-cmp"}

	use {'hrsh7th/cmp-vsnip'}
	use {'hrsh7th/vim-vsnip'}

	use {"pianocomposer321/yabs.nvim"}

	use {"folke/trouble.nvim",
   		requires = "kyazdani42/nvim-web-devicons",
    	config = function()
       		require("trouble").setup {}
    	end
	}
	use { "simrat39/symbols-outline.nvim"}
	use { "williamboman/nvim-lsp-installer" }

	use { "jose-elias-alvarez/null-ls.nvim"}
	use { "kosayoda/nvim-lightbulb" }
	use { "onsails/lspkind-nvim" }

	use { "ray-x/lsp_signature.nvim" }
	use { "dstein64/nvim-scrollview"}
	-- use { "Xuyuanp/scrollbar.nvim"}
	-- use {"mizlan/iswap.nvim"}

	use { "nvim-telescope/telescope.nvim" }
	use {"nvim-telescope/telescope-file-browser.nvim"}
	-- use { "nvim-telescope/telescope-vimspector.nvim"}
   -- use { "nvim-telescope/telescope-z.nvim"}
	use { "nvim-telescope/telescope-project.nvim"}
	use { "nvim-telescope/telescope-frecency.nvim"}
	use { "nvim-telescope/telescope-dap.nvim"}
	-- use { "nvim-telescope/telescope-packer.nvim"}
	use { "nvim-telescope/telescope-symbols.nvim"}
	-- use { "dcampos/nvim-snippy"}
	use { "nvim-neorg/neorg-telescope"}
	use { "sudormrfbin/cheatsheet.nvim"}

	use { "nvim-treesitter/nvim-treesitter" }
	use { "nvim-treesitter/nvim-tree-docs"}
	use { "nvim-treesitter/nvim-treesitter-textobjects"}
	use { "JoosepAlviste/nvim-ts-context-commentstring"}
	use { "RRethy/nvim-treesitter-textsubjects"}
	use { "nvim-treesitter/nvim-treesitter-refactor" }
	use { "romgrk/nvim-treesitter-context"}
	-- use {"ldelossa/calltree.nvim"}
	use {"filipdutescu/renamer.nvim"}

	use {"b3nj5m1n/kommentary"}
	-- use { "sidebar-nvim/sidebar.nvim"}

	use {"mrjones2014/dash.nvim",
		run = "make install",
	}

	use { "kevinhwang91/nvim-hlslens"}
	use {"nvim-pack/nvim-spectre"}
	use { "kdheepak/lazygit.nvim"}
	use {"rcarriga/nvim-notify"}


	use { "akinsho/toggleterm.nvim"}
	use { "folke/which-key.nvim",
	    config = function()
		require("which-key").setup{

		}
	    end
	}
	use {'RishabhRD/popfix'}
	use {'RishabhRD/nvim-lsputils'}
	-- use { "famiu/feline.nvim"}
	 use { "windwp/windline.nvim"}
	use { "beauwilliams/focus.nvim"}
	use { "sakhnik/nvim-gdb"}

	use { "kyazdani42/nvim-tree.lua",
	    requires = {'kyazdani42/nvim-web-devicons'},
	    config = function() require("plugins.nvim-tree") end,
	}
	-- use { "nanozuki/tabby.nvim",
	    -- config = function() require("plugins.tabby") end,
	-- }
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	-- use { "glepnir/dashboard-nvim"}
	use {    'goolord/alpha-nvim', config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.opts)
      end
	}
	use { "NTBBloodbath/rest.nvim"}
	use { "karb94/neoscroll.nvim"}

	use { "mfussenegger/nvim-dap"}
	use { "rcarriga/nvim-dap-ui"}
	use { "theHamsta/nvim-dap-virtual-text"}
	use { "Pocco81/DAPInstall.nvim"}

	use { "windwp/nvim-autopairs"}
	use { "hkupty/iron.nvim" }
	use { "mhartington/formatter.nvim",
	    config = function()
		require("plugins.formatter")
	    end
    }

	use { "nathom/filetype.nvim"}
	use { "ggandor/lightspeed.nvim"}
	use { "kevinhwang91/nvim-bqf", ft = 'qf' }
	use { "blackCauldron7/surround.nvim",
	    config = function()
		require"surround".setup {mappings_style = "sandwich"}
	    end
	}
	use { "lewis6991/gitsigns.nvim"}
	use {'nvim-telescope/telescope-fzf-native.nvim', 
	    run = 'make' ,
	    config = function() require"plugins.fzf-native" end
	}
	use { "jalvesaq/Nvim-R"}
	use { "simrat39/rust-tools.nvim" ,
	    config = function() 
		require("plugins.rust-tools") 
	    end
	}
	use { "Saecki/crates.nvim",
	    event = { "BufRead Cargo.toml" },
	    config = function()
		require('plugins.crates')
	    end,
	}
	use { "ray-x/go.nvim"}
	use { "jose-elias-alvarez/nvim-lsp-ts-utils"}
	use { "alaviss/nim.nvim"}
	use {"akinsho/flutter-tools.nvim"}
	--[[ use {'pianocomposer321/yabs.nvim',
	    requires = { 'nvim-lua/plenary.nvim' },
	    config = function() require("plugins.yabs") end
	} ]]
	use { "nanotee/sqls.nvim"}
	use { "luukvbaal/stabilize.nvim",
	    config = function() require("stabilize").setup() end
	}
	use {'VonHeikemen/searchbox.nvim',
	    requires = { {'MunifTanjim/nui.nvim'} }
	}
	use { "nvim-neorg/neorg",

	config = function()
		require("neorg").setup {
    		load = {
        		["core.defaults"] = {},
        		["core.norg.concealer"] = {},
        		["core.norg.dirman"] = {
            		config = {
                		workspaces = {
                    		my_workspace = "~/org"
                		}
            		}
        		}
    		}
		}
	end,
	requires = "nvim-lua/plenary.nvim"
	}
	
	use {"max397574/better-escape.nvim"}
	-- use { "lukas-reineke/headlines.nvim"}
	--
	use { "weilbith/nvim-code-action-menu",
	    cmd = 'CodeActionMenu',
	    config = function()
		vim.g.code_action_menu_show_details = false
		vim.g.code_action_menu_show_diff = false
	    end
	}
	use { "norcalli/nvim-colorizer.lua" }


	use {'ShinKage/idris2-nvim', 
	    requires = {'neovim/nvim-lspconfig', 'MunifTanjim/nui.nvim'},
	    config = function() require('idris2').setup {} end
	}
	use { "Mofiqul/dracula.nvim"}
	use { "Shatur/neovim-ayu" }
    use 'purescript-contrib/purescript-vim'
    use 'Olical/conjure'

  -- My plugins herekkkkj
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

----
--
--
--
--
