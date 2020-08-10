//
//  ChatView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

struct Chat:View{
    var body:some View{
        VStack(){
            ChatTop()
            ChatView()
            Spacer()
        }
    }
    
}


struct ChatTop:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    var body: some View{
        ZStack(){
            Rectangle()
                .foregroundColor(.init(UIColor.systemGray5))
                .edgesIgnoringSafeArea(.top)
                .shadow(color: .black, radius: 0.5)
            
            HStack(){
                if group.picture != ""{
                    Button(action: { ContentView().isMenuActive = true}){
                        Image(group.picture)
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                }
                else{
                    Button(action: {ContentView().isMenuActive = true}){
                        Image(systemName: "line.horizontal.3")
                            .frame(width: 50, height: 50, alignment: .center)
                            .foregroundColor(.pink)
                            .scaleEffect(2)
                    }
                }
                
                Spacer()
                
                Text("Chat")
                    .font(.system(size: 30))
                
                Spacer()
                
                Button(action: {ContentView().profilePage = true}){
                    Image(systemName: "person.circle")
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.pink)
                        .scaleEffect(2)
                }
            }.padding(.horizontal, 15)
        }.frame(height: 50)
        
    }
}


struct ChatView:View{
    
    private var chatBubbleSend: some View {
    RoundedRectangle(cornerRadius: 6)
        .foregroundColor(.init(UIColor(red: 0.7, green: 1, blue: 0.8, alpha: 1)))
        .shadow(color: .gray, radius: 2)
    }
    
    private var chatBubbleRecieved: some View {
    RoundedRectangle(cornerRadius: 6)
        .foregroundColor(.init(UIColor(red: 0.7, green: 0.8, blue: 1, alpha: 1)))
        .shadow(color: .gray, radius: 2)
    }
    
    
    private var chatBubbleRecieved2: some View {
    RoundedRectangle(cornerRadius: 6)
        .foregroundColor(.init(UIColor(red: 0.9, green: 0.9, blue: 0.6, alpha: 1)))
        .shadow(color: .gray, radius: 2)
    }
    
    
    private var chatBubbleRecieved3: some View {
    RoundedRectangle(cornerRadius: 6)
        .foregroundColor(.init(UIColor(red: 0.9, green: 0.6, blue: 0.9, alpha: 1)))
        .shadow(color: .gray, radius: 2)
    }
    
    
    
    var body: some View{
        VStack(spacing: 20){
            HStack(){
                Text("Fala pessoal, tava pensando em marcar nossos encontros pra toda quinta 16:00, todo mundo pode?")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleSend)
                
                
                Spacer()
                
            }.padding(.horizontal, 10)
            
            
            
            HStack(){
                
                Text("Opa, por mim fechado")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleRecieved)
                
                Spacer()
                
            }.padding(.horizontal, 10)
            
            
            
            HStack(){
                Spacer()
                
                Text("Eu acho perfeito!")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleRecieved2)
                
            }.padding(.horizontal, 10)
            
            
            
            HStack(){
                
                
                Text("Pra mim é tranquilo também")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleRecieved3)
                
                Spacer()
                
            }.padding(.horizontal, 10)
            
            
            HStack(){
                Text("Fechado então!! Vou colocar lá no Mural de avisos pra todo mundo lembrar 😉")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleSend)
                
                
                Spacer()
                
            }.padding(.horizontal, 10)
            
            
            
            HStack(){
                Spacer()
                
                Text("Show! Coloquei uma lá no Mural também uma tarefa pra já irmos fazendo até a Palestra")
                .frame(width: 300)
                .padding(5)
                .background(chatBubbleRecieved2)
                
            }.padding(.horizontal, 10)
            
            Spacer()
            
            
            ZStack(){
                Rectangle()
                    .cornerRadius(40)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 15)
                    .frame(height: 40)
                
                Rectangle()
                    .cornerRadius(38)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 3)
                    .frame(height: 40)
                
                
                TextField("Digite aqui sua mensagem...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(height: 40)
                    .padding(.horizontal, 30)
                
            }
            
        }
    }

}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
