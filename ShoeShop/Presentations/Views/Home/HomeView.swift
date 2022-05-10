import SwiftUI

struct HomeView: View {
    @State var email: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Spacer()
                        .frame(maxWidth: geometry.size.width)
                        .frame(height: geometry.safeAreaInsets.top + 248)
                        .background(Color.primaryColor)
                    
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    HStack(alignment: .top) {
                        Image("background")
                            .resizable()
                            .frame(width: 86, height: 86)
                            .scaledToFit()
                            .cornerRadius(86)
                        
                        Spacer()
                        
                        Image("cart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.all, 8)
                            .scaledToFit()
                    }
                    .padding(.top, geometry.safeAreaInsets.top)
                    .padding(.horizontal, 20)

                    Spacer().frame(height: 26)

                    HStack {
                        Image("search-outline")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .scaledToFit()
                        
                        TextField("Tìm kiếm sản phẩm ...", text: $email)
                            .frame(height: 40)
                            .foregroundColor(.textTitle)
                            .font(.custom(UIFonts.regular.rawValue, size: 15))
                            .disabled(true)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding(.horizontal, 10)
                    .background(.background)
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                   
                    

                    Spacer().frame(height: 16)

                    CarouselView(numberOfItems: 5) {
                        CarouselShoeItem()
                            .frame(width: geometry.size.width - 40, height: 160)
                            .padding(.horizontal, 4)
                        CarouselShoeItem()
                            .frame(width: geometry.size.width - 40, height: 160)
                            .padding(.horizontal, 4)
                        CarouselShoeItem()
                            .frame(width: geometry.size.width - 40, height: 160)
                            .padding(.horizontal, 4)
                        CarouselShoeItem()
                            .frame(width: geometry.size.width - 40, height: 160)
                            .padding(.horizontal, 4)
                        CarouselShoeItem()
                            .frame(width: geometry.size.width - 40, height: 160)
                            .padding(.horizontal, 4)
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 160)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .ignoresSafeArea()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CarouselShoeItem: View {
    var body: some View {
        HStack(spacing: 0) {
            Image("shoe_sample_01")
                .resizable()
                .scaledToFit()
                .frame(width: 167, height: 134)
            
            Spacer().frame(width: 4)
            
            VStack(alignment: .trailing, spacing: 0) {
                Text("Nike Special 810 Blue")
                    .foregroundColor(.textTitle)
                    .font(.custom(UIFonts.semibold.rawValue, size: 22))
                    .italic()
                
                Text("Nike")
                    .foregroundColor(.textTitle.opacity(0.6))
                    .font(.custom(UIFonts.semibold.rawValue, size: 14))
                    .italic()
                
                Spacer()
                
                Text("5.000.000 VND")
                    .foregroundColor(.textTitle.opacity(0.3))
                    .font(.custom(UIFonts.semibold.rawValue, size: 11))
                    .italic()
                    .strikethrough()
                
                Text("5.000.000 VND")
                    .foregroundColor(.primaryColor)
                    .font(.custom(UIFonts.semibold.rawValue, size: 13))
                    .italic()
                
                Spacer().frame(height: 10)
                
                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 8, height: 8)
                        .background(Color.dot)
                        .cornerRadius(8)
                    
                    Spacer()
                        .frame(width: 8, height: 8)
                        .background(Color.primaryColor)
                        .cornerRadius(8)
                    
                    Spacer()
                        .frame(width: 8, height: 8)
                        .background(Color.dot)
                        .cornerRadius(8)
                    
                    Spacer()
                        .frame(width: 8, height: 8)
                        .background(Color.dot)
                        .cornerRadius(8)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.all, 13)
       
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
    }
}
