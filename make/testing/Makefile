TARGET = ${APPOUTPATH}/runtest
SUBDIRS =
OBJECTS = main.o

all: subdirs ${OBJECTS}
	${CXX} -o ${TARGET} ${OBJECTS} ${LDFLAGS} ${INCLUDES}

clean: cleansubdirs
	-(${RM} ${TARGET} ${OBJECTS})

include ${MAKEINCLUDE}
