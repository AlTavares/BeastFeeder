//
//  File.swift
//
//
//  Created by Alexandre Mantovani Tavares on 25/01/20.
//

import Foundation

class App {
    static let shared = App()
    private init() {}

    let name = "BeastFeeder"
    let server = Server()
    let balena = Balena()

    private var didStart = false
    func start() {
        guard didStart == false else { return }
        print(ASCII.appName)
        balena.setupShutdownSignals()
        server.start()
    }

    func shutdown() {
        logger.info("Shutting down")
        server.stop()
        print(ASCII.goodbye)
        exit(0)
    }
}
