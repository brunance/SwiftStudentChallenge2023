//
//  TextData.swift
//  SSC2023
//
//  Created by Bruno França do Prado on 15/04/23.
//

import Foundation
import SwiftUI

struct TextData {
    var text: String
    var emotion: String

    public static var aboutStepOneText: [TextData] = [
        .init(text: "First things first, I'm gonna tell you about Sprites. They're are important elements in digital games that help create the game's visual appearance.", emotion: "serious"),
        .init(text: "They're used to represent characters, objects, and other elements of the game. They can be animated or static, and are usually drawn in a graphics creation program.", emotion: "serious"),
        .init(text: "In the following screen you'll have a little canvas to paint the floor of our game scene, just press the play button bellow to begin.", emotion: "happy"),
    ]

    public static var assetText: [TextData] = [
        .init(text: "let's start with the basics, drag the blocks bellow to the respective empty spaces at the bottom of the screen.", emotion: "serious"),
        .init(text: "When you are finished, press the red play button down the screen to proceed with the experience!", emotion: "happy"),
        .init(text: "If you're lost and want to read these instructions again, simply press this button one more time for me to repeat what I just said.", emotion: "happy"),
    ]

    public static var aboutStepTwoText: [TextData] = [
        .init(text: "So, now that we have a floor we should create a game object for our main character - in a later moment, it'll be able to move at any direction!", emotion: "serious"),
        .init(text: "But what is a game object? They are typically defined as any entity that exists within the game world and can be interacted with by the player or other game objects.", emotion: "serious"),
        .init(text: "Game objects can represent a wide range of things within a game, including characters, enemies, items, obstacles, and environmental elements.", emotion: "happy"),
    ]

    public static var gameObjText: [TextData] = [
        .init(text: "As you can see, here we have our litle character sprite (you can drag it to wherever position you like).", emotion: "serious"),
        .init(text: "But there's a little problem, for our character to interact with our ground we will need some physics!", emotion: "surprised"),
        .init(text: "I'll add some to our character and see what happens...", emotion: "happy"),
    ]

    public static var physicsOneText: [TextData] = [
        .init(text: "Oops, it looks like something went wrong. What could have happened right now?", emotion: "surprised"),
        .init(text: "Oh of course, our floor does not have physical properties - it's just a sprite!", emotion: "surprised"),
        .init(text: "But if we add physics to it i'm pretty sure we can make this character stand on the ground.", emotion: "happy"),
    ]

    public static var physicsTwoText: [TextData] = [
        .init(text: "Tap anywhere in the screen to spawn out little character and see if it stays on the ground.", emotion: "serious"),
        .init(text: "Oh great! Now our little guy has an appearance and can stand on his own two feet.", emotion: "surprised"),
        .init(text: "You can tap to add more of him in the scene, try it out it's quite fun.", emotion: "happy"),
    ]

    public static var aboutStepThreeText: [TextData] = [
        .init(text: "We are reaching the final steps of the experience, our character still need more things...", emotion: "serious"),
        .init(text: "Some type of movement and animation will sure make him look more alive!", emotion: "surprised"),
        .init(text: "These are essential for creating immersive and engaging gameplay, let me show you how it looks.", emotion: "happy"),
    ]

    public static var movementText: [TextData] = [
        .init(text: "Here we have the little man again, but check this out...", emotion: "serious"),
        .init(text: "if you tap and hold in each sides of the screen, he will move!", emotion: "happy"),
        .init(text: "and there we have it, a nice little sprite with animation, physics and movement.", emotion: "happy"),
    ]

}
