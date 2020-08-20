//
//  BoardAddButton.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 19/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI


struct BoardAddButton:View{
    
    @State var boardAddPage = false
    
    
    var body: some View{
        
        ZStack(){
            
            if self.boardAddPage{
                
                BoardAddPage()
            }
            
            VStack(){
                
                Spacer()
                
                HStack(){
                    
                    Spacer()
                    
                    Button(action: {self.boardAddPage.toggle()}){
                        
                        ZStack(){
                            
                            Circle()
                                .strokeBorder(Color.black, lineWidth: 2)
                                .frame(width: 50, height: 50)
                            
                            Circle()
                                .foregroundColor(.init(UIColor.systemGray2))
                                .frame(width: 48, height: 48)
                            
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


struct BoardAddPage : View {
    
    
    var body : some View{
        
        Rectangle()
    }
}
