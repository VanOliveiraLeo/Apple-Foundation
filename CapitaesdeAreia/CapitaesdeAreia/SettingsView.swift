//
//  configuracoes.swift
//  LuvaDePedreiroCard
//
//  Created by aluno on 24/05/22.
//

import SwiftUI

struct SettingsView: View {
    //@State var nomeDoUsuario: String = ""
    //@State private var ePrivado: Bool = true
    //@State private var notificacoesHabilitadas: Bool = false
    //@State private var previewIndex = 0
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @Binding var imageSelected: UIImage
    
    var body: some View {
        ZStack {
            Color(red: 10/255, green: 125/255, blue: 80/255) // r: 10, g: 125, b: 80
                .opacity(1)
                .ignoresSafeArea()
            Form {
                
                //navigation text
                //                    NavigationLink(destination: TelaLogin(imageSelected: imageSelected), label: {
                //                        Text("Proxima tela")
                //                            .bold()
                //                            .foregroundColor(.blue)
                //                            .cornerRadius(10)
                //                    })
                //
                Section {
                    
                    HStack(alignment: .center, spacing: 20) {
                        
                        //                        Image("profile")
                        //                            .resizable()
                        //                            .frame(width: 50, height: 50)
                        //                            .cornerRadius(100)
                        
                        VStack {
                            ZStack(alignment: .bottomTrailing){
                                //                                    Button("Trocar imagem de perfil"){
                                //
                                //                                    }.font(.callout)
                                //                            Text("")
                                //                                .font(.caption)
                                //                                .foregroundColor(.secondary)
                                
                                Button(action: {
                                    changeProfileImage = true
                                    openCameraRoll = true
                                }, label: {
                                    Image(uiImage: imageSelected)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                })
                                
                                
                                Image(systemName: "plus")
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                
                            }.sheet(isPresented: $openCameraRoll) {
                                ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                            }
                        }
                        Text("Ao acionar a imagem ao lado, poderá selecionar uma imagem para seu perfil")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
                
            }
            .padding(.top, 5)
            .navigationTitle("Configurações")
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(imageSelected: .constant(UIImage()))
    }
}

//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var image: UIImage?
//    private let controller = UIImagePickerController()
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(parent: self)
//    }
//    class Coordinator:Nso
//}
