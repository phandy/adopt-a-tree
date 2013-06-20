# Post-process the records in a .rb file,
# to convert species name to id.
# Author: Ken Webb (for Ecology Ottawa)
# Date:   November 16, 2012
# File:   rbSpeciesName2rbSpeciesId.sed
# To run using sed on linux, do one of the following:
#   sed -f rbSpeciesName2rbSpeciesId.sed seedsTestE1.rb >seedsTestE1withId.rb

s/Amur Corktree/1/g
s/Apple Species/2/g
s/Ash Black/3/g
s/Ash European/4/g
s/Ash Green/5/g
s/Ash Species/6/g
s/Ash White/7/g
s/Aspen Columnar/8/g
s/Aspen Largetooth/9/g
s/Aspen Trembling/10/g
s/Basswood/11/g
s/Beech American/12/g
s/Beech Blue/13/g
s/Beech European/14/g
s/Beech Species/15/g
s/Birch Gray/16/g
s/Birch Species/17/g
s/Birch Weeping/18/g
s/Birch White/19/g
s/Birch Yellow/20/g
s/Buckeye Ohio/21/g
s/Butternut/22/g
s/Catalpa northern/23/g
s/Cedar  Eastern White/24/g
s/Cherry Black/25/g
s/Cherry Choke/26/g
s/Cherry Choke Schubert/27/g
s/Cherry Purple Leaf/28/g
s/Cherry Species/29/g
s/Coffeetree Kentucky/30/g
s/Crabapple Species/31/g
s/Elm American/32/g
s/Elm Prospector/33/g
s/Elm Rock/34/g
s/Elm Siberian/35/g
s/Elm Species/36/g
s/Fir Balsam/37/g
s/Fir Colorado/38/g
s/Fir Douglas/39/g
s/Fir Species/40/g
s/Ginkgo/41/g
s/Hackberry/42/g
s/Hawthorn/43/g
s/Hazel Turkish/44/g
s/Hemlock/45/g
s/Hickory Bitternut/46/g
s/Hickory Shagbark/47/g
s/Horsechestnut Common/48/g
s/Ironwod/49/g
s/Juniper/50/g
s/Katsura tree/51/g
s/Larch Eastern/52/g
s/Larch European/53/g
s/Lilac  Japanese/54/g
s/Linden Littleleaf/55/g
s/Locust  Black/56/g
s/Locust Honey/57/g
s/Magnolia Species/58/g
s/Maple Amur/59/g
s/Maple Black/60/g
s/Maple Freeman/61/g
s/Maple Manitoba/62/g
s/Maple Norway/63/g
s/Maple Red/64/g
s/Maple Silver/65/g
s/Maple Species/66/g
s/Maple Sugar/67/g
s/Mountain Ash  Oakleaf/68/g
s/Mountain Ash  Showy/69/g
s/Mountain Ash  Species/70/g
s/Mulberry Species/71/g
s/Oak Bur/72/g
s/Oak English/73/g
s/Oak Pin/74/g
s/Oak Red/75/g
s/Oak Species/76/g
s/Oak White/77/g
s/Olive Russian/78/g
s/Other/79/g
s/Pear Species/80/g
s/Pine Austrian/81/g
s/Pine Jack/82/g
s/Pine Red/83/g
s/Pine Scotch/84/g
s/Pine Species/85/g
s/Pine White/86/g
s/Poplar Balsam/87/g
s/Poplar Lombardy/88/g
s/Poplar Species/89/g
s/Redbud Eastern/90/g
s/Serviceberry/91/g
s/Spruce Black/92/g
s/Spruce Colorado/93/g
s/Spruce Norway/94/g
s/Spruce Red/95/g
s/Spruce Species/96/g
s/Spruce White/97/g
s/Sycamore American/98/g
s/Unknown Species/99/g
s/Various Species/100/g
s/Walnut Black/101/g
s/Willow  Black/102/g
s/Willow Species/103/g
s/Willow Weeping/104/g
s/Yew Canada/105/g
