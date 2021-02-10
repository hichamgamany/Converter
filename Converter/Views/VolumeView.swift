//
//  ContentView.swift
//  Converter
//
//  Created by hicham on 9/2/2021.
//



import SwiftUI

struct VolumeView: View {
    
    
    let inputUnits = ["l","ml","cup","tsp","tbsp"]
    let outputUnits = ["l","ml","cup","tsp","tbsp"]
    
    @State private var inputValue = ""
    @State private var ouputValue = ""
    @State private var inputUnitValue = 0
    @State private var outputUnitValue = 0
    
    var inputToOutput: String {
        var output = ""
        
        var input = Measurement(value: 0, unit: UnitVolume.liters)
        
        switch inputUnits[inputUnitValue] {
            case "l":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.liters)
            case "ml":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.milliliters)
            case "cup":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.cups)
            case "tsp":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.teaspoons)
            case "tbsp":
                input = Measurement(value: Double(inputValue) ?? 0, unit: UnitVolume.tablespoons)
            default:
                input = Measurement(value: 0, unit: UnitVolume.liters)
        }
        switch outputUnits[outputUnitValue] {
            case "l":
                output = String(describing: input.converted(to: UnitVolume.liters).value)
               
            case "ml":
                output = String(describing: input.converted(to: UnitVolume.milliliters).value)
               
            case "cup":
                output = String(describing: input.converted(to: UnitVolume.cups).value)
               
            case "tsp":
                output = String(describing: input.converted(to: UnitVolume.teaspoons).value)
               
            case "tbsp":
                output = String(describing: input.converted(to: UnitVolume.tablespoons).value)
               
            default:
                output = String(describing: input.converted(to: UnitVolume.liters).value)
                
        }
        
        return output
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        Text("Convert Volumes")
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

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}

