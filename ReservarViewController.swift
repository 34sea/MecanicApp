//
//  FeitoServicosViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class ReservarViewController: UIViewController {
    
    let dbHelper = DBHelperUser()

    var dadoSelecionado: (nome: String, preco: Double)?
    var emailUser: String = ""
    var nomeSele: String?
    var precoSele: Double?
    let servicosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reservar", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // print(dadoSelecionado?.nome)
        
        let largura = view.frame.size.width
        let altura = view.frame.size.height
        nomeSele = dadoSelecionado?.nome
        precoSele = dadoSelecionado?.preco
        print("Nome: \(nomeSele!) Preco: \(precoSele!) email: \(emailUser)")
        
        view.addSubview(servicosButton)
        
        servicosButton.frame = CGRect(x: (largura - (largura-50))/2, y: (altura-40)/2, width: largura-50, height: 40)
        servicosButton.addTarget(self, action: #selector(reserva), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func reserva(){
        dbHelper.updateUser(email: emailUser, nomeServico: nomeSele!, PrecoServicos: precoSele!, StatusReserva: "reservado")
        let t = ViewController()
        t.modalPresentationStyle = .fullScreen
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
