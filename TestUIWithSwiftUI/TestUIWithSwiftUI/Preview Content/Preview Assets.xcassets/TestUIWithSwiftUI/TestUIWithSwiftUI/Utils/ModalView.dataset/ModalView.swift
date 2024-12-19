//
//  ModalView.swift
//  TestUIWithSwiftUI
//
//  Created by Philippe Du Monceau on 17/12/24.
//

import SwiftUI

struct ModalContentView: View {
    @Environment(\.presentationMode) var presentationMode // Controlar el cierre del modal

    var body: some View {
        VStack(spacing: 20) {
            Text("Información de la Aplicación")
                .font(.headline)
                .padding(.top)

            VStack(alignment: .leading, spacing: 10) {
                Text("Nombre: Galería de Imágenes")
                Text("Desarrollador: Philippe Du Monceau")
                Text("Versión: 1.0")
                Text("Fecha: 2024")
                Text("Tema: Explorar imágenes y navegación")
            }
            .padding()

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss() // Cierra el modal
            }) {
                Text("Cerrar")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.colorSecundario)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
