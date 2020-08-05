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
    static var tasks = dao.userProfile.group[dao.userProfile.currentGroup].taskBoard
    var tasksTitles = getTaskTitle(tasks: tasks)
    var tasksDeadlines = getTaskDeadline(tasks: tasks)
    var taskCount = tasks.count
    var now = Date()
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TimelineTop()
            TimelineBar(index: self.$index, offset: self.$offset)
            //Divider()
            ScrollView(.vertical, showsIndicators: false) {
                if self.index == 0 {
                    VStack(spacing: 30) {
                        ForEach(0...(taskCount-1), id: \.self) { i in
                            HStack(spacing: 5) {
                                Text(dateToString(date: self.tasksDeadlines[i]))
                                    .frame(width: 80)
                                    .padding(.leading)
                                if self.now > self.tasksDeadlines[i] {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                }
                                else {
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.green)
                                }
                                Text(self.tasksTitles[i])
                                
                                Spacer()
                            }.frame(height: 60)
                        }
                    }
                }
                
                else if self.index == 1 {
                    VStack(spacing: 30) {
                        ForEach(0...(taskCount-1), id: \.self) { i in
                            VStack {
                                
                                if self.now < self.tasksDeadlines[i] {
                                    HStack(spacing: 5) {
                                        Text(dateToString(date: self.tasksDeadlines[i]))
                                            .frame(width: 80)
                                            .padding(.leading)
                                        
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.green)
                                        
                                        Text(self.tasksTitles[i])
                                        Spacer()
                                        }.frame(height: 60)
                                }
                                Spacer()
                            }
                        }
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
    }
}


struct TimelineTop:View {
    var profile = dao.userProfile
    var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    var body: some View{
        ZStack() {
//            Rectangle()
//                .foregroundColor(.gray).opacity(0.40)
//                .edgesIgnoringSafeArea(.top)
//                .frame(height: 50)
            
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
                
                Text("Timeline")
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
}



struct TimelineScollView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineScollView()
    }
}

func getTaskTitle(tasks: [Task]) -> [String] {
    var titles:[String] = []
    for task in tasks {
        titles.append(task.title)
    }
    return titles
}

func getTaskDeadline(tasks: [Task]) -> [Date] {
    var deadlines:[Date] = []
    for task in tasks {
        deadlines.append(task.deadline)
    }
    deadlines = deadlines.sorted(by:{ $0.compare($1) == .orderedAscending} )
    return deadlines
}

func dateToString(date: Date) -> String {
    let data = DateFormatter()
    data.dateFormat = "dd/MM/yy"
    return data.string(from: date)
}
