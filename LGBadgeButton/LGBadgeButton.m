//
//  LGBadgeButton.m
//  LGBadgeButtonDemo
//
//  Created by liuge on 9/11/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import "LGBadgeButton.h"
#import <CoreText/CoreText.h>

@interface LGBadgeButton ()

@property (weak, nonatomic) CAShapeLayer *badgeLayer;

@property (weak, nonatomic) CATextLayer *textLayer;

@end

@implementation LGBadgeButton

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _badgeText = NSLocalizedString(_badgeText, nil);
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGSize size = self.bounds.size;
    CGPoint center = (CGPoint){size.width - .25 * size.height, .25 * size.height};
    
    CGFloat height = sqrt(2) * size.height / 4;
    CGFloat tweak = height * .1;// Make ribbon a little wider
    CGFloat width = height * 3 + tweak * 2;
    
    
    UIFont *font = _badgeTextFont ?: [UIFont systemFontOfSize:ceil(height * .6)];
    
    CGSize textSize = [self sizeOfText:_badgeText font:font];
    
    if (!_badgeLayer) {
        CAShapeLayer *badgeLayer = [CAShapeLayer layer];
        _badgeLayer = badgeLayer;
        [self.layer addSublayer:badgeLayer];
        
        CATextLayer *textLayer = [CATextLayer layer];
        _textLayer = textLayer;
        // http://stackoverflow.com/questions/3815443/how-to-get-text-in-a-catextlayer-to-be-clear
        textLayer.contentsScale = [UIScreen mainScreen].scale;
        textLayer.alignmentMode = kCAAlignmentCenter;
        textLayer.backgroundColor = [UIColor clearColor].CGColor;
        [badgeLayer addSublayer:textLayer];
    } else {
        _badgeLayer.transform = CATransform3DIdentity;
    }
    
    // 1. Config TextLayer
    _textLayer.font = (__bridge CFTypeRef)([font fontName]);
    _textLayer.fontSize = [font pointSize];
    _textLayer.string = _badgeText;
    _textLayer.foregroundColor = _badgeTextColor.CGColor ?: [UIColor whiteColor].CGColor;
    
    _textLayer.frame = (CGRect){(width - textSize.width) / 2, (height - textSize.height) / 2, .size = textSize};
    
    
    // 2. Config ShapeLayer
    CGRect badgeLayerFrame = (CGRect){center.x - width / 2, center.y - height / 2, width, height};
    
    _badgeLayer.frame = badgeLayerFrame;
    
    CGFloat radius = height / 4;
    
    CGPoint topLeft = (CGPoint){(width - height) / 2 - tweak, 0};
    CGPoint bottomLeft = (CGPoint){0, height};
    CGPoint bottomRight = (CGPoint){width, height};
    CGPoint topRight = (CGPoint){(width + height) / 2 + tweak, 0};
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, topLeft.x, topLeft.y);
    CGPathAddArcToPoint(path, NULL, bottomLeft.x, bottomLeft.y, bottomRight.x, bottomRight.y, radius / 3);
    CGPathAddArcToPoint(path, NULL, bottomRight.x, bottomRight.y, topRight.x, topRight.y, radius / 3);
    CGPathAddArcToPoint(path, NULL, topRight.x, topRight.y, topLeft.x, topLeft.y, radius);
    CGPathAddArcToPoint(path, NULL, topLeft.x, topLeft.y, bottomLeft.x, bottomLeft.y, radius);
    
    _badgeLayer.path = path;
    CGPathRelease(path);
    
    _badgeLayer.fillColor = _badgeBackgroundColor.CGColor ?: [UIColor colorWithRed:240 / 255.f green:110 / 255.f blue:100 / 255.f alpha:1.f].CGColor;
    
    _badgeLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
}

- (CGSize)sizeOfText:(NSString *)text font:(UIFont *)font {
    NSDictionary *attributesDict = @{NSFontAttributeName:font};

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text attributes:attributesDict];

    return [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}


#pragma mark - Setter

- (void)setBadgeText:(NSString *)badgeText {
    _badgeText = badgeText;
    
    [self setNeedsLayout];
}

- (void)setBadgeBackgroundColor:(UIColor *)badgeBackgroundColor {
    _badgeBackgroundColor = badgeBackgroundColor;
    
    [self setNeedsLayout];
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    _badgeTextColor = badgeTextColor;
    
    [self setNeedsLayout];
}

- (void)setBadgeTextFont:(UIFont *)badgeTextFont {
    _badgeTextFont = badgeTextFont;
    
    [self setNeedsLayout];
}



@end
