//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var viewModel: LoginViewModel
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "person.circle")
                        .foregroundColor(.gray).font(.headline)
                    
                    ZStack(alignment: .leading) {
                        if viewModel.login.email.isEmpty {
                            Text("E-mail")
                                .bold()
                                .foregroundColor(Color("colorSet"))
                        }
                        TextField("", text: $viewModel.login.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .foregroundColor(Color("colorSet"))
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .foregroundColor(Color("colorSet"))
                .padding(.horizontal)

                Text("If the account entered exists, a password reset email will be sent to the address linked to the account.")
                    .foregroundColor(Color("colorSet"))
                    .font(.callout)
                    .padding(.horizontal)
                    .padding(.vertical)
                
                LoginButtonView(text: "Send reset link")
                Spacer()
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
            .environmentObject(LoginViewModel())
    }
}
