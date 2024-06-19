import SwiftUI
import PassKit

struct PassViewControllerWrapper: UIViewControllerRepresentable {
    var passName: String
    @Binding var isActive: Bool
    @Binding var showingPassView: Bool
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        context.coordinator.viewController = viewController
        context.coordinator.addPass()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PKAddPassesViewControllerDelegate {
        var parent: PassViewControllerWrapper
        var viewController: UIViewController?
        
        init(_ parent: PassViewControllerWrapper) {
            self.parent = parent
        }
        
        func addPass() {
            guard let url = Bundle.main.url(forResource: parent.passName, withExtension: "pkpass"),
                  let passData = try? Data(contentsOf: url),
                  let pass = try? PKPass(data: passData) else {
                print("Failed to load \(parent.passName).pkpass file")
                return
            }
            
            let passLibrary = PKPassLibrary()
//            if passLibrary.containsPass(pass) {
//                print("Pass already exists in Wallet")
//            } else {
                if let addPassesViewController = PKAddPassesViewController(pass: pass) {
                    addPassesViewController.delegate = self
                    DispatchQueue.main.async {
                        self.viewController?.present(addPassesViewController, animated: true, completion: nil)
                    }
                }
//            }
        }
        
        func addPassesViewControllerDidFinish(_ controller: PKAddPassesViewController) {
            controller.dismiss(animated: true) {
                self.viewController?.dismiss(animated: true, completion: {
                    self.parent.isActive = false
                    self.parent.showingPassView = false
                })
            }
        }
    }
}


//
//struct PassButtonView: UIViewControllerRepresentable {
//    
//    var passName: String
//    @Binding var isActive: Bool
//    
//    func makeUIViewController(context: Context) -> UIViewController {
//        let viewController = UIViewController()
//        context.coordinator.parent = self
//        context.coordinator.viewController = viewController
//        context.coordinator.addPass()
//        return viewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, PKAddPassesViewControllerDelegate {
//        var parent: PassButtonView
//        var viewController: UIViewController?
//        
//        init(_ parent: PassButtonView) {
//            self.parent = parent
//        }
//        
//        func addPass() {
//            guard let url = Bundle.main.url(forResource: parent.passName, withExtension: "pkpass"),
//                  let passData = try? Data(contentsOf: url),
//                  let pass = try? PKPass(data: passData) else {
//                print("Failed to load \(parent.passName).pkpass file")
//                return
//            }
//            
//            let passLibrary = PKPassLibrary()
////            if passLibrary.containsPass(pass) {
////                print("Pass already exists in Wallet")
////            } else {
//                if let addPassesViewController = PKAddPassesViewController(pass: pass) {
//                    addPassesViewController.delegate = self
//                    DispatchQueue.main.async {
//                        self.viewController?.present(addPassesViewController, animated: true, completion: nil)
//                    }
//                }
////            }
//        }
//        
//        func addPassesViewControllerDidFinish(_ controller: PKAddPassesViewController) {
//            controller.dismiss(animated: true) {
//                self.viewController?.dismiss(animated: true, completion: {
//                    self.parent.isActive = false
//                })
//            }
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatefulPreviewWrapper(true) { PassButtonView(passName: "MC1", isActive: $0) }
//    }
//}
//
//struct StatefulPreviewWrapper<Content: View>: View {
//    @State var state: Bool
//    var content: (Binding<Bool>) -> Content
//
//    init(_ initialState: Bool, @ViewBuilder content: @escaping (Binding<Bool>) -> Content) {
//        _state = State(initialValue: initialState)
//        self.content = content
//    }
//
//    var body: some View {
//        content($state)
//    }
//}
