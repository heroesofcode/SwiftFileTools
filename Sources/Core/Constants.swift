//
//  Constants.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Foundation
import Rainbow

final class Constants {

    func setup() {
        generateFile()
    }

    private func generateFile() {
        let filePath = "Constants.swift"

        let swiftCode = """
        enum Constants {
            static let constant1: CGFloat = 1.0
            static let constant4: CGFloat = 4.0
            static let constant6: CGFloat = 6.0
            static let constant8: CGFloat = 8.0
            static let constant10: CGFloat = 10.0
            static let constant12: CGFloat = 12.0
            static let constant14: CGFloat = 14.0
            static let constant16: CGFloat = 16.0
            static let constant20: CGFloat = 20.0
            static let constant24: CGFloat = 24.0
            static let constant26: CGFloat = 26.0
            static let constant30: CGFloat = 30.0
            static let constant34: CGFloat = 34.0
            // ...
            static let constant120: CGFloat = 120.0
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
