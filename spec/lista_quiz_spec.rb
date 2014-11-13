#Práctica 7

#Realizada por Juan José Gregorio Díaz Marrero y Miguel Aurelio García González

require 'lista_quiz.rb'
require 'spec_helper.rb'

describe Quiz do	

before :all do
		
		@q1 = Quiz::Question.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")
		@p1 = Quiz::SimpleQuestion.new(@q1)

		@p1.insert_Respuesta(true, "Una instancia de la clase Class")
		@p1.insert_Respuesta(false, "Una constante")
		@p1.insert_Respuesta(false, "Un objeto")
		@p1.insert_Respuesta(false, "Ninguna de las anteriores")
				
		@q2 = Quiz::Question.new("Es apropiado que una clase Tablero herede de una clase Juego")
		@p2 = Quiz::BoolQuestion.new(@q2)

		@p2.insert_Respuesta(false, "SI")
		
		@q3 = Quiz::Question.new("¿Hoy?")
		@p3 = Quiz::BoolQuestion.new(@q3)

		@p3.insert_Respuesta(true, "SI")

		@nodo1 = Quiz::Node.new(@p1)
		@nodo2 = Quiz::Node.new(@p2)
		@nodo3 = Quiz::Node.new(@p3)
		@nodo4 = Quiz::Node.new(@p4)

		@lista = Quiz::ListaEnlazada.new

		@lista.insertarElemento_final(@nodo1)
		@lista.insertarElemento_final(@nodo2)

		
		
		@q3 = Quiz::Question.new("¿Hará frío mañana?")
		@p3 = Quiz::SimpleQuestion.new(@q3)
		
		@p3.insert_Respuesta(true, "Sí")
		@p3.insert_Respuesta(false, "No")
		@p3.insert_Respuesta(false, "Tal vez")

		@q4 = Quiz::Question.new("¿Hará frío mañana?")
		@p4 = Quiz::BoolQuestion.new(@q4)	
		@p4.insert_Respuesta(true, "NO")
		
		@lista.to_s
			   
			
		
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
		(@p2 == @p2).should == true

	end
	it "Respuestas A Distinto B (ambas SimpleQuestion y BoolQuestion)" do
		
		
		(@p1 != @p1).should == false
		(@p2 != @p2).should == false

	end
	it "Respuesta A menor B" do

		(@p3 < @p1).should == true
		(@p4 < @p2).should == false
		
	end
	it "Respuesta A mayor B" do

		(@p1 > @p3).should == true
		(@p4 > @p2).should == false
	end
	
	

end
