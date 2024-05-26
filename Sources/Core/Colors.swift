//
//  Colors.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Foundation
import Rainbow

final class Colors {

    func setup() {
        print("\nEnter the number of colors you want to add:".yellow)
        
        guard let countInput = readLine(), let count = Int(countInput) else {
            print("Invalid Input. Please enter a number.".red)
            return
        }

        var colors: [(name: String, hexCode: String)] = []

        for i in 1...count {
            print("Enter the color name \(i):")
            guard let name = readLine(), !name.isEmpty else {
                print("Invalid name. Try again.".red)
                continue
            }

            print("Enter the hexadecimal code to \(name) (ex: #FFFFFF):")
            guard let hexInput = readLine(), let _ = Int(hexInput.replacingOccurrences(of: "#", with: ""), radix: 16) else {
                print("Invalid hexadecimal code. Try again.".red)
                continue
            }

            let hexCode = hexInput.replacingOccurrences(of: "#", with: "0x")
            colors.append((name: name, hexCode: hexCode))
        }

        generateFile(with: colors)
    }

    private func generateFile(with colors: [(name: String, hexCode: String)]) {
        let filePath = "Colors.swift"
        
        var swiftCode = """
        import UIKit

        extension UIColor {

            fileprivate convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
                assert(red >= 0 && red <= 255, "Invalid red component")
                assert(green >= 0 && green <= 255, "Invalid green component")
                assert(blue >= 0 && blue <= 255, "Invalid blue component")
                self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
            }

            convenience init(hexadecimal: String, alpha: CGFloat) {
                let hex = Int(hexadecimal.dropFirst(2), radix: 16) ?? 0
                self.init(red: (hex >> 16) & 0xff,
                          green: (hex >> 8) & 0xff,
                          blue: hex & 0xff,
                          alpha: alpha)
            }
        }

        extension UIColor {

        """
        
        for color in colors {
            swiftCode += """

                static var \(color.name): UIColor = {
                    return UIColor(hexadecimal: "\(color.hexCode)", alpha: 1.0)
                }()

            """
        }
        
        swiftCode += "}\n"

        do {
            try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("✅ File generated successfully: \(filePath)".green)
        } catch {
            print("❌ An error occurred while generating the file.".red)
        }
    }
}
