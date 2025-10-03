{
  pkgs,
  lib,
  ...
}: {
  # https://github.com/NotAShelf/nvf/blob/main/configuration.nix
  programs.nvf = {
    enable = true;
    settings.vim = {
      statusline = {
        lualine = {
          enable = true;
          theme = lib.mkForce "catppuccin";
        };
      };

      utility = {
        ccc.enable = false;
        vim-wakatime.enable = false;
        diffview-nvim.enable = true;
        yanky-nvim.enable = false;
        icon-picker.enable = false;
        surround.enable = true;
        multicursors.enable = true;
        smart-splits.enable = true;

        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = true;
        };
        images = {
          image-nvim.enable = false;
          img-clip.enable = true;
        };
      };

      filetree = {neo-tree = {enable = true;};};

      tabline = {nvimBufferline.enable = true;};

      theme = {
        enable = true;
        name = lib.mkForce "catppuccin";
        style = "mocha";
      };

      autopairs.nvim-autopairs.enable = true;

      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        nix = {enable = true;}; # if you meant Nix
        lua = {enable = true;}; # or Lua
        rust = {enable = true;};
        python = {enable = true;};
      };

      treesitter = {
        enable = true;
        context.enable = false;
        textobjects = {
          enable = true;
          setupOpts = {
            move = {
              enable = true;
              set_jumps = true; # record in jumplist
              goto_next_start = {
                "]m" = "@function.outer";
              };
              goto_next_end = {
                "]M" = "@function.outer";
              };
              goto_previous_start = {
                "[m" = "@function.outer";
              };
              goto_previous_end = {
                "[M" = "@function.outer";
              };
              goto_next = {
                "]p" = "@parameter.inner";
              };
              goto_previous = {
                "[p" = "@parameter.inner";
              };
              goto_next_scope = {
                "]s" = "@scope";
              };
              goto_previous_scope = {
                "[s" = "@scope";
              };
            };

            # (Optional) Selecting the whole function or just its body:
            select = {
              enable = true;
              lookahead = true;
            };
          };
        };
      };

      lsp = {
        # This must be enabled for the language modules to hook into
        # the LSP API.
        enable = true;

        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
        hardtime-nvim.enable = false;
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = false; # the theme looks terrible with catppuccin
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            # this is a freeform module, it's `buftype = int;` for configuring column position

            nix = "110";
            ruby = "120";
            java = "130";
            go = ["90" "130"];
          };
        };
        fastaction.enable = true;
      };

      assistant = {
        chatgpt.enable = false;
        copilot = {
          enable = true;
          cmp.enable = true;
        };
        codecompanion-nvim.enable = false;
        avante-nvim.enable = false;
      };

      comments = {comment-nvim.enable = true;};
      projects = {project-nvim.enable = true;};

      session = {nvim-session-manager.enable = true;};
      luaConfigPost = ''
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.smartindent = true
        vim.opt.clipboard:append("unnamedplus")
        vim.opt.expandtab = true     -- Use spaces instead of tabs
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true
        vim.opt.foldcolumn = "1"
      '';
      globals.mapleader = " ";
      options.autoindent = true;

      keymaps = [
        {
          key = "<leader>bd";
          mode = ["n"];
          action = ":bd<CR>";
          silent = true;
          desc = "Close current buffer";
        }
        {
          key = "<leader>e";
          mode = ["n"];
          action = "<cmd>Neotree toggle<CR>";
          silent = true;
          desc = "Toggle Neo-tree";
        }
        {
          key = "<leader>E";
          mode = ["n"];
          action = "<cmd>Trouble symbols toggle<CR>";
          silent = true;
          desc = "Symbols [trouble]";
        }
      ];
    };
  };
}
