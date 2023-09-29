//
//  Notificacoes.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 31/08/23.
//

import SwiftUI



struct Notificacoes: View {
    
    @Binding var notificacoes : [NotificationCellViewModel]
    
    var body: some View {
        
        NavigationStack {
            
            NavigationView {
                
                ZStack {
                    
                    
                    VStack(spacing: 12) {
                        
                        ForEach(notificacoes, id: \.self){ notificacao in
                            NotificationCell(photo: notificacao.photo, title: notificacao.title, descricao: notificacao.descricao, icon: notificacao.icon, time: notificacao.time)
                        }
                     
                        Spacer()
                        
                    }
        
                }
                
            } .navigationTitle("Notificações")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct Notificacoes_Previews: PreviewProvider {
    
                                                
    static var previews: some View {
        @State var notificacao = [ NotificationCellViewModel(photo: "asda", title: "dadad", descricao: "dadadadad", icon: "lightbulb.fill", time: "10:52")]
        Notificacoes(notificacoes: $notificacao)
    }
}
