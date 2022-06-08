import SwiftUI

struct ProfileView: View {
    
    let greenColor: Color = Color.init(red: 67/255, green: 151/255, blue: 117/255)

    var profileHeader: some View {
        VStack(spacing: 10) {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                //.overlay(Circle().stroke(Color.white, lineWidth: 5))
            Text("@Admin")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.white)
        }
    }
    
    var titleView: some View {
        ZStack {
            
            
            Text("Perfil")
                .font(.system(size: 24, weight: .heavy, design: .default))
                .bold()
                .foregroundColor(.white)
                .padding(.top, 50)
        }
    }
    
    var proportionalYOffset: Double {
        UIScreen.main.bounds.height * 0.05
    }
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                Rectangle()
                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                Rectangle()
                    .foregroundColor(.white)
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack {
                    ZStack(alignment: .top) {
                        
                        greenColor
                        
                        VStack {
                            titleView
                            profileHeader
                            VStack {
                                HStack(alignment: .center , spacing: 35) {
                                    Text("Since: \n 2022")
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                    Text("Denúncias: \n          73")
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                    
                                }
                            }
                            .fixedSize()
                            .frame(width: 200, height: 100)
                            .padding(.horizontal, 50)
                            .background(Color.init(red: 44/255, green: 99/255, blue: 75/255))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .offset(y: proportionalYOffset)
                            
                        }
                        
                    }
                    
                    
                    ZStack (alignment: .leading){
                        Rectangle()
                            .fill(Color.white)
                            .frame(height: UIScreen.main.bounds.height * 0.4)
                            .offset(y: 150)
                        
                        VStack(alignment: .leading, spacing: 35){
                            Spacer()
                            HStack{
                                
                                Button(action: {}) {
                                    
                                    Text(" INFORMAÇÕES PESSOAIS")
                                        .font(.system(size: 22, weight: .regular, design: .default))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding()
                                    
                                    
                                }}
                            .frame(width: UIScreen.main.bounds.size.width, height: 10)
                            Divider()
                            HStack{
                                Button(action: {}) {
                                    Text(" AJUDA")
                                        .font(.system(size: 22, weight: .regular, design: .default))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding()
                                }}
                            .frame(width: UIScreen.main.bounds.size.width, height: 10)
                            Divider()
                            
                            HStack{
                                Button(action: {}) {
                                    Text(" CONFIGURAÇÕES")
                                        .font(.system(size: 22, weight: .regular, design: .default))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding()
                                }}
                            .frame(width: UIScreen.main.bounds.size.width, height: 10)
                            Divider()
                            HStack{
                                Button(action: {}) {
                                    Text(" CRÉDITOS")
                                        .font(.system(size: 22, weight: .regular, design: .default))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .padding()
                                }}
                            .frame(width: UIScreen.main.bounds.size.width, height: 10)
                            Divider()
                            
                        }
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .tint(.black)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .background(Color.white)
            }
            .edgesIgnoringSafeArea(.all)
        }
        
        
    }
}


struct ImageIcon: View {
    var imageName: String

    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

struct TelaLogin_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileView()
            
        }
    }
}
