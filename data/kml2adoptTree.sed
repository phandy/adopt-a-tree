# Pre process the text in a .kml file, before running adoptTree.xsl
# Author: Ken Webb (for Ecology Ottawa)
# Date:   November 1, 2012
# File:   kml2adoptTree.sed
# To run using sed on linux, do one of the following:
#   sed -f kml2adoptTree.sed odata0327_test02.kml >sedOut.kml
#   sed -f kml2adoptTree.sed odata0327/doc.kml >docSed.kml
#   sed -f kml2adoptTree.sed odata0327/docOriginal.kml >temp.kml

# (1) fix kml tag at start of file; the tag attributes interfere with xsltproc
/^<kml/ c\
<kml>

# (2) remove unterminated META and meta elements
/^<META/d
/^<meta/d

# (3) remove CDATA start/end strings
s/<!\[CDATA\[//
s/]]>//

# (4) split coordinates text into lat and lng
s|<coordinates>\(.*\),\(.*\),0</coordinates>|<lng>\1</lng><lat>\2</lat>|g

