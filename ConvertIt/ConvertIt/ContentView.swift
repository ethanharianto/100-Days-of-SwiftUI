//
//  ContentView.swift
//  ConvertIt
//
//  Created by Ethan Harianto on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var type = "temp"
    @State private var input_unit = "fahrenheit"
    @State private var output_unit = "celsius"
    @State private var input = 0
    let types = ["temp", "length", "time", "volume"]
    let temp_units = ["fahrenheit", "kelvin", "celsius"]
    let length_units = ["meters", "kilometers", "feet", "yards", "miles"]
    let time_units = ["seconds", "minutes", "hours", "days"]
    let volume_units = ["milliliters", "liters", "cups", "pints", "gallons"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Type of conversion") {
                    Picker("", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Input unit") {
                    Picker("", selection: $input_unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Output unit") {
                    Picker("", selection: $output_unit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Input") {
                    TextField("0", value: $input, format: .number)
                }
                
                Section("Output") {
                    Text(String(output))
                }
            }
            .navigationTitle("Convert It")
        }
    }

    var units: [String] {
        if type == "temp" {
            return temp_units
        }
        if type == "time" {
            return time_units
        }
        if type == "length" {
            return length_units
        }
        if type == "volume" {
            return volume_units
        }
        return []
    }

    var output: Double {
        if type == "temp" {
            var original = Measurement(value: Double(input), unit: UnitTemperature.fahrenheit)
            if input_unit == "fahrenheit" {
                original = Measurement(value: Double(input), unit: UnitTemperature.fahrenheit)
                if output_unit == "celsius" {
                    return original.converted(to: UnitTemperature.celsius).value
                }
                if output_unit == "kelvin" {
                    return original.converted(to: UnitTemperature.kelvin).value
                }
            }
            if input_unit == "celsius" {
                original = Measurement(value: Double(input), unit: UnitTemperature.celsius)
                if output_unit == "fahrenheit" {
                    return original.converted(to: UnitTemperature.fahrenheit).value
                }
                if output_unit == "kelvin" {
                    return original.converted(to: UnitTemperature.kelvin).value
                }
            }
            if input_unit == "kelvin" {
                original = Measurement(value: Double(input), unit: UnitTemperature.fahrenheit)
                if output_unit == "celsius" {
                    return original.converted(to: UnitTemperature.celsius).value
                }
                if output_unit == "fahrenheit" {
                    return original.converted(to: UnitTemperature.fahrenheit).value
                }
            }
        }
        if type == "length" {
            var original = Measurement(value: Double(input), unit: UnitLength.meters)
            if input_unit == "meters" {
                original = Measurement(value: Double(input), unit: UnitLength.meters)
                if output_unit == "kilometers" {
                    return original.converted(to: UnitLength.kilometers).value
                }
                if output_unit == "miles" {
                    return original.converted(to: UnitLength.miles).value
                }
                if output_unit == "feet" {
                    return original.converted(to: UnitLength.feet).value
                }
                if output_unit == "yards" {
                    return original.converted(to: UnitLength.yards).value
                }
            }
            if input_unit == "kilometers" {
                original = Measurement(value: Double(input), unit: UnitLength.kilometers)
                if output_unit == "miles" {
                    return original.converted(to: UnitLength.miles).value
                }
                if output_unit == "meters" {
                    return original.converted(to: UnitLength.meters).value
                }
                if output_unit == "feet" {
                    return original.converted(to: UnitLength.feet).value
                }
                if output_unit == "yards" {
                    return original.converted(to: UnitLength.yards).value
                }
            }
            if input_unit == "miles" {
                original = Measurement(value: Double(input), unit: UnitLength.miles)
                if output_unit == "kilometers" {
                    return original.converted(to: UnitLength.kilometers).value
                }
                if output_unit == "meters" {
                    return original.converted(to: UnitLength.meters).value
                }
                if output_unit == "feet" {
                    return original.converted(to: UnitLength.feet).value
                }
                if output_unit == "yards" {
                    return original.converted(to: UnitLength.yards).value
                }
            }
            if input_unit == "feet" {
                original = Measurement(value: Double(input), unit: UnitLength.feet)
                if output_unit == "kilometers" {
                    return original.converted(to: UnitLength.kilometers).value
                }
                if output_unit == "meters" {
                    return original.converted(to: UnitLength.meters).value
                }
                if output_unit == "miles" {
                    return original.converted(to: UnitLength.miles).value
                }
                if output_unit == "yards" {
                    return original.converted(to: UnitLength.yards).value
                }
            }
            if input_unit == "yards" {
                original = Measurement(value: Double(input), unit: UnitLength.yards)
                if output_unit == "kilometers" {
                    return original.converted(to: UnitLength.kilometers).value
                }
                if output_unit == "meters" {
                    return original.converted(to: UnitLength.meters).value
                }
                if output_unit == "feet" {
                    return original.converted(to: UnitLength.feet).value
                }
                if output_unit == "miles" {
                    return original.converted(to: UnitLength.miles).value
                }
            }
        }
        if type == "time" {
            var original = Measurement(value: Double(input), unit: UnitDuration.seconds)
            if input_unit == "seconds" {
                original = Measurement(value: Double(input), unit: UnitDuration.seconds)
                if output_unit == "minutes" {
                    return original.converted(to: UnitDuration.minutes).value
                }
                if output_unit == "hours" {
                    return original.converted(to: UnitDuration.hours).value
                }
                if output_unit == "days" {
                    return original.converted(to: UnitDuration.hours).value/24
                }
            }
            if input_unit == "minutes" {
                original = Measurement(value: Double(input), unit: UnitDuration.minutes)
                if output_unit == "seconds" {
                    return original.converted(to: UnitDuration.seconds).value
                }
                if output_unit == "hours" {
                    return original.converted(to: UnitDuration.hours).value
                }
                if output_unit == "days" {
                    return original.converted(to: UnitDuration.hours).value/24
                }
            }
            if input_unit == "hours" {
                original = Measurement(value: Double(input), unit: UnitDuration.hours)
                if output_unit == "seconds" {
                    return original.converted(to: UnitDuration.seconds).value
                }
                if output_unit == "minutes" {
                    return original.converted(to: UnitDuration.minutes).value
                }
                if output_unit == "days" {
                    return original.value/24
                }
            }
            if input_unit == "days" {
                original = Measurement(value: Double(input), unit: UnitDuration.hours) * 24
                if output_unit == "seconds" {
                    return original.converted(to: UnitDuration.seconds).value
                }
                if output_unit == "minutes" {
                    return original.converted(to: UnitDuration.minutes).value
                }
                if output_unit == "hours" {
                    return original.value/24
                }
            }
        }
        if type == "volume" {
            var original = Measurement(value: Double(input), unit: UnitVolume.liters)
            if input_unit == "liters" {
                original = Measurement(value: Double(input), unit: UnitVolume.liters)
                if output_unit == "milliliters" {
                    return original.converted(to: UnitVolume.milliliters).value
                }
                if output_unit == "cups" {
                    return original.converted(to: UnitVolume.cups).value
                }
                if output_unit == "pints" {
                    return original.converted(to: UnitVolume.pints).value
                }
                if output_unit == "gallons" {
                    return original.converted(to: UnitVolume.gallons).value
                }
            }
            if input_unit == "milliliters" {
                original = Measurement(value: Double(input), unit: UnitVolume.milliliters)
                if output_unit == "liters" {
                    return original.converted(to: UnitVolume.liters).value
                }
                if output_unit == "cups" {
                    return original.converted(to: UnitVolume.cups).value
                }
                if output_unit == "pints" {
                    return original.converted(to: UnitVolume.pints).value
                }
                if output_unit == "gallons" {
                    return original.converted(to: UnitVolume.gallons).value
                }
            }
            if input_unit == "cups" {
                original = Measurement(value: Double(input), unit: UnitVolume.cups)
                if output_unit == "liters" {
                    return original.converted(to: UnitVolume.liters).value
                }
                if output_unit == "milliliters" {
                    return original.converted(to: UnitVolume.milliliters).value
                }
                if output_unit == "pints" {
                    return original.converted(to: UnitVolume.pints).value
                }
                if output_unit == "gallons" {
                    return original.converted(to: UnitVolume.gallons).value
                }
            }
            if input_unit == "pints" {
                original = Measurement(value: Double(input), unit: UnitVolume.pints)
                if output_unit == "liters" {
                    return original.converted(to: UnitVolume.liters).value
                }
                if output_unit == "milliliters" {
                    return original.converted(to: UnitVolume.milliliters).value
                }
                if output_unit == "cups" {
                    return original.converted(to: UnitVolume.cups).value
                }
                if output_unit == "gallons" {
                    return original.converted(to: UnitVolume.gallons).value
                }
            }
            if input_unit == "gallons" {
                original = Measurement(value: Double(input), unit: UnitVolume.gallons)
                if output_unit == "liters" {
                    return original.converted(to: UnitVolume.liters).value
                }
                if output_unit == "milliliters" {
                    return original.converted(to: UnitVolume.milliliters).value
                }
                if output_unit == "cups" {
                    return original.converted(to: UnitVolume.cups).value
                }
                if output_unit == "pints" {
                    return original.converted(to: UnitVolume.pints).value
                }
            }
        }
        return Double(input)
    }
}

#Preview {
    ContentView()
}
