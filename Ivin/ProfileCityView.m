//
//  ProfileCityView.m
//  Ivin
//
//  Created by user on 3/26/14.
//  Copyright (c) 2014 user. All rights reserved.
//

#import "ProfileCityView.h"
#import "words.h"
#import "SingletonClass.h"

@interface ProfileCityView ()
@end
NSArray *_pickerData;
UIPickerView * pickerView;
UIPickerView *myPickerView ;
NSArray* temp;

@implementation ProfileCityView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)click1
{
    [self.t2 resignFirstResponder];
    [self.text resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.text.layer.borderWidth =1.0;
    self.text.layer.cornerRadius =5.0;
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"3" ofType:@"png"]]];
    
    if ([[SingletonClass sharedInstance].lang isEqual:@"zh"])
    {
    temp=@[@"南非",@"阿尔巴尼亚",@"阿尔及利亚",@"德国",@"安道尔",@"阿根廷",@"亚美尼亚",@"澳大利亚",@"奥地利",@"阿塞拜疆",@"比利时",@"白俄罗斯",@"玻利维亚",@"波斯尼亚和黑塞哥维那",@"巴西",@"保加利亚",@"加拿大",@"佛得角",@"智利",@"中国",@"塞浦路斯",@"哥伦比亚",@"韩国",@"哥斯达黎加",@"科特迪瓦",@"克罗地亚",@"古巴",@"丹麦",@"埃及",@"西班牙",@"爱沙尼亚",@"美国",@"芬兰",@"法国",@"加蓬",@"格鲁吉亚",@"希腊",@"危地马拉",@"香港",@"匈牙利",@"伊郎",@"印度",@"印度尼西亚",@"爱尔兰",@"冰岛",@"以色列",@"意大利",@"日本",@"哈萨克斯坦",@"拉脱维亚",@"留尼汪",@"黎巴嫩",@"列支敦士登",@"立陶宛",@"利比亚",@"卢森堡",@"马其顿",@"马达加斯加",@"马来西亚",@"马耳他",@"摩洛哥",@"毛里求斯",@"墨西哥",@"摩尔多瓦",@"摩纳哥",@"黑山",@"纳米比亚",@"挪威",@"新西兰",@"荷兰",@"秘鲁",@"波兰",@"葡萄牙",@"卡塔尔",@"多米尼加共和国",@"捷克",@"罗马尼亚",@"英国",@"俄罗斯",@"圣马力诺",@"萨尔瓦多",@"塞内加尔",@"塞尔维亚共和国",@"新加坡",@"斯洛伐克共和国",@"斯洛文尼亚",@"叙利亚",@"瑞典",@"瑞士",@"坦桑尼亚",@"泰国",@"突尼斯",@"土耳其",@"塔希提",@"乌克兰",@"乌拉圭",@"梵蒂冈",@"委内瑞拉",@"越南",@"津巴布韦"];
    }
    
    else if ([[SingletonClass sharedInstance].lang isEqual:@"fr"])
    {
        temp=@[@"Afrique du Sud",@"Albanie",@"Algérie",@"Allemagne",@"Andorre",@"Argentine",@"Arménie",@"Australie",@"Autriche",@"Azerbaïdjan",@"Belgique",@"Biélorussie",@"Bolivie",@"Bosnie-Herzégovine",@"Brésil",@"Bulgarie",@"Canada",@"Cap-Vert",@"Chili",@"Chine",@"Chypre",@"Colombie",@"Corée du Sud",@"Costa Rica",@"Côte d'Ivoire",@"Croatie",@"Cuba",@"Danemark",@"Égypte",@"Espagne",@"Estonie",@"États-Unis",@"Finlande",@"France",@"Gabon",@"Géorgie",@"Grèce",@"Guatemala",@"Hong Kong",@"Hongrie",@"Iran",@"Inde",@"Indonésie",@"Irlande",@"Islande",@"Israël",@"Italie",@"Japon",@"Kazakhstan",@"Lettonie",@"Réunion",@"Liban",@"Liechtenstein",@"Lituanie",@"Libye",@"Luxembourg",@"Macédoine",@"Madagascar",@"Malaisie",@"Malte",@"Maroc",@"Maurice",@"Mexique",@"Moldavie",@"Monaco",@"Monténégro",@"Namibie",@"Norvège",@"Nouvelle-Zélande",@"Pays-Bas",@"Pérou",@"Pologne",@"Portugal",@"Qatar",@"République Dominicaine",@"République Tchèque",@"Roumanie",@"Royaume-Uni",@"Russie",@"Saint Marin",@"Salvador",@"Sénégal",@"Serbie",@"Singapour",@"Slovaquie",@"Slovénie",@"Syrie",@"Suède",@"Suisse",@"Tanzanie",@"Thaïlande",@"Tunisie",@"Turquie",@"Tahiti",@"Ukraine",@"Uruguay",@"Vatican",@"Venezuela",@"Viêt Nam",@"Zimbabwe"];
    }
    else{
        temp=@[@"South Africa",@"Albania",@"Algeria",@"Germany",@"Andorra",@"Argentina",@"Armenia",@"Australia",@"Austria",@"Azerbaijan",@"Belgium",@"Belarus",@"Bolivia",@"Bosnia and Herzegovina",@"Brazil",@"Bulgaria",@"Canada",@"Cape Verde",@"Chile",@"China",@"Cyprus",@"Colombia",@"South Korea",@"Costa Rica",@"Cote D'Ivoire",@"Croatia",@"Cuba",@"Denmark",@"Egypt",@"Spain",@"Estonia",@"United States",@"Finland",@"France",@"Gabon",@"Georgia",@"Greece",@"Guatemala",@"Hong Kong",@"Hungary",@"Iran",@"India",@"Indonesia",@"Ireland",@"Iceland",@"Israel",@"Italy",@"Japan",@"Kazakhstan",@"Latvia",@"Reunion (FR)",@"Lebanon",@"Liechtenstein",@"Lithuania",@"Libyan",@"Luxembourg",@"Macedonia",@"Madagascar",@"Malaysia",@"Malta",@"Morocco",@"Mauritius",@"Mexico",@"Moldova",@"Monaco",@"Montenegro",@"Namibia",@"Norway",@"New Zealand",@"Netherlands",@"Peru",@"Poland",@"Portugal",@"Qatar",@"Dominican Republic",@"Czech Republic",@"Romania",@"United Kingdom",@"Russia",@"San Marino",@"El Salvador",@"Senegal",@"Serbia",@"Singapore",@"Slovakia",@"Slovenia",@"Syrian",@"Sweden",@"Switzerland",@"Tanzania",@"Thailand",@"Tunisia",@"Turkey",@"Tahiti(FR)",@"Ukraine",@"Uruguay",@"Vatican",@"Venezuela",@"Viet Nam",@"Zimbabwe"];
    }
    
    _pickerData = temp;//@[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6"];
    _t2.delegate=self;
    
    
    UIPickerView *myPickerView =[[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, 100, 150)];
    myPickerView.dataSource=self;
    myPickerView.delegate=self;
    myPickerView.showsSelectionIndicator = YES;
    _t2.inputView = myPickerView;
    UIToolbar *myToolbar = [[UIToolbar alloc] initWithFrame:
                            CGRectMake(0,0, 320, 44)]; //should code with variables to support view resizing
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self action:@selector(inputAccessoryViewDidFinish)];
    [myToolbar setItems:[NSArray arrayWithObject: doneButton] animated:NO];
    _t2.inputAccessoryView = myToolbar;
    
    
    
    UITapGestureRecognizer* gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click1)];
    [self.view setUserInteractionEnabled:YES];
    [self.view addGestureRecognizer:gesture1];

}

-(void)inputAccessoryViewDidFinish
{
    [self.t2 resignFirstResponder];
    //_t2.text=[_pickerData objectAtIndex: [myPickerView selectedRowInComponent:1]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    
    _t2.text = [_pickerData objectAtIndex:row];
    
}


/*
- (BOOL) textFieldShouldBeginEditing:(UITextView *)textView
{

    return NO;
}*/



@end
