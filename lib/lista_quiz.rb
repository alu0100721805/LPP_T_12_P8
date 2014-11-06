#Práctica 7
#Realizada por Juan José Gregorio Díaz Marrero y Miguel Aurelio García González

module Quiz 

	class SimpleQuestion

		attr_accessor :preguntas, :respuestas

		def initialize(preg) 
			raise ArgumentError, 'El argumento no es una cadena' unless preg.is_a?(String)  
			@pregunta = preg 
			@respuestas = [] 			

		end

		def insert_Respuesta(valor, resp)

			raise ArgumentError, 'El argumento no es una cadena' unless resp.is_a?(String)
			arr_respuesta = []
			arr_respuesta << valor
 			arr_respuesta << resp
			@respuestas << arr_respuesta			

		end

		def to_s

			puts @pregunta
	               
			@respuestas.each do |a|
			puts a[1]
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
		    puts @valor.to_s	
		  end
		  def sig
		     puts @sig.valor	
		  end
		  def ant
		     puts @ant.valor
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

		attr_accessor :head, :tail
		def intialize ()
		  @head = nil
		  @tail = nil
		  @cont = 0
	        end 
		
		def insertarElemento_final(nodo)
			if (@head == nil)
				@head = nodo
				@tail = nodo
				nodo.sig = nil
				nodo.ant = nil
				nodo.valor
				@cont = 1 
			elsif (@head != nil)
				@head.sig = nodo
				nodo.ant = @head
				@head.valor
				@head = nodo
				@head.valor
				@cont = @cont + 1
			end
		    
		end
		def eliminarElemento_final
			if (@head != nil)
			 	if (@head.ant == nil)
			    	  @tail = nil
			   	  @head = nil
			       else
			          @head = @head.ant
			          @head.sig = nil
			        end
		        else
				puts "Lista vacía"
			end
	        end
		def cont
			@cont
		end 


	end

	
end

