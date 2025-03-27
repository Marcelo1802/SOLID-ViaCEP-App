import Foundation

protocol ViaCEPServiceProtocol {
    func fetchAddress(cep: String) async throws -> Address
}

class ViaCEPService: ViaCEPServiceProtocol {
    private let networkService: NetworkProtocol
    
    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchAddress(cep: String) async throws -> Address {
        return try await networkService.fetch(from: cep)
    }
} 