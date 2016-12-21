
TARGET	:=

ifneq ($(OBJS),)
TARGET	+= $(OBJS)
endif

ifneq ($(APP),)
TARGET	+= $(APP)
endif

ifneq ($(DEVTABLES),)
TARGET	+= devtable.txt
endif

ifneq ($(DIETABLES),)
TARGET	+= dietable.txt
endif

ifneq ($(GENFILES),)
TARGET	+= $(GENFILES)
endif

