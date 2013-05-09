#-*- coding:utf-8 -*-
from cocos2d import *
from level_mgr import LevelManager
from game.view import v_start, v_options, v_about, v_game, v_over

def wrap_switch(func):
    def _func(self, *args, **kw):
        self.before_switch()
        func(self, *args, **kw)
        self.switch_view()
    return _func

class MainCtl(object):
    def init(self):
        self.levelManager = LevelManager(self)
        self.director = CCDirector.sharedDirector()
        self.director.setDisplayStats(True)
        self.director.setDepthTest(False)
        self.scheduler = self.director.Scheduler
        self.winSize = self.director.getWinSize()
        self.view = None
        self.ctl_view = None

    def start(self):
        self.init()
        self.cb_goback = CallBack(self._on_goback)
        self.starting = True
        self.view_start()

    def schedule(self, cb, fInterval, 
                repeat=None, delay=0.0, bPaused=False):
        self.scheduler.scheduleSelector(cb, fInterval,
                repeat, delay, bPaused)

    def unschedule(self, cb):
        self.scheduler.unscheduleSelector(cb)

    def before_switch(self):
        if self.view:
            self.view.stop()
            self.view = None
        if self.ctl_view:
            self.ctl_view.stop()
            self.ctl_view = None

    def switch_view(self):
        if self.starting:
            self.starting = False
            self.director.runWithScene(self.view.init())
        else:
            self.director.replaceScene(
                    CCTransitionFade.create(1.2, self.view.init()))

    @wrap_switch
    def view_start(self):
        self.view = v_start.StartView(self)

    @wrap_switch
    def view_options(self):
        self.view = v_options.OptionsView(self)

    @wrap_switch
    def view_about(self):
        self.view = v_about.AboutView(self)

    @wrap_switch
    def view_game_over(self):
        self.view = v_over.GameOverView(self)

    @wrap_switch
    def view_game(self):
        from c_game import GameCtrl
        self.view = v_game.GameView(self)
        self.ctl_view = GameCtrl(self, self.view)


    def _on_goback(self, obj):
        self.view_start()


main_ctl = None
def start():
    global main_ctl
    main_ctl = MainCtl()
    main_ctl.start()
