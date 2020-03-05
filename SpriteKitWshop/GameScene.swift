//
//  GameScene.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player: Player!
    var enemySpawner: EnemySpawner!
    
    var lastTime: TimeInterval = TimeInterval(0)
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
    }
    
    override func sceneDidLoad() {
       let playerNode = self.childNode(withName: "player") as! SKSpriteNode
        
        self.player = Player(scene: self, node: playerNode)
        self.enemySpawner = EnemySpawner(self)
        
        self.configureFloor()
    }
    
    func configureFloor() {
        let floorNode = self.childNode(withName: "floor")!
        
        floorNode.physicsBody?.restitution = 0
        floorNode.physicsBody?.categoryBitMask  = ContactMask.floor.rawValue
        floorNode.physicsBody?.contactTestBitMask = 0
        floorNode.physicsBody?.collisionBitMask = ContactMask.player.rawValue
    }
    

     override func update(_ currentTime: TimeInterval) {
         // space = vel * time
        
        if lastTime == 0 {
            lastTime = currentTime
            return
        }
        
        let deltaTime = currentTime - lastTime

        lastTime = currentTime
        
        self.player.update(CGFloat(deltaTime))
        self.enemySpawner.update(CGFloat(deltaTime))
     }
    
    // MARK: - ContactDelegate
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Tocou")
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("Destocou")
    }

    
    // MARK: - Touch methods
    
    func touchDown(atPoint pos : CGPoint) {
        self.player.startFlying()
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        self.player.stopFlying()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    }
