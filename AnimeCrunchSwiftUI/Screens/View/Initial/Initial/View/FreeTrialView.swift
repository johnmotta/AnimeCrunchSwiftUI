//

import SwiftUI

struct FreeTrialView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Image("1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 700)
                            Image("2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 700)
                            Image("3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 700)
                        }
                    }
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .font(.callout)
                        .offset(y: -100)
                }
                
                
                VStack {
                
                    Text("AnimeCrunch Premium")
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .padding(.top, 11)
                        .background(.black)
                        .foregroundColor(.orange)
                        .padding(.top, -10)
                    Text("Teste gratuito de 14 dias")
                        .foregroundColor(.white)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .background(.black)
                        .padding(.top, -10)
                        
                    Spacer()
                    
                    Button {} label: {
                        Text("Sign up with free trial")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            //.padding(.top, 16)
                            .background(.black)
                            .foregroundColor(.white)
                            //.padding(.top, -10)
                            .shadow(color: .black.opacity(0.5), radius:6 ,x:2, y:-8)
                            .shadow(color: .black.opacity(0.5), radius:5 ,x:1, y:-7)
                            .shadow(color: .black.opacity(0.5), radius:4 ,x:0, y:-6)
                            .shadow(color: .black.opacity(0.5), radius:3 ,x:-1, y:-5)
                            .shadow(color: .black.opacity(0.5), radius:2 ,x:-2, y:-4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.orange, lineWidth: 2)
                                    .padding(.horizontal)
//                                    .padding(.top, -5)
//                                    .padding(.bottom, -7)
                            )
                    }
                }
            }
        }
    }
}

struct FreeTrialView_Previews: PreviewProvider {
    static var previews: some View {
        FreeTrialView()
    }
}
