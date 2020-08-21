
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
            
            ViewTop(title: "Mural")
            
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
        
        ZStack(){
            
            Rectangle()
                .foregroundColor(.init(UIColor.systemGray5))
            
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
        }.frame(height:40)
    }
}



struct Avisos: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var notices = group.noticeBoard
    
    var body: some View{
        ZStack(){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:15){
                    ForEach(notices, id: \.self) { notice in
                        NoticeCard(associatedNotice: notice)
                    }
                }.padding(.vertical, 15)
                }.animation(.default)
            
        }
    }
}
struct Arquivos: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var files = group.fileBoard
    
    var body: some View{
        
        ZStack(){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:15){
                    ForEach(files, id: \.self) { file in
                        FileCard(associatedFile: file)
                    }
                }.padding(.vertical, 15)
            }.animation(.default)
        
        }
    }
}
struct Tarefas: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var tasks = group.taskBoard
    
    
    var body: some View{
        ZStack(){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:15){
                    ForEach(tasks, id: \.self) { task in
                        TaskCard(associatedTask: task)
                    }
                    
                    Spacer()
                    
                }.padding(.vertical, 15)
            }.animation(.default)
            
            BoardAddButton()
        }
    }
}


