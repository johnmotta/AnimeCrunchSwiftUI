//

import SwiftUI
import AVKit

struct PlayView: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "movie", withExtension: "mp4")!)
    
    @State var isPlaying: Bool = false
        
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .frame(width: 320, height: 180, alignment: .center)

            Button {
                isPlaying ? player.pause() : player.play()
                isPlaying.toggle()
                player.seek(to: .zero)
            } label: {
                Image(systemName: isPlaying ? "stop" : "play")
                    .padding()
            }
            .foregroundColor(Color("colorSet"))
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
