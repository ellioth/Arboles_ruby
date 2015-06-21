# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "NodoB.rb"
require_relative "metodos_arboles.rb"
/clase para crear un arbol splay, hereda de metodos para arboles /
class Arbol_splay < MetodosArboles
  #atributo raiz
  attr_accessor :_ifpadre
  #bloque para metodos privados 
  private
    /metodo para relizar el sply de un nodo hasta que llegue a ser la raiz/
    def splay(pDato)
      toRoot=find(pDato)
      if(toRoot==@_root)
          return;
      else
          @_root=splayAux(toRoot)
      end
    end
    
    /metodo recursivo auxiliar para ir revizando cuando llega a la raiz el nodo/
    def splayAux(toRoot)
      if (toRoot.getPadre==nil)
          return toRoot
      elsif(toRoot.getPadre.getPadre==nil)
        if(toRoot.getPadre.getHder==toRoot)
          zag(toRoot)
        else
          zig(toRoot)
        end
      else
        if(toRoot.getPadre.getPadre.getHder==toRoot.getPadre)
          if(toRoot.getPadre().getHder()==toRoot)
            zagzag(toRoot)
          else
            zigzag(toRoot)
          end
        else
          if(toRoot.getPadre().getHizq()==toRoot)
              zigzig(toRoot)
          else
              zagzig(toRoot)
          end
        end
      end
      if(toRoot.getPadre()!=nil)
        return splayAux(toRoot)
      else
        return toRoot
      end
     
    end
    
    /metodo para realizar una busqueda en el arbol/
    def find(pDato)
      if(@_root.getDato==pDato)
        @_ifpadre=false
        return @_root
      else
        return findAux(@_root,pDato)
      end
    end
    
    /metodo recursivo auxiliar para realizar busquedas en el arbol, retorna 
    nodos que tienen enlaces con el arbol/
    def findAux(pNodo,pDato)
      if(pNodo.getDato==pDato)
        @_ifpadre=true
        return pNodo
      elsif(pNodo.getDato<pDato)
        if(pNodo.getHder==nil)
          @_ifpadre=false
          return pNodo
        else
          return findAux(pNodo.getHder, pDato)
        end
      elsif(pNodo.getDato>pDato)
        if(pNodo.getHizq==nil)
            @_ifpadre=false
            return pNodo
        else 
            return findAux(pNodo.getHizq, pDato)
        end
      end
    end
    
    /rotacion siemple a la izquierda para un splay/
    def zig(pNodo)
      super
    end
    
    /rotacion siemple a la derecha para un splay/
    def zag(pNodo)
      super
    end
    
    /rotacion doble a la izquierda para un splay/
    def zigzig(pNodo)
      super
    end
    
    /rotacion doble a la derecha para un splay/
    def zagzag(pNodo)
      super
    end
    
    /rotacion de derecha a izquierda para un splay/
    def zigzag(pNodo)
      super
    end
    
    /rotacion de izquierda a derehca para un splay/
    def zagzig(pNodo)
      super
    end
    
  public
    /metodo para realizar una insercion en el arbol/
    def insertar(pDato)
      super
      splay(pDato)
    end
    
    /metodo para realizar una eliminacion en el arbol/
    def borrar(pDato)
      tmp= find(pDato);
      if(tmp==@_root)
        super
      elsif(@_ifpadre)
        padre= tmp.getPadre
        super
        @_root=splayAux(padre)
      else
        @_root=splayAux(tmp)
      end
    end
    
    /metodo para realizar busquedas en un arbol splay/
    def search(pDato)
      splay(pDato)
      if(@_ifpadre)
        return true
      else
        return false
      end
    end
    
    /metodo para realizar una impresion de los datos del arbol/
    def imprimir()
      super
    end
end