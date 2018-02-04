PREFIX=/usr/local
bindir=$(PREFIX)/bin
unitdir=/etc/systemd/system

SCRIPTS = \
	  restic-run \
	  restic-run-schedule \
	  restic-backup \
	  restic-clean

SERVICES = \
	restic-backup@.service \
	restic-clean@.service \
	restic-backup-schedule@.service \
	restic-clean-schedule@.service

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
