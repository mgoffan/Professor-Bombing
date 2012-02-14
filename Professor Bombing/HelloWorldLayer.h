//
//  HelloWorldLayer.h
//  Professor Bombing
//
//  Created by Martin Goffan on 2/8/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <CCTargetedTouchDelegate>
{
    NSMutableArray *facesArray;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
