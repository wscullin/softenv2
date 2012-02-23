all: docdirs softenv soft-mad soft-msc soft-msd soft-mwl soft-dec \
	softenv-code softenv-admin softenv-intro softenv-policy \
	resoft softcheck soft softmenu soft-dbq soft-menu-change \
	soft-menu-select

docdirs:
	@if [ ! -d man ] ; then mkdir man ; fi
	@if [ ! -d html ] ; then mkdir html ; fi
	@if [ ! -d txt ] ; then mkdir txt ; fi


soft-mad: html/soft-mad.html txt/soft-mad.txt man/soft-mad.1

soft-msc: html/soft-msc.html txt/soft-msc.txt man/soft-msc.1

soft-msd: html/soft-msd.html txt/soft-msd.txt man/soft-msd.1

soft-mwl: html/soft-mwl.html txt/soft-mwl.txt man/soft-mwl.1

soft-dec: html/soft-dec.html txt/soft-dec.txt man/soft-dec.1

softenv: html/softenv.html txt/softenv.txt man/softenv.1

softenv-admin: html/softenv-admin.html txt/softenv-admin.txt man/softenv-admin.1

softenv-intro: html/softenv-intro.html txt/softenv-intro.txt man/softenv-intro.1

softenv-code: html/softenv-code.html txt/softenv-code.txt man/softenv-code.1

softenv-policy: html/softenv-policy.html txt/softenv-policy.txt man/softenv-policy.1

resoft: html/resoft.html txt/resoft.txt man/resoft.1

softcheck: html/softcheck.html txt/softcheck.txt man/softcheck.1

soft: html/soft.html txt/soft.txt man/soft.1

soft-dbq: html/soft-dbq.html txt/soft-dbq.txt man/soft-dbq.1

soft-menu-select: html/soft-menu-select.html txt/soft-menu-select.txt man/soft-menu-select.1

soft-menu-change: html/soft-menu-change.html txt/soft-menu-change.txt man/soft-menu-change.1

softmenu: html/softmenu.html txt/softmenu.txt man/softmenu.1


html/soft-mad.html: soft-mad.pod
	rm -f $@
	pod2html $? > $@

man/soft-mad.1: soft-mad.pod
	rm -f $@
	pod2man $? > $@

txt/soft-mad.txt: soft-mad.pod
	rm -f $@
	pod2text $? > $@


html/soft-msc.html: soft-msc.pod
	rm -f $@
	pod2html $? > $@

man/soft-msc.1: soft-msc.pod
	rm -f $@
	pod2man $? > $@

txt/soft-msc.txt: soft-msc.pod
	rm -f $@
	pod2text $? > $@


html/soft-msd.html: soft-msd.pod
	rm -f $@
	pod2html $? > $@

man/soft-msd.1: soft-msd.pod
	rm -f $@
	pod2man $? > $@

txt/soft-msd.txt: soft-msd.pod
	rm -f $@
	pod2text $? > $@


html/soft-mwl.html: soft-mwl.pod
	rm -f $@
	pod2html $? > $@

man/soft-mwl.1: soft-mwl.pod
	rm -f $@
	pod2man $? > $@

txt/soft-mwl.txt: soft-mwl.pod
	rm -f $@
	pod2text $? > $@

html/soft-dec.html: soft-dec.pod
	rm -f $@
	pod2html $? > $@

man/soft-dec.1: soft-dec.pod
	rm -f $@
	pod2man $? > $@

txt/soft-dec.txt: soft-dec.pod
	rm -f $@
	pod2text $? > $@


html/softenv.html: softenv.pod
	rm -f $@
	pod2html $? > $@

man/softenv.1: softenv.pod
	rm -f $@
	pod2man $? > $@

txt/softenv.txt: softenv.pod
	rm -f $@
	pod2text $? > $@


html/softenv-admin.html: softenv-admin.pod
	rm -f $@
	pod2html $? > $@

man/softenv-admin.1: softenv-admin.pod
	rm -f $@
	pod2man $? > $@

txt/softenv-admin.txt: softenv-admin.pod
	rm -f $@
	pod2text $? > $@


html/softenv-intro.html: softenv-intro.pod
	rm -f $@
	pod2html $? > $@

man/softenv-intro.1: softenv-intro.pod
	rm -f $@
	pod2man $? > $@

txt/softenv-intro.txt: softenv-intro.pod
	rm -f $@
	pod2text $? > $@


html/softenv-code.html: softenv-code.pod
	rm -f $@
	pod2html $? > $@

man/softenv-code.1: softenv-code.pod
	rm -f $@
	pod2man $? > $@

txt/softenv-code.txt: softenv-code.pod
	rm -f $@
	pod2text $? > $@


html/softenv-policy.html: softenv-policy.pod
	rm -f $@
	pod2html $? > $@

man/softenv-policy.1: softenv-policy.pod
	rm -f $@
	pod2man $? > $@

txt/softenv-policy.txt: softenv-policy.pod
	rm -f $@
	pod2text $? > $@


html/resoft.html: resoft.pod
	rm -f $@
	pod2html $? > $@

man/resoft.1: resoft.pod
	rm -f $@
	pod2man $? > $@

txt/resoft.txt: resoft.pod
	rm -f $@
	pod2text $? > $@


html/softcheck.html: softcheck.pod
	rm -f $@
	pod2html $? > $@

man/softcheck.1: softcheck.pod
	rm -f $@
	pod2man $? > $@

txt/softcheck.txt: softcheck.pod
	rm -f $@
	pod2text $? > $@


html/soft.html: soft.pod
	rm -f $@
	pod2html $? > $@

man/soft.1: soft.pod
	rm -f $@
	pod2man $? > $@

txt/soft.txt: soft.pod
	rm -f $@
	pod2text $? > $@


html/softmenu.html: softmenu.pod
	rm -f $@
	pod2html $? > $@

man/softmenu.1: softmenu.pod
	rm -f $@
	pod2man $? > $@

txt/softmenu.txt: softmenu.pod
	rm -f $@
	pod2text $? > $@


html/soft-menu-change.html: soft-menu-change.pod
	rm -f $@
	pod2html $? > $@

man/soft-menu-change.1: soft-menu-change.pod
	rm -f $@
	pod2man $? > $@

txt/soft-menu-change.txt: soft-menu-change.pod
	rm -f $@
	pod2text $? > $@


html/soft-menu-select.html: soft-menu-select.pod
	rm -f $@
	pod2html $? > $@

man/soft-menu-select.1: soft-menu-select.pod
	rm -f $@
	pod2man $? > $@

txt/soft-menu-select.txt: soft-menu-select.pod
	rm -f $@
	pod2text $? > $@


html/soft-dbq.html: soft-dbq.pod
	rm -f $@
	pod2html $? > $@

man/soft-dbq.1: soft-dbq.pod
	rm -f $@
	pod2man $? > $@

txt/soft-dbq.txt: soft-dbq.pod
	rm -f $@
	pod2text $? > $@


clean: cleanman cleantxt cleanhtml
	rm -f pod2html-*


cleanman: /dev/null
	rm -rf man

cleantxt: /dev/null
	rm -rf txt

cleanhtml: /dev/null
	rm -rf html
