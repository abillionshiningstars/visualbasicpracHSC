//  Created by Akira Li (yes hi ms chen that is me) on 25/10/2022-12/10/2022.
//

import SwiftUI
import AVKit
import AVFoundation

// the page that opens when the user opens the application
struct ContentView: View {
    // a variable determining whether the button has been pressed or not
    @State private var navigated = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Text("Café solitude")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .lineLimit(0)
                .padding()
            // this button will open the main screen
            Button("Begin session"){
                navigated.toggle()
            }
                .padding()
                .fontWeight(.medium)
                .background(.brown)
                .foregroundColor(.white)
                .clipShape(Capsule())
            // credits
            Text("Inspired by Noisli.\n Icons by icons8.")
                .font(.caption)
                .fontWeight(.regular)
                .foregroundColor(Color.gray)
                .padding(.top, 100.0)
            
            
        }
        .padding()
        .sheet(isPresented: $navigated) {
            MainView()
        } // creates a sheet so that the main view appears on top of the opening screen
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

let audioSession = AVAudioSession.sharedInstance()

private func initPlayer(_ filename: String) -> AVAudioPlayer {
    let path: String! = Bundle.main.resourcePath?.appending("/\(filename).mp3")
    let mp3 = NSURL(fileURLWithPath: path)
    var player: AVAudioPlayer = AVAudioPlayer()
    do {
        try audioSession.setCategory(.ambient)
        player = try AVAudioPlayer(contentsOf: mp3 as URL)
        player.prepareToPlay() //prepares it to play
    } catch {
          // error
    }
    return player
}





struct MainView: View {
    @State private var cp = false
    @State private var fp = false
    @State private var rp = false
    @State private var wp = false
    @State var coffeePlayer = initPlayer("cafe-ambience-sound")
    @State var firePlayer = initPlayer("free-flame-sound")
    @State var rainPlayer = initPlayer("free-rain-and-thunder-audio-loop")
    @State var wavePlayer = initPlayer("water-white-noise-sound")
    var body: some View {
            VStack(spacing: 40) {
                Text("Mix and match sounds to create \n a calming atmosphere")
                    .fontWeight(.medium)
                    .padding()
                    .multilineTextAlignment(.center)
                // creates a vertical stack for the grid
                HStack(spacing: 40) {
                    Button(action: {
                        if (!fp){
                            firePlayer.numberOfLoops = -1
                            self.firePlayer.play()
                        }
                        else {
                            self.firePlayer.pause()
                        }
                        fp.toggle()
                        }, label: {
                            Image("icons8-campfire-90").renderingMode(.template).foregroundColor(Color.orange)
                        })
                        .aspectRatio(1.0, contentMode: .fit)
                    Button(action: {
                        if (!cp){
                            coffeePlayer.numberOfLoops = -1
                            self.coffeePlayer.play()
                        }
                        else {
                            self.coffeePlayer.pause()
                        }
                        }, label: {
                            Image("icons8-cafe-90").renderingMode(.template)
                            .foregroundColor(Color.brown)
                        })
                        .aspectRatio(1.0, contentMode: .fit)
                        
                    
                }
                HStack(spacing: 40) {
                    Button(action: {
                        if (!rp){
                            rainPlayer.numberOfLoops = -1
                            self.rainPlayer.play()
                        }
                        else {
                            self.rainPlayer.pause()
                        }
                        }, label: {
                            Image("icons8-torrential-rain-90").renderingMode(.template).foregroundColor(Color.gray)
                        })
                        .aspectRatio(1.0, contentMode: .fit)
                    Button(action: {
                        if (!wp){
                            wavePlayer.numberOfLoops = -1
                            self.wavePlayer.play()
                        }
                        else {
                            self.wavePlayer.pause()
                        }

                        }, label: {
                            Image("icons8-water-element-90").renderingMode(.template).foregroundColor(Color.cyan)
                        })
                        .aspectRatio(1.0, contentMode: .fit)
                }
                Text("Click the button again to pause")
                    .fontWeight(.medium)
                    .padding()
                    .multilineTextAlignment(.center)
            }.aspectRatio(contentMode: .fit)
            .padding()
        
    }
    
}
struct HelpMe: View {
    var body: some View {
        Text("help me")
            .padding()
    }
    
}
