TARGET  = ${LIBOUTPATH}/libexample_lib_${OUTSUFFIX}.a
SUBDIRS =
OBJECTS = example_lib.o

all: ${SUBDIRS} ${OBJECTS}
	${AR} ${ARFLAGS} ${TARGET} ${OBJECTS}

clean: cleansubdirs
	${RM} ${TARGET} ${OBJECTS}

include ${MAKEINCLUDE}
