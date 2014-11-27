#Práctica 7

#Realizada por Juan José Gregorio Díaz Marrero y Miguel Aurelio García González
require 'spec_helper.rb'
require 'lista_quiz.rb'

describe Quiz do	

before :all do

		@q1 = Quiz::Question.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\n\tclass Objeto\n\tend")
		@p1 = Quiz::SimpleQuestion.new(@q1)

		@p1.insert_Respuesta(true, "Una instancia de la clase Class")
		@p1.insert_Respuesta(false, "Una constante")
		@p1.insert_Respuesta(false, "Un objeto")
		@p1.insert_Respuesta(false, "Ninguna de las anteriores")
				
		@q2 = Quiz::Question.new("Es apropiado que una clase Tablero herede de una clase Juego")
		@p2 = Quiz::BoolQuestion.new(@q2)

		@p2.insert_Respuesta(false, "SI")

		
	
		@q3 = Quiz::Question.new("¿Hará frío mañana?")
		@p3 = Quiz::SimpleQuestion.new(@q3)
		
		@p3.insert_Respuesta(true, "Sí")
		@p3.insert_Respuesta(false, "No")
		@p3.insert_Respuesta(false, "Tal vez")

		@q4 = Quiz::Question.new("¿Hará frío mañana?")
		@p4 = Quiz::BoolQuestion.new(@q4)	
		@p4.insert_Respuesta(true, "NO")

		@nodo1 = Quiz::Node.new(@p1)
		@nodo2 = Quiz::Node.new(@p2)
		@nodo3 = Quiz::Node.new(@p3)
		@nodo4 = Quiz::Node.new(@p4)

		
		@lista = Quiz::ListaEnlazada.new
		@lista2 = Quiz::ListaEnlazada.new
	
		@lista.insertarElemento_final(@nodo1)
		@lista.insertarElemento_final(@nodo2)
		@lista.insertarElemento_final(@nodo3)
		@lista2 = @lista.invertirLista

		@ex1 = Quiz::Examen.new(@lista)
		@aux1 = [0,1,0]
		@ex1.respuestas_examen = @aux1
		@ex2 = Quiz::Examen.new(@lista)
		@aux2 = [1,1,2]
		@ex2.respuestas_examen = @aux2
		puts @ex1.cuentaAciertos
		puts @ex2.cuentaAciertos
		
		@usuario = Quiz::InterfazUsuario.new(@ex1)
		@lista.to_s
		@lista2.to_s
		
			
	end	

	it "Debe existir una pregunta" do
		
		(@p1.instance_of? Quiz::SimpleQuestion).should == true
		(@p2.instance_of? Quiz::BoolQuestion).should == true
	end

	it "Se debe invocar a un método para obtener la pregunta" do

		(@p1.respond_to? :pregunta).should == true
	end

	it "Deben existir opciones de respuesta" do
		

		@p1.should_not == nil
		@p2.should_not == nil
	end

	it "Se deben mostrar por la consola formateada la pregunta y las opciones de respuesta" do

		(@p1.respond_to? :to_s).should == true
	end

	it "Debe existir un nodo de la lista con sus datos y su siguiente" do
		
		(@lista.head).should_not == nil
	
	end	

	it "Se extrae el primer elemento de la lista" do
		
		(@lista.respond_to? :eliminarElemento_final).should == true
	
	end
		
	it "Se puede insertar un elemento" do
		(@lista.respond_to? :insertarElemento_final).should == true
	end

	it "Debe existir una lista con su cabeza" do
		(@lista.is_a? Quiz::ListaEnlazada).should == true
		(@lista.instance_of? Quiz::ListaEnlazada).should == true
		((@lista.head) != nil).should == true
	end

	it "Respuestas A Igual B (ambas SimpleQuestion y BoolQuestion)" do
		
		
		(@p1 == @p1).should == true
		(@p3 == @p4).should == false

	end
	it "Respuestas A Distinto B (ambas SimpleQuestion y BoolQuestion)" do
		
		
		(@p1 != @p1).should == false
		(@p3 != @p4).should == true

	end
	it "Respuesta A menor B" do

		(@p1 < @p3).should == true
		
	end
	it "Respuesta A mayor B" do

		(@p3 > @p1).should == true
		
	end	
	it " Respuesta  existe MAX" do

		(@lista.max != nil).should == true
	end
	it " Respuesta existe MiN" do

		(@lista.min != nil).should == true
	end
  ## Espectativas de una clase Examen 
	it "Existe clase examen y su instancia?" do
	  
		(@ex1.is_a? Quiz::Examen).should == true
		(@ex1.instance_of? Quiz::Examen).should == true
	end
	it "La clase examen contiene una lista de preguntas y ésta es distinta a nula ?" do

		(@ex1.examen.is_a? Quiz::ListaEnlazada).should == true
		(@ex1.examen.instance_of? Quiz::ListaEnlazada).should == true
		(@ex1.examen != nil) == true

	end
	it "La clase examen contiene un atributo que guardar el número de preguntas que contiene el mismo" do
		
		(@ex1.n_preguntas.is_a? Integer).should == true
	end
	it "La clase examen contiene un atributo para guardar los aciertos del examen ?" do
		(@ex1.aciertos.is_a? Integer).should == true

	end
	it " La calse examen contiene un atributo que nos devuelve el número de preguntas que contiene dicho examen" do
		
		(@ex1.respond_to? :n_preguntas).should == true 
	end
	it "La clase examen contiene un método para calcular el resultado del mismo" do
		(@ex1.respond_to? :cuentaAciertos).should == true
		(@ex1.respond_to? :resultado).should == true
	end
	it "El examen está aprobado?" do

		(@ex1.resultado >= 5).should == true
	end
	it "El examen está suspendido" do
		
		(@ex2.resultado < 5).should == true
	end
	it "El examen contiene el arrray de las respuestas que introdujo el usuario al realizar el mismo" do
		(@ex1.respuestas_examen.is_a? Array).should == true
	end
	

   ## Espectativas de una Interfaz

	it "Existe la clase interfaz de usuario y contiene un examen?" do
		
		(@ex1.is_a? Quiz::Examen).should == true
		(@ex1.instance_of? Quiz::Examen).should == true
		(@usuario.is_a? Quiz::InterfazUsuario).should == true
		(@usuario.instance_of? Quiz::InterfazUsuario).should == true	
	end
	it "El objeto interfaz contiene un método para mostrar el menú de elección del usuario para mostrar el examen" do

		(@usuario.respond_to?:menu).should == true	
	end
	it "El objeto interfaz contiene un método para imprimir un examen" do

		(@usuario.respond_to?:imprimirExamen).should == true	
 	end
	it "El objeto interfaz contiene un método para realizar un examen" do

		(@usuario.respond_to?:ejecutarExamen).should == true	
 	end
   ## Espectativas para invertir un examen

	it "Existe un método para invertir una lista con las preguntas del examen y que devuelve la misma lista pero invertida" do
		(@lista.respond_to?:invertirLista).should == true
	end
	it " Comparar lista 1 cabeza con la cola lista2 inversa cola para ver si coinciden " do
		(@lista.head == @lista2.tail).should == true
	end
  end

