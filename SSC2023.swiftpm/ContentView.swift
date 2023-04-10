import SwiftUI
import SpriteKit

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct ContentView: View {
    var scene: SKScene {
        let scene = boxScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        SpriteView(scene: scene)
            .frame(width: 300, height: 400)
            .ignoresSafeArea()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
