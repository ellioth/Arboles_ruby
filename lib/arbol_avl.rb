# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "NodoB.rb"
require_relative "metodos_arboles.rb"
/clase para crear un arbol AVL, hereda de la clase metodos para arboles/
class Arbol_avl < MetodosArboles
  
  #metodos privados de la clase
  private
    /metodo para encontrar el datos mayor entre la comparacion de varios/
    def mayor(*datos)
      super
    end
    
    /metodo para encontrar la altura o profundidad del nodo/
    def height(pHder,pHizq)
      if(pHizq!=nil && pHder!=nil)
        return mayor(pHizq.getDepth,pHder.getDepth)+1;
      elsif(pHizq!=nil)
        return pHizq.getDepth()+1;
      elsif(pHder!=nil)
        return pHder.getDepth()+1;
      else
        return 0;
      end
    end
    
    /metodo para encontrar el factor de equilibrio/
    def factorEquilibrio(pHder,pHizq)
      if(pHizq!=nil && pHder!=nil)
        return pHizq.getDepth()-pHder.getDepth();
      elsif(pHizq!=nil)
        return -pHizq.getDepth()-1;
      elsif(pHder!=nil)
        return pHder.getDepth()+1;
      else
        return 0;
      end
    end

    /metodo para revisar que el arbol se encuentre valanceado/
    def revizar()
      tmp=@_root
      revizarAux(tmp)
    end
    
    /metodo recursivo auxiliar para revisar que el arbol se 
    encuentre valanceado/
    def revizarAux(pNodo)
      if(pNodo==nil)
          return;
      end
      revizarAux(pNodo.getHizq)
      revizarAux(pNodo.getHder)
      pNodo.setDepth(height(pNodo.getHizq, pNodo.getHder))
      pNodo.setFE(factorEquilibrio(pNodo.getHizq, pNodo.getHder))
      if(pNodo==@_root)
        if(pNodo.getFE()>=2)
            if((pNodo.getFE()+pNodo.getHizq().getFE())>pNodo.getFE())
              @_root=rotacionDer(pNodo);
            else
              @_root=rotacionDDer(pNodo);
            end
        elsif(pNodo.getFE()<=-2)
            if((pNodo.getFE()+pNodo.getHder().getFE())<pNodo.getFE())
              @_root=rotacionIzq(pNodo)
            else
              @_root=rotacionDIzq(pNodo)
            end
        end
      else
        if(pNodo.getFE()>=2)
            if((pNodo.getFE()+pNodo.getHizq().getFE())>pNodo.getFE())
                rotacionDer(pNodo)
            else
                rotacionDDer(pNodo)
            end
        elsif(pNodo.getFE()<=-2)
            if((pNodo.getFE()+pNodo.getHder().getFE())<pNodo.getFE())
                rotacionIzq(pNodo)
            else
                rotacionDIzq(pNodo)
            end
        end
      end
    end
    
    /rotacion sobre escrita del padre/
    def rotacionIzq(pNodo)
      return super
    end
    
    /rotacion sobre escrita del padre/
    def rotacionDer(pNodo)
      return super
    end
    
    /rotacion sobre escrita del padre/
    def rotacionDDer(pNodo)
      return super
    end
    
    /rotacion sobre escrita del padre/
    def rotacionDIzq(pNodo)
      return super
    end
    
  #metodos publicos del arbol
  public
    /metodo para realizar una insercion en el arbol/
    def insertar(pDato)
      super
      revizar()
    end
    
    /metodo para realizar una eliminacion en el arbol/
    def borrar(pDato)
      super
      revizar()
    end
    
    /metodo para realizar una busqueda en el arbol/
    def buscar(pDato)
      super
    end

    /metodo para realizar una impresion de los datos del arbol/ 
    def imprimir()
      super
    end
end
