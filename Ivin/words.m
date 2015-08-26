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
   // NSLog(@"%@",lang);
    
}


+ (void) initword
{
    
    //    return
    
    
    //NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    //currentlang=[[[defaults objectForKey:@"AppleLanguages"] objectAtIndex:0] substringWithRange:NSMakeRange(0,2)];

    
    keys = [NSMutableArray arrayWithObjects:@"fr.userlogin", @"fr.website",@"fr.feedback",@"fr.storerating",@"fr.about",@"fr.photo",@"fr.profile",@"fr.lang",@"fr.cancel",@"fr.winery",@"fr.winemaker",@"fr.wineyard",@"fr.winetourism",@"fr.contact",@"fr.wine",@"fr.thewine",@"fr.winetasting",@"fr.winemaking",@"fr.grape",@"fr.recommandationofwinemaker",@"fr.averagerating",@"fr.averageprice",@"fr.ratings",@"fr.mywines",@"fr.sort",@"fr.sortbyname",@"fr.sortbywinery",@"fr.sortbyyear",@"fr.sortbytype",@"fr.rating",@"fr.setting",@"fr.confirm",@"fr.advice",@"fr.bi1",@"fr.bi2",@"fr.bi3",@"fr.bi4",@"fr.bi5",@"fr.bc1",@"fr.bc2",@"fr.bc3",@"fr.bc4",@"fr.bc5",@"fr.username",@"fr.password",@"fr.signin",@"fr.signout",@"fr.signup",@"fr.loginerror",@"fr.loginok",@"fr.signupok",@"fr.signuperror",@"fr.networkerror",@"fr.t1",@"fr.t2",@"fr.t3",@"fr.t4",@"fr.t5",@"fr.usertype",@"fr.usertypeshort",@"fr.profile",@"fr.team",@"fr.teaminfo",@"fr.error",@"fr.restartinfo",@"fr.info",@"fr.signature",@"fr.place",@"fr.email",@"fr.upvotes",@"fr.whatdoyouthink",@"fr.save",@"fr.like",@"fr.collect",@"fr.entertheprice",@"fr.entertheplace",@"fr.price",@"fr.send",@"fr.leavemessage",@"fr.wines",@"fr.qrcode",@"fr.yes",@"fr.no",@"fr.signoutask",@"fr.search",@"fr.wine/winery",@"fr.salonlist",@"fr.h1",@"fr.h2",@"fr.h3",@"fr.region",@"fr.skip",@"fr.slide1",@"fr.slide2",@"fr.slide3",@"fr.information",@"fr.noresulterror",@"fr.passwordshorterror",@"fr.salondescription",
            nil];
    
    int key_count=keys.count;
    NSString * temp;
    for (int i=0; i<key_count; i++)
    {
        temp=[NSString stringWithFormat:@"%@%@",@"en",[[keys objectAtIndex:i]substringFromIndex:2]];
        [keys addObject:temp];
    }

    for (int i=0; i<key_count; i++)
    {
        temp=[NSString stringWithFormat:@"%@%@",@"zh",[[keys objectAtIndex:i]substringFromIndex:2]];
        [keys addObject:temp];
    }

    objects = [NSArray arrayWithObjects:@"Se connecter", @"Site web",@"Feedback",@"Notes de l'App Store",@"L'equipe",@"Photo",@"Profil",@"Langue",@"Annuler",@"Le domaine",@"Les Hommes",@"La Vigne",@"Oeno-tourisme",@"Contact",@"Vin",@"Le Vin",@"Dégustation",@"Vinification",@"Cépages",@"Recommandation du Vigneron",@"Note moyenne",@"Prix moyen",@"notes",@"Mes vins",@"Tri",@"Tri par nom",@"Tri par château",@"Tri par année",@"Tri par type",@"Note",@"Paramètres",@"Confirmer",@"Le conseil",@"Note de dégustation",@"Récompenses",@"Description du millésime",@"Viticulture",@"Vinification & Elevage",@"Le domaine",@"Les hommes",@"Vignoble",@"Œno-tourisme",@"Contact",@"Pseudo",@"Mot de passe",@"Connexion",@"Déconnexion",@"Créer un compte",@"Erreur de pseudo/mot de passe",@"Connexion réussie",@"Inscription réussie",@"Pseudo déjà pris",@"Erreur de connexion, merci de réessayer à nouveau",@"Amateur de vin",@"Passionné de vin",@"Négotiant de vin",@"Expert de vin",@"Autre",@"Catégorie d’utilisateur",@"Catégorie",@"Profil",@"L'Equipe",@"Développé par IvinTech.",@"Erreur",@"Vos changements seront effectifs au prochain démarrage de l'application",@"Information",@"Signature",@"Localisation",@"Email",@"Amateurs",@"Conservez votre opinion sur ce vin.",@"Enrg.",@"Liker",@"Favoris",@"Saisissez le prix",@"Saisissez le localisation",@"Prix",@"envoyez",@"Laissez une évaluation pour IVin",@"vins",@"QR Code",@"Oui",@"Non",@"Voulez vous vraiment vous déconnecter?",@"Recherche",@"Vin/Domaine",@"Liste des salons",@"Salon",@"Domaine",@"QR code",@"Région",@"Sauter",@"Découvrir des producteurs et leur vins",@"Trouver les meilleurs vins des salons digitaux",@"Mémoriser tous les vins dégustés",@"Information",@"Aucun résultat trouvé",@"Votre mot de passe est trop court",@"Description du salon",
               @"User account", @"Website",@"Feedback",@"App ratings",@"Credits",@"Photo",@"Profile",@"Language",@"Cancel",@"Winery",@"Wine maker",@"Wineyard",@"Wine tourism",@"Contact",@"Wine",@"The Wine",@"Wine tasting",@"Wine making",@"Grape",@"Wine maker Recommandation",@"Average rating",@"Average price",@"ratings",@"My wines",@"Sort",@"Sort by name",@"Sort by winery",@"Sort by year",@"Sort by type",@"Rating",@"Setting",@"Confirm",@"Wine guide",@"Tasting note",@"Awards",@"Vintage description",@"Viticulture",@"Breeding",@"The Winery",@"The people",@"Vineyard",@"Wine tasting tourism",@"Contact",@"Username",@"Password",@"Sign in",@"Sign out",@"Sign up",@"Username/password error",@"Login success",@"Successful registration",@"Username already exists",@"Network error, please try it later",@"Wine consumer",@"Wine amateur",@"Wine broker",@"Wine expert",@"Other",@"profile type",@"profile type",@"Profile",@"Team",@"Brought to you by IVinTech.",@"Error",@"Your changes will take effect when your application be restarted next time",@"Information",@"Signature",@"Location",@"Email",@"Upvotes",@"What do you think about this wine?",@"Save",@"Like",@"Bookmark",@"Enter the price",@"Enter the place",@"Price",@"send",@"Leave a feedback for IVin",@"wines",@"QR Code",@"Yes",@"No",@"Do you want to really sign out?",@"Search",@"Wine/Winery",@"List of wine exhibitions",@"Exhibition",@"Winery",@"QR code",@"Region",@"Skip",@"Discover wineries and their wines",@"Find the best wines in digital wine fairs",@"Note every wine you tasted",@"Information",@"No result found",@"Your password is too short",@"Wine exhibition description",
               @"用户帐户", @"访问网页",@"意见反馈",@"给应用评分",@"关于我们",@"修改头像",@"我的资料",@"语言",@"取消",@"酒庄",@"酒农",@"葡萄种植园",@"葡萄酒旅游",@"联系方式",@"葡萄酒",@"葡萄酒",@"品酒",@"葡萄酒酿造",@"葡萄",@"酒农推荐",@"平均评价",@"平均价格",@"评价",@"我的酒窖",@"排序",@"按名字排序",@"按酒庄排序",@"按年份排序",@"按类型排序",@"评分",@"设置",@"确认",@"酒农建议",@"品鉴描述",@"葡萄酒奖项",@"年份描述",@"种植文化",@"酿造工艺",@"酒庄介绍",@"酒庄人物",@"酒庄田园",@"酒庄旅游",@"联系方式",@"用户名",@"密码", @"登录", @"注销",@"注册",@"用户名/密码错误",@"登录成功",@"注册成功",@"用户名已被注册",@"网络错误，请稍后重试",@"葡萄酒消费者",@"葡萄酒爱好者",@"葡萄酒从业者",@"葡萄酒专家",@"其他",@"用户种类",@"用户种类",@"用户信息",@"制作团队",@"IVinTech团队制作",@"错误",@"语言改动将在下次程序启动生效",@"提示",@"签名",@"地点",@"Email",@"喜爱",@"您的酒评",@"保存",@"喜欢",@"收藏",@"输入价格",@"输入地点",@"价格",@"发送",@"给我们团队留言",@"瓶葡萄酒",@"二维码",@"是",@"否",@"确认注销吗",@"酒搜索",@"输入酒庄或酒的名字",@"酒展列表",@"酒展",@"酒庄",@"二维码",@"地区",@"跳过",@"探索精品酒庄和精品酒",@"在数字酒展中寻找精品酒",@"收藏您喝过的精品酒",@"提醒",@"搜索结果为空",@"密码太短",@"酒展详情",
               nil];
    dictionary = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
}


@end
