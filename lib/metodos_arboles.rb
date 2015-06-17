# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "NodoB.rb"

class MetodosArboles
  public
    def rotacionIzq(pNodo)
      padre= pNodo.getPadre
      _hder= pNodo.getHder
      maxMIn= pNodo.getHder.getHizq
      _hder.setPadre(padre)
      _hder.setHizq(pNodo)
      pNodo.setPadre(_hder)
      pNodo.setHder(maxMIn)
      if(padre!=nil && padre.getHder==pNodo)
          padre.setHder(_hder)
      elsif(padre!=nil && padre.getHizq==pNodo)
          padre.setHizq(_hder)
      end
      if(maxMIn!=nil)
          maxMIn.setPadre(pNodo)
      end
      return _hder
    end

    def rotacionDer(pNodo)
      padre=pNodo.getPadre
      _hizq= pNodo.getHizq
      minMAx=pNodo.getHizq.getHder
      _hizq.setHder(pNodo)
      _hizq.setPadre(padre)
      pNodo.setPadre(_hizq)
      pNodo.setHizq(minMAx)
      if(padre!=nil && padre.getHder==pNodo)
          padre.setHder(_hizq)
      elsif(padre!=nil && padre.getHizq==pNodo)
          padre.setHizq(_hizq)
      end
      if(minMAx!=nil)
          minMAx.setPadre(pNodo)
      end
      return _hizq
    end

    def rotacionDIzq(pNodo)
      padre= pNodo.getPadre
      _hder= pNodo.getHder
      toHead= pNodo.getHder.getHizq
      hizqG= pNodo.getHder.getHizq.getHizq
      hderG= pNodo.getHder.getHizq.getHder
      toHead.setPadre(padre)
      toHead.setHder(_hder)
      toHead.setHizq(pNodo)
      _hder.setPadre(toHead)
      _hder.setHizq(hderG)
      pNodo.setPadre(toHead)
      pNodo.setHder(hizqG)
      if(padre!=nil && padre.getHder==pNodo)
        padre.setHder(toHead)
      elsif(padre!=nil && padre.getHizq()==pNodo)
        padre.setHizq(toHead)
      end
      if(hderG!=nil)
        hderG.setPadre(_hder)
      end
      if (hizqG!=nil)
        hizqG.setPadre(pNodo)
      end
      return toHead
    end

    def rotacionDDer(pNodo)
      padre= pNodo.getPadre
      _hizq= pNodo.getHizq
      toHead= pNodo.getHizq.getHder
      hizqG= pNodo.getHizq.getHder.getHizq
      hderG= pNodo.getHizq.getHder.getHder
      toHead.setPadre(padre)
      toHead.setHizq(_hizq)
      toHead.setHder(pNodo)
      _hizq.setPadre(toHead)
      _hizq.setHder(hizqG)
      pNodo.setPadre(toHead)
      pNodo.setHizq(hderG)
      if(padre!=nil && padre.getHder==pNodo)
          padre.setHder(toHead)
      elsif(padre!=nil && padre.getHizq==pNodo)
          padre.setHizq(toHead)
      end
      if(hderG!=nil)
          hderG.setPadre(pNodo)
      end
      if (hizqG!=nil)
          hizqG.setPadre(_hizq)
      end
      return toHead
    end
    
    def zig(pNodo)
      padre=pNodo.getPadre()
      hder =pNodo.getHder()
      pNodo.setPadre(padre.getPadre())
      if(padre.getPadre()!=nil)
        if(padre.getPadre().getHder()==padre)
            padre.getPadre().setHder(pNodo)
        else
            padre.getPadre().setHizq(pNodo)
        end
      end
      pNodo.setHder(padre)
      padre.setPadre(pNodo)
      padre.setHizq(hder)
      if(hder!=nil)
          hder.setPadre(padre)
      end
    end
    
    def zag(pNodo)
      padre= pNodo.getPadre
      hizq= pNodo.getHizq
      pNodo.setPadre(padre.getPadre)
      if(padre.getPadre!=nil)
        if(padre.getPadre.getHder==padre)
            padre.getPadre.setHder(pNodo)
        else
            padre.getPadre.setHizq(pNodo)
        end
      end
      pNodo.setHizq(padre) 
      padre.setPadre(pNodo)
      padre.setHder(hizq)
      if(hizq!=nil)
          hizq.setPadre(padre)
      end
    end
    
    def zigzig(pNodo)
      padre= pNodo.getPadre
      abuelo= padre.getPadre
      hderP= padre.getHder
      hder= pNodo.getHder
      pNodo.setPadre(abuelo.getPadre)
      if(abuelo.getPadre!=nil)
        if(abuelo.getPadre.getHder==abuelo)
            abuelo.getPadre.setHder(pNodo);
        else
            abuelo.getPadre.setHizq(pNodo);
        end
      end
      pNodo.setHder(padre);
      padre.setPadre(pNodo);
      padre.setHizq(hder);
      padre.setHder(abuelo);
      abuelo.setPadre(padre);
      abuelo.setHizq(hderP);
      if(hder!=nil)
          hder.setPadre(padre);
      end
      if(hderP!=nil)
          hderP.setPadre(abuelo);
      end
    end
    
    def zagzag(pNodo)
      padre= pNodo.getPadre
      abuelo= padre.getPadre
      hizqP= padre.getHizq
      hizq= pNodo.getHizq
      pNodo.setPadre(abuelo.getPadre)
      if(abuelo.getPadre!=nil)
        if(abuelo.getPadre.getHder==abuelo)
          abuelo.getPadre.setHder(pNodo)
        else
          abuelo.getPadre.setHizq(pNodo)
        end
      end
      pNodo.setHizq(padre)
      padre.setPadre(pNodo)
      padre.setHder(hizq)
      padre.setHizq(abuelo)
      abuelo.setPadre(padre)
      abuelo.setHder(hizqP)
      if(hizq!=nil)
        hizq.setPadre(padre)
      end
      if(hizqP!=nil)
        hizqP.setPadre(abuelo)
      end
    end
    
    def zigzag(pNodo)
      abuelo=pNodo.getPadre.getPadre
      padre= pNodo.getPadre
      hizq=pNodo.getHizq
      hder=pNodo.getHder
      pNodo.setPadre(abuelo.getPadre)
      if(abuelo.getPadre!=nil)
          if(abuelo.getPadre.getHder==abuelo)
              abuelo.getPadre.setHder(pNodo);
          else
              abuelo.getPadre.setHizq(pNodo)
          end
      end
      pNodo.setHizq(abuelo)
      pNodo.setHder(padre)
      padre.setPadre(pNodo)
      padre.setHizq(hder)
      abuelo.setPadre(pNodo)
      abuelo.setHder(hizq)
      if(hizq!=nil)
          hizq.setPadre(abuelo)
      end
      if(hder!=nil)
          hder.setPadre(padre)
      end
    end
    
    def zagzig(pNodo)
      abuelo=pNodo.getPadre.getPadre
      padre= pNodo.getPadre
      hizq=pNodo.getHizq
      hder=pNodo.getHder
      pNodo.setPadre(abuelo.getPadre)
      if(abuelo.getPadre!=nil)
          if(abuelo.getPadre.getHder==abuelo)
              abuelo.getPadre.setHder(pNodo)
          else
              abuelo.getPadre.setHizq(pNodo)
          end
      end
      pNodo.setHizq(padre)
      pNodo.setHder(abuelo)
      padre.setPadre(pNodo)
      padre.setHder(hizq)
      abuelo.setPadre(pNodo)
      abuelo.setHizq(hder)
      if(hizq!=nil)
          hizq.setPadre(padre)
      end
      if(hder!=nil)
          hder.setPadre(abuelo)
      end
    end
end
