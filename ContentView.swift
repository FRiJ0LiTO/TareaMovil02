//
//  ContentView.swift
//  TareaMovil02
//
//  Created by Alumno on 27/09/23.


import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var mensaje: String = ""
    @State private var showMensaje: Bool = false
    
    @State private var totalCuenta: String = ""
    @State private var numPersonas: String = ""
    @State private var propina: String = ""
    @State private var totalPersona: String = ""
    @State private var resultado: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Calculadora de pago con propina")
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.center)
            Spacer()
            HStack() {
                Text("Total de la Cuenta:")
                Spacer()
                TextField("", text:$totalCuenta)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            .padding(10)
            HStack() {
                Text("Número de Personas:")
                Spacer()
                TextField("", text:$numPersonas)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            .padding(10)
            HStack() {
                Text("Porcentaje de propina:")
                Spacer()
                TextField("", text: $propina)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            .padding(10)
            HStack() {
                Text("Total por persona")
                Spacer()
                Text("Bienvenido")
            }
            .padding(10)
            
            
            Button("Calcular", action: creaMensaje)
            //Modificador de boton
            .buttonStyle(.borderedProminent)
            .alert("Debes poner algo", isPresented: $showMensaje) {
                Button("Ok"){}
            }
            Text("😀 \(mensaje)")
            Spacer()
            Text("App creada por: Jaime Cabrera Flores | A00835376")
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    func creaMensaje(){
        if (totalCuenta == "" || numPersonas == "") {
            mensaje = ""
            showMensaje.toggle()
        }else{
            mensaje = "Hola" + userName
        }
        
    }
    
    func calcularPropina(){
        if (totalCuenta == "" || numPersonas == ""){
            showMensaje.toggle()
        }
        else if (propina == ""){
            propina = "10"
        }
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
