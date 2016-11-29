#block基础用法

### 1. block定义

```
    //第一个int，block的返回值，addBlock block名称，,后面的两个int是传入的参数
    int (^addBlock)(int, int) = ^(int num1, int num2){
        return  num1 + num2;
    };
    
    NSLog(@"相加值是:%d",addBlock(10,20));
    
    //先声明，再实现
    int (^mulBlock)(int, int);
    mulBlock =  ^(int num1, int num2){
        return num1 * num2;
    };
    
    NSLog(@"相乘值是:%d",mulBlock(2,5));
```
### 2. 修改局部变量

###需要用到 `__block` 参数修饰

```
    __block int num = 20;
    
    void (^changeNum)(void) = ^(void){
        num = 30;
    };
    NSLog(@"变化之前：%d",num);
    changeNum();
    NSLog(@"变化之后：%d",num);
```
### 3. block的调用
直接使用即可  `NSLog(@"相乘值是:%d",mulBlock(2,5));`

### 4. 使用，可以代替delegate,这个也是我一开始喜欢它的原因
具体可以项目内的代码，首先先设置

```
    __weak ViewController* wself = self;
    
    nextVC.getClickInfo = ^(NSInteger tag){
        
        __strong ViewController* sself = wself;
        
        sself.infoLabel.text = [NSString stringWithFormat:@"点击了第%ld个按钮",tag];
        return 1;
    };
```
其中 先设置`__weak`的原因是解决循环引用的问题, 内部 `__strong`是为了防止使用多线程的时候出错的.

<font color = green>在另一个 VC 先定义一个属性</font> `@property(nonatomic, copy) int(^getClickInfo)(NSInteger);`


```
        int (^TempBlock)(NSInteger);
        TempBlock = self.getClickInfo;
        
        if (TempBlock) {
            if(TempBlock(btn.tag))
            {
                NSLog(@"设置成功");
            }
        }
```

其中设置 `TempBlock ` 也是防止多线程的时候被提前释放的问题.