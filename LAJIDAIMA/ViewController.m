#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)NSMutableArray *lettersArr;
@property(strong,nonatomic)NSMutableArray *numbersArr;
@property(strong,nonatomic)NSMutableArray *lettersArrAndNumbers;
@property(strong,nonatomic)NSMutableArray *paramesNameArr;
@property(strong,nonatomic)NSMutableArray *paramesTypeArr;
@property(strong,nonatomic)NSMutableArray *systemStrArr;
@property(strong,nonnull)NSString *str;
//暂时int NSString* BOOL
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.paramesNameArr = [[NSMutableArray alloc] initWithCapacity:0];
    self.paramesTypeArr = [[NSMutableArray alloc] initWithCapacity:0];
    
    // Do any additional setup after loading the view, typically from a nib.
}
/*-(void)dasdwdaWithdasdsas:(int)dasdas asdsadas:(nsstring*)adas dasdasdas:(Bool)age{
 int dasdas = dasdas;
 nsstring sadas = adas;
 sadas* age = sadas;
 }
 */
- (IBAction)makeFuntion:(id)sender {
    self.str = @"";
    int letterNumber = 10;
    for (int i = 0 ; i<letterNumber; i++) {
        [self printCode];
    }
    NSLog(@"\n\n\n\n%@",self.str);
}
-(void)printCode{
    //参数个数
    //    int letterNumber = self.paramsNumber.text.intValue;
    int letterNumber = 1;
    [self.paramesNameArr removeAllObjects];
    [self.paramesTypeArr removeAllObjects];
    //根据number，重置这次所有的参数,还有类型
    for (int i = 0; i<letterNumber; i++) {
        [self.paramesNameArr addObject:[self getParamesName]];
        [self.paramesTypeArr addObject:[self getParamesType]];
    }
    
    int rtType = arc4random()%2;
    int rtLogo = arc4random()%2;//+ -
    int rtParamesInddex = arc4random()%(MAX(1, self.paramesNameArr.count));
    NSString *txtStr = @"";
    if (rtType==0) {
        //返回类型为void
        if (rtLogo==0) {
            //-
            txtStr = [txtStr stringByAppendingString:@"- (void)dyWeast"];
        }else{
            //+
            txtStr = [txtStr stringByAppendingString:@"+ (void)dyWeast"];
        }
    }else{
        //返回类型为某个参数
        if (rtLogo==0) {
            //-
            txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@"- (%@)dyWeast",self.paramesTypeArr[rtParamesInddex]]];
        }else{
            //+
            txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@"- (%@)dyWeast",self.paramesTypeArr[rtParamesInddex]]];
        }
    }
    txtStr = [txtStr stringByAppendingString:[self getPrexWithStr]];
    //-(void)dasdasWith
    for (int i = 0; i<self.paramesNameArr.count; i++) {
        if (self.paramesNameArr.count == 1) {
            txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@"%@:(%@)%@{\n",self.paramesNameArr[i],self.paramesTypeArr[i],self.paramesNameArr[i]]];
        }else{
            if (i==0) {
                txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@"%@:(%@)%@",self.paramesNameArr[i],self.paramesTypeArr[i],self.paramesNameArr[i]]];
            }else if (i==self.paramesNameArr.count-1){
                txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@" %@:(%@)%@{\n",self.paramesNameArr[i],self.paramesTypeArr[i],self.paramesNameArr[i]]];
                
            }else{
                txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@" %@:(%@)%@",self.paramesNameArr[i],self.paramesTypeArr[i],self.paramesNameArr[i]]];
            }
        }
        
    }
    //-(void)asdasdaWithad:(int)ad asdadas:(BOOL)asdadas{
    for (int i = 0; i<self.paramesNameArr.count; i++) {
        txtStr = [txtStr stringByAppendingString:[self getOneLineWithIndex:i]];
    }
    /*-(void)asdasdaWithad:(int)ad{
     int a = 1;
     NSString *b = @"dasdas";
     */
    for (int i = 0; i<self.paramesNameArr.count; i++) {
        txtStr = [txtStr stringByAppendingString:[self setNilFuntionWithInddex:i]];
    }
    /*-(void)asdasdaWithad:(int)ad{
     int a = 1;
     NSString *b = @"dasdas";
     a = 0;
     b = @"";
     */
    
    if (rtType==0) {
        txtStr = [txtStr stringByAppendingString:@"\n}\n"];
    }else{
        txtStr = [txtStr stringByAppendingString:[NSString stringWithFormat:@"return %@;",self.paramesNameArr[rtParamesInddex]]];
        txtStr = [txtStr stringByAppendingString:@"\n}\n"];
    }
    //    NSLog(@"txtStr:\n%@",txtStr);
    self.str = [self.str stringByAppendingString:txtStr];
    self.str = [self.str stringByAppendingString:@"\n"];
}
-(NSString*)getOneLineWithIndex:(int)index{
    //int a = 1
    NSString *line = @"";
    if ([self.paramesTypeArr[index] isEqualToString:@"int"]) {
        line = [NSString stringWithFormat:@"int the%@ = %d;\n",self.paramesNameArr[index],arc4random()%9999];
    }else if ([self.paramesTypeArr[index] isEqualToString:@"NSString*"]){
        line = [NSString stringWithFormat:@"NSString* the%@ = @\"%@\";\n",self.paramesNameArr[index],[self getPrexWithStrWithNum]];
    }else if ([self.paramesTypeArr[index] isEqualToString:@"BOOL"]){
        line = [NSString stringWithFormat:@"BOOL the%@ = %@;\n",self.paramesNameArr[index],arc4random()%2==0?@"TRUE":@"FALSE"];
    }
    return line;
}
//parame = nil ;
-(NSString*)setNilFuntionWithInddex:(int)index{
    NSString *line = @"";
    if ([self.paramesTypeArr[index] isEqualToString:@"int"]) {
        line = [NSString stringWithFormat:@"the%@ = 0;\n",self.paramesNameArr[index]];
    }else if ([self.paramesTypeArr[index] isEqualToString:@"NSString*"]){
        line = [NSString stringWithFormat:@"the%@ = @\"\";\n",self.paramesNameArr[index]];
    }else if ([self.paramesTypeArr[index] isEqualToString:@"BOOL"]){
        line = [NSString stringWithFormat:@"the%@ = %@;\n",self.paramesNameArr[index],arc4random()%2==0?@"TRUE":@"FALSE"];
    }
    return line;
}
-(NSString*)getPrexWithStr{
    //1-20位
    //1-10位，字母开头
    int random = arc4random()%3+1;
    NSString *str = @"";
    for (int i = 0; i<random; i++) {
        str = [str stringByAppendingString:[self.lettersArr objectAtIndex:arc4random()%self.lettersArr.count]];
    }
    str = [str stringByAppendingString:@"With"];
    return str;
}

-(NSString*)getPrexWithStrWithNum{
    //1-20位
    //1-10位，字母开头
    int random = arc4random()%3+1;
    NSString *str = @"";
    for (int i = 0; i<random; i++) {
        if (i==0) {
            str = [str stringByAppendingString:[self.lettersArr objectAtIndex:arc4random()%self.lettersArr.count]];
        }else{
            str = [str stringByAppendingString:[self.lettersArrAndNumbers objectAtIndex:arc4random()%self.lettersArrAndNumbers.count]];
        }
        
    }
    str = [str stringByAppendingString:@"With"];
    return str;
}
-(NSString *)getParamesName{
    //1-10位，字母开头
    int random = arc4random()%2+1;
    NSString *parames = @"";
    for (int i = 0; i<random; i++) {
        parames = [parames stringByAppendingString:[self.lettersArr objectAtIndex:arc4random()%self.lettersArr.count]];
    }
    //防止随机参数词语是if，return，void等与系统已命名过的词语冲突
    if ([self isStrDisCmoplictSystemWithStr:parames]) {
        //如果冲突，就将词语倒叙，如if - >if
        [self disStringWithStr:parames];
    }
    //先生成一个parames，在判断相同的话，就一直循环，直到不相同为止
    while ([self isSameToParamesArrOneParameWithStr:parames]) {
        for (int i = 0; i<random; i++) {
            if (i==0) {
                parames = [parames stringByAppendingString:[self.lettersArr objectAtIndex:arc4random()%self.lettersArr.count]];
            }else{
                parames = [parames stringByAppendingString:[self.lettersArrAndNumbers objectAtIndex:arc4random()%self.lettersArrAndNumbers.count]];
            }
            
        }
    }
    
    return parames;
}
//如果参数数组里已经有参数d，就不再生成参数d。
-(BOOL)isSameToParamesArrOneParameWithStr:(NSString*)str{
    for (int i = 0; i < self.paramesNameArr.count; i++) {
        if ([str isEqualToString:self.paramesNameArr[i]]) {
            return TRUE;
        }
    }
    return FALSE;
}
-(BOOL)isStrDisCmoplictSystemWithStr:(NSString*)str{
    for (int i = 0; i < self.systemStrArr.count; i++) {
        if ([str isEqualToString:self.systemStrArr[i]]) {
            return TRUE;
        }
    }
    return FALSE;
}
//if = fi , or =  ro , and = dna , while = elihw , return = nruter , super = repus , void = diov ,
-(NSString*)disStringWithStr:(NSString *)str{
    NSString *newStr = @"";
    for (int i = 0; i<str.length; i++) {
        newStr = [newStr stringByAppendingString:[NSString stringWithFormat:@"%@", [str substringWithRange:NSMakeRange(str.length-1-i, 1)] ]];
    }
    return newStr;
}
-(NSString *)getParamesType{
    NSArray*arr = @[@"int",@"NSString*",@"BOOL"];
    return arr[arc4random()%3];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSMutableArray *)lettersArr{
    if (!_lettersArr) {
        _lettersArr = [NSMutableArray arrayWithCapacity:0];
        [_lettersArr addObjectsFromArray:@[@"And",@"Bower",@"Can",@"Do",@"Expect",@"Figure",@"Get",@"Handler",@"Issue",@"Just",@"Kind",@"Like",@"Match",@"Nature",@"Offter",@"Pursue",@"Quit",@"Respect",@"Stick",@"Trigger",@"Urge",@"Value",@"With",@"Xl",@"Yet",@"Zeal"]];
    }
    return _lettersArr;
}
-(NSMutableArray *)numbersArr{
    if (!_numbersArr) {
        _numbersArr = [NSMutableArray arrayWithCapacity:0];
        [_numbersArr addObjectsFromArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
    }
    return _numbersArr;
}
-(NSMutableArray *)lettersArrAndNumbers{
    if (!_lettersArrAndNumbers) {
        _lettersArrAndNumbers = [NSMutableArray arrayWithCapacity:0];
        [_lettersArrAndNumbers addObjectsFromArray:self.lettersArr];
        [_lettersArrAndNumbers addObjectsFromArray:self.numbersArr];
    }
    return _lettersArrAndNumbers;
}
-(NSMutableArray *)systemStrArr{
    if (!_systemStrArr) {
        _systemStrArr = [NSMutableArray arrayWithCapacity:0];
        [_systemStrArr addObjectsFromArray:@[@"if",@"or",@"and",@"while",@"return",@"super",@"void"]];
        
    }
    return _systemStrArr;
}






@end  
