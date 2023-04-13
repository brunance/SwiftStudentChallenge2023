//
//  Boxes.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 04/04/23.
//

import Foundation
import SwiftUI
import SpriteKit

class GravityScene: SKScene {
    let background = SKSpriteNode(imageNamed: "backzinho")
    let ground = SKSpriteNode(imageNamed: "ground")


    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        background.position = CGPoint(x: 450, y: 450)
        addChild(background)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let grass = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        //let box = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        //grass
        grass.position = location
        grass.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(grass)
    }
}
