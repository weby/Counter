//
//  CNTAppDelegate.m
//  Counter
//
//  Created by Jeff Gilbert on 8/22/13.
//  Copyright (c) 2013 Mutual Mobile. All rights reserved.
//

#import "CNTAppDelegate.h"
#import "CNTCountInteractor.h"
#import "CNTCountPresenter.h"
#import "CNTCountViewController.h"
#import "CNTRouter.h"


@implementation CNTAppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self createScreen];

    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)createScreen
{
    // Wireframe - Module A
    CNTCountViewController* view = [[CNTCountViewController alloc] init];
	CNTCountPresenter* presenter = [[CNTCountPresenter alloc] init];
	CNTCountInteractor* interactor = [[CNTCountInteractor alloc] init];

    view.presenter = presenter;
    presenter.view = view;

    presenter.interactor = interactor;
    interactor.presenter = presenter;

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:view];
    presenter.router = [[CNTRouter alloc] initWithNavigationController:navigationController];

	self.window.rootViewController = navigationController;
}

@end
