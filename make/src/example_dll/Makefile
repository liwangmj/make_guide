TARGET  = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}.so
LIBRARY = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}.so.1.0.0
SONAME  = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}.so.1
SUBDIRS =
OBJECTS = example_dll.o

all: subdirs ${OBJECTS}
	${CXX} -fPIC -shared -o ${TARGET} ${OBJECTS}
#	${CXX} -fPIC -shared -Wl,-soname,${SONAME} -o ${LIBRARY} ${OBJECTS}
#	ln -sf ${LIBRARY} ${SUBDIRS}
#	ln -sf ${LIBRARY} ${SONAME}

clean: cleansubdirs
	${RM} ${TARGET} ${OBJECTS}

include ${MAKEINCLUDE}
