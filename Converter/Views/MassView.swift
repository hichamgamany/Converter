//
//  MassView.swift
//  Converter
//
//  Created by hicham on 9/2/2021.
//



import SwiftUI

struct MassView: View {
    
    
    let inputUnits = ["g","kg","oz","lb","ct"]
    let outputUnits = ["g","kg","oz","lb","ct"]
    
    @State private var inputValue = ""
    @State private var ouputValue = ""
    @State private var inputUnitValue = 0
    @State private var outputUnitValue = 0
    
    var inputToOutput: String {
        var output = ""
        
        var input = Measurement(value: 0, unit: UnitMass.grams)
        
        switch inputUnits[inputUnitValue] {
            case "g":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.grams)
            case "kg":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.kilograms)
            case "oz":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.ounces)
            case "lb":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.pounds)
            case "ct":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitMass.carats)
           
            default:
                input = Measurement(value: 0, unit: UnitMass.grams)
        }
        switch outputUnits[outputUnitValue] {
            case "g":
                output = String(describing: input.converted(to: UnitMass.grams).value)
               
            case "kg":
                output = String(describing: input.converted(to: UnitMass.kilograms).value)
               
            case "oz":
                output = String(describing: input.converted(to: UnitMass.ounces).value)
               
            case "lb":
                output = String(describing: input.converted(to: UnitMass.pounds).value)
               
            case "ct":
                output = String(describing: input.converted(to: UnitMass.carats).value)
               
            default:
                output = String(describing: input.converted(to: UnitMass.grams).value)
                
        }
        
        return output
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Text("Convert Mass")
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

struct MassView_Previews: PreviewProvider {
    static var previews: some View {
        MassView()
    }
}


