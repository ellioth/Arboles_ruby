# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "NodoB.rb"
require_relative "metodos_arboles.rb"

class Arbol_avl < MetodosArboles
  attr_accessor :_root
  
  private
    
    def mayor(*datos)
      return datos.max
    end
    
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

    def revizar()
      tmp=@_root
      revizarAux(tmp)
    end
    
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
    
    def rotacionIzq(pNodo)
      return super
    end
    
    def rotacionDer(pNodo)
      return super
    end
    
    def rotacionDDer(pNodo)
      return super
    end
    
    def rotacionDIzq(pNodo)
      return super
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
      revizar()
    end
    
    def borrar(pDato)
      if(@_root==nil)
        return
      else(buscar(pDato))
        @_root=borrarAux(pDato,@_root)
      end
      revizar()
    end
    
    def buscar(pDato)
      if(@_root.getDato==pDato)
        return true
      else
        return findAux(pDato,@_root)
      end
    end

    def imprimir()
      imprimirAux(@_root)
    end
end