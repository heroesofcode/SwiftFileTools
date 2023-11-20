import ArgumentParser
import Figlet
import Rainbow

@main
struct SwiftFileTools: ParsableCommand {
    mutating func run() throws {
        Header().setup()
    }
}
