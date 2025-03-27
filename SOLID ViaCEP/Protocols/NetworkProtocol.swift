import Foundation

protocol NetworkProtocol {
    func fetch<T: Decodable>(from endpoint: String) async throws -> T
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(String)
} 