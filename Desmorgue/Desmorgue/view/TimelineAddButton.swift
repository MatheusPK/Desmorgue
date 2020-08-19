//
//  TimelineAddButton.swift
//  Desmorgue
//
//  Created by Marcos Vinicius Majeveski De Angeli on 19/08/20.
//  Copyright © 2020 Lidiane Chen. All rights reserved.
//

import Foundation
import SwiftUI

struct TimelineAddButton : View {
    
    
    
    var body : some View{
        
        HStack(){

            Button(action: {}){
                
                ZStack(){
                    Circle()
                        .strokeBorder(Color.black, lineWidth: 2)
                        .frame(width: 85, height: 85)
                    
                    Image(systemName: "plus")
                    .frame(width: 85, height: 85)
                        .foregroundColor(.black)
                    .scaleEffect(2)
                }
            }
            
            Spacer()
            
        }
    }
}
