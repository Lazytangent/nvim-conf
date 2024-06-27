.PHONY: help
help:
	@printf "Commands:\n"
	@printf "  - spelllist\t\tMake commit for updating spell list\n"

.PHONY: spelllist
spelllist:
	git add spell/en.utf-8.add
	git commit --message "Update spell list"

.PHONY: spell
spell: spelllist
