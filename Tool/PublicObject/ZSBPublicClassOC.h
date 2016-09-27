//
//  ZSBPublicClassOC.h
//  zskx
//
//  Created by MacPro on 15/10/13.
//  Copyright © 2015年 zsb2c. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ZSBPublicClassOC : NSObject

/**
 *  获取键盘高度
 *
 *  @param aNotification 键盘出现监听
 *
 *  @return 高度
 */
+ (NSInteger)heightForKeyboard:(NSNotification *)aNotification ;

/**
 *  获取关键词信息长度
 *
 *  @param txt  文字长度
 *  @param font 字体
 *  @param size 宽、高范围
 *
 *  @return 长度
 */
+(CGSize)FontboundingRectWithSize:(NSString*)txt Font:(UIFont*)font Size:(CGSize)size;

/**
 * 根据文字，字体大小和宽度计算文字高度
*/
+ (CGFloat)getTextHeightWith:(NSString *)text font:(UIFont *)font width:(CGFloat)width;

/*
 * 权限
 */
+ (void)APPpermissions ;


/*
 * 判断是否为11位数的手机号码
 */

+ (BOOL)isNumber11DigitNumber:(NSString *)phone ;

/*
 * 判断是否有中文字符
 */
+ (BOOL)isIncludeChineseInString:(NSString*)str ;

/*
 *正则判断手机号码格式
 */
//+ (BOOL)validatePhone:(NSString *)phone;

/*
 * 判断中国邮政格式
 */
+ (BOOL)ChinaPostEncodingPhoneNumber:(NSString *)number ;
/*
 * 判断固定电话号码是否为数字
 */
+ (BOOL)isValidateTelephone:(NSString *)Telephone;


/*
 * 判断是否拥有打开摄像机权限
 */
+ (BOOL)isJudgeWhetherOpenTheCamera ;

/*
 * 判断是否拥有通知权限
 */
+ (BOOL)isAllowedNotification ;


+ (BOOL)isSystemVersioniOS8 ;

//提示
+ (void)ShowTitlt:(NSString *)title viewcontroller:(UIViewController *)VC;




//字典转json格式字符串：
+ (NSString*)dictionaryToJson:(NSDictionary *)dic ;

//json格式字符串转字典：
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString ;

// 字符串转字典：
+(NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;


//URL编码
+ (NSString*)encodeString:(NSString*)unencodedString ;


+ (BOOL)ZSBsystemVersion:(float) mm ;


@end
