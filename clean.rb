#!/usr/bin/env ruby

# Running this script will remove torrents which seeding is done

require 'trans-api'
require 'yaml'

# Load configuration from file
config = YAML.load_file File.expand_path('../config/config.yml', __FILE__)
# Set transmission RPC parameters
Trans::Api::Client.config = config[:transmission]
# Set delete options
delete_options = {}
delete_options[:delete_local_data] = true if config[:clean][:remove_data]

Trans::Api::Torrent.all.each do |torrent|
  next unless torrent.isFinished
  next if config[:clean].key? :only_dirs and config[:clean][:only_dirs].none? {|dir| torrent.downloadDir.include? dir }
  sleep 10  # give time to transmission server
  torrent.delete! delete_options
  puts "#{torrent.name} deleted!"
end
