//
//  ViewRecipeViewController.h
//  ViewRecipe
//
//  Created by jari on 7/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewRecipeViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>{
    UIView *recipeView;
    UIImage *recipeViewImage;
    CALayer *recipeSubLayer;
    
    UIPickerView *recipePicker;
    NSMutableArray *recipes;
}
@property (nonatomic, retain) IBOutlet UIView *recipeView;
@property (nonatomic, retain) IBOutlet UIPickerView *recipePicker;

@end
