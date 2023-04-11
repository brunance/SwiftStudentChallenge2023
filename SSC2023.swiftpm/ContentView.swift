import SwiftUI
import SpriteKit

struct ContentView: View {

    var scene: SKScene {
        let scene = GravityScene()
        scene.size = CGSize(width: 900, height: 900)
        scene.scaleMode = .fill
        return scene
    }

    var body: some View {
        VStack {
            Text("amoooo")
                .frame(width: 900, height: 200)
                .background(.cyan)
                .padding(.bottom, 100)
            SpriteView(scene: scene)
                .frame(width: 900, height: 900, alignment: .bottom)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        }
        //.padding(.top, 300)



    }
}
