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

    public static var aboutAssetText: [TextData] = [
        .init(text: "First things first, I'm gonna tell you about Sprites. They're are important elements in digital games that help create the game's visual appearance.", emotion: "serious"),
        .init(text: "They're used to represent characters, objects, and other elements of the game. They can be animated or static, and are usually drawn in a graphics creation program.", emotion: "serious"),
        .init(text: "In the following screen you'll have a little canvas to paint the floor of our game scene, just press the play button bellow to begin.", emotion: "happy"),
    ]

    public static var assetText: [TextData] = [
        .init(text: "let's start with the basics, drag the grass block bellow to the respective empty spaces at the bottom of the screen.", emotion: "serious"),
        .init(text: "Second Text baby!", emotion: "surprised"),
        .init(text: "If you're lost and want to read these instructions again, simply press this button one more time for me to repeat what I just said.", emotion: "happy"),
    ]

    public static var gameobjText: [TextData] = [
        .init(text: "cooolzin.", emotion: "serious"),
        .init(text: "amooooo", emotion: "surprised"),
        .init(text: "eiiitaaaaaa", emotion: "happy"),
    ]

}
