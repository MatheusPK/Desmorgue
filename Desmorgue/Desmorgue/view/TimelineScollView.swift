//
//  TimelineScollView.swift
//  Desmorgue
//
//  Created by Matheus Kulick on 05/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import SwiftUI


struct TimelineScollView: View {
    static var tasks = dao.userProfile.group[dao.userProfile.currentGroup].taskBoard
    var tasksTitles = getTaskTitle(tasks: tasks)
    var tasksDeadlines = getTaskDeadline(tasks: tasks)
    var taskCount = tasks.count
    var now = Date()
    var body: some View {
        VStack() {
            TimelineTop()
            ScrollView(.vertical, showsIndicators: false) {
                VStack() {
                    ForEach(0...(taskCount-1), id: \.self) {i in
                        HStack(spacing: 15) {
                            Text(dateToString(date: self.tasksDeadlines[i]))
                            if self.now < self.tasksDeadlines[i] {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.green)
                            }
                            else {
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.red)
                            }
                            Text(self.tasksTitles[i])
                        }

                    }
                                
                }.padding(.leading)
                
            }
        }
        
        
    }
}

struct TimelineTop:View {
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
                    Circle()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.yellow)
                }
            }
            
            Spacer()
            
            Text("Timeline")
                .font(.system(size: 30))
            
            Spacer()
            
            Button(action: {ContentView().profilePage = true}){
                Circle()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(.blue)
            }
        }.padding(.horizontal, 15)
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
    return deadlines
}

func dateToString(date: Date) -> String {
    let data = DateFormatter()
    data.dateFormat = "dd/MM/yy"
    return data.string(from: date)
}
