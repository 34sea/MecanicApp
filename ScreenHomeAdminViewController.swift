//
//  HomeAdminViewController.swift
//  ToolApp
//
//  Created by Elisio Simao on 1/1/01.
//  Copyright © 2001 Cleyton&Samir. All rights reserved.
//

import UIKit


class ScreenHomeAdminViewController: UIViewController {
    var nomeAdministrador: String = "Joana"
    let dbHelper = DBHelperServicos()
    let dbHelper2 = DBHelperUser()
    var reservado: Int = 0
    var valorTotal: Double = 0

    let tituloBoasVindasField: UILabel = {
        let txt = UILabel()
        txt.text = "Bem vindo, "
        txt.textColor = UIColor(hex: "#222222")
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.font = UIFont.boldSystemFont(ofSize: 20)
        return txt
    }()
    
    let nomeDaPessoaField: UILabel = {
        let txt = UILabel()
        txt.text = "Clayton!"
        txt.textColor = UIColor(hex: "#f18f02")
        txt.numberOfLines = 0
        txt.lineBreakMode = .byWordWrapping
        txt.font = UIFont.boldSystemFont(ofSize: 15)
        return txt
    }()
    
    let bannerImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "bamm")
        return img
    }()
    
    let servicosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Servicos", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    let sairButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sair", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(hex: "#f18f02")
        button.tintColor = UIColor(hex: "#ffffff")
        return button
    }()
    
    let divLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = ""
        textLbn.numberOfLines = 0
        textLbn.textColor = UIColor(hex: "#aaaaaa")
        textLbn.backgroundColor = UIColor(hex: "#aaaaaa")
        textLbn.lineBreakMode = .byWordWrapping
        textLbn.textAlignment = .center
        return textLbn
    }()
    
    let quantiUsersLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "Usuarios"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        // textLbn.textAlignment = .center
        return textLbn
    }()
    
    let quantiServicosLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "Servicos"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        // textLbn.textAlignment = .center
        return textLbn
    }()
    
    let servicoTerminadoLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "Valor total"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        // textLbn.textAlignment = .center
        return textLbn
    }()
    
    let servicosReservadosLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "Reservados"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        // textLbn.textAlignment = .center
        return textLbn
    }()
    
    let servicoTerminadoResultLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "0"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        textLbn.textAlignment = .center
        return textLbn
    }()
    
    let servicosReservadosResultLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "0"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        textLbn.textAlignment = .center
        return textLbn
    }()
    
    let quantiUsersResultLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "0"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        textLbn.textAlignment = .center
        return textLbn
    }()
    
    let quantiServicosResultLbn: UILabel = {
        let textLbn = UILabel()
        textLbn.text = "0"
        textLbn.textColor = UIColor(hex: "#222222")
        textLbn.font = UIFont.systemFont(ofSize: 17)
        textLbn.numberOfLines = 0
        textLbn.lineBreakMode = .byWordWrapping
        textLbn.textAlignment = .center
        return textLbn
    }()
    
    let rgisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reservado", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(hex: "#ffffff")
        button.tintColor = UIColor(hex: "#f18f02")
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#ffffff")
        
        layout()
        
        servicosButton.addTarget(self, action: #selector(telaServicos), for: .touchUpInside)
        sairButton.addTarget(self, action: #selector(sairTela), for: .touchUpInside)
        rgisterButton.addTarget(self, action: #selector(telaResrvados), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    func layout(){
        
        let largura = view.frame.size.width
        let altura = view.frame.size.height
        
        print("Nome: \(nomeAdministrador)")
        nomeDaPessoaField.text = nomeAdministrador
        view.addSubview(tituloBoasVindasField)
        view.addSubview(nomeDaPessoaField)
        view.addSubview(bannerImg)
        view.addSubview(servicosButton)
        view.addSubview(sairButton)
        view.addSubview(divLbn)
        view.addSubview(quantiUsersLbn)
        view.addSubview(quantiServicosLbn)
        view.addSubview(quantiServicosResultLbn)
        view.addSubview(quantiUsersResultLbn)
        view.addSubview(servicoTerminadoLbn)
        view.addSubview(servicosReservadosLbn)
        view.addSubview(servicoTerminadoResultLbn)
        view.addSubview(servicosReservadosResultLbn)
        view.addSubview(rgisterButton)
        
        tituloBoasVindasField.frame = CGRect(x: 20, y: 140, width: 120, height: 20)
        nomeDaPessoaField.frame = CGRect(x: 125, y: 140, width: 170, height: 20)
        sairButton.frame = CGRect(x: largura-60, y: 125, width: 40, height: 40)

        
        bannerImg.frame = CGRect(x: 0, y: 200, width: largura, height: 170)
        
        quantiUsersLbn.frame = CGRect(x: 20, y: 400, width: largura/2, height: 20)
        quantiUsersResultLbn.frame = CGRect(x: 30, y: 430, width: 50, height: 20)

        quantiServicosLbn.frame = CGRect(x: largura-90, y: 400, width: largura/2, height: 20)
        quantiServicosResultLbn.frame = CGRect(x: largura-80, y: 430, width: 50, height: 20)

        
        servicoTerminadoLbn.frame = CGRect(x: 20, y: 505, width: largura/2, height: 20)
        servicoTerminadoResultLbn.frame = CGRect(x: 30, y: 530, width: 50, height: 20)

        servicosReservadosLbn.frame = CGRect(x: largura-100, y: 505, width: largura/2, height: 20)
        servicosReservadosResultLbn.frame = CGRect(x: largura-80, y: 530, width: 50, height: 20)
        
        divLbn.frame = CGRect(x: (largura - 0.5)/2, y: 395, width: 0.5, height: 170)
        
        rgisterButton.frame = CGRect(x: (largura - (largura-50))/2, y: altura-150, width: largura-50, height: 40)
        servicosButton.frame = CGRect(x: (largura - (largura-50))/2, y: altura-100, width: largura-50, height: 40)
        
        let totalServicos = dbHelper.countServicos()
        let totalUsers = dbHelper2.countUser()

        reservados()
        quantiServicosResultLbn.text = "\(totalServicos)"
        quantiUsersResultLbn.text = "\(totalUsers)"
        servicosReservadosResultLbn.text = "\(reservado)"
        servicoTerminadoResultLbn.text = "\(valorTotal)"

    }
    
    @objc func telaServicos(){
        let t = ServicosViewController()
        t.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(t, animated: true)
    }
    
  
    
    @objc func sairTela(){
        let t = ViewController()
        t.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    @objc func telaResrvados(){
        let t = ReservadosViewController()
        t.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(t, animated: true)
    }
    
    func reservados(){
        let users = dbHelper2.fetchAllUsers()
        for userItem in users {
            print(reservado)
            if(userItem.StatusReserva == "reservado"){
                reservado+=1
                valorTotal+=userItem.PrecoServicos
            }
        }
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
