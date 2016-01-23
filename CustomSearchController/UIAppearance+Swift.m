//
//  UIAppearance+Swift.m
//  CustomSearchController
//
//  Created by burt on 2016. 1. 23..
//  Copyright © 2016년 Pandodroid. All rights reserved.
//

#import "UIAppearance+Swift.h"

@implementation UIView (UIViewAppearance_Swift)
+ (instancetype)my_appearanceWhenContainedIn:(Class<UIAppearanceContainer>)containerClass {
    return [self appearanceWhenContainedIn:containerClass, nil];
}
@end
