#Práctica 7
#Realizada por Juan José Gregorio Díaz Marrero y Miguel Aurelio García González

module Quiz 
	class Question
	        include Comparable
		attr_accessor :texto
		def initialize(text)
		raise ArgumentError, 'El argumento no es una cadena' unless text.is_a?(String)
		@texto = text
		end
		def to_s
		    puts @texto 		
		end
		def <=>(o)
		    @texto <=> o
		end  
	end

	class SimpleQuestion
		include Comparable
		attr_accessor :pregunta, :respuestas
		def <=>(o)
		   if (@pregunta == o.pregunta)
		   	return @respuestas.length <=> o.respuestas.length
		   else
			if(@pregunta > o.pregunta)
				return 1
			else
				return -1
			end
		   end 
		end

		def initialize(preg) 
			
		        raise ArgumentError, 'El argumento no es una pregunta' unless preg.is_a?(Question)
							
			@pregunta = preg 
			@respuestas = [] 			

		end

		def insert_Respuesta(valor=false, resp)

			raise ArgumentError, 'El argumento no es una cadena' unless resp.is_a?(String)
			arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta			

		end

		def to_s

			puts @pregunta.to_s
			i = 1
			@respuestas.each do |a|
			puts "(#{i}) #{a[1]}"
			i += 1
			end
			puts
		end

	end

	Node = Struct.new(:valor, :sig , :ant) do

		  # Metodo para inicializar la clase
		  def initialize(valor=nil)
		    if valor!= nil
		     raise ArgumentError, 'El argumento no es una instancia de la clase SimpleQuestion' unless valor.is_a?(SimpleQuestion)
		     @valor=valor 
		    else
		      @valor = nil
		    end
		     @sig = nil
		     @ant = nil
		     puts
  		  end
		  def valor=(arg)
		    if(arg != nil)
		    	raise ArgumentError, 'El argumento no es una instancia de la clase SimpleQuestion' unless arg.is_a?(SimpleQuestion)
		    	@valor = arg
		    else
			@valor = nil
		    end	
		    puts
		  end
		  def sig=(arg)
		    if(arg != nil)
		    	raise ArgumentError, 'El argumento no es un Nodo' unless arg.is_a?(Node)
		    	@sig = arg
		    else
			@sig = nil
		    end	
		    puts
		  end
		  def ant=(arg)
		     if(arg != nil)
		    	raise ArgumentError, 'El argumento no es un Nodo' unless arg.is_a?(Node)
		    	@ant = arg
		     else
			@ant = nil
		     end
		    puts	
		  end
		  def valor
		     return @valor	
		  end
		  def sig
		     return @sig
		  end
		  def ant
		      return @ant
		  end
		
		  
        end
	class BoolQuestion < SimpleQuestion
	    	
		def insert_Respuesta (valor, resp)
		   if @respuestas.empty? == false
			@respuestas.clear
		   end
				 
		    if (valor == true && resp == "SI")
			arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta
			arr_respuesta2 = []
			arr_respuesta2 << false
 			arr_respuesta2 << "NO"
			@respuestas << arr_respuesta2
								
		    elsif (valor == false && resp == "NO")
			
		        arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta
			arr_respuesta2 = []
			arr_respuesta2 << true
 			arr_respuesta2 << "SI"
			@respuestas << arr_respuesta2
			
		    elsif (valor == true && resp == "NO")
			
			 arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta
			arr_respuesta2 = []
			arr_respuesta2 << false
 			arr_respuesta2 << "SI"
			@respuestas << arr_respuesta2
		
		    elsif (valor == false && resp == "SI")

			arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta
			arr_respuesta2 = []
			arr_respuesta2 << true
 			arr_respuesta2 << "NO"
			@respuestas << arr_respuesta2

		     else
			 puts "No se pudo introducir la respuesta ,asegurese de que valor sea un booleano y respuesta del tipo cadena 'SI' o 'NO'"			
		     end
		end
	
	end
	class ListaEnlazada
		include Enumerable
		attr_accessor :head, :tail,:size
		def intialize ()
		  @head = nil
		  @tail = nil
	        end
		def buscarNodo(nodo)
		
		    if(nodo != nil)
		    	raise ArgumentError, 'El argumento no es un Nodo' unless nodo.is_a?(Node)
			aux = @tail
			cont = 1 		 
			while (aux != nil) do
				if (aux.valor == nodo.valor)
					puts "Nodo encontrado en la posicion #{cont}"
					
				end
			  cont = cont + 1				
			  aux = aux.sig
			end		    	
		
		    end
		
		end
		def insertarElemento_despuesdenodo(nodoviejo,nodonuevo)
		
		    if(nodoviejo != nil && nodonuevo != nil)
		    	raise ArgumentError, 'El argumento primero no es un Nodo' unless nodoviejo.is_a?(Node)
			raise ArgumentError, 'El argumento segungo no es un Nodo' unless nodonuevo.is_a?(Node)
			aux = @tail 
			while (aux != nil) do
				if (aux.valor == nodoviejo.valor)
					if(aux.sig == nil)
						aux.sig = nodonuevo
						nodonuevo.ant = aux
						nodonuevo.sig = nil
					else
						 aux2 = aux.sig
						nodonuevo.sig = aux2
						nodonuevo.ant = aux
						aux.sig = nodonuevo
						aux2.ant = nodonuevo	 
					end
					puts " Nodo insertado "
					return
				end	

			  aux = aux.sig
			end		    	
		
		    end
		end 
		def insertarElemento_final(nodo)
		    if (nodo != nil)			
			if (@head == nil)
				@head = nodo
				@tail = nodo
				nodo.sig = nil
				nodo.ant = nil
			else
				aux_ant = Node.new				
				aux_ant = @head
				@head.sig = nodo
				@head = nodo
				@head.ant = aux_ant	
				@head.sig = nil
			end
		     end			  
		end
		
		def eliminarElemento_final
			if (@head != nil)
			 	if (@head.ant == nil)
			    	  @tail = nil
			   	  @head = nil
				  puts "Lista vacia"
			       else
				  aux = @head.ant
				  @head = nil
				  @head = aux
				  @head.sig = nil
			        end
			end
	        end
		def each
		
			aux = @tail
			while (aux != nil ) do
				
				 yield aux	          		
				 aux = aux.sig
				 
			end
		end 
		def to_s
			aux = @tail
			while (aux != nil ) do
		         	puts aux.valor.to_s	
	          		aux = aux.sig
			end
			
		end
		def invertirLista

			listainvertida = ListaEnlazada.new
			 aux = @head			
			self.reverse_each {|x| nuevo_nodo = Node.new
			               nuevo_nodo.sig = x.sig
				       nuevo_nodo.ant = x.ant
			               nuevo_nodo.valor = x.valor
			               listainvertida.insertarElemento_final(nuevo_nodo)}
			return listainvertida

		end

	end
	
	class Examen
	  attr_accessor :examen,:aciertos,:fecha,:n_preguntas,:respuestas_examen
	  def initialize(o)
	    raise ArgumentsError, 'El agurmento debe de ser del tipo ListaEnlazada' unless o.is_a?(ListaEnlazada) 	
	    @examen = o
	    @n_preguntas = o.count
	    @aciertos = 0
	    @fecha = nil
	    @respuestas_examen = Array.new[@n_preguntas]
	  end
	  def n_preguntas
		@n_preguntas = @examen.count
		return @n_preguntas
	  end
	  def cuentaAciertos
		
            	     @aciertos = 0		
		     i=0 
		      @examen.each do |x|
		      
		      	      aux = x.valor.respuestas.at(@respuestas_examen[i])
			      if(aux != nil && aux[0] == true)
				@aciertos = @aciertos + 1
			      end
			     i=i+1
		      end
		      return @aciertos
	  end
	  def resultado
		return ((@aciertos/@n_preguntas)*10)
	  end
	end

	class InterfazUsuario
		
		def initialize(o)
	  	raise ArgumentsError, 'El argumento debe ser del tipo Examen' unless o.is_a?(Examen)
	     		if(o.examen != nil)	    
			 @objeto_interfaz = o
	     		end
		end
		def imprimirExamen
			puts " FECHA: " + @objeto_interfaz.fecha
			puts " Numero de preguntas: " +@objeto_interfaz.n_preguntas
			@objeto_interfaz.examen.to_s
		end
		def ejecutarExamen
		      @objeto_interfaz.aciertos = 0		
		      i=1
		      @objeto_interfaz.examen.each do |x|
		      print "#{i}-) "
		      x.to_s
		      i= i + 1
		      puts "Su respuesta: "
		      resp =  gets.chomp.to_i
		      raise IndexError, "La respuesta debe estar entre 1 y #{x.respuestas.size}." unless resp <= x.respuestas.size and resp > 0
		      aux = x.respuestas[resp-1]
				if aux[0] == true
					puts "##################################"
					puts "#           Correcto!            #"
					puts "##################################"
					@objeto_interfaz.aciertos += 1
				else
					puts "----------------------------------"
					puts "---         Fallo              ---"
					puts "----------------------------------"
	
				end
			end
			puts " NOTA : " + @objeto_interfaz.resultado 
	
		end
		def menu

			eleccion = 0
		    	begin
			puts "---------------------MENÚ---------------------"
			puts "- 1-) Imprimir examen 			   -"
			puts "- 2-) Imprimir examen inverso		   -"
			puts "- 3-) Ejecutar examen                        -"
			puts "- 4-) Ejecutar examen inverso  		   -" 
			puts "----------------------------------------------"
			
			puts "\n Introduzca su elección "
			eleccion = gets.chomp.to_i
			  case eleccion
			  when 1
				puts " HA SELECCIONADO IMPRIMIR EXAMEN"
				imprimirExamen
				break
			  when 2
			  	puts " HA SELECCIONADO EJECUTAR EL EXAMEN"
				ejecutarExamen
				break
 			 
			  end
			end while (eleccion < 1 || eleccion > 2)

			respuesta = nil
			puts "DESEA VOLVER A EJECUTAR EL MENÚ ? S/s(Sí)"
			respuesta = get.chomp
			if (respuesta == 'S' || respuesta == 's')
			   menu
			end
		end

	end	
end

