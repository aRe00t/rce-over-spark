#!/bin/bash

rm -rf Exploit.class Exploit.jar
javac Exploit.java
jar cf Exploit.jar Exploit.class
