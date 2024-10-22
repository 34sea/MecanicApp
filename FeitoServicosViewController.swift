//
//  FeitoServicosViewController.swift
//  MecanicApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit

class FeitoServicosViewController: UIViewController {
    let dbHelper = DBHelperUser()

    var dadoSelecionado: (nome: String, servico: String, pagamento: Double)?
    let lbn = UILabel()
    var nomeSele: String?

    let servicosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Feito", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        lbn.text = "Nome"
        lbn.textColor = UIColor(hex: "#222222")
        lbn.textAlignment = .center
        lbn.font = UIFont.systemFont(ofSize: 18, weight: .bold)
       // print(dadoSelecionado?.nome)
        
        let largura = view.frame.size.width
        let altura = view.frame.size.height
        
        nomeSele = dadoSelecionado?.nome
        lbn.text = "\(nomeSele!)"
        view.addSubview(lbn)
        view.addSubview(servicosButton)
        
        lbn.frame = CGRect(x: (largura - (largura-50))/2, y: (altura-100)/2, width: largura-50, height: 20)
        servicosButton.frame = CGRect(x: (largura - (largura-50))/2, y: (altura-40)/2, width: largura-50, height: 40)
        servicosButton.addTarget(self, action: #selector(feitoL), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func feitoL(){
        dbHelper.updateUser(email: nomeSele!, nomeServico: "none", PrecoServicos: 0, StatusReserva: "sem")
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
