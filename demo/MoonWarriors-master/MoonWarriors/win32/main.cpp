#include "main.h"
#include "../Classes/AppDelegate.h"
#include "CCEGLView.h"
#include "Python.h"

USING_NS_CC;

void py() {
	Py_NoSiteFlag = 1;
	//Py_SetPythonHome("C:\\Python27");
    Py_Initialize();
    //PySys_SetArgv(argc, argv);

    // If other modules are using thread, we need to initialize them before.
    PyEval_InitThreads();

    // Add an importer for builtin modules
	static const char *s = "import sys, os\n"
"out = open('CONOUT$', 'wb', buffering=0)\n"
"err = open('CONERR$', 'wb', buffering=0)\n"
"sys.stdout = out\n"
"sys.stderr = err\n"
"exe_path = os.path.dirname(sys.executable)\n"
"lib_path = os.path.join(exe_path, '..', '..', 'demo', 'MoonWarriors-master', 'MoonWarriors', 'Resources', 'lib')\n"
"sys.path = []\n"
//"sys.path.append('E:\\dev\\cocos2d\\pycocos2d\\demo\\MoonWarriors-master\\MoonWarriors\\Resources\\lib')\n"
//"sys.path.append('E:\\dev\\cocos2d\\pycocos2d\\demo\\MoonWarriors-master\\MoonWarriors\\Resources\\lib\\python27.zip')\n"
"sys.path.insert(0, exe_path)\n"
"sys.path.insert(0, os.path.join(lib_path, 'python27.zip'))\n"
"sys.path.insert(0, lib_path)\n"
"import ccpy\n"
"print(sys.path)\n";
	PyRun_SimpleString(s);


	//TCHAR szFilePath[MAX_PATH + 1]; 
	//GetModuleFileName(NULL, szFilePath, MAX_PATH); 
	//char *p;
	//p = "E:\\dev\\cocos2d\\pycocos2d\\demo\\MoonWarriors-master\\MoonWarriors\\Resources\\lib;E:\\dev\\cocos2d\\pycocos2d\\demo\\MoonWarriors-master\\MoonWarriors\\Resources\\lib\\python27.zip";
    //PySys_SetPath(p);
}


int APIENTRY _tWinMain(HINSTANCE hInstance,
                       HINSTANCE hPrevInstance,
                       LPTSTR    lpCmdLine,
                       int       nCmdShow)
{
	AllocConsole(); 
	freopen("CONOUT$", "w", stdout);
	freopen("CONERR$", "w", stderr);
	freopen("CONIN$", "r", stdin);

    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);
	py();
    // create the application instance
    AppDelegate app;
    CCEGLView* eglView = CCEGLView::sharedOpenGLView();
    eglView->setViewName("MoonWarriors");
	eglView->setFrameSize(640, 1136);//(320, 500); //(640, 1136); //1136, 960
	//eglView->setFrameSize(2048, 1536);
    // The resolution of ipad3 is very large. In general, PC's resolution is smaller than it.
    // So we need to invoke 'setFrameZoomFactor'(only valid on desktop(win32, mac, linux)) to make the window smaller.
    eglView->setFrameZoomFactor(0.4f);
    return CCApplication::sharedApplication()->run();
}
