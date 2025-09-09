# This should be a test or example startup script

require linstat

epicsEnvSet("ENGINEER", "KG")

#var linStatDebug 5

dbLoadRecords("linStatHost.db","IOC=ioc99-test")
dbLoadRecords("linStatProc.db","IOC=ioc99-test")
dbLoadRecords("linStatNIC.db","IOC=ioc99-test,NIC=lo")
dbLoadRecords("linStatFS.db","P=ioc99-test:ROOT,DIR=/")

dbLoadRecords("linStatNIC.db","IOC=ioc99-test,NIC=enp86s0")
