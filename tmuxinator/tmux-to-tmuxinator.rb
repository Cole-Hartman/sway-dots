#!/usr/bin/env ruby

require 'yaml'
require 'optparse'

class TmuxToTmuxinator
  def initialize(session_name = nil)
    @session_name = session_name || current_session
    @windows = []
  end

  def generate_config
    parse_windows
    generate_yaml
  end

  private

  def current_session
    `tmux display-message -p '#S'`.strip
  end

  def parse_windows
    window_list = `tmux list-windows -t #{@session_name}`.split("\n")
    
    window_list.each do |window|
      window_info = parse_window_info(window)
      window_config = {
        'name' => window_info[:name],
        'panes' => get_pane_commands(window_info[:index])
      }
      
      # Add layout if there are multiple panes
      if window_config['panes'].length > 1
        window_config['layout'] = get_window_layout(window_info[:index])
      end
      
      @windows << window_config
    end
  end

  def parse_window_info(window)
    # Window format: "0: window_name* (1 panes) [layout]"
    match = window.match(/^(\d+): ([\w-]+)/)
    {
      index: match[1],
      name: match[2]
    }
  end

  def get_pane_commands(window_index)
    pane_list = `tmux list-panes -t #{@session_name}:#{window_index} -F '#{pane_command_format}'`.split("\n")
    pane_list.map do |pane|
      command = pane.strip
      command.empty? ? nil : command
    end.compact
  end

  def get_window_layout(window_index)
    `tmux display-message -t #{@session_name}:#{window_index} -p '#{window_layout_format}'`.strip
  end

  def pane_command_format
    '#{pane_current_command}'
  end

  def window_layout_format
    '#{window_layout}'
  end

  def generate_yaml
    config = {
      'name' => @session_name,
      'root' => Dir.pwd,
      'windows' => @windows
    }

    config.to_yaml
  end
end

# Command line options parsing
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename($0)} [options]"

  opts.on("-s", "--session SESSION_NAME", "Specify tmux session name") do |s|
    options[:session] = s
  end

  opts.on("-o", "--output FILE", "Output file (default: stdout)") do |o|
    options[:output] = o
  end

  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

# Generate configuration
generator = TmuxToTmuxinator.new(options[:session])
yaml_config = generator.generate_config

# Output configuration
if options[:output]
  File.write(options[:output], yaml_config)
  puts "Configuration saved to #{options[:output]}"
else
  puts yaml_config
end
