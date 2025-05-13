.PHONY: help
help:
	@printf "Commands:\n"
	@printf "  - spelllist\t\tMake commit for updating spell list\n"
	@printf "  - spell\t\tMake commit for updating spell list\n"
	@printf "  - snippets\t\tMake commit for updating snippets\n"

.PHONY: spelllist
spelllist:
	git add spell/en.utf-8.add
	git commit --message "Update spell list"

.PHONY: spell
spell: spelllist

.PHONY: snippets
snippets:
	git add snippets/
	git commit --message "Update snippets"

.PHONY: plugins
plugins:
	git add lazy-lock.json
	git commit --message "Update plugins"
