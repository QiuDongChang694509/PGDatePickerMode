//
//  ViewController.m
//  PGDatePickerMode
//
//  Created by qdc on 2018/5/17.
//  Copyright © 2018年 qdc. All rights reserved.
//https://blog.csdn.net/zzqiudc/article/details/80348421
//

#import "PGDatePickManager.h"
#import "ViewController.h"

@interface ViewController ()<PGDatePickerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *AddBut= [[UIButton alloc]init];
    AddBut.frame =CGRectMake(0, 100, 200,50);
    AddBut.backgroundColor = [UIColor redColor];
    [self.view addSubview:AddBut];
    [AddBut addTarget:self action:@selector(TimeButAction) forControlEvents:UIControlEventTouchUpInside];
    
//    。。。。。。。测试
    
}

- (void)TimeButAction
{
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.delegate = self;
    datePicker.datePickerMode = PGDatePickerModeDateAndTime;
    [self presentViewController:datePickManager animated:false completion:nil];
    
    NSLog(@"日期");
}

#pragma mark -选择完时间回调
- (void)datePicker:(PGDatePicker *)datePicker didSelectDate:(NSDateComponents *)dateComponents {
    NSLog(@"dateComponents =【 %@】", dateComponents);
    NSDateComponents * Components =[[NSDateComponents alloc]init];
    Components =dateComponents;
    if (Components.month <10) {
        if (Components.day <10) {
//            self.ProductModel.text =[NSString stringWithFormat:@"%ld-0%ld-0%ld",(long)Components.year,(long)Components.month,(long)Components.day];
        }else
        {
//            self.ProductModel.text =[NSString stringWithFormat:@"%ld-0%ld-%ld",(long)Components.year,(long)Components.month,(long)Components.day];
        }
    }else
    {
        if (Components.day <10) {
//            self.ProductModel.text =[NSString stringWithFormat:@"%ld-%ld-0%ld",(long)Components.year,(long)Components.month,(long)Components.day];
        }else
        {
//            self.ProductModel.text =[NSString stringWithFormat:@"%ld-%ld-%ld",(long)Components.year,(long)Components.month,(long)Components.day];
        }
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
