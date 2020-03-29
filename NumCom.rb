##
##Clase de numeros complejos
class NumCom
	##
	##Metodo constructor de numeros complejos
	def initialize (r,i)
		if r.class != Fixnum && r.class != Bignum && r.class != Float && i.class != Fixnum && i.class != Bignum && i.class != Float && r == nil && i == nil
			return "Alguno de los numeros no es valido"
			exit
		else
			@r = r
			@i = i
		end
	end

	##
	##Metodo auxiliar para el toString de los complejos
	def toStringC
		if self == nil
			return "No es un numero valido"
			exit
		elsif @i < 0
			s = "(" + @r.to_s + " " + @i.to_s + "i" + ")"
		else
			s = "(" + @r.to_s + " + " + @i.to_s + "i" + ")"
		end 
		return s
	end

	##
	##Metodo que regresa el valor real de un numero complejo
	def getReal
		return @r
	end

	##
	##Metodo que regresa el valor imaginario de un numero complejo
	def getImaginario
		return @i
	end

	##
	##Metodo que regresa el conjugado de un numero complejo
	def conjugado
		return NumCom.new(@r,-@i)
	end

	##
	##Metodo que regresa la suma de dos numeros complejos
	def sumaDeComplejos(c)
		if c.class != NumCom && c.class != Float && c.class != Fixnum && c.class != Bignum && c == nil
			return "El numero rescibido no es valido"
			exit
		else
			a2 = (@r + c.getReal)
			b2 = (@i + c.getImaginario)	
		end
		return NumCom.new(a2,b2) 
	end

	##
	##Metodo que regresa la resta de dos numeros complejos
	def restaDeComplejos (c)
		if c.class != NumCom && c.class != Float && c.class != Fixnum && c.class != Bignum
			return "El numero rescibido no es valido"
			exit
		else
			a2 = @r - c.getReal
			b2 = @i - c.getImaginario	
		end
		return NumCom.new(a2,b2)
	end

	##
	##Metodo que regresa la multiplicacion de dos numeros complejos
	def multDeComplejos (c)
		if (c.class != NumCom && c.class != Float && c.class != Fixnum && c.class != Bignum) 
			return "El numero rescibido no es valido"
			exit
		else
			a2 = (@r * c.getReal) - (@i * c.getImaginario)
			b2 = (@r * c.getImaginario) + (@i * c.getReal)
		end
		return NumCom.new(a2,b2)
	end

	##
	##Metodo que regresa la divicion de dos numeros complejos
	def divDeComplejos(c)
		if c.class != NumCom && c.class != Float && c.class != Fixnum && c.class != Bignum
			return "El numero rescibido no es valido"
			exit
		else
			a2 = (@r * c.getReal + @i * c.getImaginario)/(c.getReal * c.getReal + c.getImaginario * c.getImaginario)
			b2 = (@i * c.getReal - @r * c.getImaginario)/(c.getReal * c.getReal + c.getImaginario * c.getImaginario)
		end
		return NumCom.new(a2,b2)
	end

	##
	##Metodo que multipilca un numero complejo por un escalar
	def multPorEscalar(n)
		if n.class != Fixnum && n.class != Bignum && n.class != Float && n.class == nil
			return "El escalar no es valido"
			exit
		else
			a2 = @r * n
			b2 = @i * n
		end
		return NumCom.new(a2,b2)
	end

	##
	##Metodo que multiplica un numero complejo n veces
	def potenciaC(n)
		if n.class != Float && n.class != Fixnum && n.class != Bignum && (n.floor != n || n < 0)
			return "No es una potencia valida"
			exit
		elsif n == 0
			return NumCom.new(1,0)
		elsif n == 1
			return self
		elsif n > 1
			aux = self
			for i in (1..n-1)
				aux = aux.multDeComplejos(self)
			end
			return aux
		end
	end
end
