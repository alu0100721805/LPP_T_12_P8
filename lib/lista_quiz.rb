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
		attr_accessor :head, :tail
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
			if (@head == nil)
				@head = nodo
				@tail = nodo
				nodo.sig = nil
				nodo.ant = nil
			else
				
				nodo.sig = nil
				nodo.ant = @head
				@head.sig = nodo
				@head = nodo
				
			end
			
		    
		end
		
		def insertarElemento_principio(nodo)

			if (@head == nil)
				@head = nodo
				@tail = nodo
				nodo.sig = nil
				nodo.ant = nil
			else
				aux = @tail
				@tail.ant = nodo
				nodo.sig = @tail
				@tail = nodo
				@tail.ant = nil
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
			i = 1
			aux = @tail
			while (aux != nil ) do
				 puts
				 puts "Pregunta #{i})"
				 yield aux.valor	          		
				 aux = aux.sig
				 i += 1
			end
		end 
		
		def to_s
			aux = @tail
			while (aux != nil ) do
		         	puts aux.valor.to_s	
	          		aux = aux.sig
			end
			
		end

	end
	
	class Examen
	  	  
	  def initialize(examen)
	    @examen = examen
	    @contador = 0
	    @aciertos = 0
	  end
 
	
	end

	
end

