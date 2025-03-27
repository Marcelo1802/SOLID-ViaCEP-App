import SwiftUI

struct AddressView: View {
    @StateObject private var viewModel = AddressViewModel()
    @State private var cep = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Digite o CEP", text: $cep)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .padding()
                
                Button("Buscar") {
                    Task {
                        await viewModel.fetchAddress(cep: cep)
                    }
                }
                .buttonStyle(.borderedProminent)
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else if let address = viewModel.address {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Endereço: \(address.logradouro)")
                        Text("Complemento: \(address.complemento)")
                        Text("Bairro: \(address.bairro)")
                        Text("Cidade: \(address.localidade)")
                        Text("Estado: \(address.uf)")
                        Text("CEP: \(address.cep)")
                    }
                    .padding()
                }
                
                Spacer()
            }
            .navigationTitle("ViaCEP")
        }
    }
}

#Preview {
    AddressView()
} 