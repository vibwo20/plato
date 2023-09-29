//
//  PostView.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 05/09/23.
//

import SwiftUI

class CardModel: ObservableObject, Identifiable {
    var iconImageName: String
    var personName: String
    var postDescription: String
    @Published var expandedCardImage: String = ""
    @Published var imagem: CardImage
    
    
    init(iconImageName: String, personName: String, postDescription: String, expandedCardImage: String, imagem: CardImage) {
        self.iconImageName = iconImageName
        self.personName = personName
        self.postDescription = postDescription
        self.expandedCardImage = expandedCardImage
        self.imagem = imagem
    }
}

struct CardView: View {
    
    var card: CardModel
    var action: () -> () = {}
    
    init(card: CardModel, action: @escaping () -> Void) {
        self.card = card
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            
            ZStack{
                
                Image(card.expandedCardImage)
                    .resizable()
                    .frame(width: 161, height: 198)
                    .cornerRadius(12)
                HStack{
                    Image(card.iconImageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.top, 154)
                        .padding(.leading, 0)
                    VStack (alignment: .leading) {
                        Text(card.personName)
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .semibold))
                        Text(card.postDescription)
                            .foregroundColor(.white)
                            .font(.system(size: 10, weight: .regular))
                    } .padding(.top, 154)
                }
            }
        }
    }
}


struct CardView_Previews: PreviewProvider {
    static var cardImage = CardImage(expandedCardImage: "post1")
    
    static var previews: some View {
        @State var isShowingExpandedCardView = false
        CardView(card: CardModel(iconImageName: "icon lola perfil", personName: "Kim Namjoon", postDescription: "eu acho que uma boa...", expandedCardImage: "post1", imagem: cardImage), action: {isShowingExpandedCardView.toggle()})
    }
}
