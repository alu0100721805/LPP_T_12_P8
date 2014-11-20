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

		@lista.insertarElemento_final(@nodo1)
		@lista.insertarElemento_final(@nodo2)
		@lista.insertarElemento_despuesdenodo(@nodo2,@nodo4)
		@lista.buscarNodo(@nodo4)
		
		puts  @lista.collect { |x| puts x.to_s}
		@ex1 = Quiz::Examen.new(@lista)
			
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
	it "Existe clase examen" do
	  
		(@ex1.is_a? Quiz::Examen).should == true
	end
	it "Existe instancia de la clase examen" do
	  
		(@ex1.instance_of? Quiz::Examen).should == true
	end	
	it "Existe método para hacer correr el examen y que el usuario realize dicho examen" do
		
		(@ex1.respond_to? :comenzar_Examen).should == true
	end

end
