//
//  TelemetryDeck.swift
//  TelemetryKit
//
//  Created by Harrison Heinig on 3/7/25.
//

/// An analytics utility for reporting analytic events and errors.
public final class AnalyticsKit: Sendable {
    
    /// Shared instance of ``AnalyticsKit`` for global access.
    public static let shared = AnalyticsKit()
    
    /// Underlying analytics manager responsible for handling events.
    private let analyticsManager: AnalyticsManaging
    
    /// Creates a new instance of ``AnalyticsKit``.
    init(analyticsManager: AnalyticsManaging = TelemetryDeckManager()) {
        self.analyticsManager = analyticsManager
    }
    
    /// Initializes the analytics reporting tool with the passed app identifier.
    ///
    /// This method must be called prior to any events are reported to ensure that events are recorded properly.
    public static func initialize(with appId: String) {
        Task {
            await AnalyticsKit.shared.analyticsManager.initialize(with: appId)
        }
    }
    
    /// Records the passed event to the analytics manager.
    /// - Parameters:
    ///   - event: The name of the event to be recorded.
    ///   - parameters: A dictionary of additional context to be added to the event.
    public static func recordEvent(_ event: String, parameters: [String: String] = [:]) {
        Task {
            await AnalyticsKit.shared.analyticsManager.recordEvent(event, parameters: parameters)
        }
    }
    
    /// Record the passed error to the analytics manager.
    /// - Parameters:
    ///   - id: The identifier for the error to be recorded.
    ///   - message: An optional description of the error.
    public static func recordError(_ id: String, message: String? = nil) {
        Task {
            await AnalyticsKit.shared.analyticsManager.recordError(id, message: message)
        }
    }
}
