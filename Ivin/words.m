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

    
    keys = [NSArray arrayWithObjects:@"fr.userlogin", @"fr.website",@"fr.feedback",@"fr.storerating",@"fr.about",@"fr.photo",@"fr.profile",@"fr.lang",@"fr.cancel",@"fr.winery",@"fr.winemaker",@"fr.wineyard",@"fr.winetourism",@"fr.contact",@"fr.wine",@"fr.thewine",@"fr.winetasting",@"fr.winemaking",@"fr.grape",@"fr.recommandationofwinemaker",@"fr.averagerating",@"fr.averageprice",@"fr.ratings",@"fr.mywines",@"fr.sort",@"fr.sortbyname",@"fr.sortbywinery",@"fr.sortbyyear",@"fr.sortbytype",@"fr.rating",@"fr.setting",@"fr.confirm",@"fr.advice",@"fr.bi1",@"fr.bi2",@"fr.bi3",@"fr.bi4",@"fr.bi5",@"fr.bc1",@"fr.bc2",@"fr.bc3",@"fr.bc4",@"fr.bc5",@"fr.username",@"fr.password",@"fr.signin",@"fr.signout",@"fr.signup",@"fr.loginerror",@"fr.loginok",@"fr.signupok",@"fr.signuperror",@"fr.networkerror",@"fr.t1",@"fr.t2",@"fr.t3",@"fr.t4",@"fr.t5",@"fr.usertype",@"fr.usertypeshort",
            @"en.userlogin", @"en.website",@"en.feedback",@"en.storerating",@"en.about",@"en.photo",@"en.profile",@"en.lang",@"en.cancel",@"en.winery",@"en.winemaker",@"en.wineyard",@"en.winetourism",@"en.contact",@"en.wine",@"en.thewine",@"en.winetasting",@"en.winemaking",@"en.grape",@"en.recommandationofwinemaker",@"en.averagerating",@"en.averageprice",@"en.ratings",@"en.mywines",@"en.sort",@"en.sortbyname",@"en.sortbywinery",@"en.sortbyyear",@"en.sortbytype",@"en.rating",@"en.setting",@"en.confirm",@"en.advice",@"en.bi1",@"en.bi2",@"en.bi3",@"en.bi4",@"en.bi5",@"en.bc1",@"en.bc2",@"en.bc3",@"en.bc4",@"en.bc5",@"en.username",@"en.password",@"en.signin",@"en.signout",@"en.signup",@"en.loginerror",@"en.loginok",@"en.signupok",@"en.signuperror",@"en.networkerror",@"en.t1",@"en.t2",@"en.t3",@"en.t4",@"en.t5",@"en.usertype",@"en.usertypeshort",
            @"zh.userlogin", @"zh.website",@"zh.feedback",@"zh.storerating",@"zh.about",@"zh.photo",@"zh.profile",@"zh.lang",@"zh.cancel",@"zh.winery",@"zh.winemaker",@"zh.wineyard",@"zh.winetourism",@"zh.contact",@"zh.wine",@"zh.thewine",@"zh.winetasting",@"zh.winemaking",@"zh.grape",@"zh.recommandationofwinemaker",@"zh.averagerating",@"zh.averageprice",@"zh.ratings",@"zh.mywines",@"zh.sort",@"zh.sortbyname",@"zh.sortbywinery",@"zh.sortbyyear",@"zh.sortbytype",@"zh.rating",@"zh.setting",@"zh.confirm",@"zh.advice",@"zh.bi1",@"zh.bi2",@"zh.bi3",@"zh.bi4",@"zh.bi5",@"zh.bc1",@"zh.bc2",@"zh.bc3",@"zh.bc4",@"zh.bc5",@"zh.username",@"zh.password",@"zh.signin",@"zh.signout",@"zh.signup",@"zh.loginerror",@"zh.loginok",@"zh.signupok",@"zh.signuperror",@"zh.networkerror",@"zh.t1",@"zh.t2",@"zh.t3",@"zh.t4",@"zh.t5",@"zh.usertype",@"zh.usertypeshort",
            nil];
    objects = [NSArray arrayWithObjects:@"Compte d'utilisateur", @"Site web",@"Feedback",@"Notes de l'App Store",@"L'equipe",@"Photo",@"Profil",@"Langue",@"Annuler",@"Le Château",@"Les Hommes",@"La Vigne",@"Oeno-tourisme",@"Contact",@"Vin",@"Le Vin",@"Dégustation",@"Vinification",@"Cépage",@"Recommandation du Vigneron",@"Note moyenne",@"Prix moyen",@"notes",@"Mes vins",@"Tri",@"Tri par nom",@"Tri par château",@"Tri par année",@"Tri par type",@"Note",@"Paramètres",@"Confirmer",@"Le conseil",@"Note de dégustation",@"L'avis de vin",@"Description du millésime",@"Viticulture",@"Vinification & Elevage",@"Le château",@"Les hommes",@"Vignoble",@"Œno-tourisme",@"Contact",@"Pseudo",@"Mot de passe",@"Connexion",@"Déconnexion",@"Créer un compte",@"Erreur de pseudo/mot de passe",@"Connexion réussie",@"Inscription réussie",@"Pseudo déjà pris",@"Erreur de connexion, merci de réessayer à nouveau",@"Amateur de vin",@"Passionné de vin",@"Négotiant de vin",@"Expert de vin",@"Autre",@"Catégorie d’utilisateur",@"Catégorie",
               @"User account", @"Website",@"Feedback",@"App ratings",@"Credits",@"Photo",@"Profile",@"Language",@"Cancel",@"Winery",@"Wine maker",@"Wineyard",@"Wine tourism",@"Contact",@"Wine",@"The Wine",@"Wine tasting",@"Wine making",@"Grape",@"Wine maker Recommandation",@"Average rating",@"Average price",@"ratings",@"My wines",@"Sort",@"Sort by name",@"Sort by winery",@"Sort by year",@"Sort by type",@"Rating",@"Setting",@"Confirm",@"Wine guide",@"Tasting note",@"Wine critics",@"Vintage description",@"Viticulture",@"Wine making",@"Chateau",@"The people",@"Vineyard",@"Wine tasting tourism",@"Contact",@"Username",@"Password",@"Sign in",@"Sign out",@"Sign up",@"Username/password error",@"Login success",@"Successful registration",@"Username already exists",@"Network error, please try it later",@"Wine consumer",@"Wine amateur",@"Wine broker",@"Wine expert",@"Other",@"profile type",@"profile type",
               @"用户帐户", @"访问网页",@"意见反馈",@"给应用评分",@"关于我们",@"修改头像",@"我的资料",@"语言",@"取消",@"酒庄",@"酒农",@"葡萄种植园",@"葡萄酒旅游",@"联系方式",@"葡萄酒",@"葡萄酒",@"品酒",@"葡萄酒酿造",@"葡萄",@"酒农推荐",@"平均评价",@"平均价格",@"评价",@"我的酒窖",@"排序",@"按名字排序",@"按酒庄排序",@"按年份排序",@"按类型排序",@"评分",@"设置",@"确认",@"酒农建议",@"品鉴描述",@"葡萄酒评论",@"年份描述",@"种植文化",@"酿造工艺",@"酒庄介绍",@"酒庄人物",@"酒庄田园",@"酒庄旅游",@"联系方式",@"用户名",@"密码", @"登录", @"注销",@"注册",@"用户名/密码错误",@"登录成功",@"注册成功",@"用户名已被注册",@"网络错误，请稍后重试",@"葡萄酒消费者",@"葡萄酒爱好者",@"葡萄酒从业者",@"葡萄酒专家",@"其他",@"用户种类",@"用户种类",
               nil];
    dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}


@end
