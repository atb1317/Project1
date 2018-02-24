################
### MAKEFILE ###
################

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

# Java execs
JC = javac
JVM = java

# Out path
OUTPATH = out/production/Project1

# Class Path
CP = src/

# Root path
ROOT = src/dendron/*.java

# Machine class path
MACHINE = src/dendron/machine/*.java

all: root test machine

test:
	$(JC) -d $(OUTPATH) -cp $(CP) $(CP)*.java

root:
	$(JC) -d $(OUTPATH) -cp $(CP) $(ROOT)

machine:
	$(JC) -d $(OUTPATH) -cp $(CP) $(MACHINE)

run:
	$(JVM) -cp $(OUTPATH) dendron/machine/InstructionReader $(call args)

clean:
	$(RM) -r $(OUTPATH)/*
