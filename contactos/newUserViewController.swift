
import Foundation
import UIKit

class newUserViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var confirmPWTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func newUserButton(_ sender: Any) {
        
        
        // Navegación de pantalla hacia el listado de usuarios.
        
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc = storyboard.instantiateViewController(identifier: "usersListVC") as! usersListViewController

        vc.modalPresentationStyle = .overFullScreen

        present(vc, animated: true)*/
        
        // Compruebo si las contraseñas coinciden.
        
        if passwordTextField.text! != confirmPWTextField.text! {
            print("Las contraseñas no coinciden.")
            return
        }else{
            
            // Creo un usuario nuevo.
            
            let emailTF = emailTextField.text!
            let passwordTF = passwordTextField.text!
            
            let email = User(user: emailTF, pass: passwordTF)
            
            let postRequest = APIRequest(endpoint: "api/register")
            
            postRequest.save(email, completion: {result in
                switch result{
                case .success(let user):
                    print("Se ha creado el siguiente usuario: \(user.user) ")
                case .failure(let error):
                    print("Ha ocurrido un error \(error)")
                }
            })
            
        }
        
        

        
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        // Navegación de pantalla hacia la pantalla de inicio de sesión.
        
              let storyboard = UIStoryboard(name: "Main", bundle: nil)

              let vc = storyboard.instantiateViewController(identifier: "VC") as! ViewController

              vc.modalPresentationStyle = .overFullScreen

              present(vc, animated: true)
        
    }
    
}
