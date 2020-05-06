//
//  Ciphers.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/19/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

struct Ciphers: View {
    @State private var expand = false
    @State private var views = [CaesarView(), VigenereView(), SubstitutionView(), AtbashView(), MorseView()]
    @State private var viewTitles = ["Caesar", "Vigenere", "Simple Sub","Atbash", "Morse"]
    
    @State private var showC = true
    @State private var showV = false
    @State private var showS = false
    @State private var showA = false
    @State private var showM = false
    @State private var selectedView = 0
    
    var body: some View {
        NavigationView(){
            VStack() {
                VStack() {
                    HStack() {
                        Text(viewTitles[selectedView])
                            .font(.title)
                            .foregroundColor(Color("Orange"))
                            .bold()
                        Image(systemName: expand ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6)
                            .foregroundColor(Color("Orange"))
                    }.onTapGesture {
                        self.expand.toggle()
                    }
                    
                    
                    if expand {
                        if(!showC){
                            Button(action: {
                                self.expand.toggle()
                                self.selectedView = 0
                                self.showS = false
                                self.showV = false
                                self.showC = true
                                 self.showM = false
                                self.showA = false
                                self.expand = false
                                
                            }) {
                                Text("Caesar")
                                    .font(.title)
                                    .bold()
                            }.foregroundColor(Color("Orange"))
                        }
                        if(!showV){
                            Button(action: {
                                self.expand.toggle()
                                self.selectedView = 1
                                self.showS = false
                                self.showV = true
                                self.showC = false
                                 self.showM = false
                                self.showA = false
                                self.expand = false
                                
                            }) {
                                Text("Vigenere")
                                    .font(.title)
                                    .bold()
                                
                                
                            }.foregroundColor(Color("Orange"))
                        }
                        if(!showS){
                            Button(action: {
                                self.expand.toggle()
                                self.selectedView = 2
                                self.showS = true
                                self.showV = false
                                self.showC = false
                                self.showA = false
                                 self.showM = false
                                self.expand = false
                                
                            }) {
                                Text("Simple Sub.")
                                    .font(.title)
                                    .bold()
                                
                            }.foregroundColor(Color("Orange"))
                        }
                        if(!showA){
                            Button(action: {
                                self.expand.toggle()
                                self.selectedView = 3
                                self.showA = true
                                self.showS = false
                                self.showC = false
                                self.showV = false
                                self.showM = false
                                self.expand = false
                            }) {
                                Text("Atbash")
                                    .font(.title)
                                    .bold()
                                
                                
                            }.foregroundColor(Color("Orange"))}
                        if(!showM){
                            Button(action: {
                                self.expand.toggle()
                                self.selectedView = 4
                                self.showA = false
                                self.showS = false
                                self.showC = false
                                self.showV = false
                                self.showM = true
                                self.expand = false
                            }) {
                                Text("Morse")
                                    .font(.title)
                                    .bold()
                                
                                
                            }.foregroundColor(Color("Orange"))}
                    }
                    
                }
                .padding(.vertical,15)
                .padding(.horizontal, 100)
                .background(Color("White"))
                .cornerRadius(15)
                .shadow(color: .gray, radius: 5)
                .animation(.spring())
                
                Spacer()
                    .frame(height: 75)
                
                VStack(){
                    if(!expand){
                        if(showC){
                            CaesarView()
                        }
                        else if(showV){
                            VigenereView()
                        }else if(showS){
                            SubstitutionView()
                        }
                        else if(showA){
                            AtbashView()
                        }
                        else if(showM){
                            MorseView()
                        }
                    }
                    
                }
            }
            .navigationBarTitle(Text("Ciphers").font(.largeTitle))
        }
        
        
        //        ZStack{
        //
        //            VStack{
        //
        //
        //                ZStack{
        //
        //
        //                    VStack(alignment: .center){
        //                        VStack(){
        //                            HStack(){
        //                                Text("Ciphers")
        //                                    .font(.title)
        //                                    .foregroundColor(Color.black)
        //                                    .bold()
        //                                Image(systemName: expand ? "chevron.up" : "chevron.down")
        //                                    .foregroundColor(Color.black)
        //                                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
        //                            }.padding(.bottom,50)
        //                                .onTapGesture {
        //                                    self.expand.toggle()
        //                            }
        //                            if(expand){
        //                                VStack(){
        //
        //                                    Button(action: {
        //                                        self.selectedView = 0
        //                                        self.showS = false
        //                                        self.showV = false
        //                                        self.showC = true
        //                                        self.showA = false
        //                                        self.expand = false
        //                                    }) {
        //                                        Text("Caesar")
        //                                            .font(.title)
        //                                            .foregroundColor(Color("Orange"))
        //                                            .bold()
        //                                    }
        //
        //
        //                                    Button(action: {
        //                                        self.selectedView = 1
        //                                        self.showS = false
        //                                        self.showV = true
        //                                        self.showC = false
        //                                        self.showA = false
        //                                        self.expand = false
        //                                    }) {
        //                                        Text("Vigenere")
        //                                            .font(.title)
        //                                            .foregroundColor(Color("Orange"))
        //                                            .bold()
        //                                    }
        //
        //
        //                                    Button(action: {
        //                                        self.selectedView = 2
        //                                        self.showS = true
        //                                        self.showV = false
        //                                        self.showC = false
        //                                        self.showA = false
        //                                        self.expand = false
        //                                    }) {
        //                                        Text("Substitution")
        //                                            .font(.title)
        //                                            .foregroundColor(Color("Orange"))
        //                                            .bold()
        //                                    }
        //
        //
        //                                    Button(action: {
        //                                        self.selectedView = 3
        //                                        self.showA = true
        //                                        self.showS = false
        //                                        self.showC = false
        //                                        self.showV = false
        //                                        self.expand = false
        //                                    }) {
        //                                        Text("Atbash")
        //                                            .font(.title)
        //                                            .foregroundColor(Color("Orange"))
        //                                            .bold()
        //                                    }
        //
        //
        //                                }.animation(.spring())
        //
        //                            }
        //                        }
        //                            VStack(){
        //                                if(!expand){
        //                                    if(showC){
        //                                        CaesarView()
        //                                    }
        //                                    else if(showV){
        //                                        VigenereView()
        //                                    }else if(showS){
        //                                        SubstitutionView()
        //                                    }
        //                                    else if(showA){
        //                                        AtbashView()
        //                                    }
        //                                }
        //
        //                            }
        //                        }
        //                    }
        //
        //                }
        //            }
        //
        //
        //        }
        
    }
}




struct ColoredToggleStyle: ToggleStyle {
    var label = ""
    var onColor = Color(UIColor.green)
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.white
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Text(label)
            Spacer()
            Button(action: { configuration.isOn.toggle() } )
            {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        Circle()
                            .fill(thumbColor)
                            .shadow(radius: 1, x: 0, y: 1)
                            .padding(1.5)
                            .offset(x: configuration.isOn ? 10 : -10))
                    .animation(Animation.easeInOut(duration: 0.1))
            }
        }
        
    }
}


struct Ciphers_Previews: PreviewProvider {
    static var previews: some View {
        Ciphers()
    }
}


//STABLE - BUTTONS W NAVIGATION VIEW
//struct Ciphers: View {
//    var body: some View {
//        ZStack{
//
//            VStack{
//                NavigationView {
//
//                    ZStack{
//
//
//                        VStack(alignment: .center, spacing: 100.0){
//
//
//
//                            NavigationLink(destination:CaesarView()) {
//                                Text("Caesar")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                    .padding(5)
//
//                            }
//                            .background(Color("Orange"))
//                            .cornerRadius(10)
//
//                            NavigationLink(destination:VigenereView()) {
//                                Text("Vigenere")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                    .padding(5)
//
//                            }
//                            .background(Color("Orange"))
//                            .cornerRadius(10)
//
//
//
//                            NavigationLink(destination:SubstitutionView()) {
//                                Text("Substitution")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                    .padding(5)
//
//                            }
//                            .background(Color("Orange"))
//                            .cornerRadius(10)
//
//                            NavigationLink(destination:AtbashView()) {
//                                Text("Atbash")
//                                    .foregroundColor(Color.black)
//                                    .bold()
//                                    .padding(5)
//
//                            }
//                             .background(Color("Orange"))
//                            .cornerRadius(10)
//
//
//
//                        }
//                    }
//
//                    .navigationBarTitle(Text("Ciphers"))
//                }
//
//            }
//        }
//
//    }
//}
