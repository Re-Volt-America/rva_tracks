rva_tracks/
===

Re-Volt America's Tracks Pack.

## Usage
For developers, the packaging pipeline was built using Rake. The following tasks take care of compressing and versioning
the files included in the tracks pack:
  - `:package`: Packages the whole cars/ directory into a zip file.
  - `:version`: Generates a packages.json file, which is later used for distributing the pack via the [RVGL Launcher](https://re-volt.gitlab.io/rvgl-launcher/#download).

Using `rake` on its own will execute all in its intended order: `:package, :version`.
