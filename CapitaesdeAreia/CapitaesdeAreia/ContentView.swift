import SwiftUI
import CoreLocation
import MapKit

struct ContentView: View {
    
    @Binding var selection: Int
    @Binding var annotations: [Place]
    @State var LocalAfetado = 0
    let numeroDenuncia = "196"
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    
    @FetchRequest(sortDescriptors: []) var userlocation: FetchedResults<MapEntity>
    
    func VerSeTaNoLocalAfetado() -> some View {
        
        for user in userlocation{
            for note in annotations {
                print("BD: \(user.userLat!)")
                print("lista: \(String(note.coordinate.latitude)), logitude: \(note.coordinate.longitude)")
                
                if String(note.coordinate.latitude) == user.userLat!{
                    return Text("LOCAL AFETADO").foregroundColor(.red).font(.system(size: 20, weight: .bold, design: .default))
                    
                }
            }
        }
        return Text("")
    }
    var RetornoNaoSeiPq: Int = 0
    
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
                        //                            .border(.red)
                        
                    }
                    .offset(x: 150, y: -15)
                    
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
                            Image("danger")
                                .resizable()
                                .frame(width: 110, height: 110)
                                .offset(x: -90, y: 130)
                                .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                            Text("Status de Risco:")
                                .font(.system(size: 23, weight: .heavy, design: .default))
                                .offset(x: 74)
                                .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                            
                            
                            
                            VerSeTaNoLocalAfetado()
                                .position(x: 270, y: 20)
                    
                            
                            
                            
                            
                            
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
                                .offset(x:80, y:60)
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
                    .frame(height:20)
                
                VStack(alignment: .center, spacing: 30){
                    ZStack{
                        Button {
                            selection = 4
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 130)
                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                HStack{
                                    Image("profile")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .offset(x: -20)
                                        .foregroundColor(.white)
                                    VStack{
                                        Text("0 Denúncias")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                            .offset(x:10)
                                        Text("Há 56 dias!")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                            .offset(x: 20)
                                    }
                                }
                            
                            }
                                
                            }
                    }
                    VStack{
                        Text("Faça o quiz!")
                            .font(.system(size: 22, weight: .semibold, design: .default))
                            .frame(width: 300)
                            .offset(x: -106)
                        Text("Teste seus conhecimentos para denunciar corretamente!")
                            .font(.system(size: 12, weight: .light, design: .default))
                            .offset(x: -6, y: 6)
                            .frame(width: 350)
                        
                            
                        
                    }
                    ZStack{
                        Button {
                            print("OI")
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 130)
                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                HStack{
                                    Image("fotoLogo")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .offset(x: -20)
                                        .foregroundColor(.white)
                                    
                                    VStack{
                                        Text("5/7 acertos")
                                            .font(.system(size: 30, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                            .offset(x:10)
                                        Text("Parabéns!")
                                            .font(.system(size: 25, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                            .offset(x: 20)
                                    }
                                }
                               
                                
                            }
                        }
                    }
                    
                    
                }
                .frame(width: (UIScreen.main.bounds.width - 50), height: UIScreen.main.bounds.height/1.8, alignment: .center)
                
                
                
                
                VStack{
                    Spacer()
                        .frame(height: 0)
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
                                
                                Image("rachadura")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-30)
                                
                                Text("Rachaduras progressivas")
                                    .offset(x: 0, y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "drop.circle.fill")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-30)
                                
                                Text("Manchas de infiltração")
                                    .offset(y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Image("door")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-35)
                                
                                Text("Portas envergadas")
                                    .offset(x: 0, y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Image("tree")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-35)
                                
                                Text("Árvores inclinando")
                                    .offset(x: 0, y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "cloud.bolt.rain.fill")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-35)

                                Text("Chuvas \nfortes")
                                    .offset(x: -15, y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            }
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 150, height: 200)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "drop.triangle")
                                    .resizable()
//                                    .foregroundColor(Color.init(red: 170/255, green: 121/255, blue: 66/255))
                                    .frame(width: 90, height: 90)
                                    .offset(y:-35)
                                
                                Text("Água barrenta acumulada")
                                    .offset(x: 0, y: 50)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(width: 150, height: 200)
                            //                            .border(.red)
                            
                            Spacer()
                                .frame(width: 20, height: 100)
                            
                            
                        }
                    }
                    .offset(x: 10, y: -10)
                }
                .offset(x: 0, y: -20)
                
                Spacer()
                    .frame(height:60)
                
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
        .ignoresSafeArea()
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(selection: .constant(0), annotations: .constant([]))
    }
}
// new 31 maio

}
