//
//  TimelineScollView.swift
//  Desmorgue
//
//  Created by Matheus Kulick on 05/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI


struct TimelineScollView: View {
    @State var index = 0
    @State var offset:CGFloat = 0
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    @State var tasks = group.taskBoard
    @State var orderedTasks = group.taskBoard.sorted(by:{$0.deadline < $1.deadline})
    var now = Date()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            TimelineTop()
            
            //TimelineBar(index: self.$index, offset: self.$offset)
            //Divider()

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(orderedTasks, id: \.self) { task in
                        HStack(spacing: 5) {
                            Text(dateToString(date: task.deadline))    .frame(width: 80)
                                .padding(.leading)
                            if self.now > task.deadline {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.red)
                            }
                            else {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.green)
                            }
                            Text(task.title)
                            
                            Spacer()
                        }.frame(height: 60)
                    }
                }
            }
            
        }
    }
}


//if self.index == 0 {
//    VStack(spacing: 30) {
//        ForEach(0...(taskCount-1), id: \.self) {i in
//            HStack(spacing: 5) {
//                    Text(dateToString(date: self.tasksDeadlines[i]))
//                        .frame(width: 80)
//                        .padding(.leading)
//                    if self.now > self.tasksDeadlines[i] {
//                        Circle()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.red)
//                    }
//                    else {
//                        Circle()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.green)
//                    }
//                    Text(self.tasksTitles[i])
//            }.frame(height: 60)
//
//            Spacer()
//        }
//    }
//}
//
//else if self.index == 1 {
//    VStack(spacing: 30) {
//        ForEach(0...(taskCount-1), id: \.self) {i in
//            if self.now > self.tasksDeadlines[i] {
//                HStack(spacing: 5) {
//                    Text(dateToString(date: self.tasksDeadlines[i]))
//                        .frame(width: 80)
//                        .padding(.leading)
//
//                    Circle()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.green)
//
//                    Text(self.tasksTitles[i])
//                }.frame(height: 60)
//            }
//
//
//            Spacer()
//        }
//    }
//}



struct TimelineBar:View {
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
                            Text("Todas")
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
                                Text("Afazer")
                                    .foregroundColor(self.index == 1 ? .black: Color.black.opacity(0.7))
                                       
                            }
                            Capsule()
                                .fill(self.index == 1 ? Color.black: Color.clear)
                                .frame(height: 4)
                                .padding(.horizontal, 5)
                        }
                    }

                }
            })
            
        }.frame(height:40)
    }
}


struct TimelineTop:View {
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
                
                Text("Timeline")
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



struct TimelineScollView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineScollView()
    }
}

func dateToString(date: Date) -> String {
    let data = DateFormatter()
    data.dateFormat = "dd/MM/yy"
    return data.string(from: date)
}
