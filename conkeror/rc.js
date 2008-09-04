var home = "/home/decklin";

require("tab-bar.js");
require("clicks-in-new-buffer.js");
require(home + "/.conkeror.mozdev.org/clicky.js");

var url_completion_use_history = true;
var browser_default_open_target = OPEN_CURRENT_BUFFER;
var download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND;
var download_temporary_file_open_buffer_delay = 1500;

session_pref("browser.ssl_override_behavior", 2);
session_pref("browser.xul.error_pages.expert_bad_cert", true);
session_pref("layout.scrollbar.side", 0);
session_pref("content.max.tokenizing.time", 2250000);
session_pref("content.notify.interval", 750000);
session_pref("content.notify.ontimer", true);
session_pref("content.switch.threshold", 750000);
session_pref("network.http.max-connections", 48);
session_pref("network.http.max-connections-per-server", 16);
session_pref("network.http.max-persistent-connections-per-proxy", 16);
session_pref("network.http.max-persistent-connections-per-server", 8);
session_pref("nglayout.initialpaint.delay", "667");
session_pref("browser.cache.memory.capacity", 65536);
session_pref("browser.cache.check_doc_frequency", 0);
session_pref("browser.cache.disk.enable", false);
session_pref("browser.cache.disk.capacity", 0);
session_pref("browser.cache.offline.capacity", 0);
session_pref("general.autoScroll", "false");

set_default_directory(home + "/mess/cur");

mime_type_external_handlers.push(["application/x-bittorrent", "rtorrent"]);

interactive("follow-new-buffer-background", function (I) {
    var target = I.browse_target("follow-new-buffer-background");
    var element = yield I.read_browser_object("follow", "Follow", target);
    browser_element_follow(I.buffer, target, element);
});
default_browse_targets["follow-new-buffer-background"] = [
    OPEN_NEW_BUFFER_BACKGROUND];

interactive("open-xsel-url", function (I) {
    var target = I.browse_target("open-xsel-url");
    open_in_browser(I.buffer, target, (yield read_from_x_primary_selection()));
});
default_browse_targets["open-xsel-url"] = [
    OPEN_CURRENT_BUFFER, OPEN_NEW_BUFFER, OPEN_NEW_WINDOW];

interactive("shell-twopass-url", function (I) {
    var uri = I.buffer.display_URI_string;
    shell_command_with_argument_blind('twopass', uri);
});

add_webjump("g", "http://www.google.com/search?q=%s");
add_webjump("gi", "http://www.google.com/images?q=%s");
add_webjump("gn", "http://news.google.com/news?q=%s");
add_webjump("bug", "http://bugs.debian.org/%s");
add_webjump("package", "http://packages.debian.org/%s");
add_webjump("perldoc", "http://perldoc.perl.org/search.html?q=%s");

var _dbk = default_base_keymap;
var _mbk = minibuffer_base_keymap;
var _dgk = default_global_keymap;
var _hbk = help_buffer_keymap;
var _cnk = content_buffer_normal_keymap;
var _ctk = content_buffer_text_keymap;

define_key(_dbk, "C-u", "cmd_deleteToBeginningOfLine");
define_key(_ctk, "C-u", "cmd_deleteToBeginningOfLine");
define_key(_mbk, "C-u", "minibuffer-cmd_deleteToBeginningOfLine");

define_key(_dbk, "escape", "universal-argument");
define_key(_mbk, "escape", "universal-argument");
define_key(_cnk, "escape", "universal-argument");

define_key(_dgk, "S-q", "quit");
define_key(_dgk, "q", null);
define_key(_dgk, "_", "switch-to-buffer");
define_key(_dgk, ":", "execute-extended-command");
define_key(_dgk, "M-:", "eval-expression");
define_key(_dgk, "m", null);
define_key(_dgk, "C-p", "buffer-previous");
define_key(_dgk, "C-n", "buffer-next");
define_key(_dgk, "!", "shell-command");
define_key(_dgk, "C-k", "kill-current-buffer");
define_key(_dgk, "M-!", null);
define_key(_dgk, "M-p", null);
define_key(_dgk, "M-n", null);
define_key(_dgk, "M-x", null);
define_key(_dgk, "C-r", null);
define_key(_dgk, "C-s", null);
define_key(_dgk, "C-x C-c", null);
define_key(_dgk, "C-x k", null);
define_key(_dgk, "C-x b", null);

define_key(_hbk, "q", null);
define_key(_hbk, "C-p", "buffer-previous");
define_key(_hbk, "C-n", "buffer-next");
define_key(_hbk, "h", "cmd_scrollLeft", $category = "Scrolling");
define_key(_hbk, "j", "cmd_scrollLineDown", $category = "Scrolling");
define_key(_hbk, "k", "cmd_scrollLineUp", $category = "Scrolling");
define_key(_hbk, "l", "cmd_scrollRight", $category = "Scrolling");
define_key(_hbk, "C-e", "cmd_scrollLineDown", $category = "Scrolling");
define_key(_hbk, "C-y", "cmd_scrollLineUp", $category = "Scrolling");
define_key(_hbk, "g", "cmd_scrollTop", $category = "Scrolling");
define_key(_hbk, "G", "cmd_scrollBottom", $category = "Scrolling");
define_key(_hbk, "b", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_hbk, "C-u", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_hbk, "C-d", "cmd_scrollPageDown", $category = "Scrolling");
define_key(_hbk, "C-b", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_hbk, "C-f", "cmd_scrollPageDown", $category = "Scrolling");
define_key(_hbk, "$", "scroll-end-of-line", $category = "Scrolling");
define_key(_hbk, "S-6", "scroll-beginning-of-line", $category = "Scrolling");
define_key(_hbk, "0", "scroll-beginning-of-line", $category = "Scrolling");

define_key(_cnk, "h", "cmd_scrollLeft", $category = "Scrolling");
define_key(_cnk, "j", "cmd_scrollLineDown", $category = "Scrolling");
define_key(_cnk, "k", "cmd_scrollLineUp", $category = "Scrolling");
define_key(_cnk, "l", "cmd_scrollRight", $category = "Scrolling");
define_key(_cnk, "C-e", "cmd_scrollLineDown", $category = "Scrolling");
define_key(_cnk, "C-y", "cmd_scrollLineUp", $category = "Scrolling");
define_key(_cnk, "g", "cmd_scrollTop", $category = "Scrolling");
define_key(_cnk, "S-g", "cmd_scrollBottom", $category = "Scrolling");
define_key(_cnk, "b", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_cnk, "C-u", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_cnk, "C-d", "cmd_scrollPageDown", $category = "Scrolling");
define_key(_cnk, "C-b", "cmd_scrollPageUp", $category = "Scrolling");
define_key(_cnk, "C-f", "cmd_scrollPageDown", $category = "Scrolling");
define_key(_cnk, "$", "scroll-end-of-line", $category = "Scrolling");
define_key(_cnk, "S-6", "scroll-beginning-of-line", $category = "Scrolling");
define_key(_cnk, "0", "scroll-beginning-of-line", $category = "Scrolling");
define_key(_cnk, "C-p", "buffer-previous");
define_key(_cnk, "C-n", "buffer-next");
define_key(_cnk, "/", "isearch-forward");
define_key(_cnk, "?", "isearch-backward");
define_key(_cnk, "n", "isearch-continue-forward");
define_key(_cnk, ".", "isearch-continue-backward");
define_key(_cnk, "o", "find-url");
define_key(_cnk, "e", "find-alternate-url");
define_key(_cnk, "p", "open-xsel-url");
define_key(_cnk, "a", "focus");
define_key(_cnk, "close_bracket", "follow-next");
define_key(_cnk, "open_bracket", "follow-previous");
define_key(_cnk, "m", "bookmark");
define_key(_cnk, "C-c", "stop-loading");
define_key(_cnk, "C-t", "go-back");
define_key(_cnk, "C-]", "go-forward");
define_key(_cnk, "\\", "view-source");
define_key(_cnk, "b", "follow-new-buffer-background");
define_key(_cnk, "C-v", "quote-next-input-mode");
define_key(_cnk, "I", "quote-input-mode");
define_key(_cnk, "M-v", null);
define_key(_cnk, "C-q", null);
define_key(_cnk, "C-x C-v", null);
define_key(_cnk, "C-M-q", null);
define_key(_cnk, "S-b", null);
define_key(_cnk, "S-p", null);
define_key(_cnk, "C-return", null);
define_key(_cnk, ";", null);

define_key(_ctk, "escape", "unfocus");
define_key(_ctk, "C-2", "shell-twopass-url");
