//
//  CTMediator+CTMediatorModuleAActions.m
//  CTMediator
//
//  Created by casa on 16/3/13.
//  Copyright © 2016年 casa. All rights reserved.
//

#import "CTMediator+CTMediatorModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionNativFetchDetailViewController = @"nativeFetchDetailViewController";
NSString * const kCTMediatorActionNativePresentImage = @"nativePresentImage";
NSString * const kCTMediatorActionNativeNoImage = @"nativeNoImage";
NSString * const kCTMediatorActionShowAlert = @"showAlert";

@implementation CTMediator (CTMediatorModuleAActions)

- (UIViewController *)CTMediator_viewControllerForDetail
{
//2:通过定义好的参数调用CTMediator，由于CTMediator+CTMediatorModuleAActions是CTMediator的扩展，所以可以直接使用self来调用CTMediator的实现
    UIViewController *viewController = [self performTarget:kCTMediatorTargetA
                                                    action:kCTMediatorActionNativFetchDetailViewController
                                                    params:@{@"key":@"value"}];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
//8: CTMediator+CTMediatorModuleAActions.m会将步骤7返回的实例当作UIViewController处理，接下来会在运行时判断这个实例的类型是不是UIViewController(是不是UIViewController的子类)。然后将得到的UIViewController交给调用者ViewController.m(由ViewController.m负责以何种方式进行展示)。
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)CTMediator_presentImage:(UIImage *)image
{
    if (image) {
        [self performTarget:kCTMediatorTargetA
                     action:kCTMediatorActionNativePresentImage
                     params:@{@"image":image}];
    } else {
        // 这里处理image为nil的场景，如何处理取决于产品
        [self performTarget:kCTMediatorTargetA
                     action:kCTMediatorActionNativeNoImage
                     params:@{@"image":[UIImage imageNamed:@"noImage"]}];
    }
}

- (void)CTMediator_showAlertWithMessage:(NSString *)message cancelAction:(void(^)(NSDictionary *info))cancelAction confirmAction:(void(^)(NSDictionary *info))confirmAction
{
    NSMutableDictionary *paramsToSend = [[NSMutableDictionary alloc] init];
    if (message) {
        paramsToSend[@"message"] = message;
    }
    if (cancelAction) {
        paramsToSend[@"cancelAction"] = cancelAction;
    }
    if (confirmAction) {
        paramsToSend[@"confirmAction"] = confirmAction;
    }
    [self performTarget:kCTMediatorTargetA
                 action:kCTMediatorActionShowAlert
                 params:paramsToSend];
}

@end
