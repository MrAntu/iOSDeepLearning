# OC对象的本质
// 没有指定架构，生成支持所有平台的代码，代码量比较大
```swift
clang -rewrite-objc main.m -o  main.cpp
```
//指定平台 （i386: 模拟器 arm64 arm32）
```swift
xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o  main.cpp
```

#### 1.一个oc对象占用多少个字节

```swift
  NSObject *obj = [[NSObject alloc] init];
```

* NSObject在OC里面的对象定义

```swift
@interface NSObject <NSObject> {
    Class isa;
}
```
* 转成c++的定义

```swift
struct NSObject_IMPL {
    Class isa;
};
```
* Class的定义

```swift
typedef struct objc_class *Class;
```

* 如何通过代码获取一个实例对象的内存大小

```SWIFT
        NSObject *obj = [[NSObject alloc] init];
        // 或者一个实例对象的内存大小， 返回成员变量所占用的大小  （64位机器为8个字节，32位为4个字节）
        NSLog(@"%zd", class_getInstanceSize([NSObject class])); // 8个字节
        
       // 获得obj指针所指向内存的大小
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj))); // 16个字节

```
**alloc实际分配的大小为16个字节，真正利用的是8个字节**

allocWithZone最后实现源码
```swift
// 至少分配16个字节
size_t instanceSize(size_t extraBytes) {
        size_t size = alignedInstanceSize() + extraBytes;
        // CF requires all objects be at least 16 bytes.
        if (size < 16) size = 16;
        return size;
    }
```

#### 2.Sudent对象占用多少字节

```swift
@interface Student : NSObject {
    @public
    int _no;
    int _age;
}
```
最后转成c++结构体为：
```SWIFT
 struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
    Class isa;  // 8个字节
    int _no; // 4个字节
    int _age; // 4个字节
};
```

执行如下结果：
```SWIFT
    Student *stu = [[Student alloc] init];
    stu->_age = 10;
    stu->_no = 11;
    NSLog(@"%zd", class_getInstanceSize([Student class])); // 16
    NSLog(@"%zd", malloc_size((__bridge const void *)(stu))); // 16
        
    struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)(stu);
    NSLog(@"no- %d, age - %d", stuImpl->_no, stuImpl->_age); // no- 11, age - 10
```

#### 3.多重继承内存计算

```SWIFT
@interface Person : NSObject {
    @public
    int _age;
}
@end
@interface Student  : Person {
    @public
    int _no;
}
@end
```
转化后:
```swift
struct NSObject_IMPL {
    Class isa;  // 8个字节
};

// Person_IMPL  16个字节
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS; // 8个字节
    int _age; //4个字节
}; // 内存对齐： 结构体的大小必须是最大成员的大小的倍数
// 还能从alloc源码分析，得出一个对象分配的最小单位为16字节


// Student_IMPL 16个字节
struct Student_IMPL {
    struct Person_IMPL Person_IVARS;  // 16字节
    int _no; // 4个字节
}; // 错误以为32个字节
```
执行下述代码:
```swift
    Student *stu = [[Student alloc] init];
    NSLog(@"%zd", class_getInstanceSize([Student class])); // 16
    NSLog(@"%zd", malloc_size((__bridge const void *)(stu))); // 16
   
    Person *per = [[Person alloc] init];
    NSLog(@"%zd", class_getInstanceSize([Person class])); // 16
    NSLog(@"%zd", malloc_size((__bridge const void *)(per))); // 16
```
理解: 上述继承关系，伪代码可转化成下述结构体, 最后为16个字节... 
```SWIFT
struct Student_IMPL_1 {
    Class isa;  // 8个字节
    int _age; //4个字节
    int _no; // 4个字节
};
```
**根本原因是：内存会存在对齐。**

#### 带有属性的对象内存计算

```SWIFT
@interface Person : NSObject {
    @public
    int _age;
//    int _height; //自动生成
}

@property(nonatomic, assign) int height;  // 自动生成_height成员变量，setter，getter属性
@end
```
转成c++：
```swift
struct Person_IMPL {
//    struct NSObject_IMPL NSObject_IVARS;
    Class isa; // 8字节
    int _age; // 4
    int _height; // 4
}; // 共16个字节

// 方法不放在实例对象的结构体中，因为方法都是固定，所有实例对象保存一份方法的内存地址就行
```
打印内存地址：
```SWIFT
    Person *per = [[Person alloc] init];
    NSLog(@"%zd", class_getInstanceSize([Person class])); // 16
    NSLog(@"%zd", malloc_size((__bridge const void *)(per))); // 16
```