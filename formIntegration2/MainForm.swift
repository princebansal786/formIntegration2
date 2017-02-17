import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class MainForm: UIViewController,FBSDKLoginButtonDelegate{

       override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton=FBSDKLoginButton()
        loginButton.readPermissions=["email"]
        loginButton.delegate=self
            //loginButton.contentMode = .scaleToFill
        loginButton.frame.size.width=232
        loginButton.frame.size.height=40
        loginButton.layer.cornerRadius = loginButton.frame.size.height/2
        //loginButton.isHidden=true
            loginButton.center=self.view.center
            self.view.addSubview(loginButton)
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
         //self.logUserData()
    }
    ove
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if(error==nil)
        {
            let parameters = ["fields": "email, id, name"]
            let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: parameters)
            
            _ = graphRequest?.start { connection, result, error in
                // If something went wrong, we're logged out
                if (error != nil) {
                    // Clear email, but ignore error for now
                    return
                }
                // Transform to dictionary first
                if let result = result as? [String: Any] {
                    print(result["name"] ?? "")
                    print(result["id"] ?? "")
                    //print(result["email"] ?? "")
//                    print(result["email"] ?? "")
//                    print(result["image"] ?? "")
                    performSegue(withIdentifier: "MainForm", sender: self)
                }
            } // End of graph request
        }
        else
        {
          print(error.localizedDescription)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logged out..")
    }

}
