import SwiftUI
import AuthenticationServices

@available(iOS 13.0, *)
public struct SignInWithAppleButton : View {
    var type : ASAuthorizationAppleIDButton.ButtonType = .default
    var style : ASAuthorizationAppleIDButton.Style? = nil
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    public init() {}

    public var body: some View {
       AppleSignInButtonView(type: type,
                             style: style == nil ? self.colorScheme == .dark ? .white : .black : style!)
           .frame(height: 50, alignment: .center).padding(.all)
    }
}

struct AppleSignInButtonView: UIViewRepresentable {
    var type : ASAuthorizationAppleIDButton.ButtonType = .default
    var style : ASAuthorizationAppleIDButton.Style = .white
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return  ASAuthorizationAppleIDButton(authorizationButtonType: type, authorizationButtonStyle: style)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: UIViewRepresentableContext<AppleSignInButtonView>) {}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInWithAppleButton().environment(\.colorScheme, .dark)
            SignInWithAppleButton()
        }
    }
}
