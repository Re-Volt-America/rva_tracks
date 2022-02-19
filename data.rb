# frozen_string_literal: true

TIME = Time.now

module RVATracks
  NAME = 'rva_tracks'
  DESCRIPTION = "Re-Volt America's Tracks Pack"
  VERSION = "#{TIME.year.digits[0]}#{TIME.year.digits[1]}.#{TIME.month}#{TIME.day}"
  URL = 'https://distribute.revolt-america.com/rva/rva_tracks.zip'
end
