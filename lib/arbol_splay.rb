# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "NodoB.rb"
require_relative "metodos_arboles.rb"
/clase para crear un arbol splay, hereda de metodos para arboles /
class Arbol_splay < MetodosArboles
  #atributo raiz
  attr_accessor :root,:_ifpadre
  #bloque para metodos privados 
  private
    /metodo para relizar el sply de un nodo hasta que llegue a ser la raiz/
    def splay(pDato)
      toRoot=find(pDato)
      if(!@_ifpadre||toRoot==@_root)
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
    
    /metodo para buscar un nodo en el arbol/
    def find(pDato)
      if (@_root.getDato==pDato)
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
    
    /metodo para buscar el menor de los mayores del nodo/
    def minMax(pNodo)
      if(pNodo.getHizq==nil)
        return pNodo
      elsif(pNodo.getHizq.getHizq!=nil)
        return minMax(pNodo.getHizq)
      else
        return pNodo
      end
    end

    /metodo recursivo para borrar un nodo del arbol/
    def borrarAux(pDato,pNodo)
      if(pNodo.getDato==pDato)
        if(pNodo.getHizq==nil)
          return pNodo.getHder
        elsif(pNodo.getHder==nil)
          return pNodo.getHizq
        else
          aux=minMax(pNodo.getHder)
          if(aux==pNodo.getHder()&& aux.getHizq()==nil)
            pNodo.getHizq.setPadre(aux)
            aux.setHizq(pNodo.getHizq())
            return aux
          end
          menor=aux.getHizq
          pNodo.getHizq.setPadre(menor)
          menor.setHizq(pNodo.getHizq)
          menor_hder= menor.getHder
          pNodo.getHder.setPadre(menor)
          menor.setHder(pNodo.getHder)
          pNodo.setHder(menor_hder)
          if(aux.getHizq==menor)
            aux.setHizq(menor_hder)
          else
            aux.setHder(menor_hder)
          end
          if(menor_hder!=nil)
            menor_hder.setPadre(aux)
          end
          return menor
        end
      elsif (pNodo.getDato>pDato)
        pNodo.setHizq(borrarAux(pDato, pNodo.getHizq))
        if(pNodo.getHizq!=nil)
          pNodo.getHizq.setPadre(pNodo);
        end
        return pNodo;
      else
        pNodo.setHder(borrarAux(pDato, pNodo.getHder))
        if(pNodo.getHder!=nil)
          pNodo.getHder.setPadre(pNodo);
        end
        return pNodo;
      end
    end

    /metodo recurisvo para realizar una insercion en el arbol/
    def insertAux(pDato,nodo_tmp)
      if(nodo_tmp.getDato>pDato)
        if (nodo_tmp.getHizq==nil)
          nodo_tmp.setHizq(NodoB.new(pDato))
          nodo_tmp.getHizq.setPadre(nodo_tmp)
        else
          insertAux(pDato,nodo_tmp.getHizq)
        end
      else
        if (nodo_tmp.getHder==nil)
          nodo_tmp.setHder(NodoB.new(pDato))
          nodo_tmp.getHder.setPadre(nodo_tmp)
        else
          insertAux(pDato,nodo_tmp.getHder)
        end
      end
    end
    
    /metodo para imprimir los nodos del arbol/
    def imprimirAux(pNodo)
      if(pNodo==nil)
        return
      end
      imprimirAux(pNodo.getHizq)
      puts pNodo.getDato.to_s
      imprimirAux(pNodo.getHder)
    end
    
    /metodo sobreescrito del padre para realizar una rotacion hacia la izquierda/
    def zig(pNodo)
      return super
    end
    
    /metodo sobreescrito del padre para realizar una rotacion hacia la derecha/
    def zag(pNodo)
      return super
    end
    
    /metodo sobreescrito del padre para realizar una rotacion doble a la izq./
    def zigzig(pNodo)
      return super
    end
    
    /metodo sobreescrito del padre para realizar una rotacion doble a la dere/
    def zagzag(pNodo)
      return super
    end
    
    /metodo sobreescrito del padre para realizar una rotacion de derecha a izq/
    def zigzag(pNodo)
      return super
    end
    
    /metodo sobreescrito del padre para realizar una rotacion de izq a derecha/
    def zagzig(pNodo)
      return super
    end
    
  public
    /metodo para realizar una insercion en el arbol/
    def insertar(pDato)
      if (@_root==nil)
        @_root=NodoB.new(pDato)
      else
        insertAux(pDato,@_root)
      end
      splay(pDato)
    end
    
    /metodo para realizar una eliminacion en el arbol/
    def borrar(pDato)
      tmp= find(pDato);
      if(tmp==@_root)
        @_root=borrarAux(pDato, @_root)
      elsif(@_ifpadre)
        padre= tmp.getPadre
        @_root=borrarAux(pDato, padre)
        splay(padre)
      else
        splay(tmp)
      end
    end
    
    /metodo para realizar una busqueda en el arbol/
    def buscar(pDato)
      if(@_root.getDato==pDato)
        return true
      else
        tmp=find(pDato)
        splay(tmp)
        return @_ifpadre
      end
    end
    
    /metodo para realizar una impresion de los datos del arbol/
    def imprimir()
      imprimirAux(@_root)
    end
end
