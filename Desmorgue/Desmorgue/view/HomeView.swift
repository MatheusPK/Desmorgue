//
//  HomeView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI


let sectionSpacer:CGFloat = 20
let inSectionSpacer:CGFloat = 15




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct Home:View {
    
    
    
    var body: some View{
        ScrollView(.vertical){
            VStack(){
                HomeTop()
                
                Spacer()
                    .frame(height: sectionSpacer + 5)
                
                HomeMembers()
                
                Spacer()
                    .frame(height: sectionSpacer)
                
                HomeGoal()
                
                Spacer()
                    .frame(height: sectionSpacer)
                
                HomeLog()
            }
        }
    }
}



struct HomeTop:View {
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
            
            Text(group.name)
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


struct HomeMembers:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    var membersPictures:[String] = getPictures(group: group)
    var membersNames = getNames(group: group)
    var membersCount = group.members.count
    
    
    
    var body: some View{
        HStack(){
            VStack(spacing: 5){
                
                HStack(){
                    Text("Integrantes do Grupo:")
                        .padding(.trailing)
                        .font(.system(size: 25))
                    
                    Spacer()
                }.padding(.leading, 10)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 20){
                        ForEach(0...(membersCount-1), id: \.self) {i in
                            VStack(spacing: 0){
                                if self.membersPictures.count != 0{
                                    if self.membersPictures[i] != "null"{
                                        Image("\(self.membersPictures[i])")
                                            .frame(width: 50, height: 50)
                                    }
                                    else{
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.pink)
                                    }
                                }
                                else{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                }
                                
                                Text("\(self.membersNames[i])")
                                    .font(.system(size: 16))
                            }
                        }
                        VStack(spacing: 0){
                            
                            Image(systemName: "plus.circle")
                                .scaleEffect(3)
                                .frame(width: 50, height: 50)
                                .padding(.bottom)
                        }
                    }.padding(.horizontal, 20)
                }
            }
        }
    }
}



struct HomeGoal:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    
    var body: some View{
        
        VStack(spacing: 0){
            
            HStack(){
                
                Text("Objetivos do Grupo:")
                    .padding(.trailing)
                    .font(.system(size: 25))
                
                Spacer()
                
            }.padding(.leading, 10)
            
            Spacer().frame(height:15)
            
            ZStack(){
                
                Rectangle()
                    .cornerRadius(40)
                    .foregroundColor(.black)
                    .padding(.horizontal, 15)
                
                Rectangle()
                    .cornerRadius(38)
                    .foregroundColor(.white)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 2)
                
                Text("\(HomeGoal.group.goal)")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                
                
                
            }
        }
    }
}



struct HomeLog:View {
    static var group = dao.userProfile.group[dao.userProfile.currentGroup]
    var logEvents = getLogEvents(group: group)
    var logIcons = getLogIcons(group: group)
    var logDescriptions = getLogDescriptions(group: group)
    var logCount = group.log.count
    
    
    var body: some View{
        VStack(spacing: 0){
            HStack(){
                
                Text("Atividades Recentes:")
                    .padding(.trailing)
                    .font(.system(size: 25))
                
                Spacer()
                
            }.padding(.leading, 10)
            
            Spacer()
                .frame(height: 15)
            
            VStack(spacing: 15){
                
                ForEach(0...(self.logCount-1), id: \.self) {i in
                    HStack(spacing: 15){
                        
                        if self.logEvents[i] == EventType.File || self.logEvents[i] == EventType.Task || self.logEvents[i] == EventType.Notice {
                            Image(systemName: "\(self.logIcons[i])")
                                .frame(width: 100, height: 50)
                                .scaleEffect(2)
                        }
                        else if self.logEvents[i] == EventType.TimelineNode{
                            Image(systemName: "mappin.circle")
                                .frame(width: 100)
                        }/*
                        else if self.logEvents[i] == EventType.Exited || self.logEvents[i] == EventType.Joined {
                            
                            if self.logIcons[i] != "null"{
                                Image("\(self.logIcons[i])")
                                .frame(width: 100)
                            }
                            else {
                                Image(systemName: "person.crop.square")
                                    .frame(width: 100)
                            }
                            
                        }*/
                        else{
                            Spacer()
                                .frame(width: 100)
                        }
                        
                        
                        Text("\(self.logDescriptions[i])")
                        
                        Spacer()
                    }
                }
            }
        }
    }
}



func getPictures(group: Group) -> [String]{
    var pics:[String] = []
    for member in group.members {
        if member.picture != nil{
            pics.append(member.picture!)
        }
        else{
            pics.append("null")
        }
    }
    return pics
}


func getNames(group: Group) -> [String]{
    var names:[String] = []
    for member in group.members {
        names.append(member.name)
    }
    return names
}

func getLogEvents(group: Group) -> [EventType]{
    var logEvents:[EventType] = []
    for event in group.log {
        logEvents.append(event.eventType)
        print(event.eventType)
    }
    return logEvents
}

func getLogIcons(group: Group) -> [String]{
    var logIcons:[String] = []
    for event in group.log {
        if event.icon != nil{
            logIcons.append(event.icon!)
        }
        else{
            logIcons.append("null")
        }
        
        
    }
    return logIcons
}

func getLogDescriptions(group: Group) -> [String]{
    var logDescriptions:[String] = []
    for event in group.log {
        logDescriptions.append(event.description)
    }
    return logDescriptions
}
