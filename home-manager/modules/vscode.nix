{ pkgs, lib, config, ... }:
{
  programs.vscode = {
    enable               = true;
    mutableExtensionsDir = true;             # must be false when using profiles
    profiles.default.userSettings = {
        # This property will be used to generate settings.json:
        # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
        "editor.formatOnSave" = true;
        "update.mode" = "none";
        "files.autoSave" = "onFocusChange";
        "workbench.sideBar.location" = "right";
        "editor.fontFamily" = lib.mkDefault  "JetBrainsMono Nerd Font, NotoMono Nerd Font, Victor Mono, JetBrains Mono";
        "editor.fontSize" = lib.mkDefault 20.0;
        # "editor.lineHeight" = 1.75; # This was commented out
        "editor.letterSpacing" = 0.35;
        "editor.codeLensFontFamily" = "JetBrainsMono Nerd Font, NotoMono Nerd Font, 0xProto Nerd Font, MesloLGS NF, Consolas, 'Courier New', monospace";
        "explorer.compactFolders" = false;
        "editor.snippetSuggestions" = "top";
        "terminal.integrated.suggest.enabled" = true;
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
          "ms-toolsai.jupyter" = 2;
          "ms-toolsai.jupyter-renderers" = 2;
          "ms-python.python" = 2;
          "ms-python.vscode-pylance" = 2;
          "ms-python.debugpy" = 2;
          "ms-dotnettools.vscode-dotnet-runtime" = 2;
          "github.copilot-chat" = 2;
          "ms-toolsai.datawrangler" = 2;
        };
        "vscode-neovim.neovimExecutablePaths.win32" = "";
        "terminal.integrated.fontSize" = lib.mkDefault 20.0;
        "editor.largeFileOptimizations" = false;
        "cSpell.userWords" = [ "foodon" ];
        "vscode-neovim.ctrlKeysForInsertMode" = [
          "h" "j" "m" "o" "r" "t" "u" "b" "g" "i" "y" "w" "k" "l" "n" "p" "q" "]"
        ];
        "vscode-neovim.ctrlKeysForNormalMode" = [
          "b" "c" "d" "e" "f" "h" "i" "j" "k" "l" "m" "o" "r" "t" "u" "v" "w" "x" "y" "z" "/" "]" "a"
        ];
        "jupyter.interactiveWindow.textEditor.executeSelection" = true;
        "jupyter.interactiveWindow.textEditor.magicCommandsAsComments" = true;
        "terminal.integrated.gpuAcceleration" = "on";
        "terminal.integrated.ignoreBracketedPasteMode" = true;
        # "nvim-edit.terminalSendTextValue" = "lvim +'call cursor(${cursor.line+1},${cursor.character+1})' ${utils.escapeShell(filename)}; exit"; # This was commented out
        "vscode-neovim.mouseSelectionDebounceTime" = 10;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.defaultLocation" = "editor";
        "nbConverter.seperator.default" = "# %%";
        "nbConverter.openFileSaveDialog" = false;
        "dataWrangler.experiments.useJupyterProposedAPI" = true;
        "jupyter.enableExtendedPythonKernelCompletions" = true;
        "jupyter.exportWithOutputEnabled" = true;
        "workbench.editor.pinnedTabSizing" = "compact";
        "terminal.integrated.confirmOnKill" = "never";
        "terminal.integrated.enableImages" = true;
        "vscode-neovim.neovimInitVimPaths.win32" = "";
        "terminal.integrated.defaultProfile.windows" = "Windows PowerShell";
        "jupyter.askForKernelRestart" = false;
        "workbench.editorAssociations" = {
          "*.copilotmd" = "vscode.markdown.preview.editor";
          "*.dwv" = "default";
        };
        "diffEditor.maxComputationTime" = 0;
        "powermode.enabled" = true;
        "powermode.combo.counterSize" = 1;
        "powermode.combo.timeout" = 1;
        "powermode.shake.intensity" = 1;
        "powermode.explosions.frequency" = 1;
        "python.analysis.autoFormatStrings" = true;
        "python.analysis.autoImportCompletions" = false;
        "python.analysis.generateWithTypeAnnotation" = true;
        "python.analysis.importFormat" = "relative";
        "python.analysis.includeAliasesFromUserFiles" = true;
        "python.analysis.inlayHints.callArgumentNames" = "all";
        "python.analysis.inlayHints.functionReturnTypes" = true;
        "python.analysis.inlayHints.pytestParameters" = true;
        "python.analysis.inlayHints.variableTypes" = true;
        "python.analysis.diagnosticSeverityOverrides" = {
          "reportMissingImports" = "none";
        };
        "python.analysis.aiCodeActions" = {
          "generateDocstring" = true;
          "generateSymbol" = true;
          "implementAbstractClasses" = true;
        };
        "python.analysis.languageServerMode" = "light";
        "isGitignoreExtActive" = true;
        "extensions.trustedPublishers" = [
          "aaron-bond" "alefragnani" "alexdauenhauer" "asvetliakov" "batisteo" "caloizou" "christian-kohler"
          "davideladisa" "donjayamanne" "dramforever" "ecmel" "esbenp" "evan-buss" "evendead" "felixzeller"
          "formulahendry" "gerrnperl" "gocodeo" "haskell" "hoovercj" "hw104" "ibm" "juniorschmidt" "justusadam"
          "kacperkozak" "katsute" "kelvin" "kevinrose" "kireshvanthb" "lavish-studios"
          "meshintelligenttechnologiesinc" "mgesbert" "miguelsolorio" "mohsen1" "murloccra4ler" "mwpb" "myping0"
          "njpwerner" "njqdev" "oderwat" "optuna" "pkief" "psqq" "puorc" "redhat" "rioj7" "ritwickdey"
          "rust-lang" "shd101wyy" "spikespaz" "stereokai" "streetsidesoftware" "styled-components" "techer"
          "tht13" "tomrijndorp" "tonybaloney" "twxs" "usernamehw" "vscodevim" "vspacecode" "wholroyd" "willasm"
          "yigitozgumus" "yo1dog" "zignd"
        ];
        "python.terminal.activateEnvInCurrentTerminal" = true;
        "python.terminal.shellIntegration.enabled" = true;
        "python-envs.defaultEnvManager" = "ms-python.python:system";
        "workbench.editor.editorActionsLocation" = "titleBar";
        "github.copilot.chat.followUps" = "always";
        "github.copilot.chat.edits.codesearch.enabled" = true;
        "github.copilot.chat.editor.temporalContext.enabled" = true;
        "github.copilot.chat.edits.temporalContext.enabled" = true;
        "github.copilot.chat.enableUserPreferences" = true;
        "github.copilot.chat.generateTests.codeLens" = true;
        "github.copilot.chat.search.semanticTextResults" = true;
        "outline-map.findRef.enabled" = true;
        "outline-map.findRef.uesFindImpl" = true;
        "outline-map.region.registerSymbolProvider" = true;
        "nvim-ui-modes.colorCustomizations" = {
          "normal" = {
            "editorCursor.foreground" = "#ee7f77";
            "activityBarBadge.background" = "#e9dbb7";
            "activityBarBadge.foreground" = "#252525";
            "statusBar.background" = "#8d504c";
            "statusBar.foreground" = "#e9dbb7";
          };
          "command" = {
            "editorCursor.foreground" = "#e9dbb7";
            "activityBarBadge.background" = "#252525";
            "activityBarBadge.foreground" = "#e9dbb7";
            "statusBar.background" = "#e9dbb7";
            "statusBar.foreground" = "#252525";
          };
          "insert" = {
            "editorCursor.foreground" = "#e9dbb7";
            "activityBarBadge.background" = "#e9dbb7";
            "activityBarBadge.foreground" = "#252525";
            "statusBar.background" = "#252525";
            "statusBar.foreground" = "#e9dbb7";
          };
          "visual" = {
            "editorCursor.foreground" = "#56a4f6";
            "activityBarBadge.background" = "#e9dbb7";
            "activityBarBadge.foreground" = "#252525";
            "statusBar.background" = "#415a81";
            "statusBar.foreground" = "#e9dbb7";
          };
          "replace" = {
            "editorCursor.foreground" = "#6af596";
            "activityBarBadge.background" = "#e9dbb7";
            "activityBarBadge.foreground" = "#252525";
            "statusBar.background" = "#39817f";
            "statusBar.foreground" = "#e9dbb7";
          };
        };
        "editor.bracketPairColorization.independentColorPoolPerBracketType" = true;
        "editor.guides.bracketPairs" = false;
        "find-it-faster.general.additionalSearchLocationsWhen" = "never";
        "find-it-faster.general.searchCurrentWorkingDirectory" = "never";
        "find-it-faster.advanced.useEditorSelectionAsQuery" = false;
        "find-it-faster.general.clearTerminalAfterUse" = false;
        "find-it-faster.general.useTerminalInEditor" = true;
        "binocular.general.keepTerminalPanelOpenAfterExecution" = true;
        "workbench.editor.enablePreviewFromQuickOpen" = true;
        "workbench.editor.enablePreviewFromCodeNavigation" = true;
        "whichkey.transient" = {
          "error" = {
            "title" = "Error transient";
            "bindings" = [
              { "key" = "N"; "name" = "Previous error"; "command" = "editor.action.marker.prev"; }
              { "key" = "n"; "name" = "Next error"; "command" = "editor.action.marker.next"; }
              { "key" = "p"; "name" = "Previous error"; "command" = "editor.action.marker.prev"; }
            ];
          };
          "symbol" = {
            "title" = "Highlight symbol transient";
            "bindings" = [
              { "key" = "p"; "name" = "Previous occurrence"; "command" = "editor.action.wordHighlight.prev"; }
              { "key" = "N"; "name" = "Previous occurrence"; "command" = "editor.action.wordHighlight.prev"; }
              { "key" = "n"; "name" = "Next occurrence"; "command" = "editor.action.wordHighlight.next"; }
              { "key" = "/"; "name" = "Search in a project with a selection"; "commands" = [ "editor.action.addSelectionToNextFindMatch" "workbench.action.findInFiles" ]; }
            ];
          };
          "lineMoving" = {
            "title" = "Line moving transient";
            "bindings" = [
              { "key" = "J"; "name" = "Move lines down"; "command" = "editor.action.moveLinesDownAction"; }
              { "key" = "K"; "name" = "Move lines up"; "command" = "editor.action.moveLinesUpAction"; }
            ];
          };
          "frameZooming" = {
            "title" = "Frame zooming transient";
            "bindings" = [
              { "key" = "="; "name" = "Zoom in"; "command" = "workbench.action.zoomIn"; }
              { "key" = "+"; "name" = "Zoom in"; "command" = "workbench.action.zoomIn"; }
              { "key" = "-"; "name" = "Zoom out"; "command" = "workbench.action.zoomOut"; }
              { "key" = "0"; "name" = "Reset zoom"; "command" = "workbench.action.zoomReset"; }
            ];
          };
          "fontZooming" = {
            "title" = "Front zooming transient";
            "bindings" = [
              { "key" = "="; "name" = "Zoom in"; "command" = "editor.action.fontZoomIn"; }
              { "key" = "+"; "name" = "Zoom in"; "command" = "editor.action.fontZoomIn"; }
              { "key" = "-"; "name" = "Zoom out"; "command" = "editor.action.fontZoomOut"; }
              { "key" = "0"; "name" = "Reset zoom"; "command" = "editor.action.fontZoomReset"; }
            ];
          };
          "imageZooming" = {
            "title" = "Image zooming transient";
            "bindings" = [
              { "key" = "="; "name" = "Zoom in"; "command" = "imagePreview.zoomIn"; }
              { "key" = "+"; "name" = "Zoom in"; "command" = "imagePreview.zoomIn"; }
              { "key" = "-"; "name" = "Zoom out"; "command" = "imagePreview.zoomOut"; }
            ];
          };
          "smartExpand" = {
            "title" = "Smart expand transient";
            "bindings" = [
              { "key" = "v"; "name" = "Grow selection"; "command" = "editor.action.smartSelect.grow"; }
              { "key" = "V"; "name" = "Shrink selection"; "command" = "editor.action.smartSelect.shrink"; }
            ];
          };
        };
        "whichkey.delay" = 200;
        "whichkey.bindings" = [
          { "key" = " "; "name" = "Commands"; "type" = "command"; "command" = "workbench.action.showCommands"; }
          { "key" = "?"; "name" = "Search keybindings"; "type" = "command"; "command" = "whichkey.searchBindings"; }
          {
            "key" = "b"; "name" = "+Buffers/Editors"; "type" = "bindings";
            "bindings" = [
              { "key" = "c"; "name" = "Close active editor"; "type" = "command"; "command" = "workbench.action.closeActiveEditor"; }
              { "key" = "k"; "name" = "Close other editors"; "type" = "command"; "command" = "workbench.action.closeOtherEditors"; }
            ];
          }
          { "key" = "c"; "name" = "Close Active Editor"; "type" = "command"; "command" = "workbench.action.closeActiveEditor"; }
          { "key" = "k"; "name" = "Close Other Editor"; "type" = "command"; "command" = "workbench.action.closeOtherEditors"; }
          {
            "key" = "e"; "name" = "+Errors"; "type" = "bindings";
            "bindings" = [
              { "key" = "."; "name" = "Error transient"; "type" = "command"; "command" = "whichkey.showTransient"; "args" = "whichkey.transient.error"; }
              { "key" = "l"; "name" = "List errors"; "type" = "command"; "command" = "workbench.actions.view.problems"; }
              { "key" = "n"; "name" = "Next error"; "type" = "command"; "command" = "editor.action.marker.next"; }
              { "key" = "p"; "name" = "Previous error"; "type" = "command"; "command" = "editor.action.marker.prev"; }
            ];
          }
          {
            "key" = "f"; "name" = "+File"; "type" = "bindings";
            "bindings" = [
              { "key" = "s"; "name" = "Save file"; "type" = "command"; "command" = "workbench.action.files.save"; }
              { "key" = "S"; "name" = "Save all files"; "type" = "command"; "command" = "workbench.action.files.saveAll"; }
              { "key" = "r"; "name" = "Rename file"; "type" = "commands"; "commands" = [ "workbench.files.action.showActiveFileInExplorer" "renameFile" ]; }
              { "key" = "t"; "name" = "Show active file in tree/explorer view"; "type" = "command"; "command" = "workbench.files.action.showActiveFileInExplorer"; }
              { "key" = "y"; "name" = "Copy path of active file"; "type" = "command"; "command" = "workbench.action.files.copyPathOfActiveFile"; }
              { "key" = "f"; "name" = "Format file"; "type" = "command"; "command" = "editor.action.formatDocument"; }
            ];
          }
          {
            "key" = "g"; "name" = "+Git"; "type" = "bindings";
            "bindings" = [
              { "key" = "b"; "name" = "Checkout [b]ranch"; "type" = "command"; "command" = "git.checkout"; }
              { "key" = "c"; "name" = "Commit"; "type" = "command"; "command" = "git.commit"; }
              { "key" = "d"; "name" = "Delete Branch"; "type" = "command"; "command" = "git.deleteBranch"; }
              { "key" = "f"; "name" = "Fetch"; "type" = "command"; "command" = "git.fetch"; }
              { "key" = "i"; "name" = "Init"; "type" = "command"; "command" = "git.init"; }
              { "key" = "s"; "name" = "Status"; "type" = "command"; "command" = "workbench.view.scm"; }
              { "key" = "g"; "name" = "Gitlens Graph"; "type" = "command"; "command" = "gitlens.showGraphPage"; }
            ];
          }
          {
            "key" = "m"; "name" = "+Bookmark"; "type" = "bindings";
            "bindings" = [
              { "key" = "t"; "name" = "Toggle Bookmark"; "type" = "command"; "command" = "bookmarks.toggle"; }
              { "key" = "l"; "name" = "List Bookmark"; "type" = "command"; "command" = "bookmarks.list"; }
              { "key" = "n"; "name" = "Next Bookmark"; "type" = "command"; "command" = "bookmarks.jumpToNext"; }
              { "key" = "p"; "name" = "Previous Bookmark"; "type" = "command"; "command" = "bookmarks.jumpToPrevious"; }
            ];
          }
          {
            "key" = "p"; "name" = "+Project"; "type" = "bindings";
            "bindings" = [
              { "key" = "f"; "name" = "Find file in project"; "type" = "command"; "command" = "workbench.action.quickOpen"; }
              { "key" = "p"; "name" = "Switch project"; "type" = "command"; "command" = "workbench.action.openRecent"; }
              { "key" = "t"; "name" = "Show tree/explorer view"; "type" = "command"; "command" = "workbench.view.explorer"; }
            ];
          }
          {
            "key" = "s"; "name" = "+Search"; "type" = "bindings";
            "bindings" = [
              { "key" = "t"; "name" = "Search text in a project"; "type" = "command"; "command" = "workbench.action.findInFiles"; }
              { "key" = "p"; "name" = "Search in a project with a selection"; "type" = "commands"; "commands" = [ "editor.action.addSelectionToNextFindMatch" "workbench.action.findInFiles" ]; }
              { "key" = "r"; "name" = "Search all references"; "type" = "command"; "command" = "editor.action.referenceSearch.trigger"; }
              { "key" = "R"; "name" = "Search all references in side bar"; "type" = "command"; "command" = "references-view.find"; }
            ];
          }
          {
            "key" = "t"; "name" = "+Toggles"; "type" = "bindings";
            "bindings" = [
              { "key" = "t"; "name" = "Theme"; "type" = "command"; "command" = "workbench.action.selectTheme"; }
              { "key" = "z"; "name" = "Toggle [z]en mode"; "type" = "command"; "command" = "workbench.action.toggleZenMode"; }
              { "key" = "s"; "name" = "Toggle [s]ide Bar visibility"; "type" = "command"; "command" = "workbench.action.toggleSidebarVisibility"; }
              { "key" = "a"; "name" = "Toggle [a]ctivity Bar visibility"; "type" = "command"; "command" = "workbench.action.toggleActivityBarVisibility"; }
              { "key" = "c"; "name" = "Toggle find [c]ase sensitive"; "type" = "command"; "command" = "toggleFindCaseSensitive"; }
            ];
          }
          {
            "key" = "v"; "name" = "+VSCode"; "type" = "bindings";
            "bindings" = [
              { "key" = "e"; "name" = "Focus Active Editor Group"; "type" = "command"; "command" = "workbench.action.focusActiveEditorGroup"; }
              { "key" = "r"; "name" = "Move Side Bar Right"; "type" = "command"; "command" = "workbench.action.moveSideBarRight"; }
              { "key" = "l"; "name" = "Move Side Bar Left"; "type" = "command"; "command" = "workbench.action.moveSideBarLeft"; }
            ];
          }
          {
            "key" = "r"; "name" = "+Refactor"; "type" = "bindings";
            "bindings" = [
              { "key" = "r"; "name" = "Rename Symbol"; "type" = "command"; "command" = "editor.action.rename"; }
            ];
          }
          {
            "key" = "x"; "name" = "+Text"; "type" = "bindings";
            "bindings" = [
              { "key" = "i"; "name" = "Organize Imports"; "type" = "command"; "command" = "editor.action.organizeImports"; }
              { "key" = "r"; "name" = "Rename symbol"; "type" = "command"; "command" = "editor.action.rename"; }
              { "key" = "R"; "name" = "Refactor"; "type" = "command"; "command" = "editor.action.refactor"; }
              { "key" = "."; "name" = "Quick fix"; "type" = "command"; "command" = "editor.action.quickFix"; }
              { "key" = "a"; "name" = "Find all references"; "type" = "command"; "command" = "editor.action.referenceSearch.trigger"; }
            ];
          }
          {
            "key" = "z"; "name" = "Fold"; "type" = "bindings";
            "bindings" = [
              { "key" = "a"; "name" = "Toggle: around a point"; "type" = "command"; "command" = "editor.toggleFold"; }
              { "key" = "c"; "name" = "Close: at a point"; "type" = "command"; "command" = "editor.fold"; }
              { "key" = "b"; "name" = "Close: all block comments"; "type" = "command"; "command" = "editor.foldAllBlockComments"; }
              { "key" = "g"; "name" = "Close: all regions"; "type" = "command"; "command" = "editor.foldAllMarkerRegions"; }
              { "key" = "m"; "name" = "Close: all"; "type" = "command"; "command" = "editor.foldAll"; }
              { "key" = "o"; "name" = "Open: at a point"; "type" = "command"; "command" = "editor.unfold"; }
              { "key" = "O"; "name" = "Open: recursively"; "type" = "command"; "command" = "editor.unfoldRecursively"; }
              { "key" = "G"; "name" = "Open: all regions"; "type" = "command"; "command" = "editor.unfoldAllMarkerRegions"; }
              { "key" = "r"; "name" = "Open: all"; "type" = "command"; "command" = "editor.unfoldAll"; }
            ];
          }
        ];
        "vscode-neovim.compositeKeys" = {
          "jk" = {
            "command" = "vscode-neovim.lua";
            "args" = [
              [
                "local code = require('vscode')"
                "code.action('vscode-neovim.escape')"
                "code.action('workbench.action.files.save')"
              ]
            ];
          };
        };
        "editor.lineNumbers" = "relative";
        "prettier.bracketSameLine" = true;
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "pythonIndent.trimLinesWithOnlyWhitespace" = true;
        "errorLens.codeLensEnabled" = true;
        "editor.cursorBlinking" = "smooth";
        "editor.minimap.enabled" = false;
        "remote.SSH.remotePlatform" = {
          "gamma-playground" = "linux";
          "h200:invest" = "linux";
          "dev-a" = "linux";
        };
        "python.analysis.typeCheckingMode" = "standard";
        "python.analysis.extraPaths" = [
          "/home/users/toon_pac/projects/deepinvest/venv_py39/lib/python3.9/site-packages/"
          "/home/users/toon_pac/.conda/envs/test/lib/python3.12/site-packages/"
        ];
        "nvidia-smi.drawtype" = "bar";
        "nvidia-smi-plus.view.gpuItems" = [
          "memory_total"
          "memory_used_percent"
          "gpu_util"
        ];
        "files.eol" = "\n";
        # "notebook.formatOnSave.enabled" = true; # This was commented out
        # "notebook.codeActionsOnSave" = { # This was commented out
        #   "notebook.source.fixAll" = "explicit";
        #   "notebook.source.organizeImports" = "explicit";
        # };
        # "[python]" = { # This was commented out
        #   "editor.defaultFormatter" = "charliermarsh.ruff";
        #   "editor.formatOnSave" = true;
        #   "editor.codeActionsOnSave" = {
        #       "source.organizeImports" = "explicit";
        #   };
        # };
        "editor.experimentalEditContextEnabled" = true;
        "workbench.editorLargeFileConfirmation" = 30;
        # "codesnap.realLineNumbers" = true; # This was commented out
        # "workbench.editor.limit.enabled" = true; # This was commented out
        # "workbench.editor.limit.value" = 3; # This was commented out
        "apc.stylesheet" = {
          ".tabs-container" = {
            "border-radius" = "7px 7px 0 0";
          };
        };
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "apc.activityBar" = {
          "position" = "bottom";
          "size" = 25;
        };
        "apc.statusBar" = {
          "position" = "editor-bottom";
          "height" = 25;
          "fontSize" = 10;
        };
        "apc.electron" = {
          "backgroundColor" = "#1a1a1a";
          "frame" = true;
          "transparent" = true;
          "titleBarStyle" = "hiddenInset";
          "vibrancy" = "ultra-dark";
          "trafficLightPosition" = {
            "x" = 15;
            "y" = 13;
          };
          "trafficLightPositionRight" = {
            "x" = 15;
            "y" = 13;
          };
        };
        "window.titleBarStyle" = "custom";
        "apc.font.family" = "JetBrainsMono Nerd Font, Victor Mono, NotoMono Nerd Font, JetBrains Mono NL, Consolas, 'Courier New', monospace";
        "apc.header" = {
          "compact" = 22;
          "fontSize" = 12;
          "fontWeight" = "bold";
        };
        "apc.listRow" = {
          "height" = 19;
          "fontSize" = 11;
        };
        "apc.sidebar.titlebar" = {
          "fontSize" = 11;
          "fontWeight" = "bold";
        };
        "workbench.settings.editor" = "json";
        "breadcrumbs.enabled" = false;
        "editor.tokenColorCustomizations" = {
          "textMateRules" = [
            {
              "name" = "Default";
              "scope" = [
                "" "support.type.property-name.json" "meta.attribute.unrecognized" "support.type.property-name.css"
                "meta.field.declaration" "meta.template.expression"
              ];
              "settings" = { "foreground" = "#ddd"; };
            }
            { "name" = "Grey - comments"; "scope" = [ "comment" ]; "settings" = { "foreground" = "#455A64"; }; }
            {
              "name" = "Green - string";
              "scope" = [
                "string.quoted.single" "string.quoted.double" "string.template" "punctuation.definition.string.template"
                "variable.parameter.url.css"
              ];
              "settings" = { "foreground" = "#98c379"; };
            }
            {
              "name" = "Purple - number";
              "scope" = [ "constant.numeric" "keyword.other.unit" "constant.other.color.rgb-value.hex" ];
              "settings" = { "foreground" = "#c678dd"; };
            }
            {
              "name" = "Yellow - Keywords";
              "scope" = [
                "keyword.control" "keyword.operator" "variable.language" "constant.language" "storage.modifier"
                "entity.other.ng-binding-name.template.html" "source.css meta.property-value" "string.regexp"
                "punctuation.definition.template-expression.begin" "support.type.object.module"
                "punctuation.separator.statement.and.shell"
              ];
              "settings" = { "foreground" = "#ff8f4a"; };
            }
            {
              "name" = "blue";
              "scope" = [
                "storage.type" "meta.definition.method" "meta.definition.function" "entity.name.type.class"
                "meta.function-call" "entity.name.tag" "entity.name.tag" "entity.other.attribute-name.id.css"
                "entity.other.attribute-name.class.css" "meta.at-rule.keyframes" "support.function.misc"
                "support.class.component" "support.function.builtin.shell" "entity.name.command.shell"
              ];
              "settings" = { "foreground" = "#00AEFF"; };
            }
            {
              "name" = "Cyan 200";
              "scope" = [
                "meta.attribute" "entity.other.attribute-name.tsx" "entity.other.attribute-name.jsx"
                "entity.other.attribute-name.pseudo-class" "entity.other.attribute-name.pseudo-element"
                "storage.type.function" "storage.type.class" "entity.other.ng-binding-name.event.html"
                "entity.other.ng-binding-name.property"
              ];
              "settings" = { "foreground" = "#80DEEA"; };
            }
            {
              "name" = "[CSS] - Keyword";
              "scope" = [
                "source.css punctuation.definition.keyword" "source.css keyword" "entity.name.tag.reference"
                "keyword.other.important" "string.unquoted.heredoc.expanded.shell" "keyword.control.at-rule"
                "punctuation.definition.tag.end" "punctuation.definition.tag.begin"
              ];
              "settings" = { "foreground" = "#f6b"; };
            }
            {
              "name" = "types";
              "scope" = [
                "entity.name.type" "support.type.primitive" "meta.interface" "storage.type.class.jsdoc"
                "variable.other.normal.shell" "variable.parameter.positional.shell" "variable.other.assignment.shell"
                "support.type.builtin"
              ];
              "settings" = { "foreground" = "#4DB6AC"; };
            }
            {
              "name" = "red test";
              "scope" = [
                "storage.type.string" "meta.toc-list.id.html" "storage.identifier" "function.support"
                "function.support.builtin" "function.support.core"
              ];
              "settings" = { "foreground" = "#F00"; };
            }
          ];
        };
        "apc.menubar.compact" = true;
        "workbench.colorCustomizations" = {
          "sideBar.border" = "#00000000";
          "statusBar.border" = "#00000000";
          "terminal.border" = "#00000000";
          "panel.border" = "#00000000";
          "activityBar.border" = "#00000000";
          "activityBar.activeBorder" = "#00000000";
          "list.focusAndSelectionOutline" = "#00000000";
          "tab.border" = "#00000000";
          "tab.activeModifiedBorder" = "#00000000";
          "tab.inactiveModifiedBorder" = "#00000000";
          "tab.activeBackground" = "#00000000";
          "tab.inactiveBackground" = "#00000000";
          "tab.lastPinnedBorder" = "#00000000";
          "editorOverviewRuler.border" = "#00000000";
          "statusBarItem.activeBackground" = "#00000000";
          "widget.shadow" = "#00000000";
          "focusBorder" = "#00000000";
          "tree.indentGuidesStroke" = "#00000000";
          "activityBar.dropBorder" = "#00000000";
          "peekViewEditor.matchHighlightBackground" = "#00000000";
          "peekViewEditor.matchHighlightBorder" = "#00000000";
          "titleBar.activeBackground" = "#0C1125";
          "titleBar.inactiveBackground" = "#0C1125";
          "activityBarBadge.background" = "#0C1125";
          "editorWidget.background" = "#0C1125";
          "settings.dropdownBackground" = "#0C1125";
          "input.background" = "#0C1125";
          "badge.background" = "#0C1125";
          "activityBar.inactiveForeground" = "#01589b99";
          "button.background" = "#01589b99";
          "panelTitle.inactiveForeground" = "#01589b99";
          "editorLineNumber.foreground" = "#01589b99";
          "editorSuggestWidget.border" = "#01589b99";
          "list.hoverBackground" = "#01589b99";
          "list.inactiveSelectionBackground" = "#01589b99";
          "list.activeSelectionBackground" = "#01589b99";
          "input.border" = "#01589b99";
          "editorLineNumber.activeForeground" = "#1979c2";
          "editorWidget.border" = "#1979c2";
          "peekView.border" = "#1979c2";
          "statusBar.foreground" = "#1979c2";
          "activityBar.foreground" = "#29B6F6";
          "activityBarBadge.foreground" = "#29B6F6";
          "sideBarSectionHeader.foreground" = "#29B6F6";
          "sideBarTitle.foreground" = "#29B6F6";
          "tab.activeBorder" = "#29B6F6";
          "icon.foreground" = "#29B6F6";
          "badge.foreground" = "#29B6F6";
          "list.focusOutline" = "#29B6F6";
          "panelTitle.activeForeground" = "#29B6F6";
          "panelTitle.activeBorder" = "#29B6F6";
          "titleBar.activeForeground" = "#29B6F6";
          "sideBar.foreground" = "#81bae6";
          "gitDecoration.modifiedResourceForeground" = "#81bae6";
          "gitDecoration.untrackedResourceForeground" = "#81bae6";
          "gitDecoration.ignoredResourceForeground" = "#81bae6";
          "gitDecoration.addedResourceForeground" = "#81bae6";
          "gitDecoration.renamedResourceForeground" = "#81bae6";
          "tab.activeBorderTop" = "#00000000";
          "editorGroupHeader.tabsBorder" = "#00000000";
        };
        "workbench.colorTheme" = lib.mkDefault "Catppuccin Noctis Mocha";
        "workbench.startupEditor" = "none";
        "workbench.navigationControl.enabled" = false;
        "workbench.iconTheme" = "catppuccin-mocha";
    };
  };
}
