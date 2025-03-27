import Foundation

class NetworkService: NetworkProtocol {
    private let baseURL: String
    
    init(baseURL: String = "https://viacep.com.br/ws") {
        self.baseURL = baseURL
    }
    
    func fetch<T: Decodable>(from endpoint: String) async throws -> T {
        guard let url = URL(string: "\(baseURL)/\(endpoint)/json") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
} 