//
//  CharacterAnimation.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 13/04/23.
//

import Foundation
import SpriteKit
import GameplayKit

class CharacterAnimation: SKScene {

    override func didMove(to view: SKView) {
        setupScene()
    }

    func setupScene() {
        removeAllActions()
        removeAllChildren()

        let textures: [SKTexture] = getTextures(with: "happy", textureAtlasName: "Character")

        let node = SKSpriteNode(texture: textures[0])
        node.position.x = self.size.width / 2
        node.position.y = self.size.height / 2
        node.scale(to: CGSize(width: 250, height: 250))
        addChild(node)

        let action = SKAction.animate(with: textures,
                                      timePerFrame: 1 / TimeInterval(textures.count),
                                      resize: true,
                                      restore: true)
        node.run(SKAction.repeat(action, count: 8))
    }

    func getTextures(with name: String, textureAtlasName: String) -> [SKTexture] {
        let textureAtlas = SKTextureAtlas(named: textureAtlasName)
        var textures: [SKTexture] = []
        let names = textureAtlas.textureNames.sorted()
        for i in 0...names.count - 1 {
            if names[i].contains(name) {
                let texture = textureAtlas.textureNamed(names[i])
                texture.filteringMode = .nearest
                textures.append(texture)
            }
        }
        return textures
    }
}
