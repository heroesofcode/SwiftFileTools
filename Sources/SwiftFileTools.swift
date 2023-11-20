// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct SwiftFileTools: ParsableCommand {
    mutating func run() throws {
        print("Name: ")
        
        guard let name = readLine() else { return }
        print(name)
    }
}
