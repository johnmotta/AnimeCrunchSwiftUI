//

import SwiftUI

struct SubscriptionPlan: View {
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.black
//                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("Free User")
                            .foregroundColor(Color("colorSet"))
                            .font(.title2)
                    }
                    VStack {
                        Image(systemName: "crown")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                            .padding(.bottom)
                        Text("Get premium access")
                            .foregroundColor(Color("colorSet"))
                            .font(.title3)
                            .padding(.bottom, 5)
                        Text("Anime in HD, ad-free, with new episodes within an hour of airing in Japan.")
                            .foregroundColor(Color("colorSet"))
                            .font(.body)
                            .padding(.bottom)
                        
                        Button {
                            // TODO - button premium logic
                        } label: {
                            Text("BECOME PREMIUM")
                                .bold()
                                .padding(.horizontal, 60)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 0)
                                        .stroke(Color.black, lineWidth: 2)
                                        .background(Color.orange)
                                        .padding(-2)
                                )
                                .padding(.vertical, 5)
                                .foregroundColor(.black)


                        }
                    }
                    .padding()
                    .background(.secondary)
                    .background(.ultraThinMaterial.opacity(0.4))
                }
            }
        }
        .navigationTitle("Subscription plan")
    }
}

struct SubscriptionPlan_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionPlan()
    }
}
