//
//  SimboloMapas.swift
//  CapitaesdeAreia
//
//  Created by aluno on 14/06/22.
//

import SwiftUI

struct SimboloMapas: View {
    var body: some View {
        
        ZStack{
            Image(systemName: "map.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Image("triangle.fill")
            
        }
        
        
    }
}

struct SimboloMapas_Previews: PreviewProvider {
    static var previews: some View {
        SimboloMapas()
    }
}
