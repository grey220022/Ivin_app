//
//  NSObject+words.m
//  Ivin
//
//  Created by user on 4/5/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "words.h"

@interface words ()

@end


@implementation words : NSObject





+ (NSString*) getword: (NSString*)text //lang: (NSString*)l
{
    NSString* kk;
    kk = [currentlang stringByAppendingString:@"."];
    kk = [kk stringByAppendingString:text];
    //NSLog(@"%@",kk);
    return dictionary[kk];
}


+ (void) changelang:(NSString*)lang
{
    currentlang=lang;
}


+ (void) initword
{
    
    //    return
    
    
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //currentlang=[[[defaults objectForKey:@"AppleLanguages"] objectAtIndex:0] substringWithRange:NSMakeRange(0,2)];

    
    keys = [NSArray arrayWithObjects:@"fr.userlogin", @"fr.website",@"fr.feedback",@"fr.storerating",@"fr.about",@"fr.photo",@"fr.profile",@"fr.lang",@"fr.cancel",@"fr.winery",@"fr.winemaker",@"fr.wineyard",@"fr.winetourism",@"fr.contact",@"fr.wine",@"fr.thewine",@"fr.winetasting",@"fr.winemaking",@"fr.grape",@"fr.recommandationofwinemaker",@"fr.averagerating",@"fr.averageprice",@"fr.ratings",@"fr.mywines",@"fr.sort",@"fr.sortbyname",@"fr.sortbywinery",@"fr.sortbyyear",@"fr.sortbytype",@"fr.rating",@"fr.setting",@"fr.confirm",@"fr.advice",
            @"en.userlogin", @"en.website",@"en.feedback",@"en.storerating",@"en.about",@"en.photo",@"en.profile",@"en.lang",@"en.cancel",@"en.winery",@"en.winemaker",@"en.wineyard",@"en.winetourism",@"en.contact",@"en.wine",@"en.thewine",@"en.winetasting",@"en.winemaking",@"en.grape",@"en.recommandationofwinemaker",@"en.averagerating",@"en.averageprice",@"en.ratings",@"en.mywines",@"en.sort",@"en.sortbyname",@"en.sortbywinery",@"en.sortbyyear",@"en.sortbytype",@"en.rating",@"en.setting",@"en.confirm",@"en.advice",
            @"zh.userlogin", @"zh.website",@"zh.feedback",@"zh.storerating",@"zh.about",@"zh.photo",@"zh.profile",@"zh.lang",@"zh.cancel",@"zh.winery",@"zh.winemaker",@"zh.wineyard",@"zh.winetourism",@"zh.contact",@"zh.wine",@"zh.thewine",@"zh.winetasting",@"zh.winemaking",@"zh.grape",@"zh.recommandationofwinemaker",@"zh.averagerating",@"zh.averageprice",@"zh.ratings",@"zh.mywines",@"zh.sort",@"zh.sortbyname",@"zh.sortbywinery",@"zh.sortbyyear",@"zh.sortbytype",@"zh.rating",@"zh.setting",@"zh.confirm",@"zh.advice",
            nil];
    objects = [NSArray arrayWithObjects:@"Compte d'utilisateur", @"Site web",@"Feedback",@"Notes de l'App Store",@"Information",@"Photo",@"Profil",@"Langue",@"Annuler",@"Le Château",@"Les Hommes",@"La Vigne",@"Oeno-tourisme",@"Contact",@"Vin",@"Le Vin",@"Dégustation",@"Vinification",@"Cépage",@"Recommandation du Vigneron",@"Note moyenne",@"Prix moyen",@"notes",@"Mes vins",@"Tri",@"Tri par nom",@"Tri par château",@"Tri par année",@"Tri par type",@"Note",@"Paramètres",@"Confirmer",@"Le conseil",
               @"User account", @"Website",@"Feedback",@"App rating",@"About",@"Photo",@"Profile",@"Language",@"Cancel",@"Winery",@"Wine maker",@"Wineyard",@"Wine tourism",@"Contact",@"Wine",@"The Wine",@"Wine tasting",@"Wine making",@"Grape",@"Wine maker Recommandation",@"Average rating",@"Average price",@"ratings",@"My wines",@"Sort",@"Sort by name",@"Sort by winery",@"Sort by year",@"Sort by type",@"Rating",@"Setting",@"Confirm",@"Wine guide",
               @"用户帐户", @"访问网页",@"意见反馈",@"给应用评分",@"关于",@"修改头像",@"我的资料",@"语言",@"取消",@"酒庄",@"酒农",@"葡萄种植园",@"葡萄酒旅游",@"联系方式",@"葡萄酒",@"葡萄酒",@"品酒",@"葡萄酒酿造",@"葡萄",@"酒农推荐",@"平均评价",@"平均价格",@"评价",@"我的酒窖",@"排序",@"按名字排序",@"按酒庄排序",@"按年份排序",@"按类型排序",@"评分",@"设置",@"确认",@"酒农建议",
               nil];
    dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}


@end
