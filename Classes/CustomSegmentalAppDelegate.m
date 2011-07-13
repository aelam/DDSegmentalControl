//
//  CustomSegmentalAppDelegate.m
//  CustomSegmental
//
//  Created by ryan on 11-7-12.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomSegmentalAppDelegate.h"
#import "DDSegmentalControl.h"

@implementation CustomSegmentalAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
//	self.window.backgroundColor = [UIColor whiteColor];
	
	// simple segmental;
	DDSegmentalControl *segmental2 = [[DDSegmentalControl alloc] initWithItems:[NSArray arrayWithObjects:@"test1",@"test2",@"test3",nil]];
	segmental2.frame = CGRectMake(10, 100, 300, 50);
	segmental2.selectedSegmentIndex = 0;
	[self.window addSubview:segmental2];
	[segmental2 release];
	

	//complex segmental;
    DDSegmentalControl *se = [[DDSegmentalControl alloc] initWithItems:[NSArray arrayWithObjects:@"test1",[UIImage imageNamed:@"all.png"],[UIImage imageNamed:@"all.png"],nil]];
	se.selectedSegmentIndex = 0;
	se.frame = CGRectMake(10, 200, 300, 50);
	
	se.selectedColor = [UIColor yellowColor];
	se.unselectedColor = [UIColor clearColor];
	se.selectedTextColor = [UIColor colorWithRed:0.18 green:0.72 blue:0.94 alpha:1];
	se.unselectedTextColor = [UIColor whiteColor];
	
	[se addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];

	
	[self.window addSubview:se];
	[se release];
	
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)segmentedAction:(DDSegmentalControl *)se {
	NSLog(@"%s -- %@ : %d",_cmd,se,se.selectedSegmentIndex);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
