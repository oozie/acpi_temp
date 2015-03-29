#!/usr/bin/rdmd

import core.thread;
import std.array;
import std.conv;
import std.datetime;
import std.file;
import std.stdio;
import std.string;

immutable METRIC_NAME = "acpi.temperature";
immutable INTERVAL = dur!("seconds")(60);

double getCelsiusTempForZone(uint zone) {
    string fileName = "/sys/class/thermal/thermal_zone"
                      ~ to!string(zone) ~ "/temp";
    string tempCelciusText = stripRight(readText(fileName));
    double tempCelcius = to!double(tempCelciusText) / 1000;
    return tempCelcius;
}

uint getNumZones() {
    auto zoneDirs = array(
        dirEntries("/sys/class/thermal", "thermal_zone?", SpanMode.shallow)
    );
    return to!uint(zoneDirs.length);
}

void main() {
    uint numZones = getNumZones();
    while(true) {
        long time_now = Clock.currTime().toUnixTime();
        for(uint zone=0; zone < numZones; zone++) {
            double value = getCelsiusTempForZone(zone);
            writefln("%s %s %.1f zone=Thermal%s", METRIC_NAME, time_now, value, zone);
        }
        stdout.flush();
        Thread.sleep(INTERVAL);
    }
}
