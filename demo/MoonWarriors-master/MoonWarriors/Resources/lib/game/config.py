#-*- coding:utf-8 -*-
from cocos2d import *

class EnemyInfo:
    # string showType
    # int showTime
    # int types[3]
    def __init__(self, stype='Repeate', stime=0, types={0,0,0}):
        self.showType = stype
        self.showTime = stime
        self.types = list(types)

class EnemyType:
    # int type;
    # string textureName;
    # string bulletType;
    # int hp;
    # int moveType;
    # int scoreValue; 
    def __init__(self, type, textureName, bulletType,
            hp, moveType, scoreValue):
        self.type = type
        self.textureName = textureName
        self.bulletType = bulletType
        self.hp = hp
        self.moveType = moveType
        self.scoreValue = scoreValue



enemies = [
    EnemyInfo(stype="Repeate", stime=2, types=[1, 2, 0]),
    EnemyInfo(stime=5, types=[3,4,5]),
    ]


enemyTypes = {
    0: EnemyType(0, "E0.png", "W2.png", 1, 0, 15),
    1: EnemyType(1, "E1.png", "W2.png", 1, 0, 40),
    2: EnemyType(2, "E2.png", "W2.png", 2, 2, 60),
    3: EnemyType(3, "E3.png", "W2.png", 2, 3, 80),
    4: EnemyType(4, "E4.png", "W2.png", 3, 2, 150),
    5: EnemyType(5, "E5.png", "W2.png", 3, 2, 200),
    }

#global value
scoreValue = 0
life = 0
isAudioOn = True
# extern cocos2d::CCArray *play_bullet;
play_bullet = set()
# extern cocos2d::CCArray *enemy_bullet;
enemy_bullet = set()
# extern cocos2d::CCArray *enemy_items;
enemy_items = set()


def updateLifeCount():
    global life
    life -= 1

def resetConfig():
    global scoreValue, life, play_bullet, enemy_items, enemy_bullet
    scoreValue = 0
    life = 2
    play_bullet = set()
    enemy_bullet = set()
    enemy_items = set()


