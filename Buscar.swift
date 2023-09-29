//
//  Busca.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 31/08/23.
//

import SwiftUI

struct Buscar: View {
    
   @State private var barraBusca = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                
                
            }
            
            .navigationTitle("Buscar")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                        
                        Text("Voltar")
                        
                    }
                    
                }
                
            }
            
        } .searchable(text: $barraBusca, prompt: "O que está procurando?")
    }
    
    struct Buscar_Previews: PreviewProvider {
        static var previews: some View {
            Buscar()
        }
    }
}
