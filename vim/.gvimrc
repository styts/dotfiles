if has("gui_macvim")
    " remap print key to CtrlP
    macmenu &File.Print key=<nop>
    map <D-p> :CtrlP<CR>

    " start full screen
    set fullscreen

    " tab navigation
    :map <C-Tab> gt
endif
