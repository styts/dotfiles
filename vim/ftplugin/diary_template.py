#!env python

import sys
import datetime

with open('/tmp/diary_template.log', 'a') as fp:
    fp.write('called with {}\n'.format(sys.argv))

template = """*{today}*

== TODO ==
* [ ] 

== Events ==
* 

== Notes ==

== Topics ==
Fitness:
Typing:""".format(
    today=datetime.datetime.strftime(datetime.date.today(), '%a, %d %B %Y'))

# accept the <afile> command line argument from autocmd
if len(sys.argv) > 1:
    filename = sys.argv[1]
    # if we don't have diary in the filename, don't output anything
    if "/diary/" in filename:
        sys.exit(0)

print(template)
