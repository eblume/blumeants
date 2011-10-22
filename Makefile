# User-defined values
# (None right now)

# Default values that can be changed but probably shouldn't
BOTS_DIR = bots/
ANTS_SRC = ants/ants.py
DEF_BOTNAME = MyBot.py3

# Values that are actually macros (ie, don't change these)
BOTS = $(notdir $(wildcard $(BOTS_DIR)*))
BOTS_SRCS = $(addprefix $(BOTS_DIR), $(BOTS:%=%/$(DEF_BOTNAME)))
BOTS_ZIPS = $(addprefix $(BOTS_DIR), $(join $(BOTS),$(BOTS:%=/%.zip)))

.SECONDEXPANSION:

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  help       display this help message"
	@echo "  build      create the file BotName.zip for all bots"
	@echo "  clean      remove all files from the build process"

build: $(BOTS_ZIPS)

clean:
	-rm $(BOTS_ZIPS)

# TODO: Don't make these depend on $(BOTS_SRCS) because it will rebuild all
$(BOTS_ZIPS): $(BOTS_SRCS)
	@echo "Creating $@"
	zip $@ $(addsuffix $(DEF_BOTNAME), $(dir $@))


