//
//  HomeView.swift
//  TargetHRKambista
//
//  Created by Joel Martin Chuco Marrufo on 8/01/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("logo")
                .resizable()
                .frame(width: 114, height: 65)
                .padding(.bottom, 55)
            CardView(user: "prueba@kambista.com")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View {
    
    var user: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("¡Bienvenido!")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(.black)
                .padding(.top, 71)
                .padding(.bottom, 14)
            Text(user)
                .font(.system(size: 12, design: .default))
                .foregroundColor(.black)
                .padding(.bottom, 107)
        }.padding(.trailing, 20)
        .frame(width: 222, height: 229, alignment: .center)
        .background(Color.white)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(radius: 4, y: 4)
    }
    
}
