//
//  Player.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

class Player: GameObject {
    
    var isFlying: Bool! = false
    
    override func configurePhysics() {
        if let body = self.node.physicsBody {
            
            body.categoryBitMask = ContactMask.player.rawValue
            body.contactTestBitMask = ContactMask.enemy.rawValue
            body.collisionBitMask = ContactMask.floor.rawValue
        }
    }
    
    func startFlying() {
        self.isFlying = true
    }
    
    func stopFlying() {
        self.isFlying = false
    }
    
    override func update(_ deltaTime: CGFloat) {
        if self.isFlying {
            self.node.physicsBody?.applyForce(CGVector(dx: 0, dy: 5000))
        }
    }
}
