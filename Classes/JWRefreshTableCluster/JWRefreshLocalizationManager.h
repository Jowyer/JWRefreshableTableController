//
//  JWRefreshLocalizationManager.h
//  Demo
//
//  Created by Jowyer on 14-6-10.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/** The name of the bundle. */
static NSString * const kJWRefreshLocalizationBunbleName = @"JWRefreshableTableController-Localization";
/** The table name for the localized strings. */
static NSString * const kJWRefreshLocalizationStringTable = @"JWRefreshableTableControllerLocalizable";

@interface JWRefreshLocalizationManager : NSObject

+(NSString *)localizedStringForKey:(NSString *)key;

@end
