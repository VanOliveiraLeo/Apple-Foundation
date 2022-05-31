//
//  MyPageView.swift
//  CapitaesdeAreia
//
//  Created by aluno on 12/04/22.
//

import SwiftUI

struct MyPageView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .white
//        UITabBar.appearance().backgroundColor = UIColor.cyan
//        UITabBar.appearance().
        
    }
    
    var body: some View {
        TabView {
                ContentView()
                .tabItem{
                    Image(systemName: "house").renderingMode(.template)
                    Text("Início")
                }
                
                MapView()
                .tabItem {
                    Image(systemName: "map").renderingMode(.template)
                    Text("Mapa")
                }
                NewsView()
                .tabItem {
                    Image(systemName: "newspaper").renderingMode(.template)
                    Text("Notícias")
                }
                ProfileView()
                .tabItem {
                    Image(systemName: "person").renderingMode(.template)
                    Text("Perfil")
                }
                
        }
        .accentColor(Color.init(red: 67/255, green: 151/255, blue: 117/255))
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
//        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
