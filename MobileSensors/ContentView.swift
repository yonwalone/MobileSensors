//
//  ContentView.swift
//  MobileSensors
//
//  Created by Lukas Zwaller on 23.05.23.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        ZStack(alignment: .top) {
            TabView(selection: $selection) {
                ForEach(0..<3) { index in
                    if index == 0 {
                        AccelerometerView()
                    } else if index == 1 {
                        GyroscopeView()
                    } else if index == 2 {
                        MagnetometerView()
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            VStack{
                Text("Exercise-01")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
            }
        }
    }
}

struct AccelerometerView: View {
    @State private var accelerometerData: String = ""
    private let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            Text("Accelerometer")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text(accelerometerData)
                .font(.body)
                .padding()
        }
        .onAppear {
            startAccelerometerUpdates()
        }
        .onDisappear {
            stopAccelerometerUpdates()
        }
    }

    func startAccelerometerUpdates() {
        guard motionManager.isAccelerometerAvailable else {
            accelerometerData = "Accelerometer data is not available"
            return
        }

        motionManager.accelerometerUpdateInterval = 0.1
        motionManager.startAccelerometerUpdates(to: .main) { accelerometerData, error in
            guard let accelerometerData = accelerometerData else {
                self.accelerometerData = "Failed to retrieve accelerometer data"
                return
            }

            let x = accelerometerData.acceleration.x
            let y = accelerometerData.acceleration.y
            let z = accelerometerData.acceleration.z

            self.accelerometerData = String(format: "X: %.2f\nY: %.2f\nZ: %.2f", x, y, z)
        }
    }

    func stopAccelerometerUpdates() {
        motionManager.stopAccelerometerUpdates()
    }
}

struct GyroscopeView: View {
    @State private var gyroscopeData: String = ""
    private let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            Text("Gyroscope")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text(gyroscopeData)
                .font(.body)
                .padding()
        }
        .onAppear {
            startGyroscopeUpdates()
        }
        .onDisappear {
            stopGyroscopeUpdates()
        }
    }

    func startGyroscopeUpdates() {
        guard motionManager.isGyroAvailable else {
            gyroscopeData = "Gyroscope data is not available"
            return
        }

        motionManager.gyroUpdateInterval = 0.1
        motionManager.startGyroUpdates(to: .main) { gyroData, error in
            guard let gyroData = gyroData else {
                self.gyroscopeData = "Failed to retrieve gyroscope data"
                return
            }

            let x = gyroData.rotationRate.x
            let y = gyroData.rotationRate.y
            let z = gyroData.rotationRate.z

            self.gyroscopeData = String(format: "X: %.2f\nY: %.2f\nZ: %.2f", x, y, z)
        }
    }

    func stopGyroscopeUpdates() {
        motionManager.stopGyroUpdates()
    }
}

struct MagnetometerView: View {
    @State private var magnetometerData: String = ""
    private let motionManager = CMMotionManager()

    var body: some View {
        VStack {
            Text("Magnetometer")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Text(magnetometerData)
                .font(.body)
                .padding()
        }
        .onAppear {
            startMagnetometerUpdates()
        }
        .onDisappear {
            stopMagnetometerUpdates()
        }
    }

    func startMagnetometerUpdates() {
        guard motionManager.isMagnetometerAvailable else {
            magnetometerData = "Magnetometer data is not available"
            return
        }

        motionManager.magnetometerUpdateInterval = 0.1
        motionManager.startMagnetometerUpdates(to: .main) { magnetometerData, error in
            guard let magnetometerData = magnetometerData else {
                self.magnetometerData = "Failed to retrieve magnetometer data"
                return
            }

            let x = magnetometerData.magneticField.x
            let y = magnetometerData.magneticField.y
            let z = magnetometerData.magneticField.z

            self.magnetometerData = String(format: "X: %.2f\nY: %.2f\nZ: %.2f", x, y, z)
        }
    }

    func stopMagnetometerUpdates() {
        motionManager.stopMagnetometerUpdates()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
