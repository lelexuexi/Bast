//
//  HTTPURLDefine.h
//  PreheatDemo
//
//  Created by chen on 16/6/28.
//  Copyright © 2016年 DFYG_YF3. All rights reserved.
//




#pragma mark -  * * * * * * * * * * * * * * 域名切换 * * * * * * * * * * * * * *

#define ENVIRONMENT 0

#if ENVIRONMENT == 0

/**
 *  域名
 *
 *  @param 开发环境
 *
 */
#define YGBaseURL @"http://"

#elif ENVIRONMENT ==1

/**
 *  域名
 *
 *  @param 测试环境
 *
 */
#define YGBaseURL @"http://"

#elif ENVIRONMENT ==2

/**
 *  域名
 *
 *  @param 正式环境
 *
 */
#define YGBaseURL @"http://"


#endif /* HTTPURLDefine_h */

#pragma mark -  * * * * * * * * * * * * * * 首页 URL * * * * * * * * * * * * * *



#pragma mark -  * * * * * * * * * * * * * * User URL * * * * * * * * * * * * * *




































