//
//  DistanceView.swift
//  Converter
//
//  Created by hicham on 9/2/2021.
//



import SwiftUI

struct DistanceView: View {
    
    
    let inputUnits = ["mm","m","km","in","ft","mi"]
    let outputUnits = ["mm","m","km","in","ft","mi"]
    
    @State private var inputValue = ""
    @State private var ouputValue = ""
    @State private var inputUnitValue = 0
    @State private var outputUnitValue = 0
    
    var inputToOutput: String {
        var output = ""
        
        var input = Measurement(value: 0, unit: UnitLength.millimeters)
        
        switch inputUnits[inputUnitValue] {
            case "mm":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.millimeters)
            case "m":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.meters)
            case "km":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.kilometers)
            case "in":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.inches)
            case "ft":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.feet)
            case "mi":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitLength.miles)
            default:
                input = Measurement(value: 0, unit: UnitLength.millimeters)
        }
        switch outputUnits[outputUnitValue] {
            case "mm":
                output = String(describing: input.converted(to: UnitLength.millimeters).value)
               
            case "m":
                output = String(describing: input.converted(to: UnitLength.meters).value)
               
            case "km":
                output = String(describing: input.converted(to: UnitLength.kilometers).value)
               
            case "in":
                output = String(describing: input.converted(to: UnitLength.inches).value)
               
            case "ft":
                output = String(describing: input.converted(to: UnitLength.feet).value)
            case "mi":
                output = String(describing: input.converted(to: UnitLength.miles).value)
               
            default:
                output = String(describing: input.converted(to: UnitLength.millimeters).value)
                
        }
        
        return output
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Text("Convert Distances")
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

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}


