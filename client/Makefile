subdirs = create_monitors_xml
install-subdirs = $(subdirs:%=install-%)
clean-subdirs = $(subdirs:%=clean-%)

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
libdir = $(prefix)/lib
sbindir = $(exec_prefix)/sbin
datarootdir = $(prefix)/share
sysconfdir = $(prefix)/etc

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

.PHONY : all
all : $(subdirs) po/fi/puavo-remote-assistance-applet.mo

.PHONY : $(subdirs)
$(subdirs) :
	$(MAKE) -C $@

.PHONY : $(install-subdirs)
$(install-subdirs) :
	$(MAKE) -C $(@:install-%=%) install

puavo-remote-assistance-applet.pot: puavo-remote-assistance-applet
	xgettext --omit-header --language Python --keyword=_tr -o $@ $^

%.po : po/puavo-client-updater-applet.pot
	msgmerge --update --no-fuzzy-matching --backup=off $@ $<
	touch $@

%.mo : %.po
	msgfmt $< --output-file $@

.PHONY : installdirs
installdirs :
	mkdir -p $(DESTDIR)/sbin
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(libdir)
	mkdir -p $(DESTDIR)$(libdir)/puavo-ltsp-client
	mkdir -p $(DESTDIR)$(libdir)/puavo-ltsp-client/pam
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/default
	mkdir -p $(DESTDIR)$(sysconfdir)/puavo-external-files-actions.d
	mkdir -p $(DESTDIR)$(sysconfdir)/puavo-remote-assistance-applet
	mkdir -p $(DESTDIR)$(sysconfdir)/puavo-vpn-client/scripts/route-up
	mkdir -p $(DESTDIR)$(sysconfdir)/init
	mkdir -p $(DESTDIR)$(sysconfdir)/init.d
	mkdir -p $(DESTDIR)$(sysconfdir)/network/if-up.d
	mkdir -p $(DESTDIR)$(sysconfdir)/network/if-post-down.d
	mkdir -p $(DESTDIR)$(sysconfdir)/NetworkManager/dispatcher.d
	mkdir -p $(DESTDIR)$(sysconfdir)/ssh
	mkdir -p $(DESTDIR)$(sysconfdir)/xdg/autostart
	mkdir -p $(DESTDIR)/lib/udev/rules.d
	mkdir -p $(DESTDIR)$(sysconfdir)/X11/Xsession.d
	mkdir -p $(DESTDIR)$(datarootdir)/applications
	mkdir -p $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/status
	mkdir -p $(DESTDIR)$(datarootdir)/initramfs-tools/hooks
	mkdir -p $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-bottom
	mkdir -p $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-premount
	mkdir -p $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-top
	mkdir -p $(DESTDIR)$(datarootdir)/locale/fi/LC_MESSAGES
	mkdir -p $(DESTDIR)$(datarootdir)/ltsp/ltsp_config.d
	mkdir -p $(DESTDIR)$(datarootdir)/ltsp/screen.d
	mkdir -p $(DESTDIR)$(datarootdir)/ltsp/xinitrc.d
	mkdir -p $(DESTDIR)$(datarootdir)/pam-configs
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/cron.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/cups
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/dbus-1/system.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/default
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/init
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/ldap
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/lightdm
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/network/if-up.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/network/if-post-down.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/pam.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/polkit-1/localauthority/50-local.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/rsyslog.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/samba
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/security
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/ssh
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/sssd
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/sudoers.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/systemd
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/xdg/autostart
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/lib/udev
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/usr/share/X11/xorg.conf.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/var/lib/polkit-1/localauthority/10-vendor.d
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp-client/xsessions
	mkdir -p $(DESTDIR)$(datarootdir)/puavo-ltsp/init-puavo.d
	mkdir -p $(DESTDIR)$(datarootdir)/xgreeters
	mkdir -p $(DESTDIR)$(datarootdir)/xsessions
	mkdir -p $(DESTDIR)/var/lib/puavo-desktop/shared
	mkdir -p $(DESTDIR)/var/lib/puavo-desktop/users

.PHONY : install
install : installdirs $(install-subdirs)
	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/pam-configs \
		pam/configs/puavo-local-access

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp/init-puavo.d \
		init-puavo.d/*-*

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/init \
		templates/etc/init/gssd.conf-userprincipal

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc \
		templates/etc/rsyslog.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/rsyslog.d \
		templates/etc/rsyslog.d/send_to_syslogserver.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/ssh \
		templates/etc/ssh/sshd_config

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/pam.d \
		templates/etc/pam.d/gnome-screensaver-laptop \
		templates/etc/pam.d/ltspsshd \
		templates/etc/pam.d/ltspguestsshd \
		templates/etc/pam.d/lightdm-autologin-fatclient \
		templates/etc/pam.d/lightdm-autologin-laptop \
		templates/etc/pam.d/lightdm-autologin-preinstalled \
		templates/etc/pam.d/lightdm-autologin-thinclient \
		templates/etc/pam.d/lightdm-autologin-wirelessaccesspoint \
		templates/etc/pam.d/lightdm-fatclient \
		templates/etc/pam.d/lightdm-laptop \
		templates/etc/pam.d/lightdm-thinclient \
		templates/etc/pam.d/sudo-laptop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/ldap \
		templates/etc/ldap/ldap.conf \
		templates/etc/ldap/ldap.conf-laptop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/lightdm \
		templates/etc/lightdm/lightdm.conf

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sysconfdir)/network/if-up.d \
		etc/network/if-up.d/sssd

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/icons/hicolor/scalable/status \
		icons/puavoremoteaccess-cyan.svg \
		icons/puavoremoteaccess-green.svg \
		icons/puavoremoteaccess-grey.svg \
		icons/puavoremoteaccess-original.svg \
		icons/puavoremoteaccess-yellow.svg

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc \
		templates/etc/hosts \
		templates/etc/hosts-ltspserver \
		templates/etc/idmapd.conf \
		templates/etc/krb5.conf \
		templates/etc/krb5.conf-laptop \
		templates/etc/nscd.conf \
		templates/etc/nslcd.conf \
		templates/etc/nsswitch.conf-extrausers \
		templates/etc/nsswitch.conf-ldap \
		templates/etc/nsswitch.conf-sss \
		templates/etc/nsswitch.conf-sss-extrausers \
		templates/etc/ntp.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/cron.d \
		templates/etc/cron.d/infotv_display_control

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/cups \
		templates/etc/cups/client.conf \
		templates/etc/cups/cupsd.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/dbus-1/system.d \
		templates/etc/dbus-1/system.d/org.freedesktop.login1.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/default \
		templates/etc/default/nfs-common

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/polkit-1/localauthority/50-local.d \
		templates/etc/polkit-1/localauthority/50-local.d/90.org.freedesktop.networkmanager.deny_in_webkiosk_mode.pkla

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/samba \
		templates/etc/samba/smb.conf-laptop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/security \
		templates/etc/security/group.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/sssd \
		templates/etc/sssd/sssd.conf \
		templates/etc/sssd/sssd.conf-laptop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/sudoers.d \
		templates/etc/sudoers.d/puavo-install-when-preinstalled

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/systemd \
		templates/etc/systemd/logind.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/etc/xdg/autostart \
		templates/etc/xdg/autostart/puavo-install.desktop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/lib/udev \
		templates/lib/udev/ltspfs_entry

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/usr/share/X11/xorg.conf.d \
		templates/usr/share/X11/xorg.conf.d/99-hitachicalib.conf

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/templates/var/lib/polkit-1/localauthority/10-vendor.d \
		templates/var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/puavo-ltsp-client/xsessions \
		xsessions/puavo-desktop-session.desktop

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/xsessions \
		xsessions/puavo-desktop-session.desktop

	$(INSTALL_PROGRAM) -t $(DESTDIR)/sbin \
		init-puavo 

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir) \
		puavo-ltsp-client-action \
		puavo-pulseaudio-setup \
		puavo-pulseaudio-list \
		puavo-remote-assistance-applet

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir) \
		puavo-configure-client \
		puavo-dns-client \
		puavo-dnssd-printer-client \
		puavo-handle-external-files-actions \
		puavo-ltsp-envfeed \
		puavo-ltsp-init-nfs \
		puavo-ltsp-login \
		puavo-ltspserver-create-guest \
		puavo-report-system-version \
		puavo-unity-greeter \
		puavo-update-nm-configurations

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/initramfs-tools/hooks/ \
		initramfs/hooks/ethtool \
		initramfs/hooks/puavo
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-premount \
		initramfs/scripts/init-premount/puavo_udhcp
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-bottom \
		initramfs/scripts/init-bottom/puavo_ltsp
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/initramfs-tools/scripts/init-top \
		initramfs/scripts/init-top/blacklist-r816x

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/locale/fi/LC_MESSAGES \
		po/fi/puavo-remote-assistance-applet.mo

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(datarootdir)/ltsp/screen.d \
		screen.d/builder \
		screen.d/lightdm \
		screen.d/ltspserver \
		screen.d/wirelessaccesspoint

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/ltsp/ltsp_config.d \
		ltsp_config.d/00-puavoltsp-by-hosttype \
		ltsp_config.d/02-find-puavo-ltsp-server

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/ltsp/xinitrc.d \
		xinitrc.d/I10-puavo-xrandr \
		xinitrc.d/I95-set-lightdm-state

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/default \
		etc/default/ltspssh \
		etc/default/ltspguestssh

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/puavo-remote-assistance-applet \
		etc/puavo-remote-assistance-applet/config.json

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sysconfdir)/puavo-vpn-client/scripts/route-up \
		etc/puavo-vpn-client/scripts/route-up/10-dnsmasq \
		etc/puavo-vpn-client/scripts/route-up/20-sssd \
		etc/puavo-vpn-client/scripts/route-up/30-ntpdate

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/init.d \
		etc/init.d/ltspssh \
		etc/init.d/ltspguestssh

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/init \
		upstart/lightdm.override \
		upstart/ltspssh.conf \
		upstart/ltspguestssh.conf \
		upstart/puavo-kdump-plymouth-message.conf \
		upstart/puavo-ltsp-client.conf \
		upstart/puavo-monitor-nbd-connection.conf \
		upstart/puavo-report-system-version.conf \
		upstart/puavo-set-sane-date.conf \
		upstart/puavo-sync-external-files.conf

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sysconfdir)/NetworkManager/dispatcher.d \
		etc/NetworkManager/dispatcher.d/dnssd-printers

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/ssh \
		etc/ssh/ltspsshd_config \
		etc/ssh/ltspguestsshd_config

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/xdg/autostart \
		etc/xdg/autostart/*

	$(INSTALL_DATA) -t $(DESTDIR)/lib/udev/rules.d \
		udev/rules.d/80-puavo-printers.rules \
		udev/rules.d/95-monitor-hotplug.rules

	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/X11/Xsession.d \
		etc/X11/Xsession.d/40puavo-infotv \
		etc/X11/Xsession.d/40puavo-retrieve-thinclient-session \
		etc/X11/Xsession.d/40puavo-webkiosk \
		etc/X11/Xsession.d/41puavo-set-locale \
		etc/X11/Xsession.d/42puavo-set-browser-homepage \
		etc/X11/Xsession.d/43puavo-set-guest-session-quirks \
		etc/X11/Xsession.d/44puavo-generate-dconf-profile \
		etc/X11/Xsession.d/45puavo-display-setup \
		etc/X11/Xsession.d/47puavo-force-plaintext-keyring \
		etc/X11/Xsession.d/90puavo-setup-printers

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(libdir)/puavo-ltsp-client \
		greeter-setup \
		puavo-admin-remote-connections \
		puavo-desktop-session \
		puavo-desktop-session-cleanup \
		puavo-display-setup \
		puavo-force-plaintext-keyring \
		puavo-handle-image-build-request \
		puavo-ltspserver-create-guest \
		puavo-make-release-logos \
		puavo-monitor-nbd-connection \
		puavo-run-xrandr \
		puavo-thin-guest-account \
		udev/udev-disable-wifi-powersave \
		udev/udev-hotplug-monitor \
		udev/udev-jetpipe \
		xinitrc

	$(INSTALL_PROGRAM) -t $(DESTDIR)$(libdir)/puavo-ltsp-client/pam \
		pam/check-if-account-is-locked \
		pam/chown-session-dir \
		pam/ltspserver-guest-login \
		pam/make-session-dir \
		pam/open-session \
		pam/puavo-local-config-setup \
		pam/populate-extrausers \
		pam/restrict-logins-by-local-config \
		pam/setup-guest-session

	ln -fs /usr/sbin/sshd $(DESTDIR)$(sbindir)/ltspsshd
	ln -fs /usr/sbin/sshd $(DESTDIR)$(sbindir)/ltspguestsshd

	$(INSTALL_DATA) -t $(DESTDIR)$(datarootdir)/xgreeters \
		xgreeters/puavo-unity-greeter.desktop

.PHONY : $(clean-subdirs)
$(clean-subdirs) :
	$(MAKE) -C $(@:clean-%=%) clean

.PHONY : clean
clean : $(clean-subdirs)
	rm -rf po/fi/*.mo
	rm -rf po/*.pot
