//
//  Proveedor_BE.swift
//  EL2EliasJurado
//
//  Created by DAMII on 11/17/19.
//  Copyright © 2019 Elías Jurado. All rights reserved.
//

import UIKit

class Proveedor_BE: NSObject {
    var codigoproveedor : Int
    var razonsocial : String?
    var direccion : String?
    var ruc : String?
    var Eliminado : Bool
    var codigoerror : integer_t
    var descripcionerror : String?
    var mensajeerror : String?
    
    override init() {
        self.codigoproveedor = 0
        self.razonsocial = ""
        self.direccion = ""
        self.ruc = ""
        self.Eliminado = false
        self.codigoerror = 0
        self.descripcionerror = ""
        self.mensajeerror = ""
    }
    
    init(prazonsocial:String,pdireccion:String,pruc:String) {
        self.codigoproveedor = 0
        self.razonsocial = prazonsocial
        self.direccion = pdireccion
        self.ruc = pruc
        self.Eliminado = false
        self.codigoerror = 0
        self.descripcionerror = ""
        self.mensajeerror = ""
    }
}
