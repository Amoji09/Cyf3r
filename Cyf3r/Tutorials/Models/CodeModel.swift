//
//  CodeModel.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/22/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

private struct Crypt : Identifiable{
    var id = UUID()
    var name : String
    var description : String
    var image : Image
}

 struct CipherView{
    var crypt: Crypt
    
    var body: some View {
        
            VStack() {
                Text(crypt.name)
                     .font(.title)
                .bold()
                crypt.image
                Text(crypt.description)
            }

        }
    
}
