local files = require("utils.api").files

local M = {
    transparent = false,
    dim_inactive = false,

    float_border = true,
    show_winbar = true,

    auto_save = true,

    storage_directory = files.join(vim.fn.stdpath("data"), "store"),
    lazy_install_directory = files.join(vim.fn.stdpath("data"), "lazy"),
    mason_install_directory = files.join(vim.fn.stdpath("data"), "mason"),
    global_config_directory = files.join(vim.fn.stdpath("config"), "config"),
}

return M
