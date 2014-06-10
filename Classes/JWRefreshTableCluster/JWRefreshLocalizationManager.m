//
//  JWRefreshLocalizationManager.m
//  Demo
//
//  Created by Jowyer on 14-6-10.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "JWRefreshLocalizationManager.h"

@implementation JWRefreshLocalizationManager

+(NSString *)localizedStringForKey:(NSString *)key
{
    NSString *localizedString = nil;
    
    NSURL *bundleUrl = [[NSBundle mainBundle] URLForResource:kJWRefreshLocalizationBunbleName withExtension:@"bundle"];
    
    // JWRefreshableTableController-Localization.bundle
    NSBundle *localizationBundle = [NSBundle bundleWithURL:bundleUrl];
    
    assert(localizationBundle);
    
    NSString *langPath = nil;
    NSString *currentLocale = [[NSLocale preferredLanguages] objectAtIndex:0];
    langPath = [localizationBundle pathForResource:currentLocale ofType:@"lproj"];
    if (langPath)
    {
        // JWRefreshableTableController-Localization.bundle/zh-Hans.lproj
        localizationBundle = [NSBundle bundleWithPath:langPath];
    }
    
    localizedString = [localizationBundle localizedStringForKey:key value:nil table:kJWRefreshLocalizationStringTable];
    
    return localizedString;
}

@end
