//

import SwiftUI

struct LoginScreenView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @State private var isPresented = false

    
    var body: some View {
        ZStack {
            if loginViewModel.isLogin {
                MainTabView()
            } else {
                NavigationStack {
                    ZStack {
                        VStack {
//                            Text("Login")
//                                .foregroundColor(.white)
//                                .font(.title2)
//                                .bold()
                            Spacer()
                            
                            AppBarView(image: "logo", name: "animecrunchyroll", isSearchButton: false, isAirplay: false)
                            VStack {
                                VStack {
                                    LoginAndPasswordView()
                                    TermsUseView(enterOrCreate: "creating")
                                    LoginButtonView(text:"Login")
                                        .accessibilityIdentifier("Login")
                                }
                                .padding(.horizontal)
                                
                                HStack {
                                    NavigationLink("Forgot password?", destination: ForgotPasswordView())
                                        .foregroundColor(.orange)
                                        .navigationTitle("Login")
                                    
                                    
                                    Text("    |    ")
                                        .foregroundColor(.white)
                                    
                                    NavigationLink("Create an account",destination: CreateAccountView())
                                        .foregroundColor(.orange)
                                }
                                .padding()
                                .padding(.top, 30)
                                
                            }
                            Spacer()
                        }
                        
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
            .environmentObject(LoginViewModel())
            .environmentObject(HomeViewModel())
    }
}

struct TermsUseView: View {
    var enterOrCreate: String
    var body: some View {
        ZStack {
            Text("By \(enterOrCreate) your account, you represent that you are over 16 years of age and that you agree to our ")
                .foregroundColor(Color("colorSet"))
            +
            Text("Terms and Conditions")
                .foregroundColor(.orange)
            +
            Text(" and our ")
                .foregroundColor(Color("colorSet"))
            +
            Text("privacy policy")
                .foregroundColor(.orange)
            +
            Text(".")
                .foregroundColor(.white)
        }
        .padding(.vertical)
        .multilineTextAlignment(.center)
        .font(.system(size: 14.1))
    }
}

struct LoginButtonView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    var text: String
    var isCreateAccount: Bool = false
    @State private var isLoading = false

    var body: some View {
        VStack {
            Button {
                self.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                   self.isLoading = false
               }
                if isCreateAccount {
                    // TODO -  create logic
                } else {
                    loginViewModel.autheticateUser()
                }
                do {
                    try loginViewModel.loginError()
                } catch let error as LoginError {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.loginViewModel.error = error
                    }
                } catch {
                    fatalError("Unknown error: \(loginViewModel.error!.localizedDescription)")
                }

            } label: {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2.0, anchor: .center)
                        .padding()
                } else {
                    Text(text)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .foregroundColor(.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.orange, lineWidth: 2)
                                .padding(.horizontal)
                                .padding(.top, -5)
                                .padding(.bottom, -7)
                        )
                }
            }
            .alert(isPresented: $loginViewModel.showAlert, content: {
                       Alert(title: Text("Erro"),
                             message: Text(loginViewModel.error?.errorMessage ?? "An unknown error has accured."),
                             dismissButton: .default(Text("OK")))
            })
        }
    }
}

