//
//  AnalyticsManaging.swift
//  TelemetryKit
//
//  Created by Harrison Heinig on 3/7/25.
//


protocol AnalyticsManaging: Sendable {
    func initialize(with appId: String) async
    func recordEvent(_ event: String, parameters: [String: String]) async
    func recordError(_ id: String, message: String?) async
}
