//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    Version 2, December 2004
//
//    Copyright (C) 2016 KIM TAE JUN <korean.darren@gmail.com>
//
//    Everyone is permitted to copy and distribute verbatim or modified
//    copies of this license document, and changing it is allowed as long
//    as the name is changed.
//
//    DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
//    TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
//
//    0. You just DO WHAT THE FUCK YOU WANT TO.
//

#import "UITextField+Max.h"
#import <objc/runtime.h>

static NSString * const DRNMaxLengthKey = @"DRNMaxLengthKey";

@implementation UITextField (Max)

@dynamic maxLength;

#pragma mark - Getter

- (NSInteger)maxLength
{
    NSValue *maxLengthValue = objc_getAssociatedObject(self, &DRNMaxLengthKey);
    if (maxLengthValue) {
        NSInteger maxLength;
        [maxLengthValue getValue:&maxLength];
        return maxLength;
    }
    
    return NSIntegerMax;
}

#pragma mark - Setter

- (void)setMaxLength:(NSInteger)maxLength
{
    if (maxLength < 1) {
        maxLength = NSIntegerMax;
    }
    
    NSValue *value = [NSValue value:&maxLength withObjCType:@encode(NSInteger)];
    objc_setAssociatedObject(self, &DRNMaxLengthKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self drn_textFieldTextChanged:self];
    [self removeTarget:self
                action:@selector(drn_textFieldTextChanged:)
      forControlEvents:UIControlEventEditingChanged];
    [self addTarget:self
             action:@selector(drn_textFieldTextChanged:)
   forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Event

- (void)drn_textFieldTextChanged:(UITextField *)textField
{
    if (textField.text.length <= textField.maxLength) {
        return;
    } else {
        NSInteger adaptedLength = MIN(textField.text.length, textField.maxLength);
        NSRange range = NSMakeRange(0, adaptedLength);
        textField.text = [textField.text substringWithRange:range];
    }
}

@end
