# Fast collectors for OpenTSDB
## Collector Listing
* `acpi_temp` - report CPU temperature as reported by the `acpi -t` command. 
   * Tags: {`unit` => `thermalN`} where N is the number of the reporting unit.

# Building D source with `dub`
* Get `dub` from http://code.dlang.org/packages/dub
* run `dub build` from the root of the repo
* Find collectors in the `collectors/` directory.

