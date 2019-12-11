//
//  AZPLaughImage.m
//  AZPComponent
//
//  Created by zipeng an  on 2019/12/11.
//  Copyright © 2019 zipeng an . All rights reserved.
//

#import "AZPLaughImage.h"
#import <UIKit/UIKit.h>
#define mainWindow [UIApplication sharedApplication].windows[0]

@interface AZPLaughImage ()
@property(nonatomic,strong)  UIImageView * laughImageView;
@end
@implementation AZPLaughImage{
  ;
}
+ (instancetype)share{
    static AZPLaughImage * instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AZPLaughImage alloc]init];
    });
    return instance;
}
- (void)startLaughImage:(NSString *)laughImage{
    if (!laughImage) {
        return;
    }
    _laughImageView = [[UIImageView alloc]initWithFrame:mainWindow.bounds];
    [_laughImageView setImage:[UIImage imageNamed:laughImage]];
    _laughImageView.alpha = 0;
    _laughImageView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1 animations:^{
         __strong typeof(weakSelf) strongSelf = weakSelf;
        [mainWindow addSubview:strongSelf.laughImageView];
        [mainWindow bringSubviewToFront:strongSelf.laughImageView];
        strongSelf.laughImageView.alpha = 1;
        strongSelf.laughImageView.transform = CGAffineTransformMakeScale(1 ,1);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf endLaughImage];
    });
}
- (void) endLaughImage{
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.5 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.laughImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
        strongSelf.laughImageView.alpha = 0;
    }completion:^(BOOL finished) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.laughImageView removeFromSuperview];
        strongSelf.laughImageView = nil;
    }];
}
@end
