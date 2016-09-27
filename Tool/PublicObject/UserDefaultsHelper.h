//
//  UserDefaultsHelper.h
//  zskx
//
//  Created by MacPro on 15/9/1.
//  Copyright (c) 2015年 zsb2c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject

+(NSString*)getStringForKey:(NSString*)key;
+(NSInteger)getIntForkey:(NSString*)key;
+(NSDictionary*)getDictForKey:(NSString*)key;
+(NSArray*)getArrayForKey:(NSString*)key;
+(BOOL)getBoolForKey:(NSString*)key;

+(void)setStringForKey:(NSString*)value  key:(NSString*)key;
+(void)setIntForKey:(NSInteger)value  key:(NSString*)key;
+(void)setDictForKey:(NSDictionary*)value  key:(NSString*)key;
+(void)setArrayForKey:(NSArray*)value  key:(NSString*)key;
+(void)setBoolForKey:(BOOL)value  key:(NSString*)key;

@end
