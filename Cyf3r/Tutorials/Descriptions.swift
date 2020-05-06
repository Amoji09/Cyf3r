//
//  Descriptions.swift
//  Cyf3r
//
//  Created by Amogh Mantri on 5/5/20.
//  Copyright © 2020 Amogh Mantri. All rights reserved.
//

import SwiftUI

struct DescriptionStorage{
    let caesarDescription = """
    Introduction

    The Caesar cipher is one of the earliest known and simplest ciphers. It is a type of substitution cipher in which each letter in the plaintext is 'shifted' a certain number of places down the alphabet. For example, with a shift of 1, A would be replaced by B, B would become C, and so on. The method is named after Julius Caesar, who apparently used it to communicate with his generals.
    
    More complex encryption schemes such as the Vigenère cipher employ the Caesar cipher as one element of the encryption process. The widely known ROT13 'encryption' is simply a Caesar cipher with an offset of 13. The Caesar cipher offers essentially no communication security, and it will be shown that it can be easily broken even by hand.
    
    Example

    To pass an encrypted message from one person to another, it is first necessary that both parties have the 'key' for the cipher, so that the sender may encrypt it and the receiver may decrypt it. For the caesar cipher, the key is the number of characters to shift the cipher alphabet.
    
    Here is a quick example of the encryption and decryption steps involved with the caesar cipher. The text we will encrypt is 'defend the east wall of the castle', with a shift (key) of 1.
    
    plaintext:  defend the east wall of the castle
    ciphertext: efgfoe uif fbtu xbmm pg uif dbtumf
    It is easy to see how each character in the plaintext is shifted up the alphabet. Decryption is just as easy, by using an offset of -1.
    
    plain:  abcdefghijklmnopqrstuvwxyz
    cipher: bcdefghijklmnopqrstuvwxyza
    Obviously, if a different key is used, the cipher alphabet will be shifted a different amount.
    """
    
    let vigenereDescription = """
    Introduction
    The Vigenère Cipher is a polyalphabetic substitution cipher. The method was originally described by Giovan Battista Bellaso in his 1553 book La cifra del. Sig. Giovan Battista Bellaso; however, the scheme was later misattributed to Blaise de Vigenère in the 19th century, and is now widely known as the Vigenère cipher.

    Blaise de Vigenère actually invented the stronger Autokey cipher in 1586.

    The Vigenère Cipher was considered le chiffre ind hiffrable (French for the unbreakable cipher) for 300 years, until in 1863 Friedrich Kasiski published a successful attack on the Vigenère cipher. Charles Babbage had, however, already developed the same test in 1854. Gilbert Vernam worked on the vigenere cipher in the early 1900s, and his work eventually led to the one-time pad, which is a provably unbreakable cipher.

    The Algorithm
    The 'key' for a vigenere cipher is a key word. e.g. 'FORTIFICATION'

    The Vigenere Cipher uses the tableau (image above) to encipher the plaintext.

    To encipher a message, repeat the keyword above the plaintext:

    FORTIFICATIONFORTIFICATIONFO
    DEFENDTHEEASTWALLOFTHECASTLE

    Now we take the letter we will be encoding, 'D', and find it on the first column on the tableau. Then, we move along the 'D' row of the tableau until we come to the column with the 'F' at the top (The 'F' is the keyword letter for the first 'D'), the intersection is our ciphertext character, 'I'.

    So, the ciphertext for the above plaintext is:

    FORTIFICATIONFORTIFICATIONFO
    DEFENDTHEEASTWALLOFTHECASTLE
    ISWXVIBJEXIGGBOCEWKBJEVIGGQS

    """
    let substitutionDescription = """
Introduction
The simple substitution cipher is a cipher that has been in use for many hundreds of years (an excellent history is given in Simon Singhs 'the Code Book'). It basically consists of substituting every plaintext character for a different ciphertext character. It differs from the Caesar cipher in that the cipher alphabet is not simply the alphabet shifted, it is completely jumbled.

The simple substitution cipher offers very little communication security, and it will be shown that it can be easily broken even by hand, especially as the messages become longer (more than several hundred ciphertext characters).

Example
Here is a quick example of the encryption and decryption steps involved with the simple substitution cipher. The text we will encrypt is 'defend the east wall of the castle'.

Keys for the simple substitution cipher usually consist of 26 letters (compared to the caeser cipher's single number). An example key is:

plain alphabet : abcdefghijklmnopqrstuvwxyz
cipher alphabet: phqgiumeaylnofdxjkrcvstzwb
An example encryption using the above key:

plaintext : defend the east wall of the castle
ciphertext: giuifg cei iprc tpnn du cei qprcni
It is easy to see how each character in the plaintext is replaced with the corresponding letter in the cipher alphabet. Decryption is just as easy, by going from the cipher alphabet back to the plain alphabet. When generating keys it is popular to use a key word, e.g. 'zebra' to generate it, since it is much easier to remember a key word compared to a random jumble of 26 characters. Using the keyword 'zebra', the key would become:

cipher alphabet: zebracdfghijklmnopqstuvwxy
This key is then used identically to the example above. If your key word has repeated characters e.g. 'mammoth', be careful not to include the repeated characters in the cipher alphabet.
"""
    
    let atbashDescription = """
Introduction
The Atbash cipher is a substitution cipher with a specific key where the letters of the alphabet are reversed. I.e. all 'A's are replaced with 'Z's, all 'B's are replaced with 'Y's, and so on. It was originally used for the Hebrew alphabet, but can be used for any alphabet.

The Atbash cipher offers almost no security, and can be broken very easily. Even if an adversary doesn't know a piece of ciphertext has been enciphered with the Atbash cipher, they can still break it by assuming it is a substitution cipher and determining the key using hill-climbing. The Atbash cipher is also an Affine cipher with a=25 and b = 25, so breaking it as an affine cipher also works.

The Algorithm
The Atbash cipher is essentially a substitution cipher with a fixed key, if you know the cipher is Atbash, then no additional information is needed to decrypt the message. The substitution key is:

ABCDEFGHIJKLMNOPQRSTUVWXYZ
ZYXWVUTSRQPONMLKJIHGFEDCBA
To encipher a message, find the letter you wish to encipher in the top row, then replace it with the letter in the bottom row. In the example below, we encipher the message 'ATTACK AT DAWN'. The first letter we wish to encipher is 'A', which is above 'Z', so the first ciphertext letter is 'Z'. The next letter is 'T', which is above 'G', so that comes next. The whole message is enciphered:

ATTACK AT DAWN
ZGGZXP ZG WZDM
To decipher a message, the exact same procedure is followed. Find 'Z' in the top row, which is 'A' in the bottom row. Continue until the whole message is deciphered.
"""
}
