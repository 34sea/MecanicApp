//
//  LoginViewController.swift
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    let dbHelper = DBHelperUser()

    var escolha: String = ""
    let labelChoice = UILabel()
    let label = UILabel()
    let email = UITextField()
    let senha = UITextField()
    var emailTexto: String?
    var senhaTexto: String?
    
    
    let logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "parklogo")
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let larguraTela = view.frame.size.width
        let alturaTela = view.frame.size.height
        
        view.addSubview(logoImg)
        logoImg.frame = CGRect(x: (larguraTela-150)/2, y: 150, width: 150, height: 100)
        
        label.textColor = .black
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        //label.frame = CGRect(x: (screenWidth-100)/2, y: 400, width: 100, height: 100)
        view.addSubview(label)
        
        
        
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.autocapitalizationType = .none
        email.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(email)
        
        
        senha.placeholder = "senha"
        senha.borderStyle = .roundedRect
        senha.isSecureTextEntry = true
        senha.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(senha)
        
        
        let btnLogin = UIButton(type: .custom)
        btnLogin.setTitle("Entrar", for: .normal)
        btnLogin.backgroundColor = UIColor(hex: "#f18f02")
        btnLogin.setTitleColor(.white, for: .normal)
        btnLogin.layer.cornerRadius = 10
        btnLogin.frame = CGRect(x: (larguraTela - 300)/2, y: (alturaTela-150), width: 300, height: 40)
        view.addSubview(btnLogin)
        
        
        btnLogin.addTarget(self, action: #selector(homeLogin), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            //label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            email.heightAnchor.constraint(equalToConstant: 44),
            
            senha.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10),
            senha.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            senha.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            senha.heightAnchor.constraint(equalToConstant: 44),
            
            ])
        
        // Do any additional setup after loading the view.
    }
    
    @objc func homeLogin(){
        let t = LoginViewController()
        t.modalPresentationStyle = .fullScreen
        t.escolha = "user"
        self.navigationController?.pushViewController(t, animated: true)
        criar()
    }
    
    @objc func criar(){
        emailTexto = email.text
        senhaTexto = senha.text
        dbHelper.insertUser(email: emailTexto!, senha: senhaTexto!, nomeServico: "none", PrecoServicos: 0, StatusReserva: "sem")        //print(emailTexto!)
        print("Email: \(emailTexto!) Senha: \(senhaTexto!)")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
