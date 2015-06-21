# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "NodoB.rb"

/
clase para crear arboles binarios
/
class Arbol_binario
  #atributo que es la raiz del arbol
  attr_reader :_root
  #bloque para metodos privados para el arbol
  private
    /metodo para realizar una insercion en el arbol/
    def insertAux(pDato,nodo_tmp)
      if(nodo_tmp.dato>pDato)
        if (nodo_tmp.getHizq==nil)
          nodo_tmp.setHizq(NodoB.new(pDato))
          nodo_tmp.getHizq.setPadre(nodo_tmp)
        else
          insertAux(pDato,nodo_tmp.getHizq)
        end
      elsif(nodo_tmp.getDato<pDato)
        if (nodo_tmp.getHder==nil)
          nodo_tmp.setHder(NodoB.new(pDato))
          nodo_tmp.getHder.setPadre(nodo_tmp)
        else
          insertAux(pDato,nodo_tmp.getHder)
        end
      end
    end

    /metodo recursivo auxiliar para realizar una busqueda en el arbol/
    def buscarAux(pDato,pNodo)
      if(pNodo.getDato==pDato)
        return true
      elsif(pNodo.getDato>pDato)
        if(pNodo.getHizq==nil)
          return false
        else
          return buscarAux(pDato,pNodo.getHizq)
        end
      else
        if(pNodo.getHder==nil)
          return false
        else
          return buscarAux(pDato,pNodo.getHder)
        end
      end
    end

    /metodo para encontrar el menor de los mayores desde un nodo
    cualquiera en el arbol/
    def minMax(pNodo)
      if(pNodo.getHizq==nil)
        return pNodo
      elsif(pNodo.getHizq.getHizq!=nil)
        return minMax(pNodo.getHizq)
      else
        return pNodo
      end
    end

    /metodo recursivo auxiliar para realizar una eliminacion en el arbol/
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

    /metodo para realizar una impresion del contenido del arbol/
    def imprimirAux(pNodo)
      if(pNodo==nil)
        return
      end
      imprimirAux(pNodo.getHizq)
      puts pNodo.getDato.to_s 
      imprimirAux(pNodo.getHder)
    end
  
  #bloque para metodos public del arbol
  public
    /metodo para realizar una insercion en el arbol/
    def insertar(*pDato)
      if (@_root==nil)
        @_root=NodoB.new(pDato[0])
      else
        insertAux(pDato[0],@_root)
      end
      return @_root
    end
    
    /metodo para realizar una eliminacion en el arbol/
    def borrar(*pDato)
      if(@_root==nil)
        return
      else(buscar(pDato[0]))
        @_root=borrarAux(pDato[0],@_root)
      end
      return @_root
    end
    
    /metodo para realizar una busqueda en el arbol/
    def buscar(*pDato)
      if(@_root.getDato==pDato[0])
        return true
      else
        return buscarAux(pDato[0],@_root)
      end
    end

    /metodo para realizar una impresion de los datos del arbol/
    def imprimir(*args)
      if(args[0]!=nil)
        imprimirAux(args[0])
      end
      imprimirAux(@_root)
    end
end


