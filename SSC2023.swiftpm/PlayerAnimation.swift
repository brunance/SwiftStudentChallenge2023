//
//  CharacterAnimation.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 13/04/23.
//

import Foundation
import SpriteKit

class PlayerAnimation: SKScene {

    var characterNode: SKSpriteNode?

    override func sceneDidLoad() {
        self.size = CGSize(width: 250, height: 250)
        self.scaleMode = .fill
        self.backgroundColor = .clear
    }

    override func didMove(to view: SKView) {
        setupScene()
        runAnim(emotion: "serious")
    }

    func setupScene() {
        removeAllActions()
        removeAllChildren()

        let textures: [SKTexture] = getTextures(with: "serious", textureAtlasName: "Character")

        characterNode = SKSpriteNode(texture: textures[0])
        characterNode?.position.x = self.size.width / 2
        characterNode?.position.y = self.size.height / 2
        characterNode?.scale(to: CGSize(width: 250, height: 250))
        addChild(characterNode!)
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
    
    public func runAnim(emotion: String) {
        let textures: [SKTexture] = getTextures(with: emotion, textureAtlasName: "Character")
        let action = SKAction.animate(with: textures,
                                      timePerFrame: 0.5 / TimeInterval(textures.count),
                                      resize: true,
                                      restore: true)
        characterNode?.run(SKAction.repeat(action, count: 8))
    }
}
