//
//  ViewRecipeAppDelegate.h
//  ViewRecipe
//
//  Created by jari on 7/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewRecipeViewController;

@interface ViewRecipeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ViewRecipeViewController *viewController;

@end
