//
//  TargetHRKambistaApp.swift
//  TargetHRKambista
//
//  Created by Joel Martin Chuco Marrufo on 7/01/21.
//

import SwiftUI

@main
struct TargetHRKambistaApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel())
        }
    }
}
