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

            print("Is the file public?: Yes/No")
            guard let isPublic = readLine() else { return }

            if isPublic.isEmpty {
                print("❌ Empty field".red)
            } else if isPublic == "Yes" {
                generateFile(name: projectName, isPublic: true)
            } else if isPublic == "No" {
                generateFile(name: projectName, isPublic: false)
            } else {
                print("❌ This option does not exist".red)
            }
        }
    }

    private func generateFile(name: String, isPublic: Bool) {
        print("Do you want to save this file in a specific location? If you can't press enter")
        guard let path = readLine() else { return }

        if path.isEmpty {
            let filePath = "swiftgen.yml"
            let swiftCode = code(name: name, isPublic: isPublic)

            validateFileGenerated(swiftCode: swiftCode, filePath: filePath)
        } else {
            let filePath = "\(path)/swiftgen.yml"
            let swiftCode = code(name: name, isPublic: isPublic)

            validateFileGenerated(swiftCode: swiftCode, filePath: filePath)
        }
    }

    private func validateFileGenerated(swiftCode: String, filePath: String) {
        do {
            try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("✅ File generated successfully: \(filePath)".green)
        } catch {
            print("❌ We had an error generating".red)
        }
    }

    private func code(name: String, isPublic: Bool) -> String {
        if isPublic == true {
            let swiftCodeWithPublic = """
            output_dir: '\(name)/Resources/'
            strings:
              inputs: \(name)/Localization/Localizable.strings
              outputs:
                - templateName: structured-swift4
                  output: LocalizableStrings.swift
                  params: { "enumName": "LocalizableStrings", "publicAccess": true }
            xcassets:
              inputs:
                - \(name)/SupportFiles/Assets.xcassets
              outputs:
                - templateName: swift4
                  output: ImageAssets.swift
                  params: { "enumName": "ImageAssets", "publicAccess": true }
            """

            return swiftCodeWithPublic
        } else {
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

            return swiftCode
        }
    }
}
