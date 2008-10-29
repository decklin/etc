require("clicks-in-new-buffer.js");
require("tab-bar.js");

var url_completion_use_history = true;
var url_completion_use_bookmarks = false;
var browser_default_open_target = OPEN_CURRENT_BUFFER;
var download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND;
var download_temporary_file_open_buffer_delay = 1500;

set_default_directory(get_home_directory() + "/mess/cur");
mime_type_external_handlers.push(["application/x-bittorrent", "rtorrent"]);

session_pref("browser.cache.check_doc_frequency", 0);
session_pref("browser.cache.disk.capacity", 0);
session_pref("browser.cache.disk.enable", false);
session_pref("browser.cache.memory.capacity", 65536);
session_pref("browser.cache.offline.capacity", 0);
session_pref("browser.link.open_newwindow", 1);
session_pref("browser.link.open_newwindow.restriction", 2);
session_pref("browser.ssl_override_behavior", 2);
session_pref("browser.xul.error_pages.expert_bad_cert", true);
session_pref("content.max.tokenizing.time", 1000000);
session_pref("content.notify.interval", 500000);
session_pref("content.notify.ontimer", true);
session_pref("content.switch.threshold", 500000);
session_pref("general.autoScroll", "false");
session_pref("layout.scrollbar.side", 3);
session_pref("network.http.max-connections", 64);
session_pref("network.http.max-connections-per-server", 16);
session_pref("network.http.max-persistent-connections-per-proxy", 16);
session_pref("network.http.max-persistent-connections-per-server", 8);
session_pref("nglayout.initialpaint.delay", "100");

session_pref("conkeror.load.page-modes/youtube", 0);
session_pref("conkeror.load.page-modes/reddit", 0);
session_pref("conkeror.load.page-modes/google-search-results", 0);
session_pref("conkeror.load.page-modes/google-calendar", 0);
session_pref("conkeror.load.page-modes/google-reader", 0);
session_pref("conkeror.load.page-modes/google-video", 0);
session_pref("conkeror.load.page-modes/google-maps", 0);
session_pref("conkeror.load.page-modes/youporn", 0);
session_pref("conkeror.load.page-modes/dailymotion", 0);
session_pref("conkeror.load.page-modes/gmail", 0);
session_pref("conkeror.load.page-modes/xkcd", 0);

function open_xsel_url(I, target) {
    browser_object_follow(I.buffer, target,
        (yield read_from_x_primary_selection()));
}

interactive("open-xsel-url", null, alternates(
    function(I) { yield open_xsel_url(I, OPEN_CURRENT_BUFFER); },
    function(I) { yield open_xsel_url(I, OPEN_NEW_BUFFER); }
));

interactive("follow-previous", null, "follow",
            $browser_object = browser_object_relationship_previous);
interactive("follow-next", null, "follow",
            $browser_object = browser_object_relationship_next);

interactive("shell-twopass-url", null, function(I) {
    var uri = I.buffer.display_URI_string;
    shell_command_with_argument_blind('twopass', uri);
});
