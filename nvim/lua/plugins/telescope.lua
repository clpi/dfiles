local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local sorters = require("telescope.sorters")
local finders = require("telescope.finders")

-- telescope fzf native
-- local fzf = require('fzf_lib')

-- require'telescope'.load_extension('frequency')
-- require'telescope'.load_extension('cheatsheet')
require("cheatsheet").setup({
    -- Whether to show bundled cheatsheets

    -- For generic cheatsheets like default, unicode, nerd-fonts, etc
    bundled_cheatsheets = true,
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },

    -- For plugin specific cheatsheets
    bundled_plugin_cheatsheets = true,
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,
})

require'telescope'.load_extension('project')
require'telescope'.load_extension('fzf')
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
)


local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

--[[ pickers.new {
  results_title = "Wiki",
  -- Run an external command and show the results in the finder window
  fd_cmd = {"fd", "type", "-f", "~/wiki", "--strip-cwd-prefix"},
  finder = finders.new_oneshot_job(fd_cmd),
  sorter = sorters.get_fuzzy_file(),
  previewer = previewers.new_termopen_previewer {
    -- Execute another command using the highlighted entry
    get_command = function(entry)
      return {"terraform", "state", "list", entry.value}
    end
  },
}:find() ]]

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    buffer_previewer_maker = new_maker,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        -- ["<C-space>"] = action_layout.toggle_preview,
        ["<esc>"] = actions.close
      }
    }
  },
  pickers = {
    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    find_files = {
	mappings = {
	    i = {
		["<C-l>"] =  function(prompt_bufnr)
            local selection = require("telescope.actions.state").get_selected_entry()
            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
            require("telescope.actions").close(prompt_bufnr)
            -- Depending on what you want put `cd`, `lcd`, `tcd`
            vim.cmd(string.format("silent lcd %s", dir))
          end
	    }
	}
    }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
