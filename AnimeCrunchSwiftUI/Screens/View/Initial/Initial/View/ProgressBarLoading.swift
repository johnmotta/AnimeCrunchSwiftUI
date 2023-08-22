//

import SwiftUI

struct ProgressBarLoading: View {
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer? = nil // Adds a timer variable for reference
    
    @State private var isAnimated = false
    
    var body: some View {
        ZStack {
            if !isAnimated {
                VStack {
                    Text("Loading...")
                        .font(.title)
                        .foregroundColor(.secondary)
                    ZStack {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: 250, height: 20)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.orange)
                                .frame(width: 250 * min(progress, 1), height: 20)
                        }
                        
                        Text("\(Int(progress * 100))%")
                    }
                }
            }
        }
        .onAppear {
            startLoading()
        }
    }
    
    func startLoading() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            self.progress += 0.015
            if self.progress >= 1.0 {
                self.progress = 1.0
                timer.invalidate() // Invalidate the timer when the progress bar reaches 100%
            }
            if Int(progress * 100) == 100 {
                withAnimation(.easeOut) {
                    isAnimated = true
                }
            }
        }
    }
}

struct ProgressBarLoading_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarLoading()
    }
}
