# Low-overhead acpi-temp collection agent for OpenTSDB's tcollector
Reports CPUs temperature, similar to the output of the `acpi -t` command. 
* Build it and run it:
```sh
$ dub build
Target acpi_temp 0.0.1 is up to date. Use --force to rebuild.
$ ./collectors/0/acpi_temp
acpi.temperature 1432609410 52.0 zone=Thermal0
acpi.temperature 1432609410 51.0 zone=Thermal1
```
* Deploy `acpi_temp` in `tcollector`'s `collectors/0` directory, as a long-lived collector.
   * Tags: {`zone` => `thermalN`} where N is the number of the reporting thermal zone

The following sequence diagram illistrates the operation of this collector.
![How acpi_temp works](https://raw.githubusercontent.com/oozie/acpi_temp/gh-pages/acpitemp.png)

# Building D source with `dub`
* Get `dub` from http://code.dlang.org/packages/dub
* run `dub build` from the root of the repo
* Find the collector in the `collectors/0` directory.
