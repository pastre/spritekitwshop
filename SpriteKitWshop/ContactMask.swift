//
//  ContactMask.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import Foundation

/*
00000000000000000000000000000001
00000000000000000000000000000010
 
 9
 10000
 00000000000000000000000000000011
 
 */

enum ContactMask: UInt32 {
    case player = 0b1
    case enemy = 0b10
    case floor = 0b100
}
