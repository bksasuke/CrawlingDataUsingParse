//
//  ViewController.m
//  CGVAPP
//
//  Created by Nguyen Van Thanh on 12/7/15.
//  Copyright © 2015 DangDingCan. All rights reserved.
//

#import "ViewController.h"
#import "TFHpple.h"
#import "PhimObj.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *arr_data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHTML];
    NSLog(@"%@",self.arr_data);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadHTML{
    self.arr_data = [NSMutableArray new];
    NSURL *tutorialURL =  [NSURL URLWithString:@"https://www.cgv.vn/vn/movies/now-showing.html"];
    NSData *data = [NSData dataWithContentsOfURL:tutorialURL];
    TFHpple * tutorialPaser = [TFHpple hppleWithHTMLData:data];
  
    NSString * tutorialQueryString = @"//div[@class='category-products']/ul/li";
    NSArray *nodes = [tutorialPaser searchWithXPathQuery:tutorialQueryString];
    for (TFHppleElement * element in nodes) {
        TFHppleElement * element1 = [element firstChildWithClassName:@"product-poster"];
          TFHppleElement * element2 = [element1 firstChildWithTagName:@"a"];
        TFHppleElement *element3 = element2.children[1];
        NSString *linkDetail = [element2 objectForKey:@"href"];
        NSString *linkimage = [element3 objectForKey:@"src"];
        PhimObj *phim = [[PhimObj alloc] initWithName:nil andCate:nil andDuration:nil date:nil linkDetail:linkDetail imageUrl:linkimage];
        [self.arr_data addObject:phim];
        
       
   
        
        
    }
    

    
}

@end
