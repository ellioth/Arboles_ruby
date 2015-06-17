# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
/
clase para crear nodos para arboles binarios de busqueda
/
class NodoB
  #atributos para el nodo
  #datos que recibe, altura factor de equilibrio, hijos y padre
  attr_accessor :dato,:altura,:fe,:hder,:hizq,:padre
  
  /
  contructor, recibe un dato
  /
  def initialize(dato)
    @dato=dato
  end
  
  /
  metodo para devolver el dato que contiene el nodo
  /
  def getDato()
    return @dato
  end
  
  /
  metodo para obtenener el factor de equilibrio del nodo 
  /
  def getFE()
    return @fe
  end
  
  /
  metodo para establecer la altura o profundidad que tienen el nodo en el 
  arbol
  /
  def getDepth()
    return @altura
  end
  
  /
  metodo para obtener el hijo derecho del nodo
  /
  def getHder()
    return @hder
  end
  
  /
  metodo para obtener el hijo izquierdo del nodo
  /
  def getHizq()
    return @hizq
  end
  
  /
  metodo para obtener el padre del nodo
  /
  def getPadre()
    return @padre
  end
  
  /
  metodo para establecer el hijo derecho del nodo
  /
  def setHder(hder)
    @hder=hder
  end
  
  /
  metodo para establecer el hijo izquierdo del nodo
  /
  def setHizq(hizq)
    @hizq=hizq
  end
  
  /
  metodo para establecer el padre del nodo
  /
  def setPadre(padre)
    @padre=padre
  end
  
  /
  metodo para establecer la profundidad o altura del nodo
  /
  def setDepth(profundidad)
    @altura=profundidad
  end
  
  /
  metodo para establecer el factor de equilibrio del nodo
  /
  def setFE(factEqu)
    @fe=factEqu
  end
end
