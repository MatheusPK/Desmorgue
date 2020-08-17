//
//  CardView.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 17/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

struct TaskCard: View {
    @State var isExpanded:Bool = false
    @State var associatedTask:Task
    
    
    var body: some View{
        ZStack(){
            if isExpanded{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.up.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            Text(associatedTask.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            ZStack(){
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 2)
                                    .padding(.horizontal, 20)
                                
                                Text(associatedTask.description)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                            }
                            
                            Spacer()
                            
                            HStack(){
                                Text(associatedTask.getDeadline())
                                    .frame(width: 90, height: 30)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }.padding(.vertical, 15)
                    }
                }
            }
                
            else{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.down.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Spacer()
                            
                            Text(associatedTask.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            Spacer()
                            
                            HStack(){
                                Text(associatedTask.getDeadline())
                                    .frame(width: 90, height: 30)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }.padding(.vertical, 15)
                    }
                }
            }
        }
    }
}






struct NoticeCard: View {
    @State var isExpanded:Bool = false
    @State var associatedNotice:Notice
    
    var body: some View{
        ZStack(){
            if isExpanded{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.up.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            Text(associatedNotice.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            ZStack(){
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color.black, lineWidth: 2)
                                    .padding(.horizontal, 20)
                                
                                Text(associatedNotice.description)
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 25)
                                    .padding(.vertical, 10)
                            }
                            
                            Spacer()
                            
                        }.padding(.vertical, 15)
                    }
                }
            }
                
            else{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.down.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Text(associatedNotice.title)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            Spacer()
                        }.padding(.vertical, 15)
                    }
                }
            }
        }
    }
}





struct FileCard: View {
    @State var isExpanded:Bool = false
    @State var associatedFile:File
    
    
    var body: some View{
        ZStack(){
            if isExpanded{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.up.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Text(associatedFile.description)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            Spacer()
                            
                            Image(systemName: "icloud.and.arrow.down")
                                .scaleEffect(2)
                                .foregroundColor(.black)
                                .frame(width: 80, height: 80)
                            
                        }.padding(.vertical, 15)
                    }
                }
            }
                
            else{
                Button(action: {self.isExpanded.toggle()}){
                    ZStack(){
                        Rectangle()
                            .frame(height: 160)
                            .cornerRadius(15)
                            .padding(.horizontal, 15)
                            .foregroundColor(.green)
                            .opacity(0.6)
                        
                        VStack(){
                            HStack(){
                                Image(systemName: "chevron.down.circle")
                                    .frame(width: 35, height: 35)
                                    .padding(.leading, 15)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            Text(associatedFile.description)
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding(.horizontal, 15)
                            
                            Spacer()
                        }.padding(.vertical, 15)
                    }
                }
            }
        }
    }
}
