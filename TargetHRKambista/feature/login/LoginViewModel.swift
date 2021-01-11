//
//  LoginViewModel.swift
//  TargetHRKambista
//
//  Created by Joel Martin Chuco Marrufo on 8/01/21.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var user = ""
    @Published var password = ""
    @Published var isValid = false
    @Published var response: LoginResponse?
    
    @Published var error_message: String?
    
    func loginKambista() {
        let urlKambista = URL(string: "https://api-qa.kambista.com/login")!
        
        let loginRequest = LoginRequest(user: user, password: password)
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(loginRequest)
            let jsonString = String(data: jsonData, encoding: .utf8)
        
            var request = URLRequest(url: urlKambista)
            request.httpMethod = "post"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    guard let data = data else { return }
                    
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.response = response
                    }
                } catch {
                    self.error_message = error.localizedDescription
                    self.loginMowui()
                }
            }.resume()
        }
        catch {
        }
    }
    
    func loginMowui() {
        let urlMowui = "https://www.mowui.pe/kambista/login.json"
        
        guard let url = URL(string: urlMowui) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                
                let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.response = response
                }
            } catch {
                self.error_message = error.localizedDescription
            }
        }.resume()
    }
    
}
