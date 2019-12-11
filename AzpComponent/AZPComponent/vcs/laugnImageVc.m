//
//  laugnImageVc.m
//  AZPComponent
//
//  Created by zipeng an  on 2019/12/11.
//  Copyright © 2019 zipeng an . All rights reserved.
//

#import "laugnImageVc.h"
#import "AZPLaughImage.h"
@interface laugnImageVc ()

@end

@implementation laugnImageVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    AZPLaughImage *image = [AZPLaughImage share];
    [image startLaughImage:@"laughImage"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
