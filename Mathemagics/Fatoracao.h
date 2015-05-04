//
//  Fatoracao.h
//  Metodos Obj-C
//
//  Created by Gabriel Nopper on 16/04/15.
//  Copyright (c) 2015 Gabriel Nopper. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fatoracao : NSObject

-(void)generateAgrupamento;
-(void)generateFatorComum;
-(void)generateTrinomio;
+(int)getAnyFatorToArray:(NSMutableArray*)Array type:(NSInteger)type dominium:(int)xDominium complexity:(NSNumber*)complexity;

@end
