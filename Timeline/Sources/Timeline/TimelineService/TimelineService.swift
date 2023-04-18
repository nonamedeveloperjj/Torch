//
//  TimelineService.swift
//
//
//  Created by John Snow on 05/04/2023.
//

import Foundation
import TorchNetwork

// sourcery: AutoMockable
protocol TimelineServiceProtocol: AnyObject {
    func fetchPublicTimelines(maxId: String?) async throws -> Result<[Status], Error>
}

public final class TimelineService: TimelineServiceProtocol {
    private let networkClient: HTTPClientProtocol

    init(networkClient: HTTPClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchPublicTimelines(maxId: String?) async throws -> Result<[Status], Error> {
        var queryItems: [String: String]? = nil
        if let maxId = maxId {
            queryItems = ["maxId": maxId]
        }
        
        let requestComponents = RequestComponents(
            scheme: "https",
            host: "mastodon.social",
            path: "/api/v1/timelines/public",
            method: .get,
            header: ["Content-Type": "application/json"],
            queryItems: queryItems
        )

        let result = try await networkClient.sendRequest(requestComponents: requestComponents)

        switch result {
        case let .success(data):
            guard let data = data else { return .failure(NSError()) }

            do {
                let decodedResult = try JSONDecoder().decode([Status].self, from: data)
                return .success(decodedResult)
            } catch {
                return .failure(error)
            }
        case let .failure(error):
            return .failure(error)
        }
    }
}
