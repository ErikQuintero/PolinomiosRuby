@ruta = Dir.pwd
require @ruta+'/NumCom'
require @ruta+'/PolCom'

##
##Metodo main del programas
a = []
puts "Dame el grado del polinomio que necesitas"
grado = Float(gets.chomp)
if grado < 0 || grado.ceil != grado
	puts "El grado de todo polinomio es un numero entero mayor o igual a 0"
	exit
end
puts "¿Que tipo de coeficientes va a tener tu polinomio, Reales o Complejos?"
s = String(gets.chomp)
s = s.downcase
if s == "reales"
	for i in (0..grado)
   	puts "Dame el coeficiente de la x^" + i.to_s
   	act = Float(gets.chomp)
		a.push(act)
	end
elsif s == "complejos"
	for i in (0..grado)
   		puts "Dame la parte real del coeficiente de la x^" + i.to_s
   		act = Float(gets.chomp)
		puts "Dame la parte imaginaria del coeficiente de la x^" + i.to_s
		act2 = Float(gets.chomp)
		nC = NumCom.new(act,act2)
		a.push(nC)
	end
else 
	puts "Respuesta Invalida, vuelve a intentarlo"	
	exit
end
p = Polinomio.new(a,s)
puts "Tu polinomio es: " + p.toString 
puts "¿Que quieres hacer?
	1. Derivar el polinomio
	2. Sumar 2 polimonios
	3. Obtener el grado de un polinomio
	4. Evaluar un valor en un polinomio"
r = gets.chomp
   if r == "1"
      p = p.derivarPol
      puts "La derivada es: " + p.toString
   elsif r == "2"
      a2 = []
      puts "Dame el grado del segundo polinomio"
      grado2 = Float(gets.chomp)
		if grado2 < 0 || grado2.ceil != grado2
			puts "El grado de todo polinomio es un numero entero mayor o igual a 0"
			exit
		end
		if s == "reales"
   		for i in (0..grado2)
		   	puts "Dame el coeficiente de la x^" + i.to_s
		   	act2 = Float(gets.chomp)
		   	a2.push(act2)
      	end
		elsif s == "complejos"
			for i in (0..grado2)
   			puts "Dame la parte real del coeficiente de la x^" + i.to_s
   			act3 = Float(gets.chomp)
				puts "Dame la parte imaginaria del coeficiente de la x^" + i.to_s
				act4 = Float(gets.chomp)
				nC2 = NumCom.new(act3,act4)
				a2.push(nC2)
			end
		else 
			puts "Respuesta Invalida, vuelve a intentarlo"
			exit
		end
      p2 = Polinomio.new(a2,s)
      puts "El primer polinomio es: " + p.toString
      puts "El segundo polinomio es: " + p2.toString
      p = p.sumaPol(p2)
      puts "p1 + p2 = " + p.toString
   elsif r == "3"
   	  n = p.getGrado
      puts "El grado del polinomio es: " + n.to_s
	elsif r == "4"
		if s == "reales"
			puts "Dame el valor que quieres evaluar en el polinomio"
			v = Float(gets.chomp)
			x = p.evaluar(v)
			puts "El resultado es: " + x.to_s
		elsif s == "complejos"
			puts "Dame el valor real del numero complejo que quieres evaluar en el polinomio"
			v1 = Float(gets.chomp)
			puts "Dame el valor imaginario del numero complejo que quieres evaluar en el polinomio"
			v2 = Float(gets.chomp)			
			nC3 = NumCom.new(v1,v2)
			e = p.evaluar(nC3)
			puts p.toString
			puts "El resultado es: " + e.toStringC
		end
   end
