version = '0.21.8'

local home = os.getenv("HOME")
package.path = home
    .. "/.config/xplr/plugins/?/init.lua;"
    .. home
    .. "/.config/xplr/plugins/?.lua;"
    .. package.path

require("fzf").setup()
require("alacritty").setup()
require("zentable").setup()
require("web-devicons").setup()
require("material-landscape2").setup {
    keep_default_layout = true,
}

xplr.config.general.search.algorithm = "Fuzzy"
xplr.config.general.show_hidden = true
xplr.config.node_types.directory.meta.icon = ""
