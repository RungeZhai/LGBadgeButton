# LGBadgeButton
A UIButton subclass with a ribbon and text on the top-right.


###Demo
<img src="https://cloud.githubusercontent.com/assets/3366713/9813741/cf028d1a-58ba-11e5-988c-60065de1c3a2.png" width=203 />

###Usage
Just include the following two files and you are good to go. 

`LGBadgeButton.h`

`LGBadgeButton.m`

Ther are 4 properties you can set:

```objective-c
@property (nonatomic, copy) IBInspectable NSString *badgeText;
@property (nonatomic, strong) IBInspectable UIFont *badgeTextFont;
@property (nonatomic, strong) IBInspectable UIColor *badgeTextColor;
@property (nonatomic, strong) IBInspectable UIColor *badgeBackgroundColor;
```
The meaning of the properties above is pretty much as the names imply.
As you can see from the code, those properties are interface builder inspectable, you can configure the properties in the xib or storyboard, except that unfortunately, UIFont is not supported by interface builder by now.
The last 3 properties have default value if they are not set. `badgeTextFont` is system default font with an auto-adjusted size according to the ribbon height. And `badgeTextColor` is whiteColor by default. `badgeBackgroundColor` is (r:240, g:110, b:100) by default.

###Under The Hood
The ribbon is a CAShapeLayer and the Text is in a CATextLayer.

About the coordinate calculating, please refer to the draft below. The ribbon height is 1/2 height of the button. 

<img src="https://cloud.githubusercontent.com/assets/3366713/9813738/cd80b46c-58ba-11e5-9b80-a7a8b62ae994.png" width=602 />
