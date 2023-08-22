//

import SwiftUI

struct SpringAnimation: ViewModifier {
    let stiffness: Double
    let damping: Double
    
    func body(content: Content) -> some View {
        content
            .onChange(of: stiffness) { _ in
                withAnimation(.spring(response: 0.5, dampingFraction: damping, blendDuration: 0.5)) {}
            }
            .onChange(of: damping) { _ in
                withAnimation(.spring(response: 0.5, dampingFraction: damping, blendDuration: 0.5)) {}
            }
    }
}

extension View {
    func springAnimation(stiffness: Double, damping: Double) -> some View {
        self.modifier(SpringAnimation(stiffness: stiffness, damping: damping))
    }
}

