//
//  CaesarTutorialView.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/21/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI



struct CaesarDetailView: View{
  @State private var name = "Caesar"
  @State private var image = Image("Caesar")
  @State private var description = "Shift cipher"
    
    var body: some View{
        VStack(){
            Text(self.name)
            self.image
            Text(self.description)
        }
    }
    func getName() -> String{
        return self.name
    }
}


