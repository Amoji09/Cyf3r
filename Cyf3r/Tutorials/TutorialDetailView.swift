//
//  TutorialDetailView.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/22/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

struct TutorialDetailView: View {
    var cryptid: Crypt
    
    var body: some View {
        ScrollView {
        
        
        VStack {
            Text(cryptid.name).font(.title).bold()
                .foregroundColor(Color("Orange"))
            cryptid.image
            .resizable()
               .aspectRatio(contentMode: .fit)
                .padding()
            Text(cryptid.description)
                .padding()
            Spacer()
            Text("Source: Cyptography Website")
        }
    }
    }
}

