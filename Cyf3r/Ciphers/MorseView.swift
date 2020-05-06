//
//  MorseView.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 4/21/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//
//TODO: Add copy button, update ui
import SwiftUI

struct MorseView: View{
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
                        .lineLimit(_: 3)
                       
                      Picker(selection: $selectedMode, label: Text("Select a mode")) {
                       ForEach(0 ..< modes.count) {
                              Text(self.modes[$0]).tag($0)
                          }
                      }.pickerStyle(SegmentedPickerStyle())
                       
                       Button(action: {
                            print("")
                           if(self.box1==""){
                            self.showCopy = true
                               self.final = "Please enter text."
                           }
                           else if(self.selectedMode == 0){
                            self.showCopy = true
                               self.final = self.cipher(plaintext:self.box1)
                           }
                           else if(self.selectedMode == 1){
                           self.showCopy = true
                               self.final = self.decipher(ciphertext:self.box1)
                           }
                       })
                       {
                           Text(String("Submit"))
                               .foregroundColor(Color.black)
                               .bold()
                               .padding(5)
                               .background(Color("Orange"))
                               .cornerRadius(10)
                        
                       }
                       Text("")
                           .padding(.vertical,20)
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
            return ["Plaintext","Encrypt"]
        }
        else{
            return ["Morse code","Decrypt"]
        }
    }
    func cipher(plaintext:String) -> String {
        
        let plaintextChars = Array(plaintext.uppercased())
        
         let uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "1", "2","3","4","5","6","7","8","9","0","!","@","$","&","(",")","_","-","+","=","/","?",",","."]
               let morse = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..", "/", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----.","-----","-.-.--",".--.-.",".....",".-...","-.--.","-.--.-","..--.-","-....-",".-.-.","-...-","-..-.","..--..","--..--",".-.-.-"]
        var result = ""
        
        for i in 0 ..< plaintextChars.count {
            if let plainIndex = uppercase.firstIndex(of: String(plaintextChars[i])){
                result += morse[plainIndex] + " "
            }
            else{
                result = "Invalid characters."
                break
            }
        }
        return result
    }
    func decipher(ciphertext:String) -> String {
        let ciphertext = ciphertext.split(separator: " ")
        
        let uppercase = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "1", "2","3","4","5","6","7","8","9","0","!","@","$","&","(",")","_","-","+","=","/","?",",","."]
        let morse = [".-", "-...", "-.-.", "-..", ".", "..-.", "--.", "....", "..", ".---", "-.-", ".-..", "--", "-.", "---", ".--.", "--.-", ".-.", "...", "-", "..-", "...-", ".--", "-..-", "-.--", "--..", "/", ".----", "..---", "...--", "....-", ".....", "-....", "--...", "---..", "----.","-----","-.-.--",".--.-.",".....",".-...","-.--.","-.--.-","..--.-","-....-",".-.-.","-...-","-..-.","..--..","--..--",".-.-.-"]
        
        var result = ""
        
        for i in 0 ..< ciphertext.count {
            
            if let morseIndex = morse.firstIndex(of: String(ciphertext[i])){
                let newCode = uppercase[morseIndex]
                result += newCode
            }
            else{
                result += "Invalid code."
                break
            }
        }
        return result
    }
}

struct MorseView_Previews: PreviewProvider {
    static var previews: some View {
        MorseView()
    }
}
