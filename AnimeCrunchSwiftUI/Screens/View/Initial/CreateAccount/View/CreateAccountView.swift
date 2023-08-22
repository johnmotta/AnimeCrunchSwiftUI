//

import SwiftUI

struct CreateAccountView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @StateObject private var createAccountViewModel = CreateViewModel()
    
    @State private var reveiveUpdadtes = false
    @State private var navigationLogin = false
    @State var pass = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Create Account")
                        .foregroundColor(Color("colorSet"))
                        .font(.title2)
                        .bold()
                    Spacer()
                    AppBarView(image: "logo", name: "animecrunchyroll", isSearchButton: false, isAirplay: false)
                    VStack {
                        email
                        username
                        password
                        
                        Toggle(isOn: $reveiveUpdadtes) {
                            Text("I want to be informed of all news and offers from AnimeCrunch")
                                .foregroundColor(Color("colorSet"))
                                .font(.system(size: 14.1))
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.horizontal, 5)
                        
                        TermsUseView(enterOrCreate: "entrar")
                            .padding(.vertical)
                            .font(.system(size: 14.1))
                            .multilineTextAlignment(.center)
                        
                        LoginButtonView(text: "Create Account",isCreateAccount: true)
                    }
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Preview

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            .environmentObject(LoginViewModel())
    }
}

// MARK: - Extensions

extension CreateAccountView {
    var email: some View {
        HStack {
            Image(systemName: "mail")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
               
                Text("e-mail")
                    .bold()
                    .foregroundColor(.gray)
                
                TextField("", text: $createAccountViewModel.createAccount.email)
                    .frame(height: 22)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .foregroundColor(Color("colorSet"))
        .padding(.horizontal, 5)
        
    }
}

extension CreateAccountView {
    var username: some View {
        HStack {
            Image(systemName: "person.circle")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
                if createAccountViewModel.createAccount.name.isEmpty {
                    Text("username")
                        .bold()
                        .foregroundColor(.gray)
                }
                TextField("", text: $createAccountViewModel.createAccount.name)
                    .accessibilityIdentifier("username")
                    .frame(height: 22)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .foregroundColor(Color("colorSet"))
        .padding(.horizontal, 5)
    }
}

extension CreateAccountView {
    var password: some View {
        HStack {
            Image(systemName: "lock.circle")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
                if createAccountViewModel.createAccount.password.isEmpty {
                    Text("password")
                        .bold()
                        .foregroundColor(.gray)
                }
                
                if pass {
                    SecureField("", text: $createAccountViewModel.createAccount.password)
                        .accessibilityIdentifier("passwordSecureField")
                        .frame(height: 22)
                } else {
                    TextField("", text: $createAccountViewModel.createAccount.password)
                        .accessibilityIdentifier("passwordTextField")
                        .frame(height: 22)
                }
            }
            
            Button {
                pass.toggle()
            } label: {
                Image(systemName: pass ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .foregroundColor(Color("colorSet"))
        .padding(.horizontal, 5)
    }
}

// MARK: - Helpers

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .green : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            configuration.label
        }
    }
}
