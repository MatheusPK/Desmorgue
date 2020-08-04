//
//  HomeView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 03/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



struct Home:View {
    var body: some View{
        VStack(){
            HomeTop()
            
            Spacer()
            
            HomeMembers()
            
            Spacer()
            
            HomeGoal()
            
            Spacer()
            
            HomeLog()
        }
    }
}



struct HomeTop:View {
    @ObservedObject var group = dao.userProfile.group[dao.userProfile.currentGroup]
    
    
    var body: some View{
        HStack(){
            if group.picture != ""{
                Button(action: { ContentView().isMenuActive = true}){
                    Image(group.picture).frame(width: 50, height: 50, alignment: .center)
                }
            }
            else{
                Button(action: {ContentView().isMenuActive = true}){
                    Circle().foregroundColor(.yellow).frame(width: 50, height: 50, alignment: .center)
                }
            }
            
            Spacer()
            
            Text(group.name)
            
            Spacer()
            
            Button(action: {ContentView().profilePage = true}){
                Circle().foregroundColor(.blue).frame(width: 50, height: 50, alignment: .center)
            }
        }
    }
}


struct HomeMembers:View {
    @ObservedObject var profile = dao.userProfile
    
    var body: some View{
        VStack(spacing: 0){
            Text("Integrantes do Grupo")
            
            Spacer()
            
            HStack(){
                VStack{
                    Circle().foregroundColor(.green).frame(width: 50, height: 50, alignment: .center)
                    
                    Text(profile.name)
                }
                
                
            }
        }
    }
}



struct HomeGoal:View {
    var body: some View{
        VStack(spacing: 0){
            Text("Objetivos do Grupo")
            
            Spacer()
            
            ZStack(){
                Rectangle().strokeBorder().cornerRadius(15).foregroundColor(.clear)
                
                Text("Nosso objetivo é fazer com que você consiga crescer na sua jornada com o auxílio do estudo em grupo que proporcionamos aqui na plataforma")
            }
        }
    }
}



struct HomeLog:View {
    var body: some View{
        VStack(spacing: 0){
            Text("Esse é o log")
        }
    }
}
