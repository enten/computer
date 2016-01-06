#!/usr/bin/env python

import imaplib

obj = imaplib.IMAP4_SSL('imap.gmail.com', '993')
obj.login('steven.enten@gmail.com', 'SECRET_PASSWORD')
obj.select()
print len(obj.search(None, 'UnSeen')[1][0].split())
