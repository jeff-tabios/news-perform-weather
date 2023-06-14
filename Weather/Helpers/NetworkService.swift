//
//  NetworkService.swift
//  Weather
//
//  Created by Jeffrey Tabios on 6/14/23.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func loadData<T: Decodable>(url: URL) throws -> AnyPublisher<T, Error>
}

final class NetworkService: NetworkServiceProtocol {

    func loadData<T: Decodable>(url: URL) throws -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
