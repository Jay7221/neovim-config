return {
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",       -- Buffer completions
      "hrsh7th/cmp-path",         -- Path completions
      "hrsh7th/cmp-nvim-lsp",     -- LSP completions
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
      "rafamadriz/friendly-snippets", -- Useful snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- Close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          
          -- Tab for snippet navigation
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        
        -- Sources for autocompletion (order matters for priority)
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP
          { name = "luasnip" },  -- Snippets
          { name = "buffer" },   -- Text within current buffer
          { name = "path" },     -- File system paths
        }),
        
        -- Configure appearance
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        
        -- Formatting
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            -- Kind icons
            local kind_icons = {
              Text = "",
              Method = "m",
              Function = "",
              Constructor = "",
              Field = "",
              Variable = "",
              Class = "",
              Interface = "",
              Module = "",
              Property = "",
              Unit = "",
              Value = "",
              Enum = "",
              Keyword = "",
              Snippet = "",
              Color = "",
              File = "",
              Reference = "",
              Folder = "",
              EnumMember = "",
              Constant = "",
              Struct = "",
              Event = "",
              Operator = "",
              TypeParameter = "",
            }
            
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]
            
            return vim_item
          end,
        },
      })
    end,
  },
}
