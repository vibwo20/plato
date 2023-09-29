//
//  Perfil.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 31/08/23.
//

import SwiftUI

struct Perfil: View {
    @Binding var favCardArray:[FavCardModel]
    @ObservedObject var viewModel: PostViewModel
    @State var segmentedChoice: PickerChoice = .userPosts
    
    enum PickerChoice {
        case allPosts, userPosts
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            NavigationView{
                
                VStack {
                    VStack {
                        
                        Image("icon lola perfil")
                            .resizable()
                            .frame(width: 80, height: 80)
                        
                        
                        Text("Lola Swift")
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.top, 4)
                        
                        
                        Text("lola.swift@ufpe.br")
                            .font(.system(size: 16, weight: .regular))
                            .accentColor(.gray)
                        
                    } .frame(height: 100)
                    
                    HStack {
                        Picker ("", selection: $segmentedChoice){
                            Text ("Minhas postagens").tag(PickerChoice.userPosts)
                            Text ("Minhas colaborações").tag(PickerChoice.allPosts)}
                        
                        .pickerStyle(.segmented)
                        .frame(width: 300, height: 100)
                        
                    } .padding(.bottom, -10)
                    
                    ScrollView {
                        VStack {
                            switch segmentedChoice {
                            case .allPosts:
                                ForEach(viewModel.posts) { post in
                                    PostView(post: post, isButtonsHidden: false)
                                }
                                
                            case .userPosts:
                                ForEach(viewModel.filterPostsByUser) { post in
                                    PostView(post: post, isButtonsHidden: false)
                                }
                                
                            }
                            
                        }
                        
                    } .frame(height: 500)
                        .padding(.bottom)
                    
                    
                }
                .toolbar {
                    
                    Menu {
                        
                        NavigationLink(destination: Favoritos (favCardArray: $favCardArray)) {
                            Text("Favoritos")
                            Image(systemName: "star")
                            
                        }
                        
                        
                        NavigationLink(destination: ConfiguracoesView()) {
                            Text("Configurações")
                            Image(systemName: "gearshape")
                            
                        }
                        
                    }  label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.black)
                        
                        
                    }
                }
            } .navigationTitle("Meu Perfil")
            .navigationBarTitleDisplayMode(.inline)
              
        }
    }
}

struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        @State var favCardArray = [FavCardModel(imageName: "Image 3", titleName: "ProblemaSwift")]
        Perfil(favCardArray: $favCardArray, viewModel: PostViewModel())
        
        
    }
}
