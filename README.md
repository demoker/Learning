# Learning
demoker‘s Learning

1.书籍：eoc、iOS7编程实战、
2.jsContent
3.runtime
4.hybrid 动态app  WaxPatch、jsPath
5.软件：postman、sourcetree、office2016、有道、火狐浏览器、sip、新浪微博、微信
6.const、static


读书笔记：
1.如果想知道一个class的接口细节，那么就需要添加这个class的头文件，否则@class；引入头文件编译时间相对@class长一些；
2.对于协议最好单独放在一个头文件中，不然，如果将某一个协议放在一个大的头文件中，只要引入此协议，就会引入那个头文件中的全部内容，会产生相互依赖问题，还会增加编译时间；对于委托协议（delegate protocol）则不用；
3.若要实现属性、实例变量或者遵循协议而必须引入头文件，则最好将其移入类别中
4.多用字面量语法，譬如：NSNumber * number = @1;少用与之等价的方法;
5.
NSArray * arrayA = [NSArray arrayWithObjects:object1,object2,object3,nil];
NSArray * arrayB = @[object1,object2,object3];
对于上面的两种数组初始化方式，如果出现objec2位nil，会出现什么情况呢？第一种会抛出异常，第二种虽然可以创建成功，但是其中只会包含一个对象object1，因为arrayWithObjects这个方法遇到nil就会提前结束，相对于第一种bug，第二个更容易发现一些；
6.字面量语法的对象是属于foundation框架的，如果我们基于NSArray自定义对象，则不能通过字面量语法创建对象，这也是字面量语法的局限性；
7.多用类型常量，少用＃define预处理命令,因为预处理指令是完全的替换，static const NSTimeInterval kAnimationDuration ＝ 0.3;
8.static 修饰符表示改变量仅在定义变量的编译单元（.m）中可见，如果不加static，同时另一个编译单元也声明了同名变量就会抛出一条错误信息；用extern来声明全局常量，并应在.m文件中定义其值。
