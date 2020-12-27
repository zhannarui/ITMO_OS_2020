@echo off
driverquery /FO TABLE > driverslist.txt
sort /R driverslist.txt /O sortdriverslist.txt