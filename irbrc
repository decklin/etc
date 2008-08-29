require 'irb/completion'
require 'irb/ext/save-history'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 8192
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

def ri(*args); help(*args); end

module Enumerable
  def pp_table
    width = collect {|e| e.to_s.length }.max + 1
    cols = 78 / width
    rows = size / cols + 1
    rows.times do |i|
      each_slice(rows) {|c| printf '%*s', width, c[i] }; puts
    end
  end
end

class Object
  def meth; self.class.instance_methods(false).sort.pp_table; end
  def meth_all; self.methods.sort.pp_table; end
end
