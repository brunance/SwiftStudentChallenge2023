//
//  GameObjSpriteView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 17/04/23.
//

import Foundation
import SpriteKit

class GameObjSpriteView: SKScene {
    let newTexture = SKTexture(imageNamed: "grass")
    let background = SKSpriteNode(texture:  SKTexture(imageNamed: "backgroundSpriteView"), size: CGSize(width: 900, height: 900))
    var player = PlayerNode()
    var touchLocation = CGPoint()
    var nodeBeingDragged: SKNode?
    var nodesToChange: [SKNode] = []
    var isBeingDragged = false
    var lastTouchLocation: CGPoint?

    override func didMove(to view: SKView) {
        background.position = CGPoint(x: 450, y: 450)
        addChild(background)

        //player = SKSpriteNode(texture:  SKTexture(imageNamed: "frame"), size: CGSize(width: 100, height: 100))
        player.position = CGPoint(x: 450, y: 600)
        player.zPosition = 5
        addChild(player)

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

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)

            for node in touchedNodes {
                if node == player {
                    isBeingDragged = true
                }
                else if let spriteNode = node as? SKSpriteNode {
                    if spriteNode == nodeBeingDragged {
                        continue
                    }
                }
            }

            if let lastTouchLocation = lastTouchLocation {
                let touchDelta = touchLocation - lastTouchLocation
                player.position =  player.position + touchDelta
            }
            lastTouchLocation = touchLocation
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBeingDragged = false
        lastTouchLocation = nil
    }
}
