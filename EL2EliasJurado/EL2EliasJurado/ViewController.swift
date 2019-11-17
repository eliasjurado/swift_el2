//
//  ViewController.swift
//  EL2EliasJurado
//
//  Created by DAMII on 11/17/19.
//  Copyright © 2019 Elías Jurado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tfrazon: UITextField!
    @IBOutlet weak var tfdireccion: UITextField!
    @IBOutlet weak var tfruc: UITextField!
    @IBOutlet weak var lbmsj: UILabel!
    @IBOutlet weak var tbLista: UITableView!
    var oLista = [Proveedor_BE]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.tbLista.dataSource=self
        self.tbLista.delegate=self
        tbLista.rowHeight = 118
        
        /*var obj = Proveedor_BE()
        obj.codigoproveedor = 1
        obj.ruc = "10434645421"
        obj.razonsocial = "Elias Jurado SAC"
        obj.direccion = "Jr. Pedro Remy 190, SMP"
        oLista.append(obj)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oLista.count
    }
    func numberOfSections(in tableview : UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ocelda = tableView.dequeueReusableCell(withIdentifier: "celda1", for: indexPath) as! TVCcelda
        let reg = oLista[indexPath.row]
        ocelda.mostrar(pentidad: reg)
        return ocelda
    }
    
    @IBAction func agregar(_ sender: Any) {
        let objadd = Proveedor_BE()
        objadd.razonsocial = self.tfrazon.text
        objadd.direccion = self.tfdireccion.text
        objadd.ruc = self.tfruc.text
        
        oLista.append(objadd)
        self.tbLista.reloadData()
        self.limpiar()
    }
    
    func limpiar(){
        self.tfrazon.text = ""
        self.tfdireccion.text = ""
        self.tfruc.text = ""
       
    }
    @IBAction func buscar(_ sender: Any) {
        oLista = [Proveedor_BE]()
        let urlListado = "http://wscibertec201922.somee.com/Proveedor/Lista?RazonSocial="+tfrazon.text!
        print(urlListado)
        let urlConsulta = URL(string: urlListado)
        let peticion = URLRequest(url: urlConsulta!)
        
        let tarea = URLSession.shared.dataTask(with: peticion)
        {Datos, Respuesta, Error in
            print("por iniciar")
            if(Error == nil)
            {
                print("por procesar datos")
                print(Datos ?? "Vacio")
                let datosCadena = NSString(data: Datos!,encoding: String.Encoding.utf8.rawValue)
                print(datosCadena!)
                print("fin procesar datos")
                
                DispatchQueue.main.async {
                    let JSON = try? JSONSerialization.jsonObject(with: Datos!, options: [])
                    
                    if let dictionary = JSON as? [String: Any], let wslista = dictionary["ObjListaPROVEEDOR"] as? [[String: Any]]
                    {
                        wslista.forEach{ Registro in
                            let CodigoProveedor = Registro["CodigoProveedor"] as! Int
                            let RazonSocial = Registro["RazonSocial"] as? String
                            let Direccion = Registro["Direccion"] as? String
                            let Ruc = Registro["Ruc"] as? String
                            
                            let proveedor1 = Proveedor_BE(prazonsocial: RazonSocial ?? "", pdireccion: Direccion ?? "", pruc: Ruc ?? "")
                            proveedor1.codigoproveedor = CodigoProveedor
                            self.oLista.append(proveedor1)
                        }
                        self.lbmsj.text = String(self.oLista.count) + " usuarios encontrados"
                        self.tbLista.reloadData()
                    }
                }
            }
            else
            {
                print("Error")
                print(Error ?? "Error vacio")
            }
        }
        tarea.resume()
    }
    
}

