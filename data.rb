# frozen_string_literal: true

module RVATracks
  NAME = 'rva_tracks'
  DESCRIPTION = "Re-Volt America's Tracks Pack"
  YEAR = 22
  MONTH = 2
  DAY = 21
  VERSION = "#{YEAR}.#{MONTH < 10 ? "0#{MONTH}" : MONTH}#{DAY < 10 ? "0#{DAY}" : DAY}"
end
