//
// QRScannerViewModel.swift
//
// Created by Speedyfriend67 on 16.07.24
//
 
import SwiftUI
import Combine

class QRScannerViewModel: ObservableObject {
    @Published var scannedCode: String?
    @Published var codeFrame: CGRect = .zero
    @Published var scanHistory: [String] = []
    
    func addScannedCode(_ code: String, frame: CGRect) {
        scannedCode = code
        codeFrame = frame
        if !scanHistory.contains(code) {
            scanHistory.append(code)
        }
    }
}