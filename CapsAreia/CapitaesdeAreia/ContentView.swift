import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    
    @Binding var selection: Int
    @Binding var annotations: [Place]
    @State var LocalAfetado = 0
    let numeroDenuncia = "196"
    var locationManager: CLLocationManager?
    
    func VerificarSeEstaEmLocalAfetado() {
        
        for i in annotations {
            if ((locationManager?.location!.coordinate) != nil) {
                LocalAfetado = 1
            }
        }
        
    }
    
    
    var body: some View {
        
        ScrollView{
            VStack{
                ZStack{
                    Text("Desmorona Brasil")
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.size.width, height: 41, alignment: .center)
                        .offset(y: -15)
                        .font(.system(size: 24, weight: .heavy, design: .default))
                    
                    Button {
                        let phone = "tel://"
                        let phoneNumberformatted = phone + numeroDenuncia
                        guard let url = URL(string: phoneNumberformatted) else {return}
                        UIApplication.shared.open(url)
                        
                    } label: {
                        
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 22, height: 20)
                            .offset(x: 150, y: -15)
                        
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.size.width, height: 147)
                .background(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                .overlay(alignment: .init(horizontal: .center, vertical: .top)) {
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 354, height: 189)
                            .offset(y: 95)
                            .foregroundColor(.white)
                        VStack{
                            Spacer()
                            Image(systemName: "globe.americas.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .offset(x: -100, y: 120)
                                .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                            Text("Status de Risco:")
                                .font(.system(size: 23, weight: .heavy, design: .default))
                                .offset(x: 74)
                                .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                            
                            if LocalAfetado == 1{
                                Text("Local afetado, RUN!")
                            }
                            
                            ZStack{
                                Button {
                                    print("alo")
                                    selection = 2
                                } label: {

                                    Text("Saiba mais")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .heavy, design: .default))
                                        .background {
                                            Capsule()
                                                .frame(width: 120, height: 35)
                                                .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                        }
                                        
                                    
                                }
                                .offset(x:80, y:50)
                            }
                            
                        }
                    }
                    .offset(x: 0)
                }
                
                
                Spacer()
                    .frame(height: 120)
                
                Text("Continue denunciando!")
                    .font(.system(size: 22, weight: .semibold, design: .default))
                    .frame(width: 300)
//                    .border(.red)
                    .offset(x: -52, y: 40)
                Text("Suas denúncias são importantes para o funcionamento do aplicativo. Veja suas denúncias aqui:")
                    .font(.system(size: 12, weight: .light, design: .default))
                    .offset(y:10)
                    .frame(width: 350)
//                    .border(.red)
                    .offset(x: -2, y: 40)
                    
                
                Spacer()
                    .frame(height:40)
                
                VStack(alignment: .center, spacing: 50){
                    ZStack{
                        Button {
                            print("OI")
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
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
                                RoundedRectangle(cornerRadius: 10)
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
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Rachaduras progressivas")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Manchas de infiltração")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Portas envergadas")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Árvores inclinando")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Chuvas fortes")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Text("Água barrenta acumulada")
                                    .offset(x: 0, y: 40)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            .border(.red)
                            
                            Spacer()
                                .frame(width: 20, height: 200)
                            
                            
                        }
                    }
                    .offset(x: 10, y: -10)
                }
                .offset(x: 0, y: -20)
                
                Spacer()
                    .frame(height: 100)
                
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
        ContentView(selection: .constant(0), annotations: .constant([]))
    }
}
// new 31 maio
