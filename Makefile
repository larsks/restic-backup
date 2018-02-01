PREFIX=/usr/local
bindir=$(PREFIX)/bin
unitdir=/etc/systemd/system

SCRIPTS = \
	  restic-helper \
	  restic-backup \
	  restic-clean

SERVICES = \
	restic-backup@.service \
	restic-clean@.service

all:

install: install-scripts install-services

install-scripts:
	for script in $(SCRIPTS); do \
		install -m 755 $$script $(bindir); \
	done

install-services:
	for svc in $(SERVICES); do \
		install -m 644 $$svc $(unitdir); \
	done
