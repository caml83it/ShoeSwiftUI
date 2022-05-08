import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    
                VStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        
                        VStack {
                            Text("WELCOME,\n LOGIN TO START")
                                .foregroundColor(.primaryColor)
                                .font(.custom(UIFonts.semibold.rawValue, size: 24))
                                .multilineTextAlignment(.center)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Email")
                                .foregroundColor(.subTitle)
                                .font(.custom(UIFonts.semibold.rawValue, size: 14))
                            
                            Spacer().frame(height: 4)
                            
                            TextField("", text: $email)
                                .frame(height: 48)
                                .padding(.horizontal, 12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.inputBorder, lineWidth: 0.75)
                                )
                                .foregroundColor(.textTitle)
                                .font(.custom(UIFonts.regular.rawValue, size: 15))
                                .disableAutocorrection(true)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                        }
                        .padding(.top, 20)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Password")
                                .foregroundColor(.subTitle)
                                .font(.custom(UIFonts.semibold.rawValue, size: 14))
                            
                            Spacer().frame(height: 4)
                            
                            SecureField("", text: $email)
                                .frame(height: 48)
                                .padding(.horizontal, 12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.inputBorder, lineWidth: 0.75)
                                )
                                .foregroundColor(.textTitle)
                                .font(.custom(UIFonts.regular.rawValue, size: 15))
                                .autocapitalization(.none)
                        }
                        .padding(.top, 16)
                        
                        VStack {
                            Button {
                                
                            } label: {
                                Text("Forgot Password?")
                                    .foregroundColor(.textTitle)
                                    .font(.custom(UIFonts.regular.rawValue, size: 14))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 10)
                        
                        
                        
                        VStack {
                            
                            NavigationLink {
                                AppRouter.shared.view(for: .kHome)
                            } label: {
                                Text("LOG IN")
                                    .foregroundColor(.btnTextTitle)
                                    .font(.custom(UIFonts.semibold.rawValue, size: 18))
                                    .frame(height: 48)
                                    .frame(maxWidth: .infinity)
                            }
                            .background(Color.primaryColor)
                            .cornerRadius(48)
                        }
                        .padding(.top, 24)

                        VStack {
                            Text("or")
                                .foregroundColor(.textTitle)
                                .font(.custom(UIFonts.regular.rawValue, size: 14))
                        }
                        .padding(.top, 12)
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                Image("fb")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            .padding(.all, 8)
                            
                            Spacer()
                            
                            Button {
                                print("Edit button was tapped")
                            } label: {
                                Image("gg")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    
                            }
                            .padding(.all, 8)
                            
                            Spacer()
                        }
                        .padding(.top, 8)
                        
                        HStack(spacing: 4) {
                            Text("Don’t have an account?")
                                .foregroundColor(.textTitle)
                                .font(.custom(UIFonts.regular.rawValue, size: 14))
                            
                            NavigationLink {
                                AppRouter.shared.view(for: .kSignUp)
                            } label: {
                                Text("REGISTER")
                                    .foregroundColor(.primaryColor)
                                    .underline()
                                    .font(.custom(UIFonts.semibold.rawValue, size: 14))
                            }
                        }
                        .padding(.top, 16)
                        
                    }
                    .padding(.all, 20)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
