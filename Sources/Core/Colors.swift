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
        print("⚠️ We generate these colors in your file, you can change them and leave them with only the necessary colors".yellow)
        
        print("-----------------------------".yellow)
        
        generateFile()
    }
    
    private func generateFile() {
        let filePath = "Colors.swift"

        let swiftCode = """
        import UIKit

        extension UIColor {

            fileprivate convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
                assert(red >= 0 && red <= 255, "Invalid red component")
                assert(green >= 0 && green <= 255, "Invalid green component")
                assert(blue >= 0 && blue <= 255, "Invalid blue component")
                self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
            }
            
            convenience init(hexadecimal: Int, alpha: CGFloat) {
                self.init(red: (hexadecimal >> 16) & 0xff,
                          green: (hexadecimal >> 8) & 0xff,
                          blue: hexadecimal & 0xff,
                          alpha: alpha)
            }
        }
        
        extension UIColor {
            
            /// White
            static var whiteColor: UIColor = {
                return UIColor(hexadecimal: 0xFFFFFF, alpha: 1.0)
            }()
            
            /// Silver
            static var silverColor: UIColor = {
                return UIColor(hexadecimal: 0xC0C0C0, alpha: 1.0)
            }()
            
            /// Gray
            static var grayColor: UIColor = {
                return UIColor(hexadecimal: 0x808080, alpha: 1.0)
            }()
            
            /// Purple
            static var purpleColor: UIColor = {
                return UIColor(hexadecimal: 0x800080, alpha: 1.0)
            }()
        }
        """

        do {
            try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("✅ File generated successfully: \(filePath)".green)
        } catch {
            print("❌ We had an error generating".red)
        }
    }
}
