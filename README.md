# SOLID ViaCEP App

Este é um aplicativo iOS que demonstra a implementação dos princípios SOLID em Swift, utilizando a API do ViaCEP para busca de endereços.

## Princípios SOLID Implementados

### 1. Single Responsibility Principle (SRP)
- Cada classe tem uma única responsabilidade
- Separação clara entre:
  - Camada de rede (NetworkService)
  - Camada de dados (Models)
  - Camada de apresentação (ViewModels)
  - Camada de UI (Views)

### 2. Open/Closed Principle (OCP)
- O código está aberto para extensão, mas fechado para modificação
- Uso de protocolos para definir contratos
- Facilidade para adicionar novos tipos de serviços sem modificar o código existente

### 3. Liskov Substitution Principle (LSP)
- As classes derivadas podem substituir suas classes base
- Implementação de protocolos que garantem a consistência do comportamento

### 4. Interface Segregation Principle (ISP)
- Interfaces pequenas e específicas
- Separação de responsabilidades em protocolos distintos
- Evita dependências desnecessárias

### 5. Dependency Inversion Principle (DIP)
- Dependência de abstrações, não de implementações concretas
- Injeção de dependências
- Facilita a testabilidade e manutenção

## Estrutura do Projeto

```
SOLID ViaCEP/
├── Models/
│   └── Address.swift
├── Services/
│   ├── NetworkService.swift
│   └── ViaCEPService.swift
├── ViewModels/
│   └── AddressViewModel.swift
├── Views/
│   └── AddressView.swift
└── Protocols/
    └── NetworkProtocol.swift
```

## Como Usar

1. Clone o repositório
2. Abra o projeto no Xcode
3. Execute o aplicativo
4. Digite um CEP válido
5. Visualize os dados do endereço

## Requisitos

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Instalação

1. Clone o repositório:
```bash
git clone https://github.com/Marcelo1802/SOLID-ViaCEP-App.git
```

2. Abra o arquivo `SOLID ViaCEP.xcodeproj` no Xcode

3. Execute o projeto (⌘R)
