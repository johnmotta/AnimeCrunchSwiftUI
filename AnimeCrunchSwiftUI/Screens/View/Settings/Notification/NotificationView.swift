//

import SwiftUI

struct NotificationView: View {
    @State private var isOnNotificationGeneral = false
    @State private var isOnNotificationContent = false
    @State private var isOnNotificationPromotional = false
    var body: some View {
        Form {
            Toggle(isOn: $isOnNotificationGeneral) {
                Text("General notice")
            }
            Toggle(isOn: $isOnNotificationContent) {
                Text("Content notification")
            }
            Toggle(isOn: $isOnNotificationPromotional) {
                Text("Primocional notification")
            }
        }
        .navigationTitle("Notificações")
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
