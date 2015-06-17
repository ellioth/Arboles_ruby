# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "NodoB.rb"

class Arbol_binario
  attr_reader :_root
  private
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

    def findAux(pDato,pNodo)
      if(pNodo.getDato==pDato)
        return true
      elsif(pNodo.getDato>pDato)
        if(pNodo.getHizq==nil)
          return false
        else
          return findAux(pDato,pNodo.getHizq)
        end
      else
        if(pNodo.getHder==nil)
          return false
        else
          return findAux(pDato,pNodo.getHder)
        end
      end
    end

    def minMax(pNodo)
      if(pNodo.getHizq==nil)
        return pNodo
      elsif(pNodo.getHizq.getHizq!=nil)
        return minMax(pNodo.getHizq)
      else
        return pNodo
      end
    end

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

    def imprimirAux(pNodo)
      if(pNodo==nil)
        return
      end
      imprimirAux(pNodo.getHizq)
      puts pNodo.getDato.to_s 
      imprimirAux(pNodo.getHder)
    end
  
  public
    def insertar(pDato)
      if (@_root==nil)
        @_root=NodoB.new(pDato)
      else
        insertAux(pDato,@_root)
      end
    end
    
    def borrar(pDato)
      if(@_root==nil)
        return
      else(buscar(pDato))
        @_root=borrarAux(pDato,@_root)
      end
    end
    
    def buscar(pDato)
      if(@_root.getDato==pDato)
        return true
      else
        return findAux(pDato,@_root)
      end
    end

    def imprimir(*args)
      if(args[0]!=nil)
        imprimirAux(args[0])
      end
      imprimirAux(@_root)
    end
end