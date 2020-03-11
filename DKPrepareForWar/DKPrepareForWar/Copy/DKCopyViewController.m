//
//  DKCopyViewController.m
//  DKPrepareForWar
//
//  Created by demoker on 2020/3/9.
//  Copyright © 2020 m.demoker. All rights reserved.
//

#import "DKCopyViewController.h"

@interface DKCopyViewController ()
@property (copy, nonatomic) NSString * originName;
@end

@implementation DKCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * string1 = @"string1";
    NSString * string1_copy = [string1 copy];//只是指针的拷贝
    NSString * string1_mutable = [string1 mutableCopy];//产生了新的对象，新的指针和对象
    string1 = @"11111";
    string1_mutable = @"3333";
    
    NSLog(@"string1.指向 = %p, .text = %@, .指针地址 = %p",string1,string1,&string1);
    NSLog(@"string1_copy.指向 = %p, .text = %@, .指针地址 = %p",string1_copy,string1_copy,&string1_copy);
    NSLog(@"string1_mutable.指向 = %p, .text = %@, .指针地址 = %p",string1_mutable,string1_mutable,&string1_mutable);
    
    NSMutableString * string2 = [NSMutableString stringWithString:@"string2"];
    NSMutableString * string2_copy = [string2 copy];
    NSMutableString * string2_mutable = [string2 mutableCopy];
    
    NSLog(@"string2.指向 = %p, .text = %@, .指针地址 = %p",string2,string2,&string2);
    NSLog(@"string2_copy.指向 = %p, .text = %@, .指针地址 = %p",string2_copy,string2_copy,&string2_copy);
    NSLog(@"string2_mutable.指向 = %p, .text = %@, .指针地址 = %p",string2_mutable,string2_mutable,&string2_mutable);
    
    NSString * string0 = @"string0";
    NSArray * array1 = @[string0,string1,string2];
    NSArray * array1_copy = [array1 copy];//浅拷贝 指针的拷贝
    NSArray * array1_mutable = [array1 mutableCopy];//深拷贝，对象拷贝 但是只会拷贝一层，数组内对象不会进行拷贝
    NSArray * array1_fullCopy = [[NSArray alloc] initWithArray:array1 copyItems:YES];//完全拷贝，如果数组中的对象是不可变的对象，那么执行copyItems:YES之后数组n内的对象依然是之前的对象，但如果数组中的对象是可变对象，那么会产生一份新的对象，从此可以看出copyItems:YES是针对数组内的元素进行了copy操作并非mutabCopy.
    string0 = @"stringxxx";
    string2 = [NSMutableString stringWithString:@"22222"];

    
    NSLog(@"array1 = %@\n,array1.指向 = %p,array1.指针地址 = %p\n",array1,array1,&array1);
    NSLog(@"array1_copy = %@\n,array1_copy.指向 = %p,array1_copy.指针地址 = %p\n",array1_copy,array1_copy,&array1_copy);
    NSLog(@"array1_mutable = %@\n,array1_mutable.指向 = %p,array1_mutable.指针地址 = %p\n",array1_mutable,array1_mutable,&array1_mutable);
    NSLog(@"array1_fullCopy = %@\n,array1_fullCopy.指向 = %p,array1_fullCopy.指针地址 = %p\n",array1_fullCopy,array1_fullCopy,&array1_fullCopy);
    
    for(NSString * string in array1){
        
        NSLog(@"array1->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    for(NSString * string in array1_copy){
        NSLog(@"array1_copy->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    for(NSString * string in array1_mutable){
        NSLog(@"array1_mutable->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    for(NSString * string in array1_fullCopy){
        NSLog(@"array1_fullCopy->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    NSLog(@"--------------mutableArray copyItems--------------");
    NSMutableArray * mutableArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSMutableArray * mutableArray2 = [NSMutableArray arrayWithObjects:[NSMutableString stringWithString:@"1"],[NSMutableString stringWithString:@"2"],[NSMutableString stringWithString:@"3"], nil];
    
    for(NSString * string in mutableArray){
        NSLog(@"mutableArray->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    for(NSString * string in mutableArray2){
        NSLog(@"mutableArray2->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    NSArray * arrayContainer1 = @[mutableArray];
    NSArray * arrayContainer1_copy = [[NSMutableArray alloc] initWithArray:arrayContainer1 copyItems:YES];
    
    for(NSString * string in arrayContainer1_copy[0]){
        NSLog(@"arrayContainer1_copy[0]->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    NSArray * arrayContainer2 = @[mutableArray2];
    NSArray * arrayContainer2_copy = [[NSMutableArray alloc] initWithArray:arrayContainer2 copyItems:YES];

    for(NSString * string in arrayContainer2_copy[0]){
        NSLog(@"arrayContainer2_copy[0]->string.指向 = %p, .text = %@, .指针地址 = %p",string,string,&string);
    }
    
    NSLog(@"------------测试----------");
//    NSMutableArray * a1 = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
//    NSMutableArray * a2 = [NSMutableArray arrayWithObjects:@"ma",@"dong",@"kai",a1, nil];
//    NSMutableArray * a3 = [[NSMutableArray alloc]initWithArray:a2 copyItems:YES];
//    a2[3][0] = @"haha";
//    NSLog(@"a2 = %@",a2);
//    NSLog(@"a3 = %@",a3);
    
    
    NSMutableArray * a1 = [NSMutableArray arrayWithObjects: [NSMutableString stringWithString:@"1"],@"2",@"3", nil];
    NSMutableArray * a11 = [a1 copy];
    NSMutableArray * a2 = [NSMutableArray arrayWithObjects:@"ma",@"dong",@"kai",a1, nil];
//    NSMutableArray * a3 = [[NSMutableArray alloc]initWithArray:a2 copyItems:YES]; //测试copyItems功能 需要打开这行注释
    
    NSLog(@"=====%@",[NSKeyedArchiver archivedDataWithRootObject:a2 requiringSecureCoding:YES error:nil]);
    NSMutableArray * a3 = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:a2]]];

    NSMutableString * s = a2[3][0];
    [s appendString:@"-haha"];
    a2[3][0] = @"haha";

    a2[3][1] = @"222";
    NSLog(@"a1 = %@",a1);
    NSLog(@"a11 = %@",a11);
    NSLog(@"a2 = %@",a2);
    NSLog(@"a3 = %@",a3);
    
    //关于copyItem:YES的总结如下：
    //a11只是指针的copy，即a11也是指向原内存地址；a2是引用了a1
    //copyItems:YES只会进行一次拷贝，也就是对数组a1的拷贝（即产生了一个新的指针xx指向了原地址），然后a1指针在更改指向之后,xx还是会继续指向原地址。
    //如果想要实现多次深拷贝的话，那么需要用到归档和解档，
    
    
    [NSNotificationCenter add]
    
    [NSNotificationCenter addObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(nullable void *)#>]
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
