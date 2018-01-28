
CXX= g++
CXXFLAGS=-I/opt/X11/include -Iobjs/ -O3 -Wall -L/opt/X11/lib -lX11 -ljpeg
ISPC= ispc 
ISPCFLAGS= -O2 --arch=x86-64 --target=sse2

default: twirlfilter

.PHONY: dirs clean
.PRECIOUS: objs/twirlfilter.h

dirs:
	/bin/mkdir -p objs/

clean:
	/bin/rm -rf objs *~ twirlfilter

twirlfilter: dirs  objs/twirlfilter.o objs/twirlfilter_ispc.o
	$(CXX) $(CXXFLAGS) -o $@ objs/twirlfilter.o objs/twirlfilter_ispc.o

objs/twirlfilter.o: twirlfilter_ispc.cpp objs/twirlfilter_ispc.h 
	$(CXX) $(CXXFLAGS) -c -o $@ $<

objs/%_ispc.h objs/%_ispc.o: %.ispc
	$(ISPC) $(ISPCFLAGS) $< -o objs/$*_ispc.o -h objs/$*_ispc.h
