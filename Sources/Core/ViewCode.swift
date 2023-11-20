//
//  ViewCode.swift
//
//
//  Created by João Lucas on 20/11/23.
//

import Foundation
import Rainbow

final class ViewCode {
    
    func setup() {
        print("Is the file public?: Yes/No")
        guard let isPublic = readLine() else { return }
        
        if isPublic.isEmpty {
            print("❌ Empty field".red)
        } else if isPublic == "Yes" {
            generateFile(isPublic: true)
        } else if isPublic == "No" {
            generateFile(isPublic: false)
        } else {
            print("❌ This option does not exist".red)
        }
    }
    
    private func generateFile(isPublic: Bool) {
        let filePath = "ViewCode.swift"

        let swiftCode = code(isPublic: isPublic)

        do {
            try swiftCode.write(toFile: filePath, atomically: true, encoding: .utf8)
            print("✅ File generated successfully: \(filePath)".green)
        } catch {
            print("❌ We had an error generating".red)
        }
    }
    
    private func code(isPublic: Bool) -> String {
        if isPublic == true {
            let swiftCodeWithPublic = """
            import Foundation

            public protocol ViewCode {
                func buildViewHierarchy()
                func setupConstraints()
                func configureViews()
            }

            public extension ViewCode {
                func setupBaseView() {
                    buildViewHierarchy()
                    setupConstraints()
                    configureViews()
                }

                func configureViews() {
                }
            }
            """
            
            return swiftCodeWithPublic
        } else {
            let swiftCode = """
            import Foundation

            protocol ViewCode {
                func buildViewHierarchy()
                func setupConstraints()
                func configureViews()
            }

            extension ViewCode {
                func setupBaseView() {
                    buildViewHierarchy()
                    setupConstraints()
                    configureViews()
                }

                func configureViews() {
                }
            }
            """
            
            return swiftCode
        }
    }
}
