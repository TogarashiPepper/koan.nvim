function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end


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

    local url = "https://raw.githubusercontent.com/TogarashiPepper/tree-sitter-koan/main/queries/highlights.scm"
    local output_file = "highlights.scm"

    local config = os.getenv("HOME") .. "/.config/nvim"

    if not file_exists(config .. "/queries/koan") then
        local command = string.format('curl -s "%s" -o "%s"', url, output_file)
        local success, exit_code = os.execute(command)

        os.execute("mkdir -p " .. config .. "/queries/koan")
        os.execute("mv highlights.scm " .. config .. "/queries/koan/highlights.scm")
    end
end

return { setup = setup }
