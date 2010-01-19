require 'irb/completion'
require 'irb/ext/history'
require 'pp'

IRB.conf[:SAVE_HISTORY] = 8192
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

def ri(*args); help(*args); end

module Enumerable
  def pp_table
    unless count.zero?
      width = collect {|e| e.to_s.length }.max + 1
      cols = 78 / width
      rows = count / cols + 1
      rows.times do |i|
        each_slice(rows) {|c| printf '%*s', width, c[i] }; puts
      end; nil
    end
  end
end

class Object
  def meth; self.class.instance_methods(false).sort.pp_table; end
  def meth_all; self.methods.sort.pp_table; end
end
