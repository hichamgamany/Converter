//
//  ContentView.swift
//  Converter
//
//  Created by hicham on 9/2/2021.
//



import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
struct ContentView: View {

    var body: some View {
        
        ZStack {
            NavigationView {
                List{
                    // Volumes
                    NavigationLink(
                        destination: VolumeView(),
                        label: {
                            HStack {
                                Image(systemName: "v.circle")
                                    .font(.title2)
                                Text("Volumes")
                            }
                        })
                    // Distance
                    NavigationLink(
                        destination: DistanceView(),
                        label: {
                            HStack {
                                Image(systemName: "d.circle")
                                    .font(.title2)
                                Text("Distance")
                            }
                        })
                    // Mass
                    NavigationLink(
                        destination: MassView(),
                        label: {
                            HStack {
                                Image(systemName: "m.circle")
                                    .font(.title2)
                                Text("Mass")
                            }
                        })
                    // Temperature
                    NavigationLink(
                        destination: TemperatureView(),
                        label: {
                            HStack {
                                Image(systemName: "t.circle")
                                    .font(.title2)
                                Text("Temperature")
                            }
                        })
                    
                }.navigationTitle("Units Converter")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark).previewDevice("iPhone 12 Pro")
    }
}
