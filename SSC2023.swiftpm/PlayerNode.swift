//
//  PlayerNode.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 18/04/23.
//

import Foundation
import SpriteKit

public enum PlayerAnimationState {
    case idle, walk
}

class PlayerNode: SKNode {

    let sprite: SKSpriteNode
    var direction = 0
    var maxSpeed: CGFloat = 200

    override init() {
        self.sprite = SKSpriteNode(imageNamed: "grass")
        self.sprite.texture?.filteringMode = .nearest
        self.sprite.size = CGSize(width: 100, height: 100)
        super.init()

        self.addChild(sprite)
        changeAnimation(to: .idle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupBody(){
        let body = SKPhysicsBody(rectangleOf: sprite.size)
        body.restitution = 0
        body.mass = 0.1
        body.linearDamping = 3
        body.allowsRotation = false
        body.categoryBitMask = 1 << 0
        body.collisionBitMask = 1 << 0
        body.contactTestBitMask = 1 << 1
        sprite.physicsBody = body
    }

    public func changeAnimation(to state: PlayerAnimationState) {
        switch state {
        case .idle:
            sprite.run(.repeatForever(.animate(with: .init(withFormat: "player%@", range: 0...0), timePerFrame: 0.1)))
        case .walk:
            sprite.run(.repeatForever(.animate(with: .init(withFormat: "player%@", range: 0...3), timePerFrame: 0.1)))
        }
    }

}

public extension Array where Element == SKTexture {
    init (withFormat format: String, range: ClosedRange<Int>) {
        self = range.map({ (index) in
            let imageNamed = String(
                format: format, "\(index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}
