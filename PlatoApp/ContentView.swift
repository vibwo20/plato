//
//  ContentView.swift
//  PlatoApp
//
//  Created by Lyvia Martins on 13/09/23.
//

import SwiftUI
struct NotificationCell: View {
    
    var photo: String
    var title: String
    var descricao: String
    var icon: String
    var time: String

    
    var body: some View {
        
        HStack {
            Image(photo)
                .resizable()
                .frame(width: 52, height: 52)
                .padding(.trailing, 2)
            
            Spacer()
            
            VStack(alignment:.leading) {
                HStack{
                    Image(systemName: "lightbulb.fill")
                        .resizable()
                        .frame(width: 8, height: 14)
                        .foregroundColor(Color("cinzapple")
                        )
                    Text(title)
                        .font(.system(size: 12, weight: .semibold)
                        )
                        .padding(.bottom, 1)
                    Text(time)
                        .font(.system(size: 10, weight: .regular)
                        )
                        .padding(.leading, 24)
                }
                Text(descricao)
                    .font(.system(size: 11, weight: .regular))
            }
        }
        .frame(width: 370, height: 52)
        
        Divider()
        
    }
    
}


struct NotificationCellViewModel: Hashable {
    
    var photo: String
    var title: String
    var descricao: String
    var icon: String
    var time: String
}

struct ContentView: View {
    @ObservedObject var viewModel: PostViewModel
    
    @State var notificacoes: [NotificationCellViewModel] = [
        NotificationCellViewModel(photo: "icon lola perfil",title: "Lola Swift colaborou com seu post:", descricao: "mto bom, amg!!! comecei ontem e uma sugestão que eu tenho é o seguinte: tenta ir no site que eu te mandei no Slack e faz...",  icon: "lightbulb.fill", time: "10:52")
    ]
   
    @State var favCardArray = [FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift"),
                               FavCardModel(imageName: "image 11", titleName: "Problema Swift")]
    
    static var cardImage = CardImage(expandedCardImage: "post1")
    
    var body: some View {
        TabView {
            Inicio(viewModel: viewModel)
                .tabItem() {
                    Image(systemName: "house")
                    Text ("início")
                }
            
            Buscar()
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                    Text ("Buscar")
                }
            
            Notificacoes(notificacoes: $notificacoes)
                .tabItem() {
                    Image(systemName: "bell")
                    Text ("Notificações")
                }
            
            Perfil(favCardArray: $favCardArray, viewModel: PostViewModel())
                .tabItem() {
                    Image(systemName: "person")
                    Text("Perfil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
