function descendent(f, pred, tag) {
    try {
        for (t = tag; t; t = t.parentNode) {
            if (f(t) == pred) return true;
        }
    } catch (error) {
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
        var by_id = function(elt) {
            return elt.id;
        }
        if (descendent(by_id, 'tab-bar', event.target)) {
            browser_object_follow(win.buffers.current, OPEN_NEW_BUFFER, xsel);
            return true;
        } else if (descendent(by_id, 'main-window', event.target)) {
            browser_object_follow(win.buffers.current,
                                  OPEN_CURRENT_BUFFER, xsel);
            return true;
        }
    } else if (event.button == 2) {
        /*
         * this should be looking for descendents of the entire viewport (the
         * HTML element), but the scrollbar is counted among those. i don't
         * know how to fix it, so for now limit to the BODY.
         */
        var by_name = function(elt) {
            return elt.tagName.toLowerCase();
        }
        if (descendent(by_name, 'body', event.target)) {
            try {
                go_back(win.buffers.current, 1);
            } catch (error) {
                win.minibuffer.message("Can't go back");
            }
            return true;
        }
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
