#-*- coding:utf-8 -*-
import sys, imp
from os.path import exists, join

class CustomBuiltinImporter(object):
    def find_module(self, fullname, mpath=None):
        if fullname in ['greenlet', 'ccpy']: 
            return self
        if '.' not in fullname:
            return
        if mpath is None:
            return
        part = fullname.rsplit('.')[-1]
        fn = join(mpath[0], '{}.so'.format(part))
        if exists(fn):
            return self
        return

    def load_module(self, fullname):
        f = fullname.replace('.', '_')
        mod = sys.modules.get(f)
        if mod is None:
            print 'LOAD DYNAMIC', f
            try:
                mod = imp.load_dynamic(f, f)
            except ImportError, e:
                print 'LOAD DYNAMIC FALLBACK', fullname, e
                mod = imp.load_dynamic(fullname, fullname)
            return mod
        return mod
sys.meta_path.append(CustomBuiltinImporter())
 