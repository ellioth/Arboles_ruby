# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class NodoB
  attr_accessor :dato,:altura,:fe,:hder,:hizq,:padre
  
  def initialize(dato)
    @dato=dato
  end
  
  def getDato()
    return @dato
  end
  
  def getFE()
    return @fe
  end
  
  def getDepth()
    return @altura
  end
  
  def getHder()
    return @hder
  end
  
  def getHizq()
    return @hizq
  end
  
  def getPadre()
    return @padre
  end
  
  def setHder(hder)
    @hder=hder
  end
  
  def setHizq(hizq)
    @hizq=hizq
  end
  
  def setPadre(padre)
    @padre=padre
  end
  
  def setDepth(profundidad)
    @altura=profundidad
  end
  
  def setFE(factEqu)
    @fe=factEqu
  end
end
