//
//  PhysicsSpriteView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 17/04/23.
//

import Foundation
import SpriteKit

class PhysicsOneSpriteView: SKScene {
    let newTexture = SKTexture(imageNamed: "grass")
    let background = SKSpriteNode(texture:  SKTexture(imageNamed: "backgroundSpriteView"), size: CGSize(width: 900, height: 900))
    var grassy = SKSpriteNode()
    var groundy = SKSpriteNode()
    var touchLocation = CGPoint()
    var nodeBeingDragged: SKNode?
    var nodesToChange: [SKNode] = []
    var isBeingDragged = false
    var lastTouchLocation: CGPoint?

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        background.position = CGPoint(x: 450, y: 450)
        addChild(background)

        //character sprite here
        grassy = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        grassy.position = CGPoint(x: 450, y: 600)
        grassy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(grassy)

        var createCount = 9
        var position = 50
        while createCount > 0 {
            addInRangeFirstRow(addPosition: CGFloat(position))
            addInRangeSecondRow(addPosition: CGFloat(position))
            createCount = createCount - 1
            position = position + 100
        }
    }

    func addInRangeFirstRow(addPosition : CGFloat) {
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "ground"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 50)
        nodeFrame.name = "blockBtm"
        addChild(nodeFrame)
    }

    func addInRangeSecondRow(addPosition : CGFloat) {
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 150)
        nodeFrame.name = "blockTop"
        addChild(nodeFrame)
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let location = touch.location(in: self)
//        let box = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
//        box.position = location
//        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
//        addChild(box)
//    }
}
