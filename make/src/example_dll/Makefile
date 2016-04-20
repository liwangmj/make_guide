TARGET = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}
LIBRARY = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}.1.0.0
SONAME = ${DLLOUTPATH}/libexample_dll_${OUTSUFFIX}${DLLSUFFIX}.1
SUBDIRS =
OBJECTS = example_dll.o

all: subdirs ${OBJECTS}
	${CXX} -shared ${OBJECTS} -o ${TARGET} 
#	${CXX} -shared  ${OBJECTS} -Wl,-soname,${SONAME} -o ${LIBRARY}
#	ln -sf ${LIBRARY} ${SUBDIRS}
#	ln -sf ${LIBRARY} ${SONAME}

#	${CXX} -shared ${OBJECTS} -Wl,--whole-archive ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX} -Wl,--no-whole-archive -o ${TARGET}

clean: cleansubdirs
	-(${RM} ${OBJECTS})

include ${MAKEINCLUDE}
