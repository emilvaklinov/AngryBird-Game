//
//  GameScene.swift
//  AngryBird Game
//
//  Created by Emil Vaklinov on 10/06/2020.
//  Copyright © 2020 Emil Vaklinov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

//    var bird2 = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    override func didMove(to view: SKView) {
//        let texture = SKTexture(imageNamed: "bird")
//        bird2 = SKSpriteNode(texture: texture)
//        bird2.position = CGPoint(x: -self.frame.width / 4, y: -self.frame.height / 4)
//        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
//        bird2.zPosition = 1
//        self.addChild(bird2)
   
        // Physics body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        
        //Birds
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "burd")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
      
        // Boxes
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 8, height: boxTexture.size().height / 8)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.mass = 0.4
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.mass = 0.4

        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.mass = 0.4

        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.mass = 0.4

        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.mass = 0.4

        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
//        bird.physicsBody?.affectedByGravity = true
        
        if gameStarted == false {
            
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
                  
                  if let touch = touches.first {
                      let touchLocation = touch.location(in: self)
                      let touchNodes = nodes(at: touchLocation)
                      
                      if touchNodes.isEmpty == false {
                          
                          for node in touchNodes {
                              if let sprite = node as? SKSpriteNode {
                                  if sprite == bird {
                                      bird.position = touchLocation
                                  }
                              }
                          }
                      }
                  }
              }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        if gameStarted == false {
        if let touch = touches.first {
                   let touchLocation = touch.location(in: self)
                   let touchNodes = nodes(at: touchLocation)
                   
                   if touchNodes.isEmpty == false {
                       
                       for node in touchNodes {
                           if let sprite = node as? SKSpriteNode {
                               if sprite == bird {
                                  
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                let impuls = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impuls)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                               }
                           }
                       }
                   }
               }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
