
//  Mural.swift
//  Desmorgue
//
//  Created by Lidiane Chen on 26/07/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI



struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}

struct BoardView:View {
    @State var index = 0
    @State var offset:CGFloat = 0
    var body: some View{
        VStack(spacing: 0){
            
            MuralTop()
            
            Spacer().frame(height: 15)
            
            AppBar(index: self.$index, offset: self.$offset)
            if self.index==0{
                Avisos()
            }
            else if self.index==1{
                Arquivos()
            }
            else if self.index==2{
                Tarefas()
            }
        }
    }
}

struct AppBar:View {
    @Binding var index:Int
    @Binding var offset: CGFloat
    var body: some View{
        VStack(alignment: .center, content: {
            
            HStack{
                Button(action: {
                    self.index = 0
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(self.index == 0 ? .black: Color.black.opacity(0.7))
                        Text("Avisos")
                            .foregroundColor(self.index == 0 ? .black: Color.black.opacity(0.7))
                        
                    }
                    Capsule()
                        .fill(self.index == 0 ? Color.black: Color.clear)
                        .frame(height: 4)
                        .padding(.horizontal, 5)
                    }
                }
                Button(action: {
                    self.index = 1
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image(systemName: "folder")
                                .foregroundColor(self.index == 1 ? .black: Color.black.opacity(0.7))
                            Text("Arquivos")
                                .foregroundColor(self.index == 1 ? .black: Color.black.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 1 ? Color.black: Color.clear)
                            .frame(height: 4)
                            .padding(.horizontal, 5)
                    }
                }
                Button(action: {
                    self.index = 2
                }) {
                    VStack(spacing: 8){
                        HStack(spacing: 12){
                            Image(systemName: "doc.on.clipboard")
                                .foregroundColor(self.index == 2 ? .black: Color.black.opacity(0.7))
                            Text("Tarefas")
                                .foregroundColor(self.index == 2 ? .black: Color.black.opacity(0.7))
                                   
                        }
                        Capsule()
                            .fill(self.index == 2 ? Color.black: Color.clear)
                            .frame(height: 4)
                            .padding(.horizontal, 5)
                    }
                }
            }
        })
    }
}
struct Avisos: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var notices = group.noticeBoard
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0){
                ForEach(notices, id: \.self) { notice in
                    Button(action: {}){
                        ZStack(){
                            Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                            
                            Text(notice.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                        }
                    }
                }
            }
        }.padding(.bottom, 18)
    }
}
struct Arquivos: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var files = group.fileBoard
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0){
                ForEach(files, id: \.self) { file in
                    Button(action: {}){
                        ZStack(){
                            Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                             
                            Text(file.description)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                        }
                    }
                }
            }
        }.padding(.bottom, 18)
    }
}
struct Tarefas: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var tasks = group.taskBoard
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing:0){
                ForEach(tasks, id: \.self) { task in
                    Button(action: {}){
                        ZStack(){
                            Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                            
                            Text(task.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                        }
                    }
                }
            }
        }.padding(.bottom, 18)
    }
}


struct MuralTop:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    var body: some View{
        HStack(){
            if group.picture != ""{
                Button(action: { ContentView().isMenuActive = true}){
                    Image(group.picture)
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }
            else{
                Button(action: {ContentView().isMenuActive = true}){
                    Image(systemName: "ellipsis.circle")
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.black)
                        .scaleEffect(2)
                }
            }
            
            Spacer()
            
            Text("Murais")
                .font(.system(size: 30))
            
            Spacer()
            
            Button(action: {ContentView().profilePage = true}){
                Image(systemName: "person.circle")
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.black)
                    .scaleEffect(2)
            }
        }.padding(.horizontal, 15)
    }
}


func getNoticesTitles(group: Group) -> [String]{
    var noticeTitles:[String] = []
    for notice in group.noticeBoard {
        noticeTitles.append(notice.title)
    }
    return noticeTitles.reversed()
}
