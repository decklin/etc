# -*- ruby -*-

require 'irb/completion'
require 'irb/ext/history'
require 'pp'

IRB_COLUMNS = ENV['COLUMNS'].to_i || 80

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

def ri(*args); help(*args); end

module Enumerable

  def _sum
    reduce(&:+)
  end

  def pp_cols
    unless empty?
      width = collect {|e| e.to_s.length }.max + 1
      cols = IRB_COLUMNS / width
      rows = count / cols + 1
      rows.times do |i|
        each_slice(rows) {|c| printf '%*s', width, c[i] }; puts
      end
    end
    nil
  end

  def _kwidths
    keys = collect {|h| h.keys }.flatten.sort.uniq
    kwidths = keys.map {|k| k.to_s.size }
    vwidths = collect {|h| keys.map {|k| h[k].to_s.size } }
    Hash[keys.zip(([kwidths]+vwidths).reduce {|a, b| a.zip(b).collect(&:max) } )]
  end

  def pp_tbl
    unless empty?
      widths = _kwidths
      boring = {}

      widths.dup.each do |k, v|
        if collect {|h| h[k] }.uniq.size == 1
          boring[k] = first[k]
          widths.delete(k)
        end
      end

      while widths.values._sum + widths.size*2 >= IRB_COLUMNS
        max_k, max_v = widths.max_by {|k, v| v }
        widths[max_k] = max_v > widths.values._sum/widths.size ? widths.values._sum/widths.size : max_v / 2
      end

      puts widths.keys.collect {|k| k.to_s[0...widths[k]].ljust(widths[k]) }.join('  ')
      puts '-' * (widths.values._sum + (widths.size-1)*2)
      each {|h| puts widths.keys.map {|k| h[k].to_s.gsub(/\n\s+/, ' ')[0...widths[k]].ljust(widths[k]) }.join('  ') }
      puts '-' * (widths.values._sum + (widths.size-1)*2)
      puts "boring: #{boring}" unless boring.empty?
    end
  end
end

class Object
  def meth; self.class.instance_methods(false).sort.pp_cols; end
  def meth_all; self.methods.sort.pp_cols; end
end
