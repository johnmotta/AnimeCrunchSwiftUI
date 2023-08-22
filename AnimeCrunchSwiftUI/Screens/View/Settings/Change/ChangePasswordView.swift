//

import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmNewPassword = ""
    
    @State private var isProgressBar = false
    
    var body: some View {
        VStack {
            VStack {
                ExtractedView(text: "Current Password", password: $currentPassword)
                ExtractedView(text: "New Password", password: $newPassword)
                ExtractedView(text: "Confirm New Password", password: $confirmNewPassword)
            }
            .padding(.horizontal)
            .padding(.top)
            Button {
                isProgressBar.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    isProgressBar = false
                }
                
            } label: {
                if isProgressBar {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .foregroundColor(.secondary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.secondary, lineWidth: 2)
                                .padding(.horizontal)
                                .padding(.top, -5)
                                .padding(.bottom, -7)
                        )
                } else {
                    Text("Change Password")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,5)
                        .foregroundColor(.secondary)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.secondary, lineWidth: 2)
                                .padding(.horizontal)
                                .padding(.top, -5)
                                .padding(.bottom, -7)
                        )
                    
                }
            }
            .padding()
            .background(Color("colorDark"))
            .foregroundColor(.secondary)
            Spacer()
        }
    }
}



struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView()
    }
}

struct ExtractedView: View {
    @State var text: String
    
    @Binding var password: String
    @State private var pass = true
    
    var body: some View {
        HStack {
            Image(systemName: "lock.circle")
                .foregroundColor(.gray).font(.headline)
            
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text(text)
                        .bold()
                        .foregroundColor(.gray)
                }
                
                if pass {
                    SecureField("", text: $password)
                        .accessibilityIdentifier("passwordSecureField")
                        .frame(height: 22)
                } else {
                    TextField("", text: $password)
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
                .stroke(Color.gray, lineWidth: 2)
        )
        .foregroundColor(Color("colorSet"))
        .padding(.horizontal, 5)
    }
}
