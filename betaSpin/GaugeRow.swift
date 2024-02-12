//
//  GaugeRow.swift
//  betaSpin
//
//  Created by johndanial on 2/12/24.
//

import SwiftUI

struct GaugeRow: View {
    
    @Binding var blueScore: Double
    @Binding var yellowScore: Double
    @Binding var redScore: Double
    
    var body: some View {
        HStack {
            
            Gauge(value: blueScore, in: 0...25) {
                Text("Speed")
                    .foregroundColor(.blue)
            } currentValueLabel: {
                Text("\(Int(blueScore))")
                    .foregroundColor(.blue)
            }
        minimumValueLabel: {
            Text("0")
                .foregroundColor(.blue)
        } maximumValueLabel: {
            Text("100")
                .foregroundColor(.blue)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.blue)
        .scaleEffect(1.6)
            
            
            Spacer()
            
            
            Gauge(value: yellowScore, in: 0...50) {
                Text("Speed")
                
            } currentValueLabel: {
                Text("\(Int(yellowScore))")
                    .foregroundColor(.yellow)
            }
        minimumValueLabel: {
            Text("0")
                .foregroundColor(.yellow)
        } maximumValueLabel: {
            Text("500")
                .foregroundColor(.yellow)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.yellow)
        .scaleEffect(1.6)
            
            
            Spacer()
            Gauge(value: redScore, in: 0...75) {
                Text("Speed")
                
            } currentValueLabel: {
                Text("\(Int(redScore))")
                    .foregroundColor(.red)
            }
        minimumValueLabel: {
            Text("0")
                .foregroundColor(.red)
        } maximumValueLabel: {
            Text("500")
                .foregroundColor(.red)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(.red)
        .scaleEffect(1.6)
            Spacer()
            
        }
    }
}
//
//#Preview {
////    GaugeRow()
//}
