Data seeding for adopt-a-tree
Ken Webb
June 20, 2013
=============

The data directory contains data and scripts, that are used to create db/seeds.rb

The tree data is from the City of Ottawa.
kml2adoptTree.sed and kmladoptTree.xsl work together to transform the tree data into Ruby code.
seeds.rb is a manually-generated combination of the transformed tree data with other data, that Ruby on Rails uses to seed the database.

In the following detailed process, "sed" and "xsltproc" are programs that are available on Linux and other operating systems.

This is the detailed process I followed to create seeds.rb:
----------------------------------------------------------
(1) Download odata0327.kml from http://ottawa.ca/en/city_hall/statisticsdata/opendata/info/tree_inventory/index.htm
    * this is a zipped kml file

(2) Rename odata0327.kml to odata0327.kmz

(3) Unzip doc.kml from odata0327.kmz

(4) Use sed to pre-process the text in doc.kml
    sed -f kml2adoptTree.sed doc.kml >sedOut.kml

(5) Use XSLT to convert sedOut.kml to Ruby (.rb) format
    xsltproc -o seedsTestF1.rb kml2adoptTreeNested.xsl sedOut.kml

(6) Use sed to convert tree names to tree IDs
    sed -f rbSpeciesName2rbSpeciesId.sed seedsTestF1.rb >seedsTestF1withId.rb

(7) Manually extract the first 1000 records of seedsTestF1withId.rb and save as
    seedsTestF1withId_1000recs.rb

(8) Manually fix a few things in seedsTestF1withId_1000recs.rb (see my notes from Nov 2, 2012)
    1. city_id should be a number e.g. 0 1 2 ...
    2. ADDNUM may have "#" character; these should be deleted
    3. ADDSTR may have "'" character; preceed these with "\'" or just "\"
    4. some <td> fields have null values e.g. <td></td>
       - TREATMENT may be EAB DED or null
    5. RDLOCATION may have "N/A"; use "//", or remove "/", or it may be OK (?)
    6. put double quotes/apostrophes around all strings
       - use double quote to solve problem 3
       - also solves problem 4 which becomes ""
       - also solves problem 5

(9) Use XSLT and sort, to extract the Species names and whether they are edible or not, in Ruby format
   xsltproc -o species.rb kml2species.xsl sedOut.kml
   sort -u species.rb > uspecies.rb

(10) Combine all the Ruby content (Tree data, Species data, and various manually-created look-up tables) together in the single seeds.rb file. Copy this file to the db folder.

