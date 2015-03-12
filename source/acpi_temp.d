#!/usr/bin/rdmd
import std.array;
import std.datetime;
import std.process;
import std.stdio;

immutable METRIC_NAME = "acpi.temperature";

void main()
{
    auto acpi_temp = pipeProcess(["/usr/bin/acpi", "-t"], Redirect.stdout);
    scope(exit) wait(acpi_temp.pid);
    
    long time_now = Clock.currTime().toUnixTime();

    foreach (line; acpi_temp.stdout.byLine) {
        char[][] unit_status = line.split(": "); 
        string unit = cast(string)unit_status[0].replace(" ", "");
        string status = cast(string)unit_status[1];
        auto status_array = status.split(" ");
        string value = status_array[1];
        
        writeln(METRIC_NAME, " ", time_now, " ", value, " unit=", unit);
    }
}
