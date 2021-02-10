//
//  TemperatureView.swift
//  Converter
//
//  Created by hicham on 9/2/2021.
//



import SwiftUI

struct TemperatureView: View {
    
    
    let inputUnits = ["k","°C","°F"]
    let outputUnits = ["k","°C","°F"]
    
    @State private var inputValue = ""
    @State private var ouputValue = ""
    @State private var inputUnitValue = 0
    @State private var outputUnitValue = 0
    
    var inputToOutput: String {
        var output = ""
        
        var input = Measurement(value: 0, unit: UnitTemperature.kelvin)
        
        switch inputUnits[inputUnitValue] {
            case "k":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.kelvin)
            case "°C":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.celsius)
            case "°F":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitTemperature.fahrenheit)
            default:
                input = Measurement(value: 0, unit: UnitTemperature.kelvin)
        }
        switch outputUnits[outputUnitValue] {
            case "k":
                output = String(describing: input.converted(to: UnitTemperature.kelvin).value)
               
            case "°C":
                output = String(describing: input.converted(to: UnitTemperature.celsius).value)
               
            case "°F":
                output = String(describing: input.converted(to: UnitTemperature.fahrenheit).value)
            default:
                output = String(describing: input.converted(to: UnitTemperature.kelvin).value)
        }
        
        return output
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Text("Convert Temperatures")
                            .font(.title)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                Section {
                    TextField("Enter a number", text: $inputValue)
                        .keyboardType(.numbersAndPunctuation)
                        .onTapGesture {
                            hideKeyboard()
                        }                    }
                Section(header: Text("Choose an input unit")){
                    Picker(selection: $inputUnitValue, label: Text("input")){
                        ForEach(0..<inputUnits.count){inp in
                            Text("\(inputUnits[inp])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Choose an output unit")){
                    Picker(selection: $outputUnitValue, label: Text("output")){
                        ForEach(0..<inputUnits.count){inp in
                            Text("\(outputUnits[inp])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section{
                    HStack {
                        Spacer()
                        Text("\(String(format: "%.2f", Double(inputToOutput) ?? 0)) \(outputUnits[outputUnitValue])")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.green)
                        Spacer()
                    }
                }
                
                Section {
                    Button(action: {
                        reset()
                    }, label: {
                        HStack {
                            Spacer()
                            Text("reset")
                                .font(.headline)
                                .foregroundColor(.red)
                            Spacer()
                        }
                    })
                }
            }
            
        }
    }
    
    func reset() {
        inputValue = ""
        inputUnitValue = 0
        outputUnitValue = 0
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}


