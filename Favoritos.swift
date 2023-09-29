//
//  FavoritesView.swift
//  Favoritos2
//
//  Created by Joana Vitória Aires de Carvalho on 22/09/23.
//

import SwiftUI

struct Favoritos: View {
    
    let columns: [GridItem] = [GridItem(),GridItem()]
    
    @Binding var favCardArray:[FavCardModel]
    
    var body: some View {
        
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(favCardArray) {FavCardModel in
                        FavView(card: FavCardModel)
                    }
                }
            } .frame(width: 350)
        } .padding(.top, 40)
    }
    
}

struct Favoritos_Previews: PreviewProvider {
    static var previews: some View {
        @State var favCardArray = [FavCardModel(imageName: "image 11", titleName: "Problema Swift")]
        Favoritos(favCardArray: $favCardArray)
    }
}
