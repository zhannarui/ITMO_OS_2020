@echo off
net start > listofserv.txt
net stop dnscache
timeout /T 15
net start > updatelistofserv.txt
fc /A listofserv.txt updatelistofserv.txt > delta.txt
net start dnscache
