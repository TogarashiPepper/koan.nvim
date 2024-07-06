# Koan.nvim
This is a simple plugin to get koan syntax highlighting and treesitter in nvim. To get started add this to your lazy.nvim plugin spec:

```lua
return {
    "https://github.com/TogarashiPepper/koan.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "koan",
    config = function()
        require('koan').setup()
    end
}
```

You'll also have to add this somewhere in your init.lua so vim and treesitter recognizes the koan filetypes


```lua
vim.filetype.add({
    extension = {
        koan = 'koan',
        kn = 'koan'
    }
})
```

After adding this you may need to run `:TSInstall koan` and afterwards any files with the `kn` or `koan` extension should have the proper syntax highlighting.
