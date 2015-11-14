TARGET = ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX}
SUBDIRS =
OBJECTS = example_lib.o

all: ${SUBDIRS} ${OBJECTS}
	${AR} ${ARFLAGS} ${TARGET} ${OBJECTS}

clean: cleansubdirs
	-(${RM} ${OBJECTS})

include ${MAKEINCLUDE}
