//
//  NewPostView.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 11/09/23.
//

import SwiftUI

struct NewPostView: View {
    @State private var criarPost: String = ""
    @State private var criarTitulo: String = ""
    
    var backButtonPressed: () -> Void
    
    
    var body: some View {
        ZStack {
            Color("cinzafundo")
            
            VStack {
                
                HStack {
                    
                    Button {
                        backButtonPressed()
                    } label: {
                        Image(systemName: "chevron.left")
                        Text("Voltar")
                    }
                    
                    Spacer()
                    
                    Button {
                        print("programar")
                    } label: {
                        Image(systemName: "clock")
                            .foregroundColor(Color("cinzapple"))
                        
                    }
                }
                .padding(.horizontal, 22)
                .padding(.top, 22)
                .padding(.bottom, 18)
                
                TextField("Nomeie sua ideia", text: $criarTitulo)
                    .font(.system(size: 14))
                    .padding(.vertical, 12 )
                    .background(Color("cinzagoria"))
                    .frame(width: 306)
                    .cornerRadius(12)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 4)
                
                // campo de texto
                VStack {
                    
                    TextField("O que você tem em mente?", text: $criarPost, axis: .vertical)
                        .padding(16)
                        .font(.system(size: 14))
                    
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            print("pic1")
                        } label: {
                            Image("imagepostpreview")
                                .resizable()
                                .frame(width: 48, height: 48)
                        }
                        
                        Button {
                            print("pic2")
                        } label: {
                            Image("imagepostpreview")
                                .resizable()
                                .frame(width: 48, height: 48)
                        }
                        
                        Button {
                            print("add pic")
                        } label: {
                            Image(systemName: "plus")
                                .imageScale(.medium)
                                .foregroundColor(Color("cinzapple"))
                        }
                        .frame(width: 48, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color("cinzapple"))
                        )
                        
                        Spacer()
                        
                    }
                    .padding(.bottom, 16)
                    .padding(.leading, 16)
                    
                }
                .frame(width: 306, height: 244)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("cinzapple"))
                )
                .padding(.bottom, 20)
                
                
                // botoes categoria + arquivos
                HStack {
                    Button {
                        print("menu")
                    } label: {
                        ZStack{
                            Color("cinzagoria")
                            
                            HStack{
                                Text("Design")
                                    .foregroundColor(Color("cinzapple"))
                                    .font(.system(size: 12))
                                
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .frame(width: 8, height: 5)
                                    .foregroundColor(Color("cinzapple"))
                                
                            }
                        }
                        .frame(width: 67, height: 22)
                        .padding(2)
                        .cornerRadius(4)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        print("mic")
                    } label: {
                        Image(systemName: "mic")
                            .foregroundColor(Color("cinzapple"))
                    }
                    
                    Button {
                        print("pic")
                    } label: {
                        Image(systemName: "camera")
                            .foregroundColor(Color("cinzapple"))
                    }
                    
                    Button {
                        print("link")
                    } label: {
                        Image(systemName: "link")
                            .foregroundColor(Color("cinzapple"))
                    }
                    
                }
                .padding(.horizontal, 22)
                .padding(.bottom, -12)
                
                // bottom buttons
                HStack(spacing: 20) {
                    Button{
                        print("rascunho")
                    } label: {
                        ZStack {
                            Color("cinzapple")
                            Text("Salvar rascunho")
                                .foregroundColor(.white)
                            
                        }
                        .cornerRadius(8)
                        
                    }
                    
                    Button{
                        print("postar")
                    } label: {
                        ZStack {
                            Color.blue
                            Text("Postar")
                                .foregroundColor(.white)
                        }
                        .cornerRadius(8)
                        
                        
                    }
                }
                .font(.system(size: 12))
                .frame(height: 32)
                .padding(22)
                
                
            }
        }
        .frame(width: 350, height: 487)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(backButtonPressed: {})
    }
}
