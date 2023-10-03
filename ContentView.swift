//
//  ContentView.swift
//  TareaMovil02
//
//  Created by Alumno on 27/09/23.


import SwiftUI


extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
extension Color {
    static let customBlue = Color(hex: 0x82A0D8)
    static let customRed = Color(hex:0xf22b56)
    static let customYellow = Color(hex: 0xEBEBAB)
    static let customGreen = Color(hex: 0x4d8f81)
    static let customBrowm = Color(hex:0x9b4b54)
}

struct ContentView: View {
    @State private var userName: String = ""
    @State private var mensaje: String = ""
    @State private var showMensaje: Bool = false
    
    @State private var totalCuenta: Double = 0.0
    @State private var numPersonas: Double = 0.0
    @State private var propina: Double = 10.0
    @State private var totalPersona: String = ""
    @State private var resultado: Double = 0.0
    
    @State private var cantidadTotal = 0.0
    
    var body: some View {
        Color.customYellow
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
        VStack {
            
            Text("Calculadora de pago con propina")
                .padding(10)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.customRed)
                .multilineTextAlignment(.center)
        
            Spacer()
            HStack() {
                Text("Total de la Cuenta:")
                Spacer()
                TextField("10019", value:$totalCuenta, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            .padding(10)
            
            HStack() {
                Text("Número de Personas:")
                Spacer()
                TextField("", value:$numPersonas, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            .padding(10)
            HStack() {
                Text("Porcentaje de propina:")
                Spacer()
                TextField("", value: $propina, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 120)
                Text("%")
            }
            .padding(10)
            HStack() {
                Text("Total por persona")
                Spacer()
                Text("\(mensaje)")
                    .multilineTextAlignment(.leading)
                    
            }
            .padding(10)
            
            
//            VStack{
//                TextField("cantidad", value: $cantidadTotal, format: .number)
//                Text("Pago \(formatearNumero(numeroBase:cantidadTotal))")
//                    .font(.largeTitle)
//            }
            
            Button("Calcular", action: creaMensaje)
            
            //Modificador de boton
                .buttonStyle(.borderedProminent
                             
                )
                .buttonStyle(.plain)
                .background(Color.green)
                .tint(Color.customGreen)
            
                .cornerRadius(23)
            
                
                .alert("Debes poner algo", isPresented: $showMensaje) {
                    Button("Ok"){}
                }
                .padding(20)
            
            Image("hucha")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200.0)
            Spacer()
            
            VStack {
                Text("App creada por: Jaime Cabrera Flores | A00835376")
                    .font(.subheadline)
                    .foregroundColor(.customBrowm)
            }
        } .background(Color.customYellow)
        
        
        
        .padding()
        .background(Color.customYellow)
        )
    }
    
    
    
    
    func creaMensaje(){
        
        resultado = calcularPropina(personas: numPersonas, cuenta: totalCuenta, prop: propina)
        
        mensaje = "\(formatearNumero(numeroBase: resultado))"
        
    }
    
    func calcularPropina(personas:Double, cuenta: Double, prop: Double) -> Double {
        var totalPersona = 0.0
        if (totalCuenta == 0.0 || numPersonas == 0.0 ){
            showMensaje.toggle()
        }
        else {
            totalPersona = ((cuenta*(propina/100)) + cuenta) / personas
        }
        
        return totalPersona;
        
    }
    
    func formatearNumero(numeroBase: Double) -> String {
        var numeroStr: String = ""
        let formatoNumero = NumberFormatter()
        
        formatoNumero.numberStyle = .currency
        
        numeroStr = formatoNumero.string(from: NSNumber(value: numeroBase))!
        
        return numeroStr
    }
      
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
