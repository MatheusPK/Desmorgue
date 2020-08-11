
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
    @State var expandedIndexes : [Int] = []
    
    var body: some View{
        ZStack(){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0){
                    ForEach(0...(notices.count-1), id: \.self) { i in
                        HStack(){
                            
                            if self.notices[i].isExpanded == false {
                                Button(action: {changeNoticeState(notice: self.notices[i])}){
                                    ZStack(){
                                    Rectangle()
                                        .frame(height: 160)
                                        .cornerRadius(15)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 15)
                                        .foregroundColor(.green)
                                        .opacity(0.6)
                                    
                                    Text(self.notices[i].title)
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 30)
                                }
                            }
                            }
                            else if self.notices[i].isExpanded == true {
                                ZStack(){
                                Button(action: {changeNoticeState(notice: self.notices[i])}){
                                    Rectangle()
                                        .frame(height: 300)
                                        .cornerRadius(15)
                                        .padding(.vertical, 15)
                                        .padding(.horizontal, 15)
                                        .foregroundColor(.green)
                                        .opacity(0.6)
                                    
                                    Text(self.notices[i].title)
                                        .font(.system(size: 25))
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 30)
                                }
                            }
                            }
                            else{
                                Button(action: {changeNoticeState(notice: self.notices[i])}){
                                    ZStack(){
                                Rectangle()
                                    .frame(height: 160)
                                    .cornerRadius(15)
                                    .padding(.vertical, 15)
                                    .padding(.horizontal, 15)
                                    .foregroundColor(.green)
                                    .opacity(0.6)
                                
                                Text(self.notices[i].title)
                                    .font(.system(size: 25))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 30)
                                }
                                }
                            }
                        }
                    }
                }
            }
            
            
            
            
            
            //BOTÃO DE ADICIONAR
            
            VStack(){
                Spacer()
                
                HStack(){
                    Spacer()
                    
                    Button(action: {}){
                        ZStack(){
                            Circle()
                                .foregroundColor(.pink)
                                .opacity(0.95)
                                .frame(width: 50, height: 50)
                                .shadow(color: .black, radius: 2)
                            
                            Image(systemName: "plus")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                        }
                    }.shadow(color: .black, radius: 55)
                }.padding(.horizontal, 10)
            }.padding(.vertical, 10)
        }
    }
}
struct Arquivos: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var files = group.fileBoard
    
    var body: some View{
        
        ZStack(){
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
                                    .padding(.horizontal, 30)
                                
                                
                            }
                        }
                    }
                }
            }
            
            
            
            //BOTÃO DE ADICIONAR
            
            VStack(){
                
                Spacer()
                
                HStack(){
                    Spacer()
                    
                    Button(action: {}){
                        ZStack(){
                            Circle()
                                .foregroundColor(.pink)
                                .opacity(0.95)
                                .frame(width: 50, height: 50)
                                .shadow(color: .black, radius: 2)
                            
                            Image(systemName: "plus")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                        }
                    }.shadow(color: .black, radius: 55)
                }.padding(.horizontal, 10)
            }.padding(.vertical, 10)
        }
        
        
        
        
    }
}
struct Tarefas: View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var tasks = group.taskBoard
    
    
    var body: some View{
        ZStack(){
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
                                    .padding(.horizontal, 30)
                                
                                VStack(){
                                    Spacer()
                                    
                                    HStack(){
                                        
                                        Text(task.getDeadline())
                                            .frame(width: 90, height: 30)
                                            .padding(.leading, 20)
                                            .padding(.bottom, 20)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                                
                                
                            }
                        }
                    }
                }
            }
            
            
            
            //BOTÃO DE ADICIONAR
            VStack(){
                Spacer()
                
                HStack(){
                    Spacer()
                    
                    Button(action: {}){
                        ZStack(){
                            Circle()
                                .foregroundColor(.pink)
                                .opacity(0.95)
                                .frame(width: 50, height: 50)
                                .shadow(color: .black, radius: 2)
                            
                            Image(systemName: "plus")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                        }
                    }.shadow(color: .black, radius: 55)
                }.padding(.horizontal, 10)
            }.padding(.vertical, 10)
        }
    }
}


struct MuralTop:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    var body: some View{
        ZStack(){
            Rectangle()
                .foregroundColor(.init(UIColor.systemGray5))
                .edgesIgnoringSafeArea(.top)
            
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
                
                Text("Mural")
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


func changeNoticeState(notice:Notice){
    if !notice.isExpanded {notice.isExpanded = true}
    else if notice.isExpanded {notice.isExpanded = false}
    else {notice.isExpanded = false}
    print(notice.isExpanded)
}

func changeFileState(file:File){
    if !file.isExpanded {file.isExpanded = true}
    else if file.isExpanded {file.isExpanded = false}
    else {file.isExpanded = false}
    
}

func changeTaskState(task:Task){
    if !task.isExpanded {task.isExpanded = true}
    else if task.isExpanded {task.isExpanded = false}
    else {task.isExpanded = false}
    
}
