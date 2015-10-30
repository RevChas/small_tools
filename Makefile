
PROJECTS = lockscreen

SCRIPTS = despace.pl itunes tmstats

all: $(PROJECTS)

lockscreen: lockscreen.m
	clang -framework Foundation lockscreen.m -o lockscreen

install: $(PROJECTS)
	@if [ ! -d ~/bin ] ; then mkdir ~/bin ; fi
	@install -v -C -m 755 $(PROJECTS) $(SCRIPTS) ~/bin

clean:
	rm -f $(PROJECTS)


