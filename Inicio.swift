//
//  Inicio.swift
//  Plato
//
//  Created by Lyvia Martins on 06/09/23.
//

import SwiftUI

struct Inicio: View {
    @State private var isShowingPostView = false
    
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("recplato")
                        .resizable()
                        .frame(height: 120)
                        .ignoresSafeArea()
                    Image("logotipoplato")
                        .resizable()
                        .frame(width: 64, height: 19.75)
                        .padding(.top, 44)
                }
                ScrollView {
                    HStack {
                        Menu {
                            Button {
                                
                            } label: {
                                Image("bolinha1")
                                Text("Geral")
                            }
                            Button {
                            } label: {
                                Image("bolinha2")
                                Text("Design")
                            }
                            Button {
                            } label: {
                                Image("bolinha3")
                                Text("Programação")
                            }
                            Button {
                            } label: {
                                Image("bolinha4")
                                Text("Inovação")
                            }
                            Button {
                            } label: {
                                Image("bolinha5")
                                Text("Negociações")
                            }
                            Button {
                            } label: {
                                Image("bolinha6")
                                Text("Challenges")
                            }
                            Button {
                            } label: {
                                Image("bolinha7")
                                
                                Text("Organização")
                            }
                            Button {
                            } label: {
                                Image("bolinha8")
                                Text("Off-topic")
                            }
                        }
                    label: {
                        Text ("Geral")
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .padding(.leading)
                            .font(.system(size: 24))
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.black)
                            .imageScale(.small)
                        
                    } .padding(.leading, 8)
                            .padding(.vertical, 10)
                        Spacer()
                        
                        
                    }
                    
                    
                    VStack (spacing: -04) {
                        ForEach(viewModel.posts) { post in
                            PostView(post: post, isButtonsHidden: false)
                        }
                        
                    }
                }.padding(.top, 12)
                Spacer()
                
            }.ignoresSafeArea()
            
            VStack {
                Spacer ()
                HStack {
                    Spacer ()
                    
                    Button {
                        isShowingPostView = true           } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .frame (width: 72, height: 72)
                                .background (Color.blue)
                                .cornerRadius(100)
                                .foregroundColor(Color.white)
                        }
                    
                    
                    
                        .padding()
                }
            }
            if isShowingPostView {
                NewPostView(backButtonPressed: {
                    isShowingPostView = false
                }
                )
            }
        }
        
    }
    
}



struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio(viewModel: PostViewModel())
    }
}
