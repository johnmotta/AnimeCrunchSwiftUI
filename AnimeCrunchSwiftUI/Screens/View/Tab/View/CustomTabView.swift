//

import SwiftUI

struct CustomTabView: View {
    @ObservedObject var viewModel: NavBarViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(NavBarViewModel.Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.rawValue)
                        .scaleEffect(tab == viewModel.selectTab ? 1.25 : 1.0)
                        .foregroundColor(tab == viewModel.selectTab ? Color("colorSet") : .secondary)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1 )) {
                                viewModel.selectTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .padding(.top)
            //.frame(width: nil, height: 60)
            .background(.thinMaterial)
            //.cornerRadius(10)
        }
    }
}

struct CustomTabView_Preview: PreviewProvider {
    static var previews: some View {
        CustomTabView(viewModel: NavBarViewModel())
    }
}
