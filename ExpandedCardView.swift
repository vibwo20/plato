//
//  ExpandedCardView.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 14/09/23.
//

import SwiftUI

class CardImage: ObservableObject {
    @Published var expandedCardImage: String = ""
    
    init(expandedCardImage: String) {
        self.expandedCardImage = expandedCardImage
    }
}

struct ExpandedCardView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var imagem: CardImage
    var action: () -> () = {}
    
    
    var body: some View {
        ZStack {
            Image(imagem.expandedCardImage)
                .resizable()
                .frame(width: 300, height: 370)
                .cornerRadius(20)
                .shadow(radius: 10)
            VStack {
                
                HStack{
                    
                    Spacer()
                    
                    Button {
                        action()
                    }label: {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("cinzapple"))
                    }
                }
                .frame(width: 260)
               
                Spacer()
                
                VStack{
                    
                    Spacer ()
                    
                    HStack{
                        Image("icon lola perfil")
                            .resizable()
                            .frame(width: 36, height: 36)
                        VStack (alignment: .leading) {
                            Text("Lola Swift")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                            Text("3h atrás")
                                .font(.system(size: 12, weight: .light))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                    }
                    Text("eu acho que uma boa ideia seria tu checar o dribbble! olha que massa essa inspo q achei por lá!")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.white)
                    
                }
                .frame(width: 260, height: 300)
                .padding(.bottom, 60)
               
        
            }
            .padding(.top, 60)
        }   .frame(width: 0, height: 0)
    }
}

struct ExpandedCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedCardView(imagem: CardImage(expandedCardImage: "post1"))
    }
}
