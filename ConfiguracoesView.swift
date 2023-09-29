//
//  Config.swift
//  Teste
//
//  Created by Vitória Beltrão Wenceslau do Ó on 31/08/23.
//

import SwiftUI

struct ConfiguracoesView: View {
    @State private var nomeConfig: String = ""
    @State private var isToggled = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("tablecolor")
                    .ignoresSafeArea()
                VStack{
                    Button {
                        
                    } label: {
                        Image("lola editar")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    Text("Lola Swift")
                    Text(verbatim: "lola.swift@ufpe.br")
                        .foregroundColor(Color("cinzapple"))
                    
                    List {
                        Button{
                            print("nome")
                        } label: {
                            HStack{
                                Text("Nome")
                                
                                Spacer()
                                
                                Text("Lola Swift")
                                    .frame(width: 80)
                                    .foregroundColor(Color("cinzinha"))
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("cinzinha"))
                            }
                        }
                        Button {
                            print("email")
                        } label: {
                            HStack{
                                Text("E-mail")
                                
                                Spacer()
                                
                                Text(verbatim: "lola.swift@ufpe.br")
                                    .foregroundColor(Color("cinzinha"))
                                    .frame(width: 140)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("cinzinha"))
                            }
                        }
                        Button {
                            print("alterarsenha")
                        } label: {
                            Text("Alterar senha")
                                .foregroundColor(.blue)
                        }
                    }
                    .scrollDisabled(true)
                    .frame(height: 170)
                    
                    
                    List {
                        HStack {
                            Image(systemName: "bell.badge.fill")
                                .padding(4)
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(6)
                                .padding(.trailing, 4)
                            Text("Notificações")
                            Toggle("", isOn: $isToggled)
                            
                        }
                    }
                    .scrollDisabled(true)
                    .frame(height: 80)
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
        }
        .navigationTitle("Configurações")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ConfiguracoesView_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguracoesView()
    }
}
