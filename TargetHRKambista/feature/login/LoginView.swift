//
//  Loginiew.swift
//  TargetHRKambista
//
//  Created by Joel Martin Chuco Marrufo on 7/01/21.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 114, height: 65)
                    .padding(.bottom, 55)
                
                VStack(alignment: .leading) {
                    Text("Correo")
                        .lineLimit(nil)
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .padding(.bottom, 5)
                    TextField("Correo", text: $viewModel.user)
                        .frame(width: 231.0, height: 40.0)
                        .modifier(CustomTextFieldRoundedStyle())
                        .padding(.bottom, 29)
                    Text("Contraseña")
                        .lineLimit(nil)
                        .padding(.leading)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 12))
                        .padding(.bottom, 5)
                    SecureField("Contraseña", text: $viewModel.password)
                        .frame(width: 231.0, height: 40.0)
                        .modifier(CustomTextFieldRoundedStyle())
                        .padding(.bottom, 136)
                    NavigationLink(
                        destination: HomeView()) {
                    }
                    Button("Iniciar Sesión"){
                        viewModel.loginKambista()
                    }
                    .frame(width: 229, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.buttonColor)
                    .cornerRadius(25)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.buttonColor, lineWidth: 1)
                    )
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}


extension Color {
    static var buttonColor: Color {
        return Color(red: 103.0/255.0, green: 223.0/255.0, blue: 195.0/255.0, opacity: 1.0)
    }
}
