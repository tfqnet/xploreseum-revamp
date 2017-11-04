//
//  ViewController.m
//  xploreseum
//
//  Created by PETRONAS ICT SDN BHD on 05/11/2017.
//  Copyright © 2017 TfqNet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _iCarouselItems = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"img1.jpg", @"img2.jpg", @"img3.jpg", @"img4.jpg", @"img5.jpg", @"img6.jpg", nil]];
    _iCarouselItemsLbl = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"Gambar pertama",@"Gambar kedua",@"Gambar ketiga",@"Gambar keempat",@"gambar Kelima", @"gambar keenam", nil]];
    
    _carouselView.delegate = self;
    _carouselView.dataSource = self;
    //[_carouselView reloadData];
    _carouselView.type = iCarouselTypeRotary;
    
    _carouselView.centerItemWhenSelected = YES;
    
    
    NSLog(@"icarousel %lu",(unsigned long)[_iCarouselItems count]);
    NSLog(@"carouselitem %@",_iCarouselItems[0]);
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [_carouselView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - iCarousel data

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return [_iCarouselItems count];
    
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    NSLog(@"item %@",_iCarouselItems[index]);
    CGRect rect = [_carouselView bounds];
    
    CGFloat contentHeight = rect.size.height/5;
    CGFloat contentWidth = rect.size.width/4;
    
    CGFloat sizeWidth = contentWidth*3;
    CGFloat sizeHeight = contentHeight*4;
    
    
    UIImageView *imgView;
    UILabel *lbl;
    
    if(view==nil){
        view = [[UIView alloc] initWithFrame:CGRectMake(_carouselView.frame.size.width/2-sizeWidth/2, _carouselView.frame.size.height/2-sizeHeight/2, contentWidth*3, contentHeight*4)];
        view.contentMode = UIViewContentModeCenter;
        view.backgroundColor = [UIColor grayColor];
        
        imgView = [[UIImageView alloc] initWithFrame:view.bounds];
        
        
        
        imgView.tag = 1;
        [view addSubview:imgView];
        
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, contentHeight*3, view.frame.size.width, contentHeight)];
        lbl.textColor = [UIColor whiteColor];
        lbl.font = [UIFont systemFontOfSize:25];
        //lbl.backgroundColor = [UIColor greenColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.tag = 2;
        [view addSubview:lbl];
        
    }
    else{
        
        imgView = (UIImageView *)[view viewWithTag:1];
        lbl = (UILabel *)[view viewWithTag:2];
    }
    
    
    [imgView setImage:[UIImage imageNamed:_iCarouselItems[index]]];
    [lbl setText:_iCarouselItemsLbl[index]];
    
   
    
    return view;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if(option == iCarouselOptionSpacing)
    {
        return value*1.1;
    }
    return value;
        
}

@end
