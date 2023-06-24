//
//  BlockTestViewController.m
//  Block演练
//
//  Created by PILIPALA on 2023/6/23.
//

#import "BlockTestViewController.h"
#import "NetworkTool.h"

@interface BlockTestViewController ()
@property (nonatomic,strong) NetworkTool *networkTool;
@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self demo3];
}

- (void)demo1 {
    self.networkTool = [[NetworkTool alloc] init];
    [self.networkTool loadData:^(NSString * str) {
        NSLog(@"%@ -- %@",str,self.view);
    }];
}

- (void)demo2 {
    NetworkTool *networkTool = [[NetworkTool alloc] init];
    [networkTool loadData:^(NSString * str) {
        NSLog(@"%@ -- %@",str,self.view);
    }];
}

- (void)demo3 {
    self.networkTool = [[NetworkTool alloc] init];
    //方式一
    //下面这行代码，返回按钮在任务没执行完的情况下被点击，控制器提前被回收，控制器的内存地址会被置为 nil。
    __weak typeof(self) weakSelf = self;
    //方式二：下面这行代码，返回按钮在任务没执行完的情况下被点击，控制器提前被回收，控制器内存地址不变。再次访问控制器会出现野指针的问题。
//    __unsafe_unretained typeof(self) weakSelf = self;
    [self.networkTool loadData:^(NSString * str) {
        //下面这行代码 __strong 是因为很多人这么写，大家形成了套路也跟着这么写，而没有做深究，仅此而已。实际上这么没啥作用，用__unsafe_unretained 修饰后再用 __strong 指向它，还是会出现野指针问题。用 __weak 修饰的控制器在返回按钮点击后，还是会在任务没执行完的情况下被释放。所以，              __strong typeof(self) strongSelf = weakSelf;这句代码实际上是个棒锤。
//        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"%@ -- %@",str,weakSelf.view);
    }];
}

- (void)dealloc {
    NSLog(@"控制器 88");
}

@end
