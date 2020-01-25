//
//  Server.swift
//
//
//  Created by Alexandre Mantovani Tavares on 25/01/20.
//

import Foundation
import Swifter

class Server {
    private let port: UInt16 = 80
    let httpServer = HttpServer()

    func start() {
        setupRoutes()
        do {
            try httpServer.start(port, forceIPv4: true, priority: .default)
        } catch {
            logger.critical("\(error.localizedDescription)")
        }
    }

    func stop() {
        httpServer.stop()
    }

    private func setupRoutes() {
        let routes = Routes()

        httpServer["/"] = routes.healthCheck
        httpServer["/feed"] = routes.feed
        httpServer["/schedule"] = routes.schedule
    }
}

class Routes {
    func healthCheck(request: HttpRequest) -> HttpResponse {
        .ok(.text("OK"))
    }

    func feed(request: HttpRequest) -> HttpResponse {
        .ok(.text("OK"))
    }

    func schedule(request: HttpRequest) -> HttpResponse {
        .ok(.text("OK"))
    }
}
