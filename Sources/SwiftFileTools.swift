import ArgumentParser
import Figlet

@main
struct SwiftFileTools: ParsableCommand {
    mutating func run() throws {
        Figlet.say("SwiftFileTools")
    }
}
