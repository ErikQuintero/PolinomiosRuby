@ruta = Dir.pwd
require @ruta+'/NumCom'
class Polinomio
   ##
   #Metodo constructor de un polinomio
   def initialize (a,b)  
		if a.class == Array && b.class == String && (b == "reales" || b == "complejos")
      	t = a.size - 1
         for i in (0..t)
         	if a[i].class != Fixnum && a[i] != Bignum && a[i].class != Float && a[i].class == nil && a.class != NumCom 			
	         	return "Existe algun coeficiente incorrecto"
	         	exit
            end 
         end		
         if a[a.size()-1] == 0
         	return "El primer coeficiente tiene que ser distinto de cero"
            exit
         else
       		@a = a
			@b = b
         end		
		else 
         return "No es un arreglo o el tipo de los coeficientes es incorrecto"
	  		exit		
      end
   end
	
   ##
   #Metodo que regresa el grado de un polinomio
   def getGrado
   	return @a.size() - 1 	
	end

   #Metodo que regresa el arreglo del polinomio
   def getArray
   	return @a
   end

	##
	##Metodo auxiliar del toString
	def toStringAux(n)
		if n.class != Fixnum && n.class != Bignum && n.class != NumCom && n.class != Float
			return "Algun numero no es valido"
			exit
		elsif @b == "reales"
			return n.to_s
		elsif @b == "complejos"
			return n.toStringC
		end
	end

   ##
   #Metodo que regresa una representacion en cadena de un polinomio
	def toString
		if getGrado == 0
			return @a[0].to_s
		else
			aux = @a.reverse
      	g = getGrado
			if @b == "reales"
      		s = toStringAux(aux[0]) + "x^" + g.to_s
	   		i = 0
        		aux.each do |x|
					if i > 0 && g > 0
	   		   	if x  >= 0
	   		   		s += " + " + toStringAux(x) + "x^" + g.to_s 
	   		      elsif x < 0 
				      	s += " " + toStringAux(x) + "x^" + g.to_s
	   		      end
					end
	   		   g = g - 1
	   		   i = i + 1
				end
	   		if aux[getGrado] > 0
	     		  	s += " + " + toStringAux(aux[getGrado])
        		elsif aux[getGrado] < 0
		  			s += toStringAux(aux[getGrado])
	     		else
		  			s = s
	     		end
	     		return s
			elsif @b == "complejos"
	    		s = toStringAux(aux[0]) + "x^" + g.to_s
	   		i = 0
        		aux.each do |x|
					if i > 0 && g > 0
	   		  		s += " + " + toStringAux(x) + "x^" + g.to_s 
					end
	   		   	g = g - 1
	   		   	i = i + 1
				end
	     		s += " + " + toStringAux(aux[getGrado])
	     		return s
			end
		end	  
   end 		

   ##
   #Metodo que deriva un polinomio
   def derivarPol
   	if @a.size == 0 
   		return Polinomio.new([0],"reales")
   	else
			a2 = []
	      j = 0
			if @b == "reales"   	
	      	@a.each do |x|
	      		if (j > 0) 
	         		a2.push(x*j)
	         	end
		      	j = j + 1
	       	end 
		    	@a = a2
		      p2 = Polinomio.new(a2,@b)
		      return p2
			elsif @b == "complejos"
				@a.each do |x|
	      		if (j > 0) 
	         		a2.push(x.multPorEscalar(j))
	         	end
		      	j = j + 1	
	       	end 
		    	@a = a2
		      p2 = Polinomio.new(a2,@b)
		      return p2
			end
		end
   end

   ##
   #Metodo que suma 2 Polinomios
   def sumaPol(p)
   	aux = p.getArray
      i = 0
      if p.class != Polinomio
      	return "No es un polinomio"
	   	exit
		elsif @b == "reales"
      	if p.getGrado >= getGrado
      		@a.each do |x|
	   		   if x != nil
	   		  		aux[i] = aux[i] + x
	   		   end
	   		  	i = i + 1
	   		end
	   		p2  = Polinomio.new(aux,@b)
	   		return p2
      	else
      		aux.each do |x|
	   	   	if x != nil
	   	  			@a[i] = @a[i] + x
	   	   	end
			   	i = i + 1
	   		end
	   		p2  = Polinomio.new(@a,@b)
	   		return p2
      	end
		elsif @b == "complejos"
			if p.getGrado >= getGrado
      		@a.each do |x|
	   		   if x != nil
	   		  		aux[i] = aux[i].sumaDeComplejos(x)
	   		   end
	   		  	i = i + 1
	   		end
	   		p2  = Polinomio.new(aux,@b)
	   		return p2
      	else
      		aux.each do |x|
	   	   	if x != nil
	   	  			@a[i] = @a[i].sumaDeComplejos(x)
	   	   	end
			   	i = i + 1
	   		end
	   		p2  = Polinomio.new(@a,@b)
	   		return p2
      	end	
		end
   end
	
	##
	##Metodo que evalua un valor en un polinomio
	def evaluar(n)
		if n.class != Fixnum && n.class != Bignum && n.class != Float && n.class != NumCom 
			return "El numero no es valido"
			exit
		elsif @b == "reales"
			if n.class == Fixnum || n.class == Bignum || n.class == Float
				aux = 0
				g = getGrado			
				@a.reverse.each do |x|			
					aux += x * (n**g)
					g = g - 1
				end
			end
			return aux
		elsif @b == "complejos" && n.class == NumCom
			aux = NumCom.new(0,0)
			g = getGrado
			p = NumCom.new(0,0)
			@a.reverse.each do |x|
				if g >= 0
					p = (n.potenciaC(g))
					aux = aux.sumaDeComplejos(x.multDeComplejos(p))
					g = g - 1
				end
			end
		return aux
		end
	end
end
