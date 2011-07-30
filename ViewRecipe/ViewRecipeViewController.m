//
//  ViewRecipeViewController.m
//  ViewRecipe
//
//  Created by jari on 7/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewRecipeViewController.h"
#import <QuartzCore/CoreAnimation.h>
@implementation ViewRecipeViewController
@synthesize recipeView;
@synthesize recipePicker;

static const CGFloat kWobbleRadians = 7.5;



- (void)dealloc
{
    [recipeView release];
    [recipePicker release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setup pickerViewDataSource
    recipes = [[NSMutableArray alloc] initWithObjects:@"nothing", @"makeCornerToRound", @"addShadow", @"pushView", @"rotate", nil];
    
    //setup pickerView
    [recipePicker selectRow:1 inComponent:0 animated:YES];
    recipePicker.delegate = self;
    
    //setup recipeView
    recipeViewImage = [UIImage imageNamed:@"jarinosuke.tron.png"];
    recipeSubLayer = [CALayer layer];
    recipeSubLayer.frame = CGRectMake(0, 0, recipeView.frame.size.width, recipeView.frame.size.height);
    recipeSubLayer.contents = (id)recipeViewImage.CGImage;
    recipeSubLayer.masksToBounds = YES;
    [recipeView.layer addSublayer:recipeSubLayer];
    
    return;
}


- (void)viewDidUnload
{
    [self setRecipeView:nil];
    [self setRecipePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)nothing {
    NSLog(@"nothing");
}

- (void)makeCornerToRound {
    NSLog(@"make corner to round");    
    recipeView.layer.cornerRadius = 10;
    recipeSubLayer.cornerRadius = 10;
}

- (void)addShadow {
    NSLog(@"add shadow");
    recipeView.layer.shadowOpacity = 0.4;
    recipeView.layer.shadowOffset = CGSizeMake(15.0, 15.0);
}

- (void)pushView {
    NSLog(@"push view");
    recipeView.layer.frame = CGRectMake(recipeView.layer.frame.origin.x + 5, recipeView.layer.frame.origin.y + 5, recipeView.frame.size.width, recipeView.frame.size.height);
    recipeView.layer.shadowOffset = CGSizeMake(5.0, 5.0);
}

- (void)rotate {
    NSLog(@"rotate");
    
    recipeView.transform = CGAffineTransformMakeRotation(0);
    [UIView animateWithDuration:0.5 animations:^{
        recipeView.transform = CGAffineTransformMakeRotation(2 * M_PI * 180.0 / 360.0 -0.000001);
        //-0.000001 is magic number to rotate right.
    }
                     completion:^(BOOL finised){
                        [UIView animateWithDuration:0.5 delay:0.5 options:nil animations:^{
                             recipeView.transform = CGAffineTransformMakeRotation(0);
                        } completion:^(BOOL finished){
                        }];
                     }];
}


///PickerViewDelegate///

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSString *recipeString = [recipes objectAtIndex:row];
    
    if ( [self respondsToSelector:NSSelectorFromString(recipeString)] ) {
        [self performSelector:NSSelectorFromString(recipeString)];
    }
    NSLog(@"%@ is selected", [recipes objectAtIndex:row]);
}

///PickerViewDataSource///
- (NSUInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSUInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [recipes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [recipes objectAtIndex:row];
}

@end
