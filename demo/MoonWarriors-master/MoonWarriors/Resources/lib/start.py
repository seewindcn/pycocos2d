#-*- coding:utf-8 -*-
#import greenlet
#import eventlet

import traceback
import os, sys
from os.path import join, abspath, dirname
import cocos2d as cc
lib_path = abspath(dirname(__file__))

def main():
	try:
	    res_path = abspath(join(lib_path, '..'))
	    print "set res_path:%s" % res_path
	    cc.CCFileUtils.sharedFileUtils().setSearchPaths([res_path])
	    print 'py start ok!'
	    from game.ctl import start
	    start()
	except:
		traceback.print_exc()
		# print traceback.format_exc()









