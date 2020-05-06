//
//  Codes.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/21/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//
//TODO: Add ascii, research more options, update ui to dropdown
import SwiftUI

struct Codes: View {
    var body: some View {
        ZStack{
            
            VStack{
                NavigationView {
                    
                    ZStack{
                        Color("BabyBlue")
                            .edgesIgnoringSafeArea(.all)
                        VStack(alignment: .center, spacing: 100.0){
                            
                            
                            
                            NavigationLink(destination:MorseView()) {
                                Text("Morse")
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .padding(5)
                                
                            }
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                            
                            
                        }
                    }
                        
                    .navigationBarTitle(Text("Codes"))
                }
                
            }
        }
        
    }
}






struct Codes_Previews: PreviewProvider {
    static var previews: some View {
        Codes ()
    }
}
extension Character: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
