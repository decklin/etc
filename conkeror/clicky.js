function descendent(f, tag, p) {
    for (t = tag; t; t = t.parentNode) {
        try {
            x = f(t);
        } catch(error) {
            x = null;
        }
        if (x == p)
            return true;
    }
}

function clicky_handler(event) {
    var win = get_recent_conkeror_window();

    if (event.button == 1) {
        try {
            var xsel = read_from_x_primary_selection();
        } catch(error) {
            win.minibuffer.message("No selection");
            return;
        }
        var id_of = function(elt) { return elt.id; }
        if (descendent(id_of, event.target, 'tab-bar'))
            open_in_browser(win.buffers.current, OPEN_NEW_BUFFER, xsel);
        else if (descendent(id_of, event.target, 'main-window'))
            open_in_browser(win.buffers.current, OPEN_CURRENT_BUFFER, xsel);
        return true;
    } else if (event.button == 2) {
        var name_of = function(elt) { return elt.tagName.toLowerCase(); }
        if (descendent(name_of, event.target, 'body')) {
            try {
                go_back(win.buffers.current, 1);
            } catch (error) {
                win.minibuffer.message("Can't go back");
            }
        }
        return true;
    }
}

var clicky_mode_enable = function ()
{
    var clicky_add_listener = function (win) {
        win.addEventListener("click", clicky_handler, true);
    }
    add_hook("window_initialize_hook", clicky_add_listener);
    for_each_window(clicky_add_listener);
}

var clicky_mode_disable = function ()
{
    var clicky_remove_listener = function (win) {
        win.removeEventListener("click", clicky_handler, true);
    }
    remove_hook("window_initialize_hook", clicky_remove_listener);
    for_each_window(clicky_remove_listener);
}

define_global_mode("clicky_mode", clicky_mode_enable, clicky_mode_disable);
clicky_mode(true);
