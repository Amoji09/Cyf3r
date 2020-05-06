//
//  ContentView.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/19/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView {
           Ciphers()
             .tabItem {
                Image(systemName: "number.circle.fill")
                Text("Ciphers")
           }//phqgiumeaylnofdxjkrcvstzwb
           TutorialView()
             .tabItem {
                Image(systemName: "info.circle.fill")
                Text("Tutorials")
          }
//        Codes()
//           .tabItem {
//              Image(systemName: "list.bullet.indent")
//              Text("Codes")
//        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
