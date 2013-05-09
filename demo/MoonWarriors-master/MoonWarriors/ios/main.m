//
//  main.m
//  MoonWarriors
//
//  Created by lerry on 13-1-26.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pyconfig.h"
#import "Python.h"

extern void initgreenlet(void);
extern void initccpy(void);

void py(int argc, char *argv[]) {
    NSString * resourcePath = [[NSBundle mainBundle] resourcePath] ;
    chdir((char *)[resourcePath UTF8String]);

    //resourcePath=[NSString stringWithFormat:@"%@/lib/python2.7",resourcePath];
    NSLog(@"PythonHome is: %s", (char *)[resourcePath UTF8String]);
    Py_SetPythonHome((char *)[resourcePath UTF8String]);

    Py_Initialize();
    PySys_SetArgv(argc, argv);

    // If other modules are using thread, we need to initialize them before.
    PyEval_InitThreads();

    // Add an importer for builtin modules
    NSString * libPath = [NSString stringWithFormat:@"%@/lib:%@/lib/python27.zip", resourcePath, resourcePath];
    PySys_SetPath((char *) [libPath UTF8String]);

    PyRun_SimpleString("import init");


    //fake load buildin modules, make sure func can dlsym
    if (1) {
//    if (sizeof(argv) == 9999) {
        initgreenlet();
        initccpy();
    }

}

int main(int argc, char *argv[]) {
    py(argc, argv);
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"AppController");
    [pool release];
    return retVal;
}

