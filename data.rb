# frozen_string_literal: true

NOW = Time.now

module RVATracks
  NAME = 'rva_tracks'
  DESCRIPTION = "Re-Volt America's Tracks Pack"
  YEAR = "#{NOW.year.digits[0]}#{NOW.year.digits[1]}"
  MONTH = NOW.month < 10 ? "0#{NOW.month}" : NOW.month.to_s
  DAY = NOW.day < 10 ? "0#{NOW.day}" : NOW.day.to_s
  VERSION = "#{YEAR}.#{MONTH}#{DAY}"
  URL = 'https://distribute.revolt-america.com/rva/rva_tracks.zip'
end
