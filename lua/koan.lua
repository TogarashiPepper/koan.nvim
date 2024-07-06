local function setup()
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.koan = {
        install_info = {
            url = "https://github.com/TogarashiPepper/tree-sitter-koan.git",
            files = {"src/parser.c", "queries/highlights.scm"},
            branch = "main",
            generate_requires_npm = true,
            requires_generate_from_grammar = true,
        },
        filetype = "koan",
    }

    -- vim.opt.runtimepath:prepend('e,')
    local url = "https://raw.githubusercontent.com/TogarashiPepper/tree-sitter-koan/main/queries/highlights.scm"
    local output_file = "highlights.scm"

    local command = string.format('curl -s "%s" -o "%s"', url, output_file)
    local success, exit_code = os.execute(command)
    local pwd = os.getenv("PWD")

    if success then
        os.execute("mkdir -p tslookup/queries/koan")
        os.execute("cp highlights.scm tslookup/queries/koan/highlights.scm")
        vim.opt.runtimepath:prepend(pwd .. "/tslookup")
    end
end

return { setup = setup }
