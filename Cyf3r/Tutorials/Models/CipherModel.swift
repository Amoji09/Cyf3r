//
//  Caesar.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/22/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

private struct Cipher{
    var name : String
    var description : String
    var image : Image
}

private struct CipherRow{
    var crypt: Cipher
    
    var body: some View {
            Text(crypt.name)
        }
    
}


private struct CipherDetailView{
    var crypt: Cipher
    
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
