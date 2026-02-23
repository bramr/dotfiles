local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = {"bash", "c", "c_sharp", "css", "csv", "diff", "dockerfile",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gomod", "gosum", "html", "http", "java", "javadoc", "javascript",
    "json", "jsonc", "lua", "markdown", "markdown_inline", "nginx","php",
    "python", "regex", "rust", "scss", "sql", "toml", "tmux", "tsx", "twig",
    "typescript", "vim", "vimdoc", "vue", "xml", "yaml", "zig"
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'norg' },

	highlight = {
		enable = true,
	}
}
