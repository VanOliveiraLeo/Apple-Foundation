import SwiftUI

struct ContentView: View {
    
    let numeroDenuncia = "196"
    
    var body: some View {
        
        ScrollView{
            VStack{
                ZStack{
                    Text("Desmorona Brasil")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.size.width, height: 41, alignment: .center)
                        .offset(y: -15)
                        .font(.system(size: 24, weight: .heavy, design: .default))
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(Color.init(red: 215/255, green: 29/255, blue: 29/255))
                        .offset(x:150, y:-20)

                }
                .frame(width: UIScreen.main.bounds.size.width, height: 147)
                .background(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                .overlay(alignment: .init(horizontal: .center, vertical: .top)) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 354, height: 189)
                        .offset(y: 95)
                        .foregroundColor(.white)
                        .offset(y:-35)
                    VStack{
                        Spacer()
                        Image(systemName: "globe.americas.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .offset(x: -100, y: 125)
                            .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                        Text("Status de Risco:")
                            .font(.system(size: 23, weight: .heavy, design: .default))
                            .offset(x: 74, y: 5 )
                            .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                        Text("Fora de local afetado")
                            .offset(x: 80, y:15)
                            .font(.system(size: 16, weight: .heavy, design: .default))
                        Text("Por alagamentos ou deslises")
                            .offset(x: 70, y:15)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        Capsule()
                            .frame(width: 120, height: 35)
                            .offset(x:80, y: 25)
                            .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                        ZStack{
                            Text("Saiba mais")
                                .offset(x:80, y:-7)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .heavy, design: .default))
                        }
                    }
                }
                
                
                Spacer()
                    .frame(height: 140)
                
                VStack(alignment: .center, spacing: 50){
                    ZStack{
                        Button {
                            print("OI")
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(height: 130)
                                    .foregroundColor(Color.init(red: 199/255, green: 199/255, blue: 199/255))
                                Text("Resumo do perfil")
                                    .foregroundColor(.black)
                                    .font(.system(size: 24, weight: .heavy, design: .default))

                            }
                        }
                    }
                    ZStack{
                        Button {
                            print("OI")
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(height: 130)
                                    .foregroundColor(Color.init(red: 199/255, green: 199/255, blue: 199/255))
                                Text("QUIZ")
                                    .foregroundColor(.black)
                                    .font(.system(size: 24, weight: .heavy, design: .default))

                            }
                        }
                    }
                    
                    
                }
                .frame(width: (UIScreen.main.bounds.width - 50), height: UIScreen.main.bounds.height/2.2, alignment: .center)
                
                
                
                
                VStack{
                    Spacer()
                        .frame(height: 20)
                    Text("SINAIS DE RISCO")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .offset(x: -80, y: 0)
                    Spacer()
                        .frame(height: 40)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 200)
                                .foregroundColor(.white)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 200)
                                .foregroundColor(.white)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 200)
                                .foregroundColor(.white)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 200)
                                .foregroundColor(.white)
                        }
                    }
                    .offset(x: 10, y: -10)
                }
                .offset(x: 0, y: -20)
                
                Spacer()
                    .frame(height: 20)
                
//                VStack{
//                    ZStack(alignment: .center){
//                        Button {
//                            let phone = "tel://"
//                            let phoneNumberformatted = phone + numeroDenuncia
//                            guard let url = URL(string: phoneNumberformatted) else {return}
//                            UIApplication.shared.open(url)
//                        } label: {
//                            ZStack{
//                                RoundedRectangle(cornerRadius: 30)
//                                    .frame(width: 250, height: 200, alignment: .center)
//                                    .foregroundColor(Color.init(red: 215/255, green: 29/255, blue: 29/255))
//                                Text("DISQUE DENÚNCIA")
//                                    .font(.system(size: 20, weight: .black, design: .default))
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .offset(x: 0, y: -50)
//                                
//                                Text("196")
//                                    .padding()
//                                    .font(.system(size: 25, weight: .bold, design: .monospaced))
//                                    .foregroundColor(.white)
//                      
//                                Image(systemName: "exclamationmark.triangle.fill")
//                                    .resizable()
//                                    .frame(width: 45, height: 45)
//                                    .offset(x: 0, y: 45)
//                                    .foregroundColor(.red)
//                                
//                            }
//                            
//                        }
//                        
//                    }
//                }
//                .frame(width: UIScreen.main.bounds.width, height: 200)
//                .padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
                
                
                
                
                
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.init(red: 235/255, green: 235/255, blue: 235/255))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// new 31 maio 
