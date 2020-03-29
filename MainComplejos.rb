@ruta = Dir.pwd
require @ruta+'/NumerosComplejos'

##
##Metodo main del programa
puts "Dame la parte real del numero complejo"
a = Float(gets.chomp)
puts "Dame la parte imaginaria del numero complejo"
b = Float(gets.chomp)
c = NumerosComplejos.new(a,b)
puts "Tu numero complejo es: " + c.toString
puts "¿Que quieres hacer?
	1. Obtener la parte real del numero complejo
	2. Obtener la parte imaginaria del numero complejo
	3. Obtener el conjugado del numero complejo
	4. Sumar 2 numeros complejos
	5. Restar 2 numeros complejos
	6. Multiplicar 2 numeros complejos
	7. Dividir 2 numeros complejos"
r = gets.chomp
	if r == "1"
		puts c.getReal.to_s
	elsif r == "2"
		puts c.getImaginario.to_s
	elsif r == "3"
		c = c.conjugado
		puts c.toString
	elsif r == "4" || r == "5" || r == "6" || r == "7"
		puts "Dame la parte real del segundo numero complejo"
		a2 = Float(gets.chomp)
		puts "Dame la parte imaginaria del primer numero complejo"
		b2 = Float(gets.chomp)
		c2 = NumerosComplejos.new(a,b)
		puts "Tu primer numero complejo es: " + c.toString
		puts "Tu segundo numero complejo es: " + c2.toString
		if r == "4"
				c3 = c.sumaDeComplejos(c2)
				puts "c1 + c2 = " + c3.toString
			elsif r == "5"
				c3 = c.restaDeComplejos(c2)
				puts "c1 - c2 = " + c3.toString
			elsif r == "6"
				c3 = c.multDeComplejos
				puts "c1 * c2 = " + c3.toString
			elsif r == "7"
				c3 = c.divDeComplejos(c2)
				puts "c1 / c2 = " + c3.toString	
			else 
				puts "No seleccionaste una opcion valida"
			end
	else
			puts "No seleccionaste una opcion valida"
	end
