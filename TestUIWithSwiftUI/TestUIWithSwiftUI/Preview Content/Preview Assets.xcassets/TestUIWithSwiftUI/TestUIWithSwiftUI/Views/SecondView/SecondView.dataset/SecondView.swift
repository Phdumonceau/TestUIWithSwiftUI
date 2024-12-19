//
//  SecondView.swift
//  TestUIWithSwiftUI
//
//  Created by Philippe Du Monceau on 17/12/24.
//

import SwiftUI

struct SecondView: View {
    let nombreUsuario: String
    @State private var mostrarModal: Bool = false
    @AppStorage("ultimaPantalla") var ultimaPantalla: String = "PantallaSecundaria"
    @AppStorage("nombreGuardado") var nombreGuardado: String = ""
    
    @Environment(\.presentationMode) var presentationMode

    let colorPrimario = Color.colorPrimario
    let colorSecundario = Color.colorSecundario

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(0..<20) { index in
                        HStack {
                            Image("imagen")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text("Elemento \(index + 1)")
                                .font(.headline)
                                .foregroundColor(colorPrimario)
                            Spacer()
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("¡Hola \(nombreUsuario)!")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button(action: {
                    mostrarModal = true
                }) {
                    Image(systemName: "info.circle")
                        .foregroundColor(colorSecundario)
                }
            )
            .sheet(isPresented: $mostrarModal) {
                ModalContentView()
                    .presentationDetents([.fraction(0.5), .large])
                    .presentationDragIndicator(.visible)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        ultimaPantalla = "PantallaSecundaria"
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Regresar")
                                .foregroundColor(colorSecundario)
                        }
                    }
                }
            }
        }
        .onAppear {
            ultimaPantalla = "PantallaSecundaria"
            nombreGuardado = nombreUsuario
        }
        .onDisappear {
            ultimaPantalla = "PantallaSecundaria"
        }
    }
}

#Preview {
    SecondView(nombreUsuario: "Philippe Du Monceau")
}
