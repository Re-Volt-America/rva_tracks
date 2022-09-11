# frozen_string_literal: true

module RVATracks
  NAME = 'rva_tracks'
  DESCRIPTION = "Re-Volt America's Tracks Pack"
  YEAR = 22
  MONTH = 8
  DAY = 17
  REVISION = 3
  SUFFIX = 'a'
  VERSION = "#{YEAR}.#{MONTH < 10 ? "0#{MONTH}" : MONTH}#{DAY}#{SUFFIX}-#{REVISION}"
  URL = 'https://distribute.revolt-america.com/rva/rva_tracks.zip'
end
