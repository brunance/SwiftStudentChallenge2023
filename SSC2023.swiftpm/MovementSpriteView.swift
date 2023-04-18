//
//  MovementSpriteView.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 17/04/23.
//

import Foundation
import SpriteKit
import SwiftUI

class MovementSpriteView: SKScene, UIGestureRecognizerDelegate {

    let background = SKSpriteNode(texture:  SKTexture(imageNamed: "backgroundSpriteView"), size: CGSize(width: 900, height: 900))
    var player = PlayerNode()
    var direction : CGFloat = 0
    var velocity: CGFloat = 5
    var longPress = UILongPressGestureRecognizer()

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        background.position = CGPoint(x: 450, y: 450)
        addChild(background)

        //player = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        player.position = CGPoint(x: 450, y: 600)
        player.zPosition = 5
        player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(player)

        var createCount = 9
        var position = 50
        while createCount > 0 {
            addInRangeFirstRow(addPosition: CGFloat(position))
            addInRangeSecondRow(addPosition: CGFloat(position))
            createCount = createCount - 1
            position = position + 100
        }

        setupControls()
    }

    override func update(_ currentTime: TimeInterval) {
        if(direction != 0) {
            self.player.xScale = direction
            self.player.position.x += self.direction * velocity
        }

//        if player.position.x > 384 {
//            view?.presentScene(DragginScene.newScene())
//        }
    }

    func setupControls() {
        longPress.addTarget(self, action: #selector(walk))
        longPress.delegate = self
        longPress.minimumPressDuration = 0.01

        view!.addGestureRecognizer(longPress)
    }

    @objc func walk(sender: UILongPressGestureRecognizer){
        let touchPosition = sender.location(in: view!)

        if sender.state == .ended || sender.state == .cancelled {
            direction = 0
            player.changeAnimation(to: .idle)
            return
        }

        if touchPosition.x < self.view!.frame.width/2 {
            direction = -1
            player.changeAnimation(to: .walk)
        } else {
            direction = 1
            player.changeAnimation(to: .walk)
        }
    }

    func addInRangeFirstRow(addPosition : CGFloat) {
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "ground"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 50)
        nodeFrame.name = "blockBtm"
        nodeFrame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(nodeFrame)
    }

    func addInRangeSecondRow(addPosition : CGFloat) {
        let nodeFrame = SKSpriteNode(texture:  SKTexture(imageNamed: "grass"), size: CGSize(width: 100, height: 100))
        nodeFrame.position = CGPoint(x: addPosition, y: 150)
        nodeFrame.name = "blockTop"
        nodeFrame.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        addChild(nodeFrame)
    }
}
