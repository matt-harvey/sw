#!/usr/bin/env ruby

###
# Copyright (c) 2014 Matthew Harvey
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
###

require 'yaml'

class Stopwatch
  
  attr_reader :running

  def initialize(filepath)
    @filepath = filepath
    load 
  end

  def reset
    stop if @running
    stats
    silent_reset
    puts "\nStopwatch has been reset."
  end

  def start
    if @running
      puts "Stopwatch is already running."
    else
      @times ||= []
      @times << Time.new
      @running = true
    end
    save
  end

  def stop
    if @running
      @times << Time.new
      @running = false
    else
      puts "Stopwatch is not running."
    end
    save
  end

  def silent_reset
    @times = []
    @running = false
    save
  end

  def stats

    def nice_time(time)
      time.localtime.to_s[11..18]
    end

    def nice_hours(hours)

      def pad(float)
        s = float.to_s
        parts = s.split('.')
        frac = parts[1]
        while frac.size < 3
          frac += "0"
        end
        parts[0] + "." + frac
      end

      pad(hours.round(rounding))
    end

    def seconds_to_hours(hours)
      hours / 60.0 / 60.0
    end

    return unless @times
    return if @times.empty?
    puts    "BEGIN     END       HOURS  CUMULATIVE"
    i = 0
    cumulative_hours = 0.0
    original_start_time = @times[0]
    while i < @times.size
      start_time = times[i]
      if i + 1 < @times.size
        stop_time = times[i+1]
      else
        stop_time = Time.new
      end
      final_end_time = stop_time
      hours = seconds_to_hours(stop_time - start_time)
      cumulative_hours = cumulative_hours + hours
      print "#{nice_time(start_time)}  #{nice_time(stop_time)}"
      if @running && (i + 1 == @times.size)
        print "* "
      else
        print "  "
      end
      puts  "#{nice_hours(hours)}  #{nice_hours(cumulative_hours)}"
      i += 2
    end
    hours_ignoring_breaks =
      seconds_to_hours(final_end_time - original_start_time)
    total_breaks = hours_ignoring_breaks - cumulative_hours
    puts ""
    puts "Gross hours elapsed:       #{nice_hours(hours_ignoring_breaks)}"
    puts "Breaks:                    #{nice_hours(total_breaks)}"
    puts "Net hours elapsed:         #{nice_hours(cumulative_hours)}"
    puts "\n*Stopwatch is still running." if @running
  end

  protected

    attr_reader :times

  private
    
    def rounding
      3
    end

    def copy_other(other_stopwatch)
      @times = other_stopwatch.times
      @running = other_stopwatch.running
    end

    def save
      @times ||= Array.new
      @running ||= false
      File.open(@filepath,'w') do |file|
        file.puts(self.to_yaml)
      end
    end

    def load
      if File.exists?(@filepath)
        other = YAML.load(File.read(@filepath))
        copy_other(other)
      end 
    end

end

def default_filepath
  File.join(Dir.home, ".sw.yml")
end

def print_usage
  print <<EOF
Usage:
  sw start    Start the stopwatch
  sw stop     Stop the stopwatch
  sw reset    Output stats, and reset the stopwatch to zero
  sw stats    Output stats without resetting the stopwatch
  sw help     Print this help message
EOF
end

def process_subcommand(subcommand)
  if [:start, :stop, :reset, :stats].include? subcommand
    stopwatch = Stopwatch.new(default_filepath)
    stopwatch.send(subcommand)
  elsif subcommand == :help
    print_usage
  else
    print "Unrecognized subcommand: #{subcommand}\n\n"
    print_usage
  end
end

def main
  if ARGV.size == 1
    process_subcommand(ARGV[0].to_sym)
  else
    print "Incorrect number of arguments.\n\n"
    print_usage
  end
end

main
