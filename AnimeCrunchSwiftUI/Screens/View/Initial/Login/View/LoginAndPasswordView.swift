//

import SwiftUI

struct LoginAndPasswordView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    @State var nameUser = ""
    @State var passwordUser = ""
    @State private var pass = true
    var body: some View {
        VStack {
            
            username
            
            password
            
        }
    }
}

// MARK: - Preview

struct LoginViewModel_Previews: PreviewProvider {
    static var previews: some View {
        LoginAndPasswordView()
            .environmentObject(LoginViewModel())
    }
}

// MARK: - Extensions

extension LoginAndPasswordView {
    var username: some View {
        HStack {
            Image(systemName: "person.circle")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
                if viewModel.login.userName.isEmpty {
                    Text("username")
                        .bold()
                        .foregroundColor(.gray)
                }
                TextField("", text: $viewModel.login.userName)
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

extension LoginAndPasswordView {
    var password: some View {
        HStack {
            Image(systemName: "lock.circle")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
                if viewModel.login.password.isEmpty {
                    Text("password")
                        .bold()
                        .foregroundColor(.gray)
                }
                
                if pass {
                    SecureField("", text: $viewModel.login.password)
                        .accessibilityIdentifier("passwordSecureField")
                        .frame(height: 22)
                } else {
                    TextField("", text: $viewModel.login.password)
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
