//
//  MoonWarriorsxAppDelegate.cpp
//  MoonWarriorsx
//
//  Created by 磊 王 on 12-12-27.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#include "AppDelegate.h"

#include "cocos2d.h"
#ifndef WIN32
  #include "StartMenu.h"
#endif
#include "SimpleAudioEngine.h"
#include "Python.h"

USING_NS_CC;
using namespace CocosDenshion;
AppDelegate::AppDelegate()
{

}

AppDelegate::~AppDelegate()
{
}

void py_run() {
    PyRun_SimpleString("import start;start.main()");
}

bool AppDelegate::applicationDidFinishLaunching()
{
    // initialize director
    CCDirector *pDirector = CCDirector::sharedDirector();
    CCEGLView* pEGLView = CCEGLView::sharedOpenGLView();
    
    pDirector->setOpenGLView(pEGLView);

    // 铺满屏幕，如果宽高比不一致，会拉伸导致失真
    pEGLView->setDesignResolutionSize(320, 480, kResolutionExactFit);
    // turn off display FPS
    pDirector->setDisplayStats(false);

    // set FPS. the default value is 1.0/60 if you don't call this
    pDirector->setAnimationInterval(1.0 / 60);
	//CCFileUtils::sharedFileUtils()->setResourceDirectory("E:\\dev\\cocos2d\\pycocos2d\\demo\\MoonWarriors-master\\MoonWarriors\\Resources");

    py_run();

    // create a scene. it's an autorelease object
//    CCScene *pScene = StartMenu::scene();
//    pDirector->runWithScene(pScene);

    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground()
{
    CCDirector::sharedDirector()->stopAnimation();
    SimpleAudioEngine::sharedEngine()->pauseBackgroundMusic();
    SimpleAudioEngine::sharedEngine()->pauseAllEffects();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground()
{
    CCDirector::sharedDirector()->startAnimation();
    SimpleAudioEngine::sharedEngine()->resumeBackgroundMusic();
    SimpleAudioEngine::sharedEngine()->resumeAllEffects();
}
