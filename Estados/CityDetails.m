//
//  CityDetails.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "CityDetails.h"

@interface CityDetails ()

@end

@implementation CityDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblCityName.text = self.CityName;
    self.lblCityDetails.text = self.CityDetails;
    self.imgCityDetails.image = [UIImage imageNamed:self.CityPhoto];
}
    
    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
