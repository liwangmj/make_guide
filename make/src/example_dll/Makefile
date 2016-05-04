TARGET = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}
SONAME = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}.1
LIBRARY = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}.1.2.3
SUBDIRS =
OBJECTS = example_dll.o

all: subdirs ${OBJECTS}
	${CXX} -shared ${OBJECTS} -o ${TARGET} 
#	${CXX} -shared  ${OBJECTS} -Wl,-soname,${SONAME} -o ${LIBRARY}
#	ln -sf ${LIBRARY} ${TARGET}
#	ln -sf ${LIBRARY} ${SONAME}

#	${CXX} -shared ${OBJECTS} -Wl,--whole-archive ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX} -Wl,--no-whole-archive -o ${TARGET}

clean: cleansubdirs
	-(${RM} ${OBJECTS})

include ${MAKEINCLUDE}
