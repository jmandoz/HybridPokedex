//
//  JBMPokemon.m
//  HybridPokedexMaster
//
//  Created by Jason Mandozzi on 7/2/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

#import "JBMPokemon.h"

@implementation JBMPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities
{
    //memberwise initializer for our class
    self = [super init];
    if (self != nil) {
        _pokemonName = name;
        //self.pokemonName = name
        _identifier = identifier;
        //self.identifier = idenitifier
        _abilities = abilities;
        //self.abilities = abilities
    }
    return self;
}




@end

@implementation JBMPokemon (JSONConvertable)

//refers to our top level dictionary
-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary
{
    //this is grabbing our key from our topLevelDictionary to assign the value
    NSString *name = topLevelDictionary[@"name"];
    //let name = dictionary["name"] as? String
    
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue];
    
    NSArray *abilitiesDict = topLevelDictionary[@"abilities"];
    
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    //let abilities : [String] = []
    
    //iterating though the ability dictionary with a for in loop
    for (NSDictionary *dictionary in abilitiesDict)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *abilityName = abilityDict[@"name"];
        [abilities addObject:abilityName];
    }
    //now we can initialize a pokemon with the accessed information above with our initWithPokemon
    return [self initWithPokemonName:name identifier:identifier abilities:abilities];
}

@end
