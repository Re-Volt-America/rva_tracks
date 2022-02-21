# frozen_string_literal: true

require 'zip'
require 'digest'
require_relative 'data'

task default: %i[package version]

task :package do
  zipfile_name = "#{RVATracks::NAME}.zip"
  File.delete(zipfile_name) if File.exist?(zipfile_name)

  puts "Packaging into #{zipfile_name} ..."

  exclude = %w[. .. Gemfile Gemfile.lock Rakefile .git .gitignore .idea data.rb README.md packages.json]
  zf = ZipFileGenerator.new('.', zipfile_name, exclude)
  zf.write

  puts "Packaging complete! (#{bytes_to_mb(File.size(zipfile_name))} MB)."
  puts 'OK.'
end

task version: [:package] do
  checksum = nil
  checksum = Digest::SHA256.hexdigest File.read "#{RVATracks::NAME}.zip" if File.exist?("#{RVATracks::NAME}.zip")

  contents = [
    '{',
    "\t\"rva_tracks\":",
    "\t{",
    "\t\t\"description\": \"#{RVATracks::DESCRIPTION}\",",
    "\t\t\"version\": #{RVATracks::VERSION},",
    "\t\t\"checksum\": \"#{checksum}\",",
    "\t\t\"url\": \"#{RVATracks::URL}\"",
    "\t}",
    '}'
  ]

  File.open('packages.json', 'w+') do |f|
    contents.each { |l| f.puts(l) }
  end
end

def bytes_to_mb(bytes)
  format_number((bytes.to_f / 2**20).round(2))
end

def format_number(number)
  whole, decimal = number.to_s.split('.')
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(',').reverse
  [whole_with_commas, decimal].compact.join('.')
end

# This is a simple example which uses rubyzip to
# recursively generate a zip file from the contents of
# a specified directory. The directory itself is not
# included in the archive, rather just its contents.
#
# Usage:
#   directory_to_zip = "/tmp/input"
#   output_file = "/tmp/out.zip"
#   zf = ZipFileGenerator.new(directory_to_zip, output_file, exclude)
#   zf.write()
class ZipFileGenerator
  # Initialize with the directory to zip and the location of the output archive.
  def initialize(input_dir, output_file, exclude = [])
    @input_dir = input_dir
    @output_file = output_file
    @exclude = exclude
  end

  # Zip the input directory.
  def write
    packaged = Dir.entries(@input_dir).select { |p| File.extname(p) == '.zip' }
    entries = Dir.entries(@input_dir) - %w[. ..].concat(@exclude).concat(packaged)

    ::Zip::File.open(@output_file, ::Zip::File::CREATE) do |zipfile|
      write_entries entries, '', zipfile
    end
  end

  private

  # A helper method to make the recursion work.
  def write_entries(entries, path, zipfile)
    entries.each do |e|
      zipfile_path = path == '' ? e : File.join(path, e)
      disk_file_path = File.join(@input_dir, zipfile_path)
      puts zipfile_path
      if File.directory? disk_file_path
        recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
      else
        put_into_archive(disk_file_path, zipfile, zipfile_path)
      end
    end
  end

  def recursively_deflate_directory(disk_file_path, zipfile, zipfile_path)
    zipfile.mkdir zipfile_path
    subdir = Dir.entries(disk_file_path) - %w[. ..]
    write_entries subdir, zipfile_path, zipfile
  end

  def put_into_archive(disk_file_path, zipfile, zipfile_path)
    zipfile.add(zipfile_path, disk_file_path)
  end
end
