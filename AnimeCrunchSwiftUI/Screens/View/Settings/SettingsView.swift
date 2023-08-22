//

import SwiftUI

struct SettingsView: View {
    @State var languages = ["Inglês", "Português(Brasil)", "Espanhol", "Francês", "Alemão", "Italiano", "Japonês", "Mandarim", "Russo", "Árabe"]
    @State private var select: String? = nil
    @State private var isOn = false
    @State private var isOn4G = true
    @State private var sellInformation = false
    //@AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink("Subscription plan", destination: SubscriptionPlan())
                    NavigationLink("My Membership Card", destination: EmptyView())
                    NavigationLink("Change E-mail", destination: EmptyView())
                    NavigationLink("Change password", destination: ChangePasswordView())
                    NavigationLink("Redeem Promo Code", destination: EmptyView())
                        
                }
                Section("PREFERENCES") {
                    Picker("Audio language", selection: $select) {
                        ForEach(languages, id: \.self) { language in
                            Text(language)
                        }
                    }
                    Picker("Subtitle language", selection: $select) {
                        ForEach(languages, id: \.self) { language in
                            Text(language)
                        }
                    }
                    Toggle(isOn: $isOn) {
                            Text("Show Closed Captions")
                    }
                    /*
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Theme")
                    }
                     */
                }
                Section("APP EXPERIENCE") {
                    Toggle(isOn: $isOn4G) {
                        Text("Watch with Mobile Data")
                    }
                    NavigationLink("Notification", destination: NotificationView())
                    
                }
                
                Section("PRIVACY") {
                    Toggle(isOn: $sellInformation) {
                        Text("Do not sell my personal information")
                    }
                }
                
                Section("ABOUT") {
                    NavigationLink("Need help?", destination: EmptyView())
                    NavigationLink("Leave", destination: EmptyView())
                }
                
               
                Text("Version 3.31.1 (616)")
                    .foregroundColor(.orange)
                Text("Service terms")
                    .foregroundColor(.orange)
                Text("Privacy policy")
                    .foregroundColor(.orange)
            }
            .foregroundColor(Color("colorSet"))
        }
        .navigationTitle("Settings")

//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
