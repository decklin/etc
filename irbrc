# -*- ruby -*-

require 'irb/completion'
require 'irb/ext/history'
require 'pp'

def _irb_columns
  ENV['COLUMNS'] ? ENV['COLUMNS'].to_i : 80
end

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

def ri(*args); help(*args); end

module Enumerable

  def _sum
    reduce(&:+)
  end

  def _pp_cols
    unless empty?
      width = collect {|e| e.to_s.length }.max + 1
      cols = _irb_columns / width
      rows = count / cols + 1
      rows.times do |i|
        each_slice(rows) {|c| printf '%*s', width, c[i] }; puts
      end
    end
    nil
  end

  def _kwidths
    keys = collect {|h| h.keys }.flatten.uniq
    kwidths = keys.map {|k| k.to_s.size }
    vwidths = collect {|h| keys.map {|k| h[k].to_s.size } }
    Hash[keys.zip(([kwidths]+vwidths).reduce {|a, b| a.zip(b).collect(&:max) } )]
  end

  def _pp_tbl
    unless empty?
      widths = _kwidths
      boring = {}

      widths.dup.each do |k, v|
        if collect {|h| h[k] }.uniq.size == 1
          boring[k] = first[k]
          widths.delete(k)
        end
      end

      while widths.values._sum + widths.size*2 >= _irb_columns
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
  def _meth; self.class.instance_methods(false).sort._pp_cols; end
  def _meth_all; self.methods.sort._pp_cols; end
end
