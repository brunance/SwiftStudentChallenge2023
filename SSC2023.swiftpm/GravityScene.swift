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

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        //self.backgroundColor = .blue
        background.position = CGPoint(x: 450, y: 450)
        addChild(background)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(box)
    }
}
