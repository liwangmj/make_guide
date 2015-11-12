TARGET = ${APPOUTPATH}/example_app
SUBDIRS = module_a module_b
OBJECTS = main.o

all: subdirs ${OBJECTS}
	${CXX} -o ${TARGET} ${OBJECTS} ${FINDSUB} ${LDFLAGS} ${INCLUDES}

clean: cleansubdirs
	-(${RM} ${TARGET} ${OBJECTS})

include ${MAKEINCLUDE}
