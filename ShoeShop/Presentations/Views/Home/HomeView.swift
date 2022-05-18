import SwiftUI

struct HomeView: View {
    @State var email: String = ""
    @State var offset: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    GeometryReader { _ in
                        Header(email: $email, offset: $offset)
                            .frame(height: getHeaderHeight(), alignment: .bottom)
                            .padding(.top, geo.safeAreaInsets.top)
                            .background(Color.primaryColor)
                            .offset(y: -geo.safeAreaInsets.top)
                    }
                    .frame(height: 162)
                    .offset(y: -offset)
                    .zIndex(1)
                    
                    HomeBody()
                        .zIndex(0)
                }
                .modifier(OffsetModifier(offset: $offset))
            }
            .coordinateSpace(name: "HomeScroller")
        }
       
    }
    
    
    func getHeaderHeight() -> CGFloat {
        let headerHeight = 162 + offset
        
        return (headerHeight > 56) ? headerHeight : 56
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

struct VShoeCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer().frame(height: 2)
            
            Image("shoe_sample_01")
                .resizable()
                .scaledToFit()
                .frame(width: 117, height: 90, alignment: .center)
            
            Spacer().frame(height: 2)
            
            Text("Nike Special 810 Blue")
                .foregroundColor(.textTitle)
                .font(.custom(UIFonts.semibold.rawValue, size: 18))
                .italic()
            
            Spacer().frame(height: 4)
            
            Text("Nike")
                .foregroundColor(.textTitle.opacity(0.6))
                .font(.custom(UIFonts.semibold.rawValue, size: 13))
                .italic()
            
            Spacer().frame(height: 4)
            
            Text("5.000.000 VND")
                .foregroundColor(.textTitle.opacity(0.3))
                .font(.custom(UIFonts.semibold.rawValue, size: 11))
                .italic()
                .strikethrough()
            
            Text("5.000.000 VND")
                .foregroundColor(.primaryColor)
                .font(.custom(UIFonts.semibold.rawValue, size: 14))
                .italic()
        }
        .frame(width: 130, height: 200)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
    }
}

struct HShoeCardView: View {
    var body: some View {
        HStack(spacing: 0) {
           
            Image("shoe_sample_01")
                .resizable()
                .scaledToFit()
                .frame(width: 116, height: 91, alignment: .center)
                .padding(.leading, 8)
        
            VStack(alignment: .leading, spacing: 0) {
                Text("Nike Special 810 Blue")
                    .foregroundColor(.textTitle)
                    .font(.custom(UIFonts.semibold.rawValue, size: 18))
                    .italic()
                
                Spacer().frame(height: 4)
                
                Text("Nike")
                    .foregroundColor(.textTitle.opacity(0.6))
                    .font(.custom(UIFonts.semibold.rawValue, size: 13))
                    .italic()
                
                Spacer().frame(height: 4)
                
                Text("5.000.000 VND")
                    .foregroundColor(.textTitle.opacity(0.3))
                    .font(.custom(UIFonts.semibold.rawValue, size: 11))
                    .italic()
                    .strikethrough()
                
                Text("5.000.000 VND")
                    .foregroundColor(.primaryColor)
                    .font(.custom(UIFonts.semibold.rawValue, size: 14))
                    .italic()
            }
            .padding(.vertical, 2)
            .frame(maxWidth: .infinity)
        }
        .frame(width: 261, height: 107)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 0)
    }
}

struct Header: View {
    var avatarSize: CGFloat = 86
    @Binding var email: String
    @Binding var offset: CGFloat
    var _avatarOffsetX: CGFloat = 86 / 2 + 20
    var _avatarOffsetY: CGFloat = 86 / 2 + 4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("background")
                    .resizable()
                    .frame(width: getAvatarSize(size: 86), height: getAvatarSize(size: 86))
                    .scaledToFit()
                    .cornerRadius(getAvatarSize(size: 86))
                    .overlay(RoundedRectangle(cornerRadius: getAvatarSize(size: 86)).stroke(Color.white, lineWidth: 2))
                    .position(x: getAvatarOffset(x: 63), y: getAvatarOffset(y: 47))
                
                Image("cart")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.all, 8)
                    .scaledToFit()
                    .position(x: geo.size.width - 32, y: 20 + 8)
                
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
                .background(Color.white)
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .frame(width: getSearchWidth(width: geo.size.width), height: 56)
                .position(x: getSearchOffset(x: geo.size.width / 2), y: getSearchOffset(y: 134))
            }
            .frame(maxHeight: .infinity)
        }
    }
    
    func getSearchWidth(width: Double) -> CGFloat {
        if offset < -96 {
            return width - 96
        }
        
        if offset > 0 {
            return width
        }
        
        return width + offset
    }
    
    func getAvatarOffset(y: Double) -> CGFloat {
        if offset < -96 {
            return y - 19
        }
        
        if offset > 0 {
            return y
        }
        
        return y + (offset * 19.0 / 96.0)
    }
    
    func getAvatarOffset(x: Double) -> CGFloat {
        if offset < -96 {
            return x - 19
        }
        
        if offset > 0 {
            return x
        }
        
        return x + (offset * 19.0 / 96.0)
    }
    
    func getSearchOffset(y: Double) -> CGFloat {
        let headerHeight = y + offset
        
        return (headerHeight > 56 / 2) ? headerHeight : 56 / 2
    }
    
    func getSearchOffset(x: Double) -> CGFloat {
        if offset < -96 {
            return x + 8
        }
        
        if offset > 0 {
            return x
        }
        
        return x - (offset / 12.0)
    }
    
    func getAvatarSize(size: Double) -> Double {
        let avatarSize = size + offset
        
        if avatarSize < 48 {
            return 48
            
        }
        
        if avatarSize > size {
            return size
        }
        
        return avatarSize
    }
}

struct HomeBody: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .frame(height: 88)
                        .background(Color.primaryColor)
                    
                    Spacer()
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .frame(height: 80)
                        .background(Color.clear)
                }
                
                CarouselView(numberOfItems: 5) {
                    CarouselShoeItem()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                        .padding(.horizontal, 4)
                    CarouselShoeItem()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                        .padding(.horizontal, 4)
                    CarouselShoeItem()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                        .padding(.horizontal, 4)
                    CarouselShoeItem()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                        .padding(.horizontal, 4)
                    CarouselShoeItem()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 160)
                        .padding(.horizontal, 4)
                }
                .frame(height: 160)
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 16)
            }
            
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Best Sellers")
                        .foregroundColor(.textTitle.opacity(0.8))
                        .font(.custom(UIFonts.semibold.rawValue, size: 18))
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            VShoeCardView()
                            VShoeCardView()
                            VShoeCardView()
                            VShoeCardView()
                            VShoeCardView()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                      
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Mens")
                        .foregroundColor(.textTitle.opacity(0.8))
                        .font(.custom(UIFonts.semibold.rawValue, size: 18))
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Womens")
                        .foregroundColor(.textTitle.opacity(0.8))
                        .font(.custom(UIFonts.semibold.rawValue, size: 18))
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Kids")
                        .foregroundColor(.textTitle.opacity(0.8))
                        .font(.custom(UIFonts.semibold.rawValue, size: 18))
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                            HShoeCardView()
                        }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 16)
                    }
                }
            }
        }
    }
}
