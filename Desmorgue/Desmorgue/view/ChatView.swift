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
