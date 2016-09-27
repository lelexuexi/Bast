//
//  BankAccountCheckClass.h
//  zskx
//
//  Created by ios004 on 16/7/21.
//  Copyright © 2016年 zsb2c. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankAccountCheckClass : NSObject

+ (NSString *)returnBankName:(NSString*) idCard ;

+ (BOOL) checkCardNo:(NSString*) cardNo ;

@end
