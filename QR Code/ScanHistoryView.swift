//
// ScanHistoryView.swift
//
// Created by Speedyfriend67 on 16.07.24
//
 
import SwiftUI

struct ScanHistoryView: View {
    @ObservedObject var viewModel: QRScannerViewModel
    
    var body: some View {
        List(viewModel.scanHistory, id: \.self) { code in
            Text(code)
                .onTapGesture {
                    if let url = URL(string: code) {
                        UIApplication.shared.open(url)
                    }
                }
        }
        .navigationTitle("Scan History")
    }
}