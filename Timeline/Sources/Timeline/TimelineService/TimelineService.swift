//
//  TimelineService.swift
//
//
//  Created by John Snow on 05/04/2023.
//

import Foundation
import TorchNetwork

protocol TimelineServiceProtocol: AnyObject {
    func fetchPublicTimelines() async throws -> Result<[Status], Error>
}

public final class TimelineService: TimelineServiceProtocol {
    private let networkClient: HTTPClientProtocol

    init(networkClient: HTTPClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchPublicTimelines() async throws -> Result<[Status], Error> {
        let requestComponents = RequestComponents(
            scheme: "https",
            host: "mastodon.social",
            path: "/api/v1/timelines/public",
            method: .get,
            header: ["Content-Type": "application/json"]
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
