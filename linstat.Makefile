# Copyright (C) 2025  FREIA Laboratory

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.


# The following lines are required
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile

# Most modules only need to be built for x86_64
EXCLUDE_ARCHS += linux-ppc64e6500
EXCLUDE_ARCHS += linux-corei7-poky

#USR_CXXFLAGS += -fno-strict-aliasing -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -D_GNU_SOURCE -fPIC -fwrapv -DNDEBUG -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -D_GNU_SOURCE -fPIC -fwrapv


# Since this file (linstat.Makefile) is copied into
# the module directory at build-time, these paths have to be relative
# to that path
APP := statApp
APPDB := $(APP)/Db
APPSRC := $(APP)/src

# If you have files to include, you will generally want to include these, e.g.
#
#     SOURCES += $(APPSRC)/linstatMain.cpp
#     SOURCES += $(APPSRC)/library.c
#     HEADERS += $(APPSRC)/library.h
USR_INCLUDES += -I$(where_am_I)$(APPSRC)
SOURCES+= $(APPSRC)/iochooks.cpp
SOURCES+= $(APPSRC)/devstat.cpp
SOURCES+= $(APPSRC)/nlreact.cpp
SOURCES+= $(APPSRC)/lsutils.cpp
SOURCES+= $(APPSRC)/tblBase.cpp
# host
SOURCES+= $(APPSRC)/tblStat.cpp
SOURCES+= $(APPSRC)/tblHost.cpp
SOURCES+= $(APPSRC)/tblMemInfo.cpp
SOURCES+= $(APPSRC)/tblUptime.cpp
SOURCES+= $(APPSRC)/tblNetstat.cpp
SOURCES+= $(APPSRC)/tblIFStat.cpp
SOURCES+= $(APPSRC)/tblHwmon.cpp
SOURCES+= $(APPSRC)/tblEthtool.cpp
# process
SOURCES+= $(APPSRC)/tblPid.cpp
SOURCES+= $(APPSRC)/tblProcStat.cpp
SOURCES+= $(APPSRC)/tblProcStatus.cpp
SOURCES+= $(APPSRC)/tblProcFD.cpp
SOURCES+= $(APPSRC)/tblProcPDB.cpp
SOURCES+= $(APPSRC)/tblProcMallinfo.cpp
# file system
SOURCES+= $(APPSRC)/tblStatVFS.cpp

HEADERS += $(APPSRC)/linStat.h
HEADERS += $(APPSRC)/nlreact.h

#
TEMPLATES += $(wildcard $(APPDB)/*.db)
TEMPLATES += $(wildcard $(APPDB)/*.proto)
TEMPLATES += $(wildcard $(APPDB)/*.template)

############################################################################
#
# Add any .dbd files that should be included (e.g. from user-defined functions, etc.)
#
############################################################################

DBDS   += $(APPSRC)/linStat.dbd

#
SCRIPTS += $(wildcard ../iocsh/*.iocsh)

# Note that architecture-specific source files can be specified:
#
#     SOURCES_linux-x86_64 += ...
#     SOURCES_linux
#
# These are also valid for many of the compile flags specified by e.g.
#     CFLAGS CXXFLAGS CPPFLAGS
# i.e.
#     USR_CFLAGS_linux-ppc64e6500 += ...

# Same as with any source or header files, you can also use $SUBS and $TMPS to define
# database files to be inflated (using MSI), e.g.
#
#     SUBS = $(wildcard $(APPDB)/*.substitutions)
#     TMPS = $(wildcard $(APPDB)/*.template)

USR_DBFLAGS += -I . -I ..
USR_DBFLAGS += -I $(EPICS_BASE)/db
USR_DBFLAGS += -I $(APPDB)

USR_CXXFLAGS += -std=c++17


.PHONY: vlibs
vlibs:
