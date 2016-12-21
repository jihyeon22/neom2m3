
$(APP):		$(OBJS)
	$(Q)rm -vrf $@
	$(Q)$(CC) -o $@ $^

devtable.txt:	$(DEVTABLES)
	$(Q)rm -vrf $@
	$(Q)for txt in $^; do echo Create $@ ... $$txt; cat $$txt >> $@; done

dietable.txt:	$(DIETABLES)
	$(Q)rm -vrf $@
	$(Q)for txt in $^; do echo Create $@ ... $$txt; cat $$txt >> $@; done

unused-files:
	$(Q)for f in $(UNUSEDFILES); do \
		fakeroot rm -vf $(DESTDIR)/$$f; done

install-files:
	$(Q)for f in $(INSTALLFILES); do				\
		if [ ! -d "$$(dirname $(DESTDIR)/$$f)" ]; then		\
			fakeroot mkdir -p $$(dirname $(DESTDIR)/$$f);	\
		fi;							\
		fakeroot cp -vd $$f $(DESTDIR)/$$f;			\
	done

install-readme:
	$(Q)for f in $(INSTALLREADME); do				\
		if [ ! -d "$$(dirname $(INSTALLREADME_DIR)/$$f)" ]; then		\
			fakeroot mkdir -p $$(dirname $(INSTALLREADME_DIR)/$$f);	\
		fi;							\
		fakeroot cp -vd $$f $(INSTALLREADME_DIR)/$$f;			\
	done

install-app:
	$(Q)if [ -n "$(INSTALLAPP)" ]; then				\
		if [ ! -d "$$(dirname $(INSTALLAPP))" ]; then		\
			fakeroot mkdir -p $$(dirname $(INSTALLAPP));	\
		fi;							\
		fakeroot cp -v $(APP) $(INSTALLAPP);			\
	fi

install-lib:
	$(Q)for f in $(INSTALLLIBS); do					\
		if [ ! -d "$$(dirname $(DESTDIR)/lib)" ]; then		\
			fakeroot mkdir -p $$(dirname $(DESTDIR)/lib);	\
		fi;							\
		fakeroot cp -vdr $$f $(DESTDIR)/lib;			\
	done

