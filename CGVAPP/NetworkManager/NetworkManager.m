//
//  NetworkManager.m
//  CGVAPP
//
//  Created by Nguyen Van Thanh on 12/7/15.
//  Copyright © 2015 DangDingCan. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
+(instancetype)shareManager {
    static NetworkManager*shareManager = nil;
    static dispatch_once_t dispatchOnce;
    dispatch_once(&dispatchOnce, ^{
        shareManager = [self new];
    });
    return shareManager;
}




@end
