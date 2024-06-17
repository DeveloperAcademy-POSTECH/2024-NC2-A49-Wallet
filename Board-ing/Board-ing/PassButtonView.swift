//
//  PassButtonView.swift
//  Board-ing
//
//  Created by Byeol Kim on 6/17/24.
//
import SwiftUI
import PassKit

struct PassButtonView: UIViewControllerRepresentable {
    var passName: String
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let button = UIButton(type: .system)
        button.setTitle("Add \(passName) to Wallet", for: .normal)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.addPass), for: .touchUpInside)
        button.layer.cornerRadius = 0
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        viewController.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(passName: passName)
    }

    class Coordinator: NSObject {
        var passName: String
        
        init(passName: String) {
            self.passName = passName
        }
        
        @objc func addPass() {
            guard let url = Bundle.main.url(forResource: passName, withExtension: "pkpass"),
                  let passData = try? Data(contentsOf: url),
                  let pass = try? PKPass(data: passData) else {
                print("Failed to load \(passName).pkpass file")
                return
            }

            let passLibrary = PKPassLibrary()
            if passLibrary.containsPass(pass) {
                print("Pass already exists in Wallet")
            } else {
                if let addPassesViewController = PKAddPassesViewController(pass: pass) {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootViewController = windowScene.windows.first?.rootViewController {
                        rootViewController.present(addPassesViewController, animated: true, completion: nil)
                    } else {
                        print("Unable to find root view controller")
                    }
                }
            }
        }
    }
}

//
//#Preview {
//    PassButtonView()
//}
