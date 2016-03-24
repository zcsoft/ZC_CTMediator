//
//  CTMediator+CTMediatorModuleAActions.h
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator.h"
#import <UIKit/UIKit.h>

@interface CTMediator (CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail;
- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction;
- (void)CTMediator_presentImage:(UIImage *)image;

@end

