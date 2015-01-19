subdirs = bootserver client puavo-install tools ruby-puavobs
install-subdirs = $(subdirs:%=install-%)
clean-subdirs = $(subdirs:%=clean-%)

.PHONY : all
all : $(subdirs)

.PHONY : $(subdirs)
$(subdirs) :
	$(MAKE) -C $@

.PHONY : $(install-subdirs)
$(install-subdirs) :
	$(MAKE) -C $(@:install-%=%) install

.PHONY : install
install : $(install-subdirs)

.PHONY : $(clean-subdirs)
$(clean-subdirs) :
	$(MAKE) -C $(@:clean-%=%) clean

.PHONY : clean
clean : $(clean-subdirs)

.PHONY : debiandir
	rm -rf debian
	cp -a debian.default debian
	puavo-dch $(shell cat VERSION)

.PHONY : deb-binary-arch
deb-binary-arch : debiandir
	dpkg-buildpackage -B -us -uc

.PHONY : deb
deb : debiandir
	dpkg-buildpackage -us -uc
