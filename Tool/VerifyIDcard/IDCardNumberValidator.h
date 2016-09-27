//
//  IDCardNumberValidator.h
//  IDCardNumber-Validation-Demo
//
//  Created by Vincent on 2/26/16.
//  Copyright © 2016 Vincent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDCardNumberValidator : NSObject
+ (BOOL)validateIDCardNumber:(NSString *)idNumber;
@end



//#import "NSString+IDCardNumberValidator.h"
//#import "IDCardNumberValidator.h"
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSArray *IDs = @[@"500234200105183376", @"431027200010280016", @"441322199002093019", @"61232619800820051X", @"522731198402148335", @"441322199211282721", @"522129198306064014", @"420983199207026013", @"452630197408051724", @"512223196101233677", @"522524197103085814", @"43052219730821437X", @"362123197605253015", @"450821199604182192", @"441624199910023816", @"441624198002295248", @"510821197204033718", @"420921199005174422", @"500236198609253983", @"45272819871014361X", @"441481199612124885", @"432826197812220377", @"422424196807122261", @"450722198507101537", @"450722199607131551", @"450603197901110029", @"370919196910141540", @"440523198008030213", @"511121197502030411", @"441421198711106411", @"452402198705210611", @"441522197205155111", @"44152319900520704X", @"440882199404255722", @"513029198701303074", @"44082519731224195X", @"51112119631209329X", @"422324198512152985", @"42100219951020455X"];
//        for (NSString *ID in IDs) {
//            NSLog(@"%@-%@", ID, [IDCardNumberValidator validateIDCardNumber:ID] ? @"有效" : @"无~~效");
//            NSLog(@"%@-%@", ID, [ID validIDCardNumber]?@"R":@"F");
//        }
//    }
//    return 0;
//}
