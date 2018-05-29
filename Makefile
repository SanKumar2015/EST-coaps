DRAFT:=draft-ietf-ace-coap-est
# Working file for all if the draft-vanderstok-ace-coap-est-current.xml
VERSION:=$(shell ./getver ${DRAFT}.xml )

${DRAFT}-${VERSION}.txt: ${DRAFT}.txt
	cp ${DRAFT}.txt ${DRAFT}-${VERSION}.txt

%.txt: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc $? $@

%.html: %.xml
	unset DISPLAY; XML_LIBRARY=$(XML_LIBRARY):./src xml2rfc --html -o $@ $?

.PRECIOUS: ${DRAFT}.xml

version:
	echo Version: ${VERSION}

clean:
	rm -rf ${DRAFT}.txt ${DRAFT}-${VERSION}.txt

