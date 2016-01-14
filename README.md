#谈StoryBoard上AutoLayout的约束动画
[![Support](https://img.shields.io/badge/support-iOS%207%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)]()
[![GitHub release](https://img.shields.io/github/release/qubyte/rubidium.svg)]()
[![Github All Releases](https://img.shields.io/badge/download-6M Total-green.svg)](https://github.com/minggo620/iOSConstraintAnimation/archive/master.zip)

##Sense：
以前写iOS的view动画，都在代码上直接实现，如放大缩小、转移、旋转等等。现在使用了`Storyboard`布局后，多是对`IUView`进行`AutoLayout`的约束，然而再在代码中对`UIView`的frame进行改修实现动画显得累赘还可能因为约束被破坏引发不可预知的布局错乱。

那么，我们可以利用AutoLayout的约束对UIView做相应的动画处理，可以满足我下我们app的简单需求。

**1.先看一下需求图**  
 ![](https://github.com/minggo620/iOSConstraintAnimation/blob/master/picture/picture1.png?raw=true)  
**2.图上的需求点如下**  
  + 用户头像的颜色条从头像边缘延伸.  
  + 用户的昵称在颜色调延伸之后渐变出现。  

##Think:
这里特别提一下，Android开发当中有一种相对布局平移动画，如果是相对父控件X或Y轴的负数开始平移到正数，这个移动的View是从父控件的边沿滑出，也就是说负数部分是一直隐藏的，无论这个负数有多小。而iOS的AutoLayout的相对约束尽管为负数，只要是在相对控件图层的排列上方都是不被隐藏的，就算是在相对控件图层的下方也只能被相对控件遮挡一部分大小。

因此，约束动画显得更加必要了。

1. 设置颜色条距离右边的底色背景view的约束。
2. 在`viewDidLoad`方法后执行约束变更。
3. 约束动画完成后再回调的block中实现昵称渐变显示。  

##Step Process：  

1. 布局页面在Xcode中拉上外边距约束。  
![](https://github.com/minggo620/iOSConstraintAnimation/blob/master/picture/picture2.png?raw=true)   
2. 代码中初始化3条颜色条的位置关系。
	
    	-(void)initUI{
 
			self.view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.8];
    
    		self.prograss1MarginRight.constant = self.prograss1Iv.frame.size.width*2-10;
    		self.prograss2MarginRight.constant = self.prograss2Iv.frame.size.width*2-10;
    		self.prograss3MarginRight.constant = self.prograss3Iv.frame.size.width*2-10;
    
    		self.userName1Lb.alpha = 0;
    		self.userName2Lb.alpha = 0;
    		self.userName3Lb.alpha = 0;
    		self.dayTextLb.layer.cornerRadius = 7;
    		self.dayTextLb.layer.masksToBounds = YES;
    		self.wordTextLb.layer.cornerRadius = 7;
    		self.wordTextLb.layer.masksToBounds = YES;
    	}  
3. 在`viewDidAppear`调用动画，注意要在viewDidLoad之后调用。    

![](https://github.com/minggo620/iOSConstraintAnimation/blob/master/picture/picture3.png?raw=true)    

4. 最终实现的效果图如下：  
![](https://github.com/minggo620/iOSConstraintAnimation/blob/master/picture/constraintAnimation.gif?raw=true) 

##Demo代码地址:  
###*[https://github.com/minggo620/iOSConstraintAnimation.git](https://github.com/minggo620/iOSConstraintAnimation.git)*