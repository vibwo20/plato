//
//  FavView.swift
//  Favoritos2
//
//  Created by Joana Vitória Aires de Carvalho on 15/09/23.
//

import SwiftUI

class FavCardModel: ObservableObject, Identifiable {
    var imageName: String
    var titleName: String
    
    init(imageName: String, titleName: String) {
        self.imageName = imageName
        self.titleName = titleName
    }
}

struct FavView: View {
    
    var card: FavCardModel
    
    var body: some View {
        ZStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 156, height: 222)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: .black.opacity(0.7), location: 0.00),
                                Gradient.Stop(color: .black.opacity(0), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 1),
                            endPoint: UnitPoint(x: 0.5, y: 0.5)
                        )
                    )
                    .background(
                        Image(card.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 156, height: 222)
                            .clipped()
                    )
                    .cornerRadius(12)
                
            HStack{
                Text(card.titleName)
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(width: 127, height: 24, alignment: .bottomLeading)
                
            } .padding(.top, 170)
            }
        }
    }


struct FavView_Previews: PreviewProvider {
    static var previews: some View {
        FavView(card: FavCardModel(imageName: "Image 3", titleName: "Problema Swift"))
    }
}
