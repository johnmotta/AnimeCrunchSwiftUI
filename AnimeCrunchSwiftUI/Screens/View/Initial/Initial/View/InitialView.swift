//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State private var isAnimation = false
    
    var body: some View {
        NavigationStack {
            
            Group {
                switch loginViewModel.screen {
                case .loading:
                    VStack {
                        ProgressBarLoading()
                    }
                case .startScreen:
                    ZStack {
                        
                        Color.black
                            .ignoresSafeArea()
                            .opacity(isAnimation ? 1 : 0)
                        
                        Image("login")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .mask(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [.clear, .black]
                                    ),
                                    startPoint: .bottom,
                                    endPoint: .top
                                )
                            )
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Spacer()
                            
                            VStack {
                                AppBarView(image: "logo", name: "animecrunch", isSearchButton: false, isAirplay: false)
                                Text("All your favorite Japanese animations. Now gathered in one place.")
                                    .foregroundColor(Color("colorSet"))
                                    .padding()
                                    .bold()
                                    .multilineTextAlignment(.center)
                                
                                
                                NavigationLink("\(Image(systemName: "crown")) TRY THE FREE TRIAL", destination: FreeTrialView())
                                    .tint(Color("colorSet"))
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.orange, lineWidth: 2)
                                        
                                            .padding(.horizontal)
                                            .padding(.top, -10)
                                            .padding(.bottom, -12)
                                    )
                                    .padding()
                                
                                
                                NavigationLink("Login",destination: LoginScreenView())
                                    .accessibilityIdentifier("Login")
                                    .tint(.orange)
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal)
                                    .font(.custom("Helvetica Neue Bold", size: 20))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.orange, lineWidth: 2)
                                            .padding(.horizontal)
                                            .padding(.top, -5)
                                            .padding(.bottom, -7)
                                    )
                                    .padding()
                                
                                HStack {
                                    Text("ou")
                                        .foregroundColor(Color("colorSet"))
                                    NavigationLink("Create an account",destination: CreateAccountView())
                                        .tint(.orange)
                                }
                                
                            }
                            .padding(.vertical, 40)
                            .background(Color("colorDark").opacity(0.2))
                            .background(.ultraThinMaterial.opacity(0.3))
                            .cornerRadius(40)
                            .padding(.horizontal, 40)
                        }
                        .offset(y: isAnimation ? 0 : -40)
                        .padding(.bottom)
                        
                    }

                    .onAppear {
                        withAnimation(.easeOut) {
                            isAnimation = true
                        }
                    }
                }
            }
            .onAppear(perform: loginViewModel.onAppear)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .environmentObject(loginViewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
            .environmentObject(LoginViewModel())
            .environmentObject(HomeViewModel())

    }
}
