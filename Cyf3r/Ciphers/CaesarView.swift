//
//  Caesar.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/21/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI
import UIKit
struct CaesarView: View{
    @State private var doEncrypt = true
    @State private var selectedMode = 0
    @State private var modes = ["Encrypt", "Decrypt"]
    @State private var mode = "Encrypt"
    @State private var box1 = ""
    @State private var box2 = ""
    @State private var final = ""
    @State private var showCopy = false
    var body: some View {
 
            
             
            VStack(){
               
                TextField(String("\(switchMode()[0])"), text: $box1)
                    .padding(.all)
                    .background(Color("Teal"))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5)
                TextField("\(switchMode()[1])", text: $box2)
                    .padding(.all)
                    .background(Color("Teal"))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5)
               Picker(selection: $selectedMode, label: Text("Select a mode")) {
                ForEach(0 ..< modes.count) {
                       Text(self.modes[$0]).tag($0)
                   }
               }.pickerStyle(SegmentedPickerStyle())
                
                Button(action: {
                    print(self.selectedMode)
                    if (self.box1=="" || self.box2 == ""){
                        self.final = "Please enter text and shift."
                    }
                    else if(self.checkValid()){
                        self.showCopy = true
                        if(self.selectedMode == 0){
                            self.final = self.cipher(plaintext:self.box1, shift: Int(self.box2)!)
                        }
                        else if(self.selectedMode == 1){
                            self.final = self.decipher(ciphertext:self.box1, shift: Int(self.box2)!)
                        }
                    }
                    else{
                        self.final = "Enter valid shift."
                    }
                    
                })
                {
                    VStack(){
                    Text(String("Submit"))
                        .foregroundColor(Color.black)
                        .bold()
                        .padding(5)
                        .background(Color("Orange"))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 5)
                    }.padding(.top,20)
                }
                Text("")
                    .padding(.vertical,15)
                HStack(){
                    
                    
                    
                    if(self.showCopy){
                        
                        Button(action: {
                            UIPasteboard.general.string = self.final
                        }) {
                            HStack(){
                           Text(self.final)
                            .padding(.trailing,50)
                            Image(systemName: "doc.on.doc")
                            }
                            .padding(.all)
                             .foregroundColor(Color.black)
                             .background(Color("lightGray"))
                            .cornerRadius(10)
                            
                            
                        }
                    }
                }
            }
            .padding(.horizontal)
        
    }
    
    func switchMode() -> [String]{
        if selectedMode == 0 {
            return ["Plaintext","Shift","Encrypt"]
        }
        else{
            return ["Ciphertext","Shift","Decrypt"]
        }
    }
    func checkValid() -> Bool {
        var valid = true
        let box2Chars = Array(self.box2)
        for i in 0 ..< box2Chars.count{
            if(!box2Chars[i].isNumber){
                valid = false
            }
        }
        return valid
    }
    func cipher(plaintext:String, shift:Int ) -> String {
        
        let plaintextChars = Array(plaintext)
        
        let uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let lowercase = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        var result : [Character] = []
        
        for i in 0 ..< plaintext.count {
            if(plaintextChars[i].isLetter){
                if(plaintextChars[i].isUppercase){
                    let newLetter = uppercase[(uppercase.firstIndex(of: String(plaintextChars[i]))! + shift) % uppercase.count]
                    result.append(Character(newLetter))
                }
                else{
                    let newLetter = lowercase[(lowercase.firstIndex(of: String(plaintextChars[i]))! + shift) % uppercase.count]
                    result.append(Character(newLetter))
                }
            }
            else{
                result.append(plaintextChars[i])
            }
        }
        return String(result)
    }
    func decipher(ciphertext:String, shift:Int ) -> String {
        
        let ciphertextChars = Array(ciphertext)
        
        let uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let lowercase = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
        var result : [Character] = []
        
        for i in 0 ..< ciphertext.count {
            if(ciphertextChars[i].isLetter){
                if(ciphertextChars[i].isUppercase){
                    let newLetter = uppercase[(uppercase.firstIndex(of: String(ciphertextChars[i]))! - shift) % uppercase.count]
                    result.append(Character(newLetter))
                }
                else{
                    let newLetter = lowercase[(lowercase.firstIndex(of: String(ciphertextChars[i]))! - shift) % uppercase.count]
                    result.append(Character(newLetter))
                }
            }
            else{
                result.append(ciphertextChars[i])
            }
        }
        return String(result)
    }
    func getName() -> String{
        return "Caesar"
    }
}
struct Caesar_Previews: PreviewProvider {
    static var previews: some View {
        CaesarView()
    }
}
