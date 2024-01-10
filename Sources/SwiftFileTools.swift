import ArgumentParser
import Figlet
import Rainbow

@main
struct SwiftFileTools: ParsableCommand {
    mutating func run() throws {
        Header().setup()
        print("-----------------------------".yellow)

        print("1 - swiftgen.yml")
        print("2 - Colors.swift")
        print("3 - Constants.swift")
        print("4 - ViewCode.swift")

        print("-----------------------------".yellow)

        print("Which file do you want to generate?")
        guard let option = readLine() else { return }

        if option.isEmpty {
            print("❌ Empty field".red)
        } else if option == "1" {
            SwiftGen().setup()
        } else if option == "2" {
            Colors().setup()
        } else if option == "3" {
            Constants().setup()
        } else if option == "4" {
            ViewCode().setup()
        } else {
            print("❌ This option does not exist".red)
        }
    }
}
