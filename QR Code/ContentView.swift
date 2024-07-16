//
// ContentView.swift
//
// Created by Speedyfriend67 on 16.07.24
//
 
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QRScannerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                QRScannerView(viewModel: viewModel)
                    .edgesIgnoringSafeArea(.all)
                
                if let scannedCode = viewModel.scannedCode {
                    VStack {
                        Spacer()
                        Button(action: {
                            if let url = URL(string: scannedCode) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text("Scanned URL: \(scannedCode)")
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                        }
                        Spacer().frame(height: 50)
                    }
                }
                
                if viewModel.codeFrame != .zero {
                    Rectangle()
                        .strokeBorder(Color.green, lineWidth: 4)
                        .frame(width: viewModel.codeFrame.width, height: viewModel.codeFrame.height)
                        .position(x: viewModel.codeFrame.midX, y: viewModel.codeFrame.midY)
                }
                
                VStack {
                    Spacer()
                    NavigationLink(destination: ScanHistoryView(viewModel: viewModel)) {
                        Text("View Scan History")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("QR Scanner")
        }
    }
}