//
//  Balena.swift
//
//
//  Created by Alexandre Mantovani Tavares on 25/01/20.
//

import Foundation

class Balena {
    // Setup shutdown handlers to handle SIGINT and SIGTERM
    // https://www.balena.io/docs/reference/base-images/base-images/#how-the-images-work-at-runtime
    private let signalQueue = DispatchQueue(label: "shutdown")

    func setupShutdownSignals() {
        makeSignalSource(SIGTERM)
        makeSignalSource(SIGINT)
    }

    private func makeSignalSource(_ code: Int32) {
        let source = DispatchSource.makeSignalSource(signal: code, queue: signalQueue)
        source.setEventHandler {
            source.cancel()
            App.shared.shutdown()
        }
        source.resume()
        signal(code, SIG_IGN)
    }
}
