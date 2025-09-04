# This should be a test or example startup script

require linstat
#from iocBoot/iocdemo/st.cmd

# search PATH for dbLoadRecords()
#epicsEnvSet("EPICS_DB_INCLUDE_PATH", "$(PWD)/../../db")

#epicsEnvSet("ENGINEER", "MD")

#dbLoadDatabase "$(PWD)/../../dbd/linStatDemo.dbd"
#linStatDemo_registerRecordDeviceDriver(pdbbase) 

##var linStatDebug 5

#dbLoadRecords("linStatHost.db","IOC=LOCALHOST")
#dbLoadRecords("linStatProc.db","IOC=LOCALHOST")
#dbLoadRecords("linStatNIC.db","IOC=LOCALHOST,NIC=lo")
#dbLoadRecords("linStatFS.db","P=LOCALHOST:ROOT,DIR=/")

#dbLoadRecords("linStatNIC.db","IOC=LOCALHOST,NIC=wlp0s20f3")

#--------------------

epicsEnvSet("IOCNAME", "ioc-test")
dbLoadRecords("linStatFS.db","P=${IOCNAME},DIR=/")


#iocshLoad("$(n1912a_DIR)n1912a.iocsh", "IP=192.168.10.31,IP_PORT=5025,P=LLRF-Ctrl:,DEV1=FwdPwr,DEV2=ReflPwr,N=1,IOCNAME=ioc30-n1912,
#TOP=/tmp/autosave")

#dbLoadRecords("asynRecord.db","P=${IOCNAME},R=:asynRec,PORT=$(ASYN_PORT=PORT1),ADDR='0',IMAX='1024',OMAX='256'")


iocInit()
