//
//  Header.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Foundation
import Rainbow
import Figlet

final class Header {
    
    func setup() {
        Figlet.say("SwiftFileTools")
        
        print("About: With SwiftFileTools you can generate everyday files such as Colors, Typography, files for SwiftGen.".blue)
        print("Version: 1.0.0".blue)
        print("Github: https://github.com/heroesofcode/SwiftFileTools".blue)
    }
}
