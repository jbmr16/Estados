//
//  City.h
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellcity.h"    
#import "CityDetails.h"

@interface City : UIViewController
@property NSString *stateTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;




@end
