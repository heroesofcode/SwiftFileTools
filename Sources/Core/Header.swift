//
//  Header.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Figlet
import Foundation
import Rainbow

final class Header {

    func setup() {
        Figlet.say("SwiftFileTools")

        print("About: With SwiftFileTools you can generate everyday files such as Colors, Constants, ViewCode and files for SwiftGen.".blue)
        print("Version: 1.1.0".blue)
        print("Github: https://github.com/heroesofcode/SwiftFileTools".blue)
    }
}
