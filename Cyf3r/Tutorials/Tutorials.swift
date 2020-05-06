//
//  Tutorials.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/20/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//
//TODO: Literally everything
import SwiftUI

import SwiftUI

struct Crypt: Identifiable {
    var id = UUID()
    var name: String
    var image: Image
    var description: String
    var type: String
}

struct CryptRow: View {
    var crypt: Crypt
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(crypt.name).foregroundColor(Color("Orange")).bold()
                
            }
        }
    }
}

struct TutorialView: View {
    @State private var sections = Sections()

   
    var body: some View {
       
        NavigationView {
            ZStack(){
        
            List {
                ForEach(self.sections.sections) { section in
                    Section(header: Text(section.title).bold().foregroundColor(Color("Teal"))) {
                        ForEach(section.crypts){
                            crypt in
                            NavigationLink(destination: TutorialDetailView(cryptid: crypt)) {
                                CryptRow(crypt: crypt)
                            }
                        }
                    }
                }
                }.listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
                 
             
                .navigationBarTitle("Tutorials")
        }
        }.accentColor(Color("Teal"))
    }
}
struct SectionContainer : Identifiable{
        var id = UUID()
        var title : String
        var crypts : [Crypt]
    }
struct Sections {
    let dS = DescriptionStorage()
    
       lazy var sections = [SectionContainer(title: "Ciphers", crypts: [
        Crypt(name: "Caesar", image: Image("Caesar"), description: dS.caesarDescription, type : "Cipher"),
        Crypt(name: "Vigenere",image: Image("Vigenere"), description: dS.vigenereDescription, type : "Cipher"),
        Crypt(name: "Simple Substitution",image: Image("substitution"), description: dS.substitutionDescription, type : "Cipher"),
        Crypt(name: "Atbash", image:Image("atbash"), description: dS.atbashDescription, type : "Cipher"),Crypt(name: "Morse", image: Image("Caesar"), description: "", type : "Cipher")
       ])/*, SectionContainer(title: "Codes", crypts:[Crypt(name: "Morse", image: Image("Caesar"), description: "", type : "Code")
       ])*/]
}


   struct Tutorials_Previews: PreviewProvider {
           static var previews: some View {
               TutorialView()
           }
   }

