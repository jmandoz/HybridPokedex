//
//  JBMPokemon.h
//  HybridPokedexMaster
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JBMPokemon : NSObject

//Declare - property attributes -- proprty type - Name
@property (nonatomic, copy, readonly) NSString *pokemonName;
//let pokemonName: String

@property (nonatomic, readonly) NSInteger identifier;
//NSInteger is primitive and does not need a pointer

@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
                                   //ponter for string ^  ^pointer for the array

//Designated initializer
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities;  //Have not implemented yet, simply creating the memberwise init
/*
 SWIFT VERSION OF ^
 init(name: String, identifier: Int, abilities: [String]){
 
 }
*/

@end
//creating an extension of our class to convert JSON
@interface JBMPokemon (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;
//in Swift this^ would look like:
//init(with dictionary: [String:Any]) {
//
//}

@end


NS_ASSUME_NONNULL_END
