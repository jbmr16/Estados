//
//  Sina.m
//  Estados
//
//  Created by System Administrator on 5/30/16.
//  Copyright (c) 2016 maciel. All rights reserved.
//

#import "Sina.h"

@interface Sina ()
@property NSMutableArray *cityTitles;
@property NSMutableArray *cityPhotos;
@property NSMutableArray *cityDetails;


@property NSString *cityTitleSelected;
@property NSString *cityPhotoSelected;
@property NSString *cityDetailsSelected;

@end

@implementation Sina

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
       [self initController];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initController {
    
    self.cityTitles   = [[NSMutableArray alloc] initWithObjects: @"Culiacan", @"Guamuchil", @"Guasave", @"Los Mochis",@"Mazatlan",nil];
    
    self.cityDetails   = [[NSMutableArray alloc] initWithObjects: @"Culiacán, oficialmente Culiacán Rosales, es una ciudad del noroeste de México, capital y ciudad más grande del Estado de Sinaloa y del Municipio de Culiacán.", @"Guamúchil es una ciudad del estado de Sinaloa, México y es la quinta ciudad más grande de la entidad. Igualmente, es la cabecera del municipio de Salvador", @"Guasave es una ciudad del estado mexicano de Sinaloa; es la cuarta en orden de importancia en el estado y cabecera del municipio del mismo nombre.", @"Los Mochis (del cáhita: mochim, pl. de mochic, 'tortuga de tierra') es una ciudad del noroeste de México, ubicada en el estado de Sinaloa, es la tercera en orden",@"Disfruta del sol, la playa y los bellos paisajes que ofrece este tradicional puerto, ubicado al sur del estado de Sinaloa. Aquí podrás tanto relajarte, como disfrutar.",nil];
    
    
    self.cityPhotos   = [[NSMutableArray alloc] initWithObjects: @"cul.jpg", @"guam.jpg", @"guas.jpg", @"lmch.jpg",@"maz.jpg",nil];
    
    
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cityTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    Sinacell *cell = (Sinacell *)[tableView dequeueReusableCellWithIdentifier:@"Sinacell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"Sinacell" bundle:nil] forCellReuseIdentifier:@"Sinacell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"Sinacell"];
    }
    //Fill cell with info from arrays
    cell.lblcity.text = self.cityTitles[indexPath.row];
    
    cell.imgcity.image =[UIImage imageNamed:self.cityPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cityTitleSelected = self.cityTitles[indexPath.row];
    self.cityDetailsSelected = self.cityDetails[indexPath.row];
    self.cityPhotoSelected = self.cityPhotos[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"SinaDetails" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[CityDetails class]]) {
        CityDetails *destination     = [segue destinationViewController];
        destination.CityName        = self.cityTitleSelected;
        destination.CityPhoto        = self.cityPhotoSelected;
        destination.CityDetails = self.cityDetailsSelected;
    }
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
