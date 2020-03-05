//
//  Enemy.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Enemy: GameObject {
    
    
    override func configurePhysics() {
        if let body = self.node.physicsBody {
            body.categoryBitMask = ContactMask.enemy.rawValue
            body.contactTestBitMask = ContactMask.player.rawValue
            body.collisionBitMask = 0
        }
    }
    override func update(_ deltaTime: CGFloat) {
        let dx = deltaTime * 200
        
        self.node.position.x -= dx
    }
    
}
