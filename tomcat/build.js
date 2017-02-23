#!/usr/bin/jjs -fv
var cmd = "docker build -t smaject/tomcat .";
var System = Java.type("java.lang.System");
$EXEC(cmd, System.in, System.out, System.err);
