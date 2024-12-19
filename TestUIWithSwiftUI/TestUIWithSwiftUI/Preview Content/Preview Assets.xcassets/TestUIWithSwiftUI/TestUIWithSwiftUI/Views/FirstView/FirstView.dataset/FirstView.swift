//
//  FirstView.swift
//  TestUIWithSwiftUI
//
//  Created by Philippe Du Monceau on 17/12/24.
//

import SwiftUI

struct FirstView: View {
    @State private var nombreUsuario: String = ""
    @AppStorage("ultimaPantalla") var ultimaPantalla: String = "PantallaPrincipal"
    @AppStorage("nombreGuardado") var nombreGuardado: String = ""
    @State private var mostrarAlerta: Bool = false
    @State private var irAGaleria: Bool = false
    @State private var mostrarBoton: Bool = false
    @State private var isFirstAppear: Bool = true

    let colorPrimario = Color.colorPrimario
    let colorSecundario = Color.colorSecundario

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("imagenBienvenida")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .animation(.spring())
                
                Text("Galería de Imágenes")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(colorPrimario)
                    .animation(.easeIn)
                
                TextField("Ingresa tu nombre", text: $nombreUsuario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if mostrarBoton {
                    Button(action: {
                        if nombreUsuario.isEmpty {
                            mostrarAlerta = true
                        } else {
                            nombreGuardado = nombreUsuario
                            ultimaPantalla = "PantallaSecundaria"
                            irAGaleria = true
                        }
                    }) {
                        Text("Ir a la Galería")
                            .padding()
                            .background(colorSecundario)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .padding()
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text("Campo Vacío"),
                    message: Text("Por favor, ingresa un nombre de usuario para continuar."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .fullScreenCover(isPresented: $irAGaleria) {
                SecondView(nombreUsuario: nombreUsuario)
            }
            .onAppear {
                if ultimaPantalla == "PantallaPrincipal" {
                    withAnimation(.easeIn(duration: 1)) {
                        mostrarBoton = true
                    }
                } else if ultimaPantalla == "PantallaSecundaria" {
                    irAGaleria = true
                }

                if isFirstAppear {
                    isFirstAppear = false
                    ultimaPantalla = "PantallaPrincipal"
                    withAnimation(.easeIn(duration: 1)) {
                        mostrarBoton = true
                    }
                }
            }
            .onDisappear {
                ultimaPantalla = "PantallaPrincipal"
            }
        }
    }
}

#Preview {
    FirstView()
}
