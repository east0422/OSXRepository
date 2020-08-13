# OSXTest
	OSX系统测试代码笔记，抽取出来的只是部分，更多的则以注释的形式保留在代码中，时间充裕的话可以对照注释阅读源码。
	
#### basic
1. SignedByte类型-128～127，超出范围值循环(eg:127+1=-128)。
2. 对于浮点数需要保留指定格式数据，可使用NSNumberFormatter进行格式化。
3. 数组指针加1(&arr + 1)偏移整个数组指向最后一个数组元素的下一个元素地址，数组变量名加1(arr + 1)偏移一个元素指向第二个元素(eg:定义数组a[5]则&a+1指向a[6]元素，a+1指向a[1]元素)。
4. copy对于原始为不可变的相当于浅复制(copy出来的对象和原始对象地址一致)，对于原始为可变的相当于深复制(copy出来的对象和原始对象地址不一致，防止原始更改影响copy出来的对象值)。mutableCopy对于原始无论是可变还是不可变都相当于深复制(mutableCopy出来的对象和原始对象地址都会不一致，而且mutableCopy对象是可变的)。

#### property
1. 声明是immutable不可变类型使用copy，防止初始化给其赋值mutStr是mutable可变类型(strong和mutStr指向同一个地址，会随mutStr的更改而更改)。
2. 声明是mutable可变类型使用strong，mutable修改值本身地址不会改变，使用copy的话再调用类似appendString:方法会奔溃(实际是不可变类型时copy和strong都不能使用类似appendString:, 实际是可变时strong使用奔溃copy可使用)。

#### protocolandcategory
1. 调用协议方法通常先使用respondsToSelector:判断是否有实现对应协议方法然后再调用协议方法。
2. 定义id<MyProtocol> test = [MyTest new];然后使用test调用MyTest方法在编译时不能通过会报错找不到对应方法，而直接声明id test则可以。
3. 若想调用类的私有方法，除了使用runtime还可以使用分类前向引用(定义一个分类，在分类头文件中定义相同的方法而不实现，在使用时引入分类头文件即可)。
4. 协议中@required标记的属性在实现类中若没有对这个属性做任何实现则实现类中会报警告。

#### thread
1. gcd创建一个并行队列嵌套同步操作和非嵌套同步操作实际上都是按顺序一个一个执行。

#### load
1. 当类对象被引入项目时(.m文件加入到Compile Sources中)无论工程项目中是否有使用到该类对象，runtime都会在main函数之前向每个类对象发送一次load消息。load方法会在每个类甚至分类被引入时仅调用一次，调用的顺序：父类优先于子类，子类优先于分类(父类>子类>父类分类>子类分类)。load方法不会被类自动继承，也不会被覆盖，所有的load方法都会被执行。 



