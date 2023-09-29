//
//  PostView.swift
//  Plato
//
//  Created by Lyvia Martins on 12/09/23.
//

import SwiftUI


class PostViewModel: ObservableObject {
    @Published var posts: [PostModel]
    
    @Published var user: String = "Lola Swift"
    
    
    var filterPostsByUser: [PostModel] {
        posts.filter { post in
            post.username == user
        }
        
    }
    
    init()
    {
        posts = Self.makePosts()
    }
    private func addPost(post: PostModel) {
        posts.append(post)
    }
    
    private static func makePosts () -> [PostModel] {
        return [
            PostModel(imageNameArray: ["i1"],
                      title: "Dica de leitura! 📚✨",
                      subtitle: "Pessoal, vocês conhecem 'Extrabold' de Ellen Lupton? Eu adorei essa leitura, me ajudou demais no challenge que a gente tá trabalhando!",
                      username: "Lola Swift",
                      imageUser: "icon lola perfil",
                      horas: "20 minutos atrás", isButtonsHidden: true, categoria: "Off-topic", catColor: Color.orange),
            PostModel(imageNameArray: [],
                      title: "Ajuda :((",
                      subtitle: "Amigos, tô tendo certa dificuldade em modificar o style do menu nativo. Não acho nada na net, alguém consegue me dar um help? SOS",
                      username: "Felipe Santos",
                      imageUser: "icon 1",
                      horas: "1 hora atrás", isButtonsHidden: true, categoria: "Programação", catColor: Color.green),
            PostModel(imageNameArray: ["i"],  title: "Inspos p/ interface?", subtitle: "Gente, to precisando fazer essa interface e não tá rolando por enquanto, quais as sugestões de vocês?", username: "Santiago Tavares", imageUser: "icon santiago", horas: "3 horas atrás", isButtonsHidden: true, categoria: "Design", catColor: Color.purple),
            PostModel(imageNameArray: [],  title: "Ideia 👀", subtitle: "Que tal a gente fazer uma exposição de apps no OpenDay? Podemos mostrar às pessoas os apps que fizemos por aqui na ADA!", username: "Gabriela Fernandes",imageUser: "icon 2", horas: "3 horas atrás", isButtonsHidden: true, categoria: "Organização", catColor: Color.pink),
            PostModel(imageNameArray: ["i1"],
                      title: "Podem me ajudar?",
                      subtitle: "Pessoal, vocês conhecem 'Extrabold' de Ellen Lupton? Eu adorei essa leitura, me ajudou demais no challenge que a gente tá trabalhando!",
                      username: "Lola Swift",
                      imageUser: "icon lola perfil",
                      horas: "20 minutos atrás", isButtonsHidden: true, categoria: "Off-topic", catColor: Color.orange),
            PostModel(imageNameArray: ["i1"],
                      title: "Dica de leitura! 📚✨",
                      subtitle: "Pessoal, vocês conhecem 'Extrabold' de Ellen Lupton? Eu adorei essa leitura, me ajudou demais no challenge que a gente tá trabalhando!",
                      username: "Lola Swift",
                      imageUser: "icon lola perfil",
                      horas: "20 minutos atrás", isButtonsHidden: true, categoria: "Off-topic", catColor: Color.orange),
            PostModel(imageNameArray: ["i1"],
                      title: "Dica de leitura! 📚✨",
                      subtitle: "Pessoal, vocês conhecem 'Extrabold' de Ellen Lupton? Eu adorei essa leitura, me ajudou demais no challenge que a gente tá trabalhando!",
                      username: "Lola Swift",
                      imageUser: "icon lola perfil",
                      horas: "20 minutos atrás", isButtonsHidden: true, categoria: "Off-topic", catColor: Color.orange)
            
        ]
    }
}

class PostModel: ObservableObject, Identifiable {
    var imageNameArray: [String] = []
    var title: String = ""
    var subtitle: String = ""
    var username: String = ""
    var imageUser: String = ""
    var horas: String = ""
    var categoria: String = ""
    var catColor: Color = Color.clear
    @Published var likes: Int = 0
    @Published var hearts: Int = 0
    let isButtonsHidden: Bool
    
    init(imageNameArray: [String], title: String, subtitle: String, username: String, imageUser: String, horas: String,  isButtonsHidden: Bool, categoria: String, catColor: Color) {
        self.imageNameArray = imageNameArray
        self.title = title
        self.subtitle = subtitle
        self.username = username
        self.imageUser = imageUser
        self.horas = horas
        self.isButtonsHidden = isButtonsHidden
        self.categoria = categoria
        self.catColor = catColor
    }
}

struct PostView: View {
    @State private var isFavorited = false
    @ObservedObject var post: PostModel
    @State private var isHearted = false
    @State private var isLiked = false
    @State private var showModal = false
    let isButtonsHidden: Bool
    
    var imageCount: Int {
        return post.imageNameArray.count
    }
    static var cardImage = CardImage(expandedCardImage: "post1")
    @State var cardViewArray = [CardModel(iconImageName: "icon lola perfil", personName: "Kim Namjoon", postDescription: "eu acho que uma boa...", expandedCardImage: "post1", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Juliana Moura", postDescription: "eu acho que uma boa...", expandedCardImage: "post2", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Roberto Alves", postDescription: "eu acho que uma boa...", expandedCardImage: "post3", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Marcos Antônio", postDescription: "eu acho que uma boa...", expandedCardImage: "post4", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Luísa Alencar", postDescription: "eu acho que uma boa...", expandedCardImage: "post1", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Sabrina Gonçalves", postDescription: "eu acho que uma boa...", expandedCardImage: "post2", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Júlio Lourenço", postDescription: "eu acho que uma boa...", expandedCardImage: "post3", imagem: cardImage),
                                CardModel(iconImageName: "icon lola perfil", personName: "Ariel Galvão", postDescription: "eu acho que uma boa...", expandedCardImage: "post4", imagem: cardImage)]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack {
                //cabeçalho com foto, username, horas postadas, tag e favoritar
                HStack {
                    //ft de perfil
                    Image(post.imageUser)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                        .clipped()
                    //username
                    VStack(alignment: .leading) {
                        Text(post.username)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(1)
                            .font(Font.headline.bold())
                            .foregroundColor(Color("cinza"))
                        
                        Text(post.horas)
                            .multilineTextAlignment(.leading)
                            .font(Font.subheadline)
                            .foregroundColor(Color("cinza"))
                    }
                    Spacer()
                    Text(post.categoria)
                        .font(Font.footnote)
                        .foregroundColor(post.catColor)
                        .padding(7.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(post.catColor, lineWidth: 1)
                        )
                    Button(action: {
                        isFavorited.toggle()
                    }) {
                        Image(systemName: isFavorited ? "star.fill" : "star")
                            .foregroundColor(isFavorited ? .yellow : .gray)
                            .font(.system(size: 20))
                    }
                }
            }
            .padding(.bottom, 8.0)
            
            
            Button {
                
                showModal.toggle()
            } label: {
                VStack (alignment: .leading) {
                    HStack {
                        Text(post.title)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                            .font(Font.title3.bold())
                            .foregroundColor (Color("cinza"))
                        Spacer()
                    }
                    
                    
                    if imageCount == 0 {
                    } else if imageCount == 1 {
                        Image(post.imageNameArray[0])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 180)
                            .frame(maxWidth: UIScreen.main.bounds.width - 60)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    } else if imageCount == 2 {
                        HStack {
                            Image(post.imageNameArray[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 170)
                                .frame(height: 170)
                                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            Image(post.imageNameArray[1])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 170)
                                .frame(height:170)
                                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        }
                    } else if imageCount == 3 {
                        HStack {
                            Image(post.imageNameArray[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: 180)
                                .frame(height: 180)
                                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            
                            VStack {
                                Image(post.imageNameArray[1])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 180)
                                    .frame(height: 85)
                                    .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                                Image(post.imageNameArray[2])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: 180)
                                    .frame(height: 85)
                                    .frame(maxWidth: UIScreen.main.bounds.width - 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            }
                        }
                    }
                    HStack {
                        Text (post.subtitle)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(3)
                            .font(.subheadline)
                            .foregroundColor (Color("cinza"))
                            .padding(.vertical, 5)
                    }
                    
                }
            }
            if !isButtonsHidden{
                HStack {
                    
                    Button(action: {
                        post.hearts += isHearted ? -1 : 1
                        isHearted.toggle()
                    }) {
                        Image(systemName: isHearted ? "heart.fill" : "heart")
                            .foregroundColor(isHearted ? .red : .gray)
                        Text("\(post.hearts)")
                            .foregroundColor(.gray)
                    }
                    
                    Button(action: {
                        post.likes += isLiked ? -1 : 1
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked ? "lightbulb.fill" : "lightbulb")
                            .foregroundColor(isLiked ? .yellow : .gray)
                        Text("\(post.likes)")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    Button(action: {
                        print("oiii")
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundColor(.gray)
                    }
                    
                }
                
                .padding(.vertical, 5)
            }
            
            Divider()
            
        }
        
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .center)
        .padding()
        
        .sheet(isPresented: $showModal) {
            ModalView(cardViewArray: $cardViewArray, post: post)
        }
    }
}



struct PostView_Previews: PreviewProvider {
    static var postModel = PostModel(imageNameArray: ["i1"],  title: "dica de leitura! 📚✨",
                                     subtitle: "pessoal, vocês conhecem 'Extrabold' de Ellen Lupton? eu adorei essa leitura, me ajudou demais no challenge que a gente tá trabalhando!", username: "Lola Swift", imageUser: "p2", horas: "3 horas atrás", isButtonsHidden: false, categoria: "Off-topic", catColor: Color.pink)
    static var isButtonsHidden = false
    static var previews: some View {
        Group {
            PostView(post: postModel, isButtonsHidden: isButtonsHidden)
            
        }
    }
}
