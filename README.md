# Low-overhead acpi-temp collection agent for OpenTSDB's tcollector
Report CPUs temperature, similar to the output of the `acpi -t` command. 
   * Tags: {`zone` => `thermalN`} where N is the number of the reporting thermal zone

# Building D source with `dub`
* Get `dub` from http://code.dlang.org/packages/dub
* run `dub build` from the root of the repo
* Find the collector in the `collectors/0` directory.
