require 'irb/completion'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 8192
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
