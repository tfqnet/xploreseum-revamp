//
//  ViewController.h
//  xploreseum
//
//  Created by PETRONAS ICT SDN BHD on 05/11/2017.
//  Copyright © 2017 TfqNet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "icarousel.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>

@property (nonatomic) BOOL wrap;
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;
@property (nonatomic, strong) NSMutableArray *iCarouselItems;
@property (nonatomic, strong) NSMutableArray *iCarouselItemsLbl;

@end

