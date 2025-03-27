import Foundation
import SwiftUI

@MainActor
class AddressViewModel: ObservableObject {
    @Published var address: Address?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private let viaCEPService: ViaCEPServiceProtocol
    
    init(viaCEPService: ViaCEPServiceProtocol = ViaCEPService()) {
        self.viaCEPService = viaCEPService
    }
    
    func fetchAddress(cep: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            address = try await viaCEPService.fetchAddress(cep: cep)
        } catch NetworkError.invalidURL {
            errorMessage = "URL inválida"
        } catch NetworkError.invalidResponse {
            errorMessage = "Resposta inválida do servidor"
        } catch NetworkError.decodingError {
            errorMessage = "Erro ao decodificar os dados"
        } catch {
            errorMessage = "Erro desconhecido: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
} 