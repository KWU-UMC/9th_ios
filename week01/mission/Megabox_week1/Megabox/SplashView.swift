import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack{
            Spacer()
            Image("megabox_logo").resizable().scaledToFit().frame(width: 249, height: 84)
            Spacer()
        }
    }
}

#Preview {
    SplashView()
}
