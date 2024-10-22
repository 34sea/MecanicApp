//
//  TelaEscolhaViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class TelaEscolhaViewController: UIViewController {

    var escolha: String = "login"
    let logoImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "parklogo")
        return img
    }()
    
    let nomeAppField: UILabel = {
        let txt = UILabel()
        txt.text = "MECANIC"
        txt.textColor = UIColor(hex: "#f18f02")
        //txt.font = UIFont.systemFont(ofSize: 25)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.textAlignment = .center
        txt.font = UIFont.boldSystemFont(ofSize: 20)
        return txt
    }()
    
    let spanPublicidadeField: UILabel = {
        let txt = UILabel()
        txt.text = "Encontre uma variedade de servicos com a mecanic, desde de lavagem ate pintura, registre-se ja!"
        txt.textColor = UIColor(hex: "#222222")
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.textAlignment = .center
        //txt.font = UIFont.boldSystemFont(ofSize: 20)
        return txt
    }()
    
    let userEscolhaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Usuario", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#ffffff")
        button.tintColor = UIColor(hex: "#222222")
        return button
    }()
    
    let adminEscolhaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Administrador", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        lView()
       
        if(escolha == "login"){
            userEscolhaButton.addTarget(self, action: #selector(telaLoginUser), for: .touchUpInside)
            adminEscolhaButton.addTarget(self, action: #selector(telaLoginAdmin), for: .touchUpInside)
        }else{
            userEscolhaButton.addTarget(self, action: #selector(telaSigUser), for: .touchUpInside)
            adminEscolhaButton.addTarget(self, action: #selector(telaSigAdmin), for: .touchUpInside)
        }
        print(escolha)
        // Do any additional setup after loading the view.
    }
    
    func lView(){
        let larguraTela = view.frame.size.width
        let alturaTela = view.frame.size.height
        
        view.addSubview(logoImg)
        view.addSubview(userEscolhaButton)
        view.addSubview(adminEscolhaButton)
        view.addSubview(nomeAppField)
        view.addSubview(spanPublicidadeField)
        
        
        
        
        userEscolhaButton.frame = CGRect(x: (larguraTela-(larguraTela-50))/2, y: alturaTela-150, width: larguraTela-50, height: 40)
        adminEscolhaButton.frame = CGRect(x: (larguraTela-(larguraTela-50))/2, y: alturaTela-100, width: larguraTela-50, height: 40)
        
        logoImg.frame = CGRect(x: (larguraTela-150)/2, y: 150, width: 150, height: 100)
        nomeAppField.frame = CGRect(x: (larguraTela-150)/2, y: 260, width: 150, height: 20)
        spanPublicidadeField.frame = CGRect(x: (larguraTela - (larguraTela-50))/2, y: (alturaTela-50)/2, width: larguraTela-50, height: 70)
        
        
    }
    
    @objc func telaLoginUser(){
        let t = LoginViewController()
        t.modalPresentationStyle = .fullScreen
        t.escolha = "user"
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    @objc func telaLoginAdmin(){
        let t = LoginViewController()
        t.modalPresentationStyle = .fullScreen
        t.escolha = "admin"
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    @objc func telaSigUser(){
        let t = AddUserViewController()
        t.modalPresentationStyle = .fullScreen
       // t.escolha = "user"
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    @objc func telaSigAdmin(){
        let t = AddAdminViewController()
        t.modalPresentationStyle = .fullScreen
       // t.escolha = "admin"
        self.navigationController?.pushViewController(t, animated: true)
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
