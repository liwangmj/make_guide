TARGET = ${DLLOUTPATH}/libexample_dll_${DLLOUTSUFFIX}
LIBRARY = ${DLLOUTPATH}/libexample_dll_${DLLOUTSUFFIX}.1.0.0
SONAME = ${DLLOUTPATH}/libexample_dll_${DLLOUTSUFFIX}.1
SUBDIRS =
OBJECTS = example_dll.o

all: subdirs ${OBJECTS}
	${CXX} -fPIC -shared ${OBJECTS} -o ${TARGET} 
#	${CXX} -fPIC -shared  ${OBJECTS} -Wl,-soname,${SONAME} -o ${LIBRARY}
#	ln -sf ${LIBRARY} ${SUBDIRS}
#	ln -sf ${LIBRARY} ${SONAME}

#	${CXX} -fPIC -shared ${OBJECTS} -Wl,--whole-archive ${LIBOUTPATH}/libexample_lib_${LIBOUTSUFFIX} -Wl,--no-whole-archive -o ${TARGET}

clean: cleansubdirs
	-(${RM} ${OBJECTS})

include ${MAKEINCLUDE}
