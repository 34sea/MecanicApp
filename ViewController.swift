//
//  ViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Martinho Macovere. All rights reserved.
//

import UIKit


extension UIColor{
    convenience init(hex: String, alpha: CGFloat = 1.0){
        var hexColor = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexColor = hexColor.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexColor).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16)/255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8)/255.0
        let blue = CGFloat((rgb & 0x0000FF))/255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


class ViewController: UIViewController {

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
    
    let rgisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Registar", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#ffffff")
        button.tintColor = UIColor(hex: "#222222")
        return button
    }()
    
    let enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Entrar", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        lView()
        
        rgisterButton.addTarget(self, action: #selector(telaEscolhaSigUp), for: .touchUpInside)
        enterButton.addTarget(self, action: #selector(telaEscolhaLogin), for: .touchUpInside)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func lView(){
        let larguraTela = view.frame.size.width
        let alturaTela = view.frame.size.height
        
        view.addSubview(logoImg)
        view.addSubview(rgisterButton)
        view.addSubview(enterButton)
        view.addSubview(nomeAppField)
        view.addSubview(spanPublicidadeField)



        
        rgisterButton.frame = CGRect(x: (larguraTela-(larguraTela-50))/2, y: alturaTela-150, width: larguraTela-50, height: 40)
        enterButton.frame = CGRect(x: (larguraTela-(larguraTela-50))/2, y: alturaTela-100, width: larguraTela-50, height: 40)

        logoImg.frame = CGRect(x: (larguraTela-150)/2, y: 150, width: 150, height: 100)
        nomeAppField.frame = CGRect(x: (larguraTela-150)/2, y: 260, width: 150, height: 20)
        spanPublicidadeField.frame = CGRect(x: (larguraTela - (larguraTela-50))/2, y: (alturaTela-50)/2, width: larguraTela-50, height: 70)


    }
    
    @objc func telaEscolhaLogin(){
        let t = TelaEscolhaViewController()
        t.modalPresentationStyle = .fullScreen
        t.escolha = "login"
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    @objc func telaEscolhaSigUp(){
        let t = TelaEscolhaViewController()
        t.modalPresentationStyle = .fullScreen
        t.escolha = "registrar"
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

