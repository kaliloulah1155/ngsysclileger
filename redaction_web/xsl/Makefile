# $Id: Makefile 61 2007-05-30 16:27:03Z herve $

DOCUMENTS=	$(wildcard samples/*/document.html)
XML_FILES=	$(wildcard samples/*/*.xml)
DOCUMENTS_APERCU=	$(DOCUMENTS:.html=.apercu.html)
DOCUMENTS_EDITION=	$(DOCUMENTS:.html=.edition.html)
XSLTPROC_ARGS+=	--stringparam fichier_texte_riche postext.xml

# Debug output
ifdef POSEIDON_XSL_DEBUG
XSLTPROC_ARGS+=	--stringparam debug yes
endif

all: apercu edition

apercu: $(DOCUMENTS_APERCU)

edition: $(DOCUMENTS_EDITION)

%.apercu.html: %.html *.xsl $(XML_FILES)
	xsl_root=`pwd` ; xml_root="`dirname "$<"`" ; cd "$${xml_root}" && xsltproc --stringparam repertoire_fichiers_xml "$${xml_root}" ${XSLTPROC_ARGS} -o "`basename "$@"`" "$${xsl_root}/poseidon.apercu.xsl" "`basename "$<"`"

%.edition.html: %.html *.xsl $(XML_FILES)
	xsl_root=`pwd` ; xml_root="`dirname "$<"`" ; cd "$${xml_root}" && xsltproc --stringparam repertoire_fichiers_xml "$${xml_root}" ${XSLTPROC_ARGS} -o "`basename "$@"`" "$${xsl_root}/poseidon.apercu.xsl" "`basename "$<"`"

clean:
	rm -f $(DOCUMENTS_APERCU)
	rm -f $(DOCUMENTS_EDITION)
	rm -f document.edition.html document.apercu.html

debug:
	@echo DOCUMENTS=$(DOCUMENTS)
	@echo DOCUMENTS_APERCU=$(DOCUMENTS_APERCU)
