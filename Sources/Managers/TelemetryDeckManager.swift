//
//  TelemetryDeckManager.swift
//  TelemetryKit
//
//  Created by Harrison Heinig on 3/7/25.
//

import TelemetryDeck

/// Actor responsible for reporting analytics events to `TelemetryDeck`.
actor TelemetryDeckManager: AnalyticsManaging {
    
    /// Initializes the ``TelemetryDeck`` with the passed app identifier.
    ///
    /// > Telemetry Deck requires that the initialization call is made from the main workspace.
    /// This method should not be used, Instead call `TelemetryDeck.initialize(config:`
    /// from within the main workspace.
    func initialize(with appId: String) {
        fatalError("ERROR: TelemetryDeck must be initialized from the main application workspace.")
    }
    
    /// Record the passed event in ``TelemetryDeck``.
    func recordEvent(_ event: String, parameters: [String: String] = [:]) {
        TelemetryDeck.signal(event, parameters: parameters)
    }
    
    /// Record the passed error in ``TelemetryDeck``.
    func recordError(_ id: String, message: String? = nil) {
        TelemetryDeck.errorOccurred(id: id, message: message)
    }
}
