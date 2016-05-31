//
//  CityDetails.h
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityDetails : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgCityDetails;
@property (strong, nonatomic) IBOutlet UILabel *lblCityName;
@property (strong, nonatomic) IBOutlet UILabel *lblCityDetails;

@property NSString *CityName;
@property NSString *CityDetails;
@property NSString *CityPhoto;



@end
