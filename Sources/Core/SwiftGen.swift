//
//  SwiftGen.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Foundation
import Rainbow

final class SwiftGen {
    
    func setup() {
        print("What is the name of the project?")
        guard let projectName = readLine() else { return }
        
        if projectName.isEmpty {
            print("❌ Empty field".red)
        } else {
            generateFile(name: projectName)
        }
    }
    
    private func generateFile(name: String) {
        let filePath = "swiftgen.yml"

        let swiftCode = """
        output_dir: '\(name)/Resources/'
        strings:
          inputs: \(name)/Localization/Localizable.strings
          outputs:
            - templateName: structured-swift4
              output: LocalizableStrings.swift
        xcassets:
          inputs:
            - \(name)/SupportFiles/Assets.xcassets
          outputs:
            - templateName: swift4
              output: ImageAssets.swift
        """

        do {
            try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("✅ File generated successfully: \(filePath)".green)
        } catch {
            print("❌ We had an error generating".red)
        }
    }
}
