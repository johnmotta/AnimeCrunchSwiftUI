//

import SwiftUI

struct ProductCardView: View {
    let image: Image
    let name: String
    let classification: String
    let width: CGFloat
    let height: CGFloat
    
    @State private var isMenuVisible = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                image
                    .resizable()
                    .frame(width: width, height: height)
                switch classification {
                case "A12":
                    Text(classification)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .font(.caption)
                        .background(.yellow)
                        .overlay(
                            Rectangle()
                                .stroke(.white, lineWidth: 1.3)
                        )
                        .padding(10)
                case "A14":
                    Text(classification)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .font(.caption)
                        .background(.orange)
                        .overlay(
                            Rectangle()
                                .stroke(.white, lineWidth: 1.3)
                        )
                        .padding(10)
                default:
                    Text(classification)
                        .font(.callout)
                        .bold()
                        .foregroundColor(.white)
                        .font(.caption)
                        .background(.red)
                        .overlay(
                            Rectangle()
                                .stroke(.white, lineWidth: 1.3)
                        )
                        .padding(10)
                }
            }
            Text(name)
                .foregroundColor(Color("colorSet"))
                .padding(.horizontal)
            HStack {
                Text("Series")
                    .font(.caption)
                    .bold()
                    .foregroundColor(Color("colorSet"))
                    .padding(.horizontal)
                Spacer()
                   Button("\(Image(systemName: "ellipsis.circle"))") {
                       isMenuVisible.toggle()
                   }
                   .padding(.trailing)
                   .font(.title2)
                   .foregroundColor(Color("colorSet"))
                   .contextMenu {
                       Button(action: {}) {
                          Label("Add to queue", systemImage: "person.3.sequence")
                      }
                      Button(action: {}) {
                          Label("Watch Now", systemImage: "play")
                      }
                      Button(action: {}) {
                          Label("To Share", systemImage: "square.and.arrow.up")
                      }
                   }
                   .foregroundColor(Color("colorSet"))
                
//                Menu {
//                    Button(action: {}) {
//                        Label("Add to queue", systemImage: "person.3.sequence")
//                    }
//                    Button(action: {}) {
//                        Label("Watch Now", systemImage: "play")
//                    }
//                    Button(action: {}) {
//                        Label("To Share", systemImage: "square.and.arrow.up")
//                    }
//
//                } label: {
//                    Label("", systemImage: "ellipsis.circle")
//                        .font(.title3)
//                        .foregroundColor(Color("colorSet"))
//                }
            }
            .padding(.top, -5)
            .padding(.bottom, 10)
        }
        .frame(width: width)
        .background(.gray.opacity(0.5))
    }
}


struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Color.black
//                .edgesIgnoringSafeArea(.all)
            ProductCardView(image: Image("kimetsu"), name: "Demon Slayer", classification: "A12", width: 170, height: 240)
        }
    }
}

