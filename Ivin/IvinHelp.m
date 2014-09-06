//
//  IvinHelp.m
//  Ivin
//
//  Created by user on 7/7/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "IvinHelp.h"
#import "SingletonClass.h"

@implementation IvinHelp




+ (NSMutableString *) strpreval:(NSString *) initval prevalue:(NSString *) pre join:(NSString *) join
{
    NSMutableString * somestring;
    if (initval == nil || [initval isKindOfClass:[NSNull class]])
        //return @"";
        somestring=[NSMutableString stringWithString:@""];
    else
    {
        somestring = [NSMutableString stringWithString: pre];
        [somestring appendString: join];
        //[somestring appendString: [initval stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]]];
        
        [somestring appendString: initval];
        
        [somestring appendString: @"\r\n\r\n"];
    }
    return somestring;
}

+ (NSString *) strval:(NSString *) initval replacevalue:(NSString *) replace
{
    if (initval == nil || [initval isKindOfClass:[NSNull class]])
        return replace;
    else return initval;
}

+ (NSData *) geturlcontent:(NSString *) url
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    if (error == nil)
      {
        return data;
      }
    return nil;
}

+ (void) wineparse:(NSData *) winecontent
{
    Wine * temp;
    
    NSError *error;
    NSDictionary *tempdic = [NSJSONSerialization JSONObjectWithData:winecontent options:NSJSONReadingMutableLeaves error:&error];

    [SingletonClass sharedInstance].wine.WineName=[[tempdic objectForKey:@"WineName"] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    int cc=[[tempdic objectForKey:@"Vintage"] intValue];
    
    
    //NSLog(@"%d",cc);
    //[NSString stringWithFormat: @"%d",cc];
    [SingletonClass sharedInstance].wine.Vintage=[NSString stringWithFormat: @"%d",cc];
    
    
    NSArray *grapelist = [tempdic valueForKey:@"WineGrapeList"];
    NSString * tmp;
    
    NSMutableArray *ttt =[[NSMutableArray alloc] initWithObjects: nil];
    
    for (NSDictionary *groupDic in grapelist) {
        //Group *group = [[Group alloc] init];
        //groupDic
        tmp=[groupDic valueForKey:@"GrapeName"];
        [ttt addObject:tmp];
    }
    
    [SingletonClass sharedInstance].wine.grapearray=ttt;
    [SingletonClass sharedInstance].wine.WineTypeName=[tempdic objectForKey:@"WineTypeName"];
    [SingletonClass sharedInstance].wine.WineryRecommandation=[tempdic objectForKey:@"WineryRecommandation"];
    NSLog(@"%@",[SingletonClass sharedInstance].wine.WineryRecommandation);
    [SingletonClass sharedInstance].wine.FoodParing=[tempdic objectForKey:@"FoodParing"];
    [SingletonClass sharedInstance].wine.AppellationName=[tempdic objectForKey:@"AppellationName"];
    
    [SingletonClass sharedInstance].wine.PropertyOwner=[tempdic objectForKey:@"PropertyOwner"];
    [SingletonClass sharedInstance].wine.ClassementName=[tempdic objectForKey:@"ClassementName"];
    [SingletonClass sharedInstance].wine.ViticultureTypename=[tempdic objectForKey:@"ViticultureTypename"];
//    [SingletonClass sharedInstance].wine.WineryRecommandation=[tempdic objectForKey:@"WineryRecommandation"];
    
    
//  Number value
    NSNumber *ccc=[tempdic objectForKey:@"AverageMark"];
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setMinimumFractionDigits:1];
//    [SingletonClass sharedInstance].wine.AverageMark=[fmt stringFromNumber:ccc];
    
    [SingletonClass sharedInstance].wine.AverageMark=[IvinHelp strval:[fmt stringFromNumber:ccc] replacevalue:@"0.0"];

    
    
    NSMutableString * tempstring;
    tempstring=[[NSMutableString alloc] initWithString:[NSString stringWithFormat: @"%d", [[tempdic objectForKey:@"TotalMarkUser"] intValue]]];
    [SingletonClass sharedInstance].wine.TotalLike=[NSString stringWithFormat: @"%d", [[tempdic objectForKey:@"TotalLike"] intValue]];
    [tempstring appendString:@" ratings"];
    [SingletonClass sharedInstance].wine.TotalMarkUser= tempstring;
    
    
    
    
    [SingletonClass sharedInstance].wine.Tastingnotes=[tempdic objectForKey:@"Tastingnotes"];
    [SingletonClass sharedInstance].wine.WineGuide=[tempdic objectForKey:@"WineGuide"];
    [SingletonClass sharedInstance].wine.WineViticulture=[tempdic objectForKey:@"WineViticulture"];
    [SingletonClass sharedInstance].wine.WineMaking=[tempdic objectForKey:@"WineMaking"];
    [SingletonClass sharedInstance].wine.VintageDescription=[tempdic objectForKey:@"VintageDescription"];
    
    [SingletonClass sharedInstance].wine.WineTypeId=[[tempdic objectForKey:@"WineTypeId"] intValue];
    [tempdic objectForKey:@"WineGrapeList"];
    
    
    NSMutableString* someString = [IvinHelp strpreval: [SingletonClass sharedInstance].wine.PropertyOwner prevalue:@"PropertyOwner" join:@":"];
    NSMutableString* someString2 =[IvinHelp strpreval: [SingletonClass sharedInstance].wine.ClassementName prevalue:@"ClassementName" join:@":"];
    NSMutableString* someString3 =[IvinHelp strpreval: [SingletonClass sharedInstance].wine.ViticultureTypename prevalue:@"ViticultureTypename" join:@":"];
    [someString appendString: someString2];
    [someString appendString: someString3];
    
    [SingletonClass sharedInstance].wine.Wine=someString;
    
    someString = [IvinHelp strpreval: [SingletonClass sharedInstance].wine.Tastingnotes prevalue:@"Tastingnotes" join:@":"];
    someString2 =[IvinHelp strpreval: [SingletonClass sharedInstance].wine.WineGuide prevalue:@"WineGuide" join:@":"];
    [someString appendString: someString2];
    [SingletonClass sharedInstance].wine.Tasting=someString;

    
    someString = [IvinHelp strpreval: [SingletonClass sharedInstance].wine.WineViticulture prevalue:@"WineViticulture" join:@":"];
    someString2 =[IvinHelp strpreval: [SingletonClass sharedInstance].wine.WineMaking prevalue:@"WineMaking" join:@":"];
    someString3 =[IvinHelp strpreval: [SingletonClass sharedInstance].wine.VintageDescription prevalue:@"VintageDescription" join:@":"];
    [someString appendString: someString2];
    [someString appendString: someString3];
    //[SingletonClass sharedInstance].wine.PictureName=[tempdic objectForKey:@"PictureName"];
    [SingletonClass sharedInstance].wine.Making=someString;
    
    
    [SingletonClass sharedInstance].wine.WinePhotoUrl=[tempdic objectForKey:@"WinePhotoUrl"];

    
    [SingletonClass sharedInstance].wine.bi1=[SingletonClass sharedInstance].wine.Tastingnotes;
    [SingletonClass sharedInstance].wine.bi2=[SingletonClass sharedInstance].wine.WineGuide;
    [SingletonClass sharedInstance].wine.bi3=[SingletonClass sharedInstance].wine.VintageDescription;
    [SingletonClass sharedInstance].wine.bi4=[SingletonClass sharedInstance].wine.WineViticulture;
    [SingletonClass sharedInstance].wine.bi5=[SingletonClass sharedInstance].wine.WineMaking;
    
}


+ (void) wineryparse:(NSData *) winerycontent
//+ (Winery *) wineryparse:(NSData *) winerycontent
{
    //NSString * ggg=[[NSString alloc] initWithData:winerycontent encoding:NSUTF8StringEncoding];
    //NSLog(@"%@",ggg);
    
    Winery * temp=[[Winery alloc] init];
    NSError *error;
    NSDictionary *tempdic = [NSJSONSerialization JSONObjectWithData:winerycontent options:NSJSONReadingMutableLeaves error:&error];
    [SingletonClass sharedInstance].winery.Name=[tempdic objectForKey:@"Name"];
    
    [SingletonClass sharedInstance].winery.Description=[tempdic objectForKey:@"Description"];
    [SingletonClass sharedInstance].winery.DescriptionTitle=[tempdic objectForKey:@"DescriptionTitle"];
    [SingletonClass sharedInstance].winery.OwnerDescriptionTitle=[tempdic objectForKey:@"OwnerDescriptionTitle"];
    [SingletonClass sharedInstance].winery.OwnerDescription=[tempdic objectForKey:@"OwnerDescription"];
    [SingletonClass sharedInstance].winery.VineyardPresentationTitle=[tempdic objectForKey:@"VineyardPresentationTitle"];
    [SingletonClass sharedInstance].winery.VineyardPresentation=[tempdic objectForKey:@"VineyardPresentation"];
    [SingletonClass sharedInstance].winery.WinetoursTitle=[tempdic objectForKey:@"WinetoursTitle"];
    [SingletonClass sharedInstance].winery.Winetours=[tempdic objectForKey:@"Winetours"];
    
    

    
    
    [SingletonClass sharedInstance].winery.VinePresentation=[tempdic objectForKey:@"VinePresentation"];
    [SingletonClass sharedInstance].winery.OtherHistory=[IvinHelp strval:[tempdic objectForKey:@"OtherHistory"] replacevalue:@"Les hommes"];
    NSLog(@"");
    [SingletonClass sharedInstance].winery.OtherHistoryTitle=[IvinHelp strval:[tempdic objectForKey:@"OtherHistoryTitle"] replacevalue:@"No data"];//Les hommes
    
//    [SingletonClass sharedInstance].winery.Winetours=[tempdic objectForKey:@"Winetours"];

    
    [SingletonClass sharedInstance].winery.Mail=[tempdic objectForKey:@"Mail"];
    [SingletonClass sharedInstance].winery.Facebook=[tempdic objectForKey:@"Facebook"];
    [SingletonClass sharedInstance].winery.RegionName=[tempdic objectForKey:@"RegionName"];
    [SingletonClass sharedInstance].winery.ContactCountryName=[tempdic objectForKey:@"ContactCountryName"];
    [SingletonClass sharedInstance].winery.Address=[tempdic objectForKey:@"Address"];
    [SingletonClass sharedInstance].winery.City=[tempdic objectForKey:@"City"];
    [SingletonClass sharedInstance].winery.Phone=[tempdic objectForKey:@"Phone"];
    [SingletonClass sharedInstance].winery.Fax=[tempdic objectForKey:@"Fax"];
    [SingletonClass sharedInstance].winery.WebSite=[tempdic objectForKey:@"WebSite"];
    [SingletonClass sharedInstance].winery.Blog=[tempdic objectForKey:@"Blog"];
    [SingletonClass sharedInstance].winery.Tweeter=[tempdic objectForKey:@"Tweeter"];
    [SingletonClass sharedInstance].winery.Youtube=[tempdic objectForKey:@"Youtube"];
    [SingletonClass sharedInstance].winery.Wechat=[tempdic objectForKey:@"Wechat"];
    [SingletonClass sharedInstance].winery.Weibo=[tempdic objectForKey:@"Weibo"];
    [SingletonClass sharedInstance].winery.EShop=[tempdic objectForKey:@"EShop"];
    
    [SingletonClass sharedInstance].winery.PictureName=[tempdic objectForKey:@"PictureName"];
    [SingletonClass sharedInstance].winery.WineryPresentationPhotoName=[tempdic objectForKey:@"WineryPresentationPhotoName"];
    [SingletonClass sharedInstance].winery.VinePresentationPhotoName=[tempdic objectForKey:@"VinePresentationPhotoName"];
    [SingletonClass sharedInstance].winery.OtherHistoryPhotoName=[tempdic objectForKey:@"OtherHistoryPhotoName"];
    [SingletonClass sharedInstance].winery.WinetoursPhotoName=[tempdic objectForKey:@"WinetoursPhotoName"];
    
    
    
    NSMutableString* someString = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Mail prevalue:@"Email" join:@":"];
    NSMutableString* someString1 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Facebook prevalue:@"Facebook" join:@":"];
    NSMutableString* someString2 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Address prevalue:@"Address" join:@":"];
    NSMutableString* someString3 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.City prevalue:@"City" join:@":"];
    
    
    NSMutableString* someString4 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.ContactCountryName prevalue:@"Country" join:@":"];
    NSMutableString* someString5 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Phone prevalue:@"Phone" join:@":"];
    NSMutableString* someString6 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Fax prevalue:@"Fax" join:@":"];
    
    NSMutableString* someString7 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.WebSite prevalue:@"WebSite" join:@":"];
    NSMutableString* someString8 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Blog prevalue:@"Blog" join:@":"];
    NSMutableString* someString9 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Tweeter prevalue:@"Tweeter" join:@":"];
    
    NSMutableString* someString10 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Youtube prevalue:@"Youtube" join:@":"];
    NSMutableString* someString11 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Wechat prevalue:@"Wechat" join:@":"];
    NSMutableString* someString12 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.Weibo prevalue:@"Weibo" join:@":"];
    NSMutableString* someString13 = [IvinHelp strpreval: [SingletonClass sharedInstance].winery.EShop prevalue:@"EShop" join:@":"];

    [someString appendString: someString1];
    [someString appendString: someString2];
    [someString appendString: someString3];
    [someString appendString: someString4];
    [someString appendString: someString5];
    [someString appendString: someString6];
    [someString appendString: someString7];
    [someString appendString: someString8];
    [someString appendString: someString9];
    [someString appendString: someString10];
    [someString appendString: someString11];
    [someString appendString: someString12];
    [someString appendString: someString13];
    [SingletonClass sharedInstance].winery.Contact=someString;
    NSLog(@"%@",someString);
    [SingletonClass sharedInstance].winery.WineryPhotoUrl=[tempdic objectForKey:@"WineryPhotoUrl"];
    
    
    //small pictures
    [SingletonClass sharedInstance].winery.VineyardPresentationPhotoUrl=[IvinHelp strval:[tempdic objectForKey:@"VineyardPresentationPhotoUrl"] replacevalue:@"NOIMG"];
    [SingletonClass sharedInstance].winery.OwnerDescriptionPhotoUrl=[IvinHelp strval:[tempdic objectForKey:@"OwnerDescriptionPhotoUrl"] replacevalue:@"NOIMG"];
    [SingletonClass sharedInstance].winery.WinetoursPhotoUrl=[IvinHelp strval:[tempdic objectForKey:@"WinetoursPhotoUrl"] replacevalue:@"NOIMG"];

    [SingletonClass sharedInstance].winery.bc1=[SingletonClass sharedInstance].winery.Description;
    [SingletonClass sharedInstance].winery.bc2=[SingletonClass sharedInstance].winery.OwnerDescription;
    [SingletonClass sharedInstance].winery.bc3=[SingletonClass sharedInstance].winery.VineyardPresentation;
    [SingletonClass sharedInstance].winery.bc4=[SingletonClass sharedInstance].winery.Winetours;
    [SingletonClass sharedInstance].winery.bc5=[SingletonClass sharedInstance].winery.Contact;
}

@end



