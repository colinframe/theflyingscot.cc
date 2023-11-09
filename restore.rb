#!/usr/bin/env ruby

require 'fileutils'

# base = 'websites/flying-scot.com'
# Dir.each_child(base).sort.reverse.each do |timestamp|
#   puts timestamp
#   FileUtils.cp_r "#{base}/#{timestamp}/.", "./flying-scot.com", verbose: true, preserve: true
# end

Dir.glob(File.join("websites", "**", "*.*")).sort.each do |path|
  puts path
  file = File.open(path)
  # return unless File.file?(file)

  src_path = file.path
  dest_path = "flying-scot.com/#{file.path.split('/')[3...]&.join('/')}"
foo = file.path.split('/')[3...]
foo&.pop
folder =  foo&.join('/')
  FileUtils.mkdir_p "flying-scot.com/#{folder}"
# puts src_path
# puts dest_path
  FileUtils.cp_r(src_path, dest_path)
end
