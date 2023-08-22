//

import SwiftUI

struct BorderedView<Content: View>: View {
    
    let content: Content
    let foregroundColor: Color
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let font: Font
    
    init(textColor: Color = .white, backgroundColor: Color = .black, borderColor: Color = .orange, borderWidth: CGFloat = 2, font: Font = .caption2, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.foregroundColor = textColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.font = font
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
       content
            .padding(6)
            .bold()
            .font(font)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .clipShape(Capsule())
            .overlay (
                Capsule()
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        
    }
}

struct BorderedView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            BorderedView(textColor: .white, backgroundColor: .black, borderColor: .orange, borderWidth: 2, font: .caption2) {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}
