//
//  EnemySpawner.swift
//  SpriteKitWshop
//
//  Created by Bruno Pastre on 05/03/20.
//  Copyright © 2020 Bruno Pastre. All rights reserved.
//

import SpriteKit


class EnemySpawner: Updateable {
    
    var spawnCountdown: TimeInterval = TimeInterval(0)
    var scene: GameScene!
    var enemies: [Enemy]! = []
    
    init(_ gameScene: GameScene) {
        self.scene = gameScene
    }
    
    
    
    
    func update(_ deltaTime: CGFloat) {
        self.spawnCountdown -= TimeInterval(deltaTime)
        
        if spawnCountdown <= 0 {
            self.spawn()
            self.spawnCountdown = TimeInterval(Int.random(in: 1...3))
        }
        
//        for enemy in enemies {
//            let $0 = enemy
//            $0.update(deltaTime)
//        }
        
        
        self.enemies.forEach { $0.update(deltaTime) }
        self.clearEnemies()
    }
    
    func clearEnemies() {
        for (i, enemy) in self.enemies.enumerated() {
            if enemy.node.position.x < -self.scene.size.width / 2 {
                enemy.node.removeFromParent()
                self.enemies.remove(at: i)
            }
        }
    }
    
    func removeAll() {
        self.enemies.forEach { $0.node.removeFromParent() }
        self.enemies.removeAll()
    }
    
    func spawn() {
        let newEnemy = self.getNewEnemy()
        
        self.enemies.append(newEnemy)
        self.scene.addChild(newEnemy.node)
    }
    
    func getNewEnemy() -> Enemy {
        let enemyNode = self.scene.childNode(withName: "enemy")!.copy() as! SKSpriteNode
        let size = self.scene.size
        enemyNode.position = CGPoint(x: size.width, y: .random(in: -100...100))
        
        return Enemy(scene: self.scene, node: enemyNode)
    }
    
    
}
