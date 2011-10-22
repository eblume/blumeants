# User-defined values
# (None right now)

# Default values that can be changed but probably shouldn't
BOTS_DIR = bots/

# Values that are actually macros (ie, don't change these)
BOTS = $(notdir $(wildcard $(BOTS_DIR)*))
BOTS_SRCS = $(wildcard $(addprefix $(BOTS_DIR),$(BOTS))/*)
BOTS_ZIPS = $(addprefix $(BOTS_DIR), $(join $(BOTS),$(BOTS:%=/%.zip)))

# Special argets that enable GNU Make features
.SECONDEXPANSION:


# Manual Targets:

help:
	@echo "Please use 'make <target>' where <target> is one of:"
	@echo "  help       display this help message"
	@echo "  build      create the file BotName.zip for all bots"
	@echo "  clean      remove all files from the build process"

build: $(BOTS_ZIPS)

clean:
	-rm $(BOTS_ZIPS)

# Automatic Targets (used by manual targets):

# TODO: Don't make these depend on $(BOTS_SRCS) because it will rebuild all
$(BOTS_ZIPS): $(BOTS_SRCS)
	@echo "Creating $@"
	zip $@ $(wildcard $(dir $@)*)


