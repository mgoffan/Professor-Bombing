//
//  HelloWorldLayer.m
//  Professor Bombing
//
//  Created by Martin Goffan on 2/8/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)animateAtIndex:(int)index
{
    CCSprite *tmp = (CCSprite *)[facesArray objectAtIndex:index];
    int x = tmp.position.x;
    id move = [CCMoveTo actionWithDuration:5 position:ccp(x, 240)];
    
    [[facesArray objectAtIndex:index] runAction:move];
    
    index++;
}

- (void)waitTime:(unsigned)time
{
    sleep(time);
}

- (void)animAll
{
    for (CCSprite *i in facesArray) {
        CCAction *action  = [CCSequence actions:[CCMoveTo actionWithDuration:i.tag position:ccp(i.position.x, 0)],
                                                [CCDelayTime actionWithDuration:100], nil];
//        sleep(2);
        [self runAction:[CCDelayTime actionWithDuration:2.5]];
        [i runAction:action];
    }
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
        
        CCLayer *layer = [CCLayerColor layerWithColor:ccc4(255, 255, 255, 255) width:480 height:320];
        [self addChild:layer];
        
        
//        CCSprite *d = [CCSprite spriteWithFile:@"face.png"];
//        d.scale = 0.5;
//        d.anchorPoint = ccp(0, 0);
//        d.position    = ccp(240, 160);
//        [self addChild:d];
        
        
//        CGSize winSize = [[CCDirector sharedDirector] winSize];
        facesArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 100; ++i) {
            CCSprite *face = [CCSprite spriteWithFile:@"face.png"];
            face.anchorPoint = ccp(0, 0);
            face.scale       = 0.1;
            face.position    = ccp(arc4random() % 450, 320 + (i * 20));
            face.tag         = i;
            [facesArray addObject:face];
            [self addChild:[facesArray objectAtIndex:i]];
            
//            [self animateAtIndex:i];
        }
        
        [self animAll];
        
//        [self schedule:@selector(animAll) interval:2.0];
        
//        CCAction *action = [CCCallFunc actionWithTarget:self selector:@selector(animAll)];
//        
//        [self runAction:action];
//        
//		
//		// create and initialize a Label
//		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
//
//		// ask director the the window size
//		CGSize size = [[CCDirector sharedDirector] winSize];
//	
//		// position the label on the center of the screen
//		label.position =  ccp( size.width /2 , size.height/2 );
//		
//		// add the label as a child to this Layer
//		[self addChild: label];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
