//
//  ZSBPublicClassOC.m
//  zskx
//
//  Created by MacPro on 15/10/13.
//  Copyright © 2015年 zsb2c. All rights reserved.
//

#import "ZSBPublicClassOC.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>



@implementation ZSBPublicClassOC



//根据文字，字体大小和宽度计算文字高度
+ (CGFloat)getTextHeightWith:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    //版本判断
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
        
        return ceilf(rect.size.height);
    }
    else
    {
        CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, 10000) ];
        return size.height ;
    }
}


//获取关键词信息长度
+(CGSize)FontboundingRectWithSize:(NSString*) txt Font:(UIFont*) font Size:(CGSize) size
{
    
    CGSize _size;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
    
    NSStringDrawingUsesLineFragmentOrigin |
    
    NSStringDrawingUsesFontLeading;
    
    _size = [txt boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
#else
    
    _size = [txt sizeWithFont:font constrainedToSize:size];
    
#endif
    
    return _size;
}



/*
 * 权限
 */
+ (void)APPpermissions
{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString ];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        
        NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:url];
    }
}



/*
 * 判断是否为11位数的手机号码
 */

+ (BOOL)isNumber11DigitNumber:(NSString *)phone
{
    if (phone && (phone.length == 11 ) && [self isValidateTelephone:phone]) {
     
        return YES ;
    }
    return NO ;
}


/**
 *  判断是否有中文字符
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)isIncludeChineseInString:(NSString*)str
{
    for (int i=0; i<str.length; i++) {
        unichar ch = [str characterAtIndex:i];
        if (0x4E00 <= ch  && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
}




///*
// *正则判断手机号码格式
// */
//+ (BOOL)validatePhone:(NSString *)phone
//{
//    /**
//     * 手机号码
//     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188         183
//     * 联通：130,131,132,152,155,156,185,186
//     * 电信：133,1349,153,180,189                       181              170 京东
//     */
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0-9])\\d{8}$";
//    /**
//     10         * 中国移动：China Mobile
//     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
//     12         */
//    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
//    /**
//     15         * 中国联通：China Unicom
//     16         * 130,131,132,152,155,156,185,186
//     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
//    /**
//     20         * 中国电信：China Telecom
//     21         * 133,1349,153,180,189
//     22         */
//    NSString * CT = @"^((133)|(153)|(17[0-9])|(18[0-9]))\\d{8}$";
//    /**
//     25         * 大陆地区固话及小灵通
//     26         * 区号：010,020,021,022,023,024,025,027,028,029
//     27         * 号码：七位或八位
//     28         */
//    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
//    
//    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
//    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
//    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
//    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
//    
//    if (([regextestmobile evaluateWithObject:phone] == YES)
//        || ([regextestcm evaluateWithObject:phone] == YES)
//        || ([regextestct evaluateWithObject:phone] == YES)
//        || ([regextestcu evaluateWithObject:phone] == YES))
//    {
//        if([regextestcm evaluateWithObject:phone] == YES) {
//            NSLog(@"China Mobile");
//        } else if([regextestct evaluateWithObject:phone] == YES) {
//            NSLog(@"China Telecom");
//        } else if ([regextestcu evaluateWithObject:phone] == YES) {
//            NSLog(@"China Unicom");
//        } else {
//            NSLog(@"Unknow");
//        }
//        
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
//}

/*
 * 判断中国邮政格式
 */
+ (BOOL)ChinaPostEncodingPhoneNumber:(NSString *)number
{
    if (number != nil) {
        if (number.length == 6) {
            unichar c;
            for (int i=0; i<number.length; i++) {
                c=[number characterAtIndex:i];
                if (!isdigit(c)) {
                    return NO;
                }
            }
            return YES;
        }
    }
    return NO ;
}

/*
 * 判断固定电话号码是否为数字
 */
+(BOOL)isValidateTelephone:(NSString *)Telephone

{
    if (Telephone != nil) {
        unichar c;
        for (int i=0; i<Telephone.length; i++) {
            c=[Telephone characterAtIndex:i];
            if (!isdigit(c)) {
                return NO;
            }
        }
        return YES;
    }
    return NO ;
}

//判断邮箱格式是否正确的代码
+(BOOL)isValidateEmail:(NSString *)email

{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:email];
}


/*
 * 允许访问相机 
 * yes 允许
 * no  不允许
 */

+ (BOOL)isJudgeWhetherOpenTheCamera
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusDenied){
        //没有使用权限
        NSLog(@"无权限");
        return NO ;
        
    }else
    {
        NSLog(@"有权限");
        return YES ;
    }
}





/*
 *  check if user allow local notification of system setting
 *
 *  @return YES-allowed,otherwise,NO.
 */
+ (BOOL)isAllowedNotification {
    
  //iOS8 check if user allow notification
   if ([self isSystemVersioniOS8]) {// system is iOS8
      UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
       if (UIUserNotificationTypeNone != setting.types) {
              return YES;
          }
   } else {//iOS7
           UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
           if(UIRemoteNotificationTypeNone != type)
                 return YES;
   }
    
   return NO;
}

/**
 *  check if the system version is iOS8
 *
 *  @return YES-is iOS8,otherwise,below iOS8
 */
+ (BOOL)isSystemVersioniOS8 {
   //check systemVerson of device
  UIDevice *device = [UIDevice currentDevice];
  float sysVersion = [device.systemVersion floatValue];
   if (sysVersion >= 8.0f)
   {
          return YES;
   }
   return NO;
}

+(void)ShowTitlt:(NSString *)title viewcontroller:(UIViewController *)VC
{
    if ([self isSystemVersioniOS8]) {
        UIAlertController * alertctrl = [UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //动作
        }];
        
        [alertctrl addAction:okAction];
        [VC presentViewController:alertctrl animated:YES completion:nil];
    
    }else
    {
        UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
    
    
    }
}










// 获取键盘高度
+ (NSInteger)heightForKeyboard:(NSNotification *)aNotification
{
    //获取键盘的高度
    /*
     iphone 6:
     中文
     2014-12-31 11:16:23.643 Demo[686:41289] 键盘高度是  258
     2014-12-31 11:16:23.644 Demo[686:41289] 键盘宽度是  375
     英文
     2014-12-31 11:55:21.417 Demo[1102:58972] 键盘高度是  216
     2014-12-31 11:55:21.417 Demo[1102:58972] 键盘宽度是  375
     
     iphone  6 plus：
     英文：
     2014-12-31 11:31:14.669 Demo[928:50593] 键盘高度是  226
     2014-12-31 11:31:14.669 Demo[928:50593] 键盘宽度是  414
     中文：
     2015-01-07 09:22:49.438 Demo[622:14908] 键盘高度是  271
     2015-01-07 09:22:49.439 Demo[622:14908] 键盘宽度是  414
     
     iphone 5 :
     2014-12-31 11:19:36.452 Demo[755:43233] 键盘高度是  216
     2014-12-31 11:19:36.452 Demo[755:43233] 键盘宽度是  320
     
     ipad Air：
     2014-12-31 11:28:32.178 Demo[851:48085] 键盘高度是  264
     2014-12-31 11:28:32.178 Demo[851:48085] 键盘宽度是  768
     
     ipad2 ：
     2014-12-31 11:33:57.258 Demo[1014:53043] 键盘高度是  264
     2014-12-31 11:33:57.258 Demo[1014:53043] 键盘宽度是  768
     */
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    NSInteger height = keyboardRect.size.height;
    NSInteger width = keyboardRect.size.width;
    NSLog(@"键盘高度是  %ld",height);
    NSLog(@"键盘宽度是  %ld",width);
    return height ;
    
//    //增加监听，当键盘出现或改变时收出消息
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    
//    //增加监听，当键退出时收出消息
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}























/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */

//json格式字符串转字典：
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    
    if (jsonString == nil) {
        
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
    
}

//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

// 字符串转字典：
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString
{
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}



//URL编码
+ (NSString*)encodeString:(NSString*)unencodedString
{
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}



// 18位身份证校验 
+ (BOOL )IDcheck:(NSString *) identityCard
{
    
    BOOL flag;
    if (identityCard.length <= 0)
    {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:identityCard];
    
    
    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if(flag)
    {
        if(identityCard.length==18)
        {
            //将前17位加权因子保存在数组里
            NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
            
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
            
            //用来保存前17位各自乖以加权因子后的总和
            
            NSInteger idCardWiSum = 0;
            for(int i = 0;i < 17;i++)
            {
                NSInteger subStrIndex = [[identityCard substringWithRange:NSMakeRange(i, 1)] integerValue];
                NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
                
                idCardWiSum+= subStrIndex * idCardWiIndex;
                
            }
            
            //计算出校验码所在数组的位置
            NSInteger idCardMod=idCardWiSum%11;
            
            //得到最后一位身份证号码
            NSString * idCardLast= [identityCard substringWithRange:NSMakeRange(17, 1)];
            
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if(idCardMod==2)
            {
                if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
                {
                    return flag;
                }else
                {
                    flag =  NO;
                    return flag;
                }
            }else
            {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
                {
                    return flag;
                }
                else
                {
                    flag =  NO;
                    return flag;
                }
            }
        }
        else
        {
            flag =  NO;
            return flag;
        }
    }
    else
    {
        return flag;
    }
}






//版本判断
+ (BOOL)ZSBsystemVersion:(float) mm
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= mm)
    {
        return YES ;
    }
    else
    {
        return NO ;
    }
}



/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param Width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}


@end
