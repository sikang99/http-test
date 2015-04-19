# Makefile for
all: usage

PROGRAM=http-test
EDITOR=vim

edit e:
	$(EDITOR) $(PROGRAM).go

readme md:
	$(EDITOR) README.md

build b:
	go build $(PROGRAM).go
	@ls -alF --color=auto

run r:
	./$(PROGRAM)

test t:
	./$(PROGRAM) 

rebuild:
	rm -f ./$(PROGRAM)
	go build $(PROGRAM).go
	@ls -alF --color=auto

install i:
	go install

clean:
	rm -f ./$(PROGRAM)

make m:
	$(EDITOR) Makefile

# ---------------------------------------------------------------------------
git-hub gh:
	ssh -T git@github.com

git-update gu:
	git init
	git add README.md Makefile $(PROGRAM).go
	git commit -m "git test and upload the base"
	git push -u https://sikang99@github.com/sikang99/$(PROGRAM) master

git-status gs:
	git status
	git log --oneline -5

git-origin go:
	git init
	git add README.md Makefile $(PROGRAM).go
	git commit -m "git test and update Makefile"
	git remote add origin https://sikang99@github.com/sikang99/$(PROGRAM)
	git push -u origin master

# ---------------------------------------------------------------------------
usage:
	@echo ""
	@echo "Makefile for '$(PROGRAM)', by Stoney Kang, 2015/04/18"
	@echo ""
	@echo "usage: make [edit|readme|build|run|test|rebuild|clean|git]"
	@echo "	edit    : edit source"
	@echo "	build   : compile source"
	@echo "	run     : execute $(PROGRAM)"
	@echo "	test    : test $(PROGRAM) options"
	@echo "	install : install $(PROGRAM) to $(GOPATH)/bin"
	@echo "	git     : upload $(PROGRAM) to github.com"
	@echo ""
