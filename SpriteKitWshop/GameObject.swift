//
//  GameObject.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit

protocol Updateable {
    func update(_ deltaTime: CGFloat)
}

class GameObject: Updateable {
    
    internal init(scene: GameScene?, node: SKSpriteNode?) {
        self.scene = scene
        self.node = node
        
        self.configurePhysics()
    }
    
    
    var scene: GameScene!
    var node: SKSpriteNode!
    
    func update(_ deltaTime: CGFloat) {
        
    }
    
    func configurePhysics() {
        
    }
    
}
