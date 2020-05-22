//
//  GameScene.swift
//  breakout
//
//  Created by Oscar Bankowski on 3/9/20.
//  Copyright © 2020 Oscar Bankowski. All rights reserved.
//

import SpriteKit
import GameplayKit
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball = SKShapeNode()
    var paddle = SKSpriteNode()
    var brick = SKSpriteNode()
    var brick2 = SKSpriteNode()
    var brick3 = SKSpriteNode()
    var brick4 = SKSpriteNode()
    var brick5 = SKSpriteNode()
    var brick6 = SKSpriteNode()
    var brick7 = SKSpriteNode()
    var brick8 = SKSpriteNode()
    var brick9 = SKSpriteNode()
    var loseZone = SKSpriteNode()
    var score:Int = 0
    var brickLives = 3
    var brick2Lives = 3
    var brick3Lives = 3
    var brick4Lives = 2
    var brick5Lives = 2
    var brick6Lives = 2
    
    
    
    
    
    override func didMove(to view: SKView) {
        createBackground()
        makeBall()
        makePaddle()
        score = 0
        brickLives = 3
        brick2Lives = 3
        brick3Lives = 3
        brick4Lives = 2
        brick5Lives = 2
        brick6Lives = 2
        makeBrick()
        makeBrick2()
        makeBrick3()
        makeBrick4()
        makeBrick5()
        makeBrick6()
        makeBrick7()
        makeBrick8()
        makeBrick9()
        makeLoseZone()
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 5))
    }
    
    func restartGame() {
        brick.removeFromParent()
        brick2.removeFromParent()
        brick3.removeFromParent()
        brick4.removeFromParent()
        brick5.removeFromParent()
        brick6.removeFromParent()
        brick7.removeFromParent()
        brick8.removeFromParent()
        brick9.removeFromParent()
        score = 0
        brickLives = 3
        brick2Lives = 3
        brick3Lives = 3
        brick4Lives = 2
        brick5Lives = 2
        brick6Lives = 2
        makeBall()
        makeBrick()
        makeBrick2()
        makeBrick3()
        makeBrick4()
        makeBrick5()
        makeBrick6()
        makeBrick7()
        makeBrick8()
        makeBrick9()
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 5))
    }
    
    func createBackground() {
        let stars = SKTexture(imageNamed: "Stars")
        for i in 0...1 {
            let starsBackground = SKSpriteNode(texture: stars)
            starsBackground.zPosition = -1
            starsBackground.position = CGPoint(x: 0, y: starsBackground.size.height * CGFloat(i))
            addChild(starsBackground)
            let moveDown = SKAction.moveBy(x: 0, y: -starsBackground.size.height, duration: 20)
            let moveReset = SKAction.moveBy(x: 0, y: starsBackground.size.height, duration: 0)
            let moveLoop = SKAction.sequence([moveDown, moveReset])
            let moveForever = SKAction.repeatForever(moveLoop)
            starsBackground.run(moveForever)
        }
    }
    
    func makeBall() {
        ball = SKShapeNode(circleOfRadius: 10)
        ball.position = CGPoint(x: frame.midX, y: frame.midY-400)
        ball.strokeColor = .black
        ball.fillColor = .yellow
        ball.name = "ball"
        
        //physics shape matches ball image
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        //ignores all forces and impulces
        ball.physicsBody?.isDynamic = false
        // use precise collision detection
        ball.physicsBody?.usesPreciseCollisionDetection = true
        //no loss of energy from fiction
        ball.physicsBody?.friction = 0
        //gravity is not a factor
        ball.physicsBody?.affectedByGravity = false
        // bounces fully off of other objects
        ball.physicsBody?.restitution = 1
        //does not slow down over time
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
        
        addChild(ball) //added ball object to the view
        
    }
    func makePaddle() {
        paddle = SKSpriteNode(color: .white, size: CGSize(width: frame.width/4, height: 20))
        paddle.position = CGPoint(x: frame.midX-100, y: frame.minY + 125)
        paddle.name = "paddle"
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.isDynamic = false
        addChild(paddle)
        
    }
    
    func makeBrick() {
        if brickLives == 3 {
            brick = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 20))
        }
        if brickLives == 2 {
            brick = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brickLives == 1 {
            brick = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick.position = CGPoint(x: frame.midX-150, y: frame.maxY - 50)
        brick.name = "brick"
        brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick.physicsBody?.isDynamic = false
        if brickLives == 0 {
            score += 1
        }
        else {
            addChild(brick)
        }
    }
    func makeBrick2() {
        if brick2Lives == 3 {
            brick2 = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 20))
        }
        if brick2Lives == 2 {
            brick2 = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brick2Lives == 1 {
            brick2 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick2.position = CGPoint(x: frame.midX, y: frame.maxY - 50)
        brick2.name = "brick2"
        brick2.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick2.physicsBody?.isDynamic = false
        if brick2Lives == 0 {
            score += 1
        }
        else {
            addChild(brick2)
        }
    }
    func makeBrick3() {
        if brick3Lives == 3 {
            brick3 = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 20))
        }
        if brick3Lives == 2 {
            brick3 = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brick3Lives == 1 {
            brick3 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick3.position = CGPoint(x: frame.midX+150, y: frame.maxY - 50)
        brick3.name = "brick3"
        brick3.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick3.physicsBody?.isDynamic = false
        if brick3Lives == 0 {
            score += 1
        }
        else {
            addChild(brick3)
        }
    }
    func makeBrick4() {
        if brick4Lives == 2 {
            brick4 = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brick4Lives == 1 {
            brick4 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick4.position = CGPoint(x: frame.midX-150, y: frame.maxY - 100)
        brick4.name = "brick4"
        brick4.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick4.physicsBody?.isDynamic = false
        if brick4Lives == 0 {
            score += 1
        }
        else {
            addChild(brick4)
        }
    }
    func makeBrick5() {
        if brick5Lives == 2 {
            brick5 = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brick5Lives == 1 {
            brick5 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick5.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
        brick5.name = "brick5"
        brick5.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick5.physicsBody?.isDynamic = false
        if brick5Lives == 0 {
            score += 1
        }
        else {
            addChild(brick5)
        }
    }
    func makeBrick6() {
        if brick6Lives == 2 {
            brick6 = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 20))
        }
        if brick6Lives == 1 {
            brick6 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        }
        brick6.position = CGPoint(x: frame.midX+150, y: frame.maxY - 100)
        brick6.name = "brick6"
        brick6.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick6.physicsBody?.isDynamic = false
        if brick6Lives == 0 {
            score += 1
        }
        else {
            addChild(brick6)
        }
    }
    func makeBrick7() {
        brick7 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        brick7.position = CGPoint(x: frame.midX-150, y: frame.maxY - 150)
        brick7.name = "brick7"
        brick7.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick7.physicsBody?.isDynamic = false
        addChild(brick7)
    }
    func makeBrick8() {
        brick8 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        brick8.position = CGPoint(x: frame.midX, y: frame.maxY - 150)
        brick8.name = "brick8"
        brick8.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick8.physicsBody?.isDynamic = false
        addChild(brick8)
    }
    func makeBrick9() {
        brick9 = SKSpriteNode(color: .green, size: CGSize(width: 100, height: 20))
        brick9.position = CGPoint(x: frame.midX+150, y: frame.maxY - 150)
        brick9.name = "brick9"
        brick9.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
        brick9.physicsBody?.isDynamic = false
        addChild(brick9)
    }
    
    
    func makeLoseZone() {
        loseZone = SKSpriteNode(color: .red, size: CGSize(width: frame.width, height: 20))
        loseZone.position = CGPoint(x: frame.midX, y: frame.minY + 25)
        loseZone.name = "loseZone"
        loseZone.physicsBody = SKPhysicsBody(rectangleOf: loseZone.size)
        loseZone.physicsBody?.isDynamic = false
        addChild(loseZone)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddle.position.x = location.x
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            paddle.position.x = location.x
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "brick" ||
            contact.bodyB.node?.name == "brick" {
            brick.removeFromParent()
            brickLives -= 1
            makeBrick()
        }
        if contact.bodyA.node?.name == "brick2" ||
            contact.bodyB.node?.name == "brick2" {
            brick2.removeFromParent()
            brick2Lives -= 1
            makeBrick2()
        }
        if contact.bodyA.node?.name == "brick3" ||
            contact.bodyB.node?.name == "brick3" {
            brick3.removeFromParent()
            brick3Lives -= 1
            makeBrick3()
        }
        if contact.bodyA.node?.name == "brick4" ||
            contact.bodyB.node?.name == "brick4" {
            brick4.removeFromParent()
            brick4Lives -= 1
            makeBrick4()
        }
        if contact.bodyA.node?.name == "brick5" ||
            contact.bodyB.node?.name == "brick5" {
            brick5.removeFromParent()
            brick5Lives -= 1
            makeBrick5()
        }
        if contact.bodyA.node?.name == "brick6" ||
            contact.bodyB.node?.name == "brick6" {
            brick6.removeFromParent()
            brick6Lives -= 1
            makeBrick6()
        }
        if contact.bodyA.node?.name == "brick7" ||
            contact.bodyB.node?.name == "brick7" {
            score += 1
            brick7.removeFromParent()
        }
        if contact.bodyA.node?.name == "brick8" ||
            contact.bodyB.node?.name == "brick8" {
            score += 1
            brick8.removeFromParent()
        }
        if contact.bodyA.node?.name == "brick9" ||
            contact.bodyB.node?.name == "brick9" {
            brick9.removeFromParent()
        }
        if score == 9 {
            print("You win!")
        }
        if contact.bodyA.node?.name == "loseZone" ||
            contact.bodyB.node?.name == "loseZone" {
            print("You lose!")
            ball.removeFromParent()
            restartGame()
        }
    }
    
}
