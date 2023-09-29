//
//  ModalView.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 08/09/23.
//

import SwiftUI

struct ModalView: View {
    @State private var isLiked = false
    @State private var isShowingPostView = false
    @State private var isShowingExpandedCardView = false
    
    
    let columns: [GridItem] = [GridItem(),GridItem()]
    
    @Binding var cardViewArray : [CardModel]
    @ObservedObject var post: PostModel
    
    
    var body: some View {
        ZStack {
            VStack{
                Rectangle()
                    .frame(width: 50.0, height: 5.0)
                    .cornerRadius(100)
                    .foregroundColor(Color("cinzapple"))
                    .padding(.top, 8)
                
                    ScrollView{
                        PostView(post: post, isButtonsHidden: true)

                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(cardViewArray) { item in
                                CardView(card: item, action: {isShowingExpandedCardView.toggle()})

                        }
                    } .frame(width: 350)
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 4)
                
                ZStack(alignment: .top) {
                    
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(height: 68)
                        .foregroundColor(.white)
                    
                    Button {
                        isShowingPostView = true
                    } label: {
                        Text("Colabore com este moodboard!")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .background {
                                Rectangle()
                                    .frame(width: 240, height: 36)
                                    .cornerRadius(20)
                                    .foregroundColor(Color("laranjato"))
                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
                            }  .padding(.top, 35)
                    }
                    
                    Divider()
                }
            }
            
            if isShowingPostView {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                NewPostView(backButtonPressed: {
                    isShowingPostView = false
                }
                )
            }
            
        }.overlay(content: {
            if isShowingExpandedCardView {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                ExpandedCardView(imagem: CardImage(expandedCardImage: "post1"), action: {
                    isShowingExpandedCardView.toggle()
                })
            }
        }
        )
    }
}

struct ModalView_Previews: PreviewProvider {
    static var cardImage = CardImage(expandedCardImage: "post1")
    static var previews: some View {
        @State var cardViewArray = [  CardModel(iconImageName: "icon lola perfil", personName: "Kim Namjoon", postDescription: "eu acho que uma boa...", expandedCardImage: "post1", imagem: cardImage)]
        
        
        ModalView(cardViewArray: $cardViewArray, post: PostModel(imageNameArray: ["i1"],  title: "EXTRABOLD: uma leitura essencial!", subtitle: "Descubra novas perspectivas de design com 'Extrapold' de Ellen Lupton. Uma leitura inspiradora para expandir horizontes criativos. 📚✨ #LeituraRecomendada #DesignInovador #EllenLupton", username: "Lola Swift", imageUser: "p2", horas: "3 horas atrás", isButtonsHidden: false, categoria: "Design", catColor: Color.purple))
    }
}
