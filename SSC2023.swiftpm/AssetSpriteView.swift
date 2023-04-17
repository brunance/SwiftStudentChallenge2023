//
//  Boxes.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 04/04/23.
//

import Foundation
import SwiftUI
import SpriteKit

class AssetSpriteView: SKScene {

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

        grassy = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        grassy.position = CGPoint(x: 600, y: 600)
        grassy.zPosition = 5
        addChild(grassy)

        groundy = SKSpriteNode(texture:  SKTexture(imageNamed: "ground"), size: CGSize(width: 100, height: 100))
        groundy.position = CGPoint(x: 300, y: 600)
        groundy.zPosition = 5
        addChild(groundy)

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
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "frame"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 50)
        nodeFrame.name = "blockBtm"
        addChild(nodeFrame)
    }

    func addInRangeSecondRow(addPosition : CGFloat) {
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "frame"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 150)
        nodeFrame.name = "blockTop"
        addChild(nodeFrame)
    }

    //nova função touches moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            let touchedNodes = nodes(at: touchLocation)

            for node in touchedNodes {
                if node == grassy {
                    isBeingDragged = true
                }
                else if let spriteNode = node as? SKSpriteNode {
                    if spriteNode == nodeBeingDragged {
                        continue
                    }
                    //Aqui é feita a verificação do nome, podes colocar pro second Row ter outra textura aqui :)
                    if isBeingDragged && spriteNode.name == "blockTop"{
                        spriteNode.texture = newTexture
                    }
                }
            }

            // Atualiza a posição do nó grassy utilizando a última posição do toque registrado
            if let lastTouchLocation = lastTouchLocation {
                let touchDelta = touchLocation - lastTouchLocation
                grassy.position =  grassy.position + touchDelta
            }
            lastTouchLocation = touchLocation
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBeingDragged = false
        lastTouchLocation = nil
    }

    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        guard let touch = touches.first else { return }
    //        let location = touch.location(in: self)
    //        let grass = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
    //        grass.position = location
    //        grass.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
    //        addChild(grass)
    //    }

}

extension CGPoint {
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
