# This should be a test or example startup script

epicsEnvSet ("IOCNAME", "ioc99-test")

require linstat

#
# This is the default nuc configuration:
# monitoring of 2 files systems (/var and /run) and 1 network interface
#
#iocshLoad("$(linstat_DIR)/host-2FS-1NIC.iocsh","IOC=$(IOCNAME),FS1=run,FS2=var,NIC1=enp86s0")
iocshLoad("$(linstat_DIR)/host-2FS-1NIC.iocsh","IOC=$(IOCNAME),NIC1=enp86s0")
#
# To add monitoring of one more network interface use 
#
dbLoadRecords("linStatNIC.db","IOC=$(IOCNAME),NIC=lo")
#
# To add monitoring of one more file system use 
#
dbLoadRecords("linStatFS.db","P=$(IOCNAME):disk-root,DIR=/")
