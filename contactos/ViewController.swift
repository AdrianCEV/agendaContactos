

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let networkingService = NetworkinService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        // Navegación de pantalla hacia el listado de usuarios.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "usersListVC") as! usersListViewController

        vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: true)
        
        // Inicio de sesión.
        
        let userText = emailTextField.text!
        let pass = passwordTextField.text!
        
        
        let user = User(user: userText, pass: pass)
        
        let postRequest = APIRequest(endpoint: "api/login")
        
        postRequest.login(user, completion: {result in
            switch result{
            case .success(let user):
                print("El siguiente usuario ha sido enviado:\(user.user) ")
            case .failure(let error):
                print("Ha ocurrido un error \(error)")
            }
        })
        
    }
    
    // Navegación de pantalla hacia la pantalla de registro de usuario

    @IBAction func newUserButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "newUserVC") as! newUserViewController

        vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: true)
        
    }
    
    // Navegación de pantalla hacia la pantalla de recuperar contraseña.
    
    @IBAction func recoverPWButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "recoverPWVC") as! recoverPWViewController

        /*vc.modalPresentationStyle = .overFullScreen*/

        present(vc, animated: true)
        
    }
    
}

