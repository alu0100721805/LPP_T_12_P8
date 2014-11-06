#Práctica 6

#Realizada por Juan José Gregorio Díaz Marrero y Miguel Aurelio García González

require 'lista_quiz.rb'
require 'spec_helper.rb'

describe Quiz do	

before :all do
		
		p1 = Quiz::SimpleQuestion.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")

		p1.insert_Respuesta(true, "Una instancia de la clase Class")
		p1.insert_Respuesta(false, "Una constante")
		p1.insert_Respuesta(false, "Un objeto")
		p1.insert_Respuesta(false, "Ninguna de las anteriores")

		p2 = Quiz::BoolQuestion.new("Es apropiado que una clase Tablero herede de una clase Juego")

		p2.insert_Respuesta(false, "SI")

		p3 = Quiz::BoolQuestion.new("¿Hoy?")

		p3.insert_Respuesta(true, "SI")

		nodo1 = Quiz::Node.new(p1)
		nodo2 = Quiz::Node.new(p2)
		nodo3 = Quiz::Node.new(p3)

		@lista = Quiz::ListaEnlazada.new

		@lista.insertarElemento_final(nodo1)
		@lista.insertarElemento_final(nodo2)
		@lista.insertarElemento_final(nodo3)

	end	

	it "Debe existir una pregunta" do
		p5 = Quiz::SimpleQuestion.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")
		(p5.instance_of? Quiz::SimpleQuestion).should == true
	        p2 = Quiz::BoolQuestion.new("Es apropiado que una clase Tablero herede de una clase Juego?")
		(p2.instance_of? Quiz::BoolQuestion).should == true
	end

	it "Se debe invocar a un método para obtener la pregunta" do
		p5 = Quiz::SimpleQuestion.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")
		(p5.respond_to? :preguntas).should == true
	end

	it "Deben existir opciones de respuesta" do
		p5 = Quiz::SimpleQuestion.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")
		p5.insert_Respuesta(true, "Una instancia de la clase Class")
		p5.insert_Respuesta(false, "Una constante")
		p5.insert_Respuesta(false, "Un objeto")
		p5.insert_Respuesta(false, "Ninguna de las anteriores")

		p5.should_not == nil
		p2 = Quiz::BoolQuestion.new("Es apropiado que una clase Tablero herede de una clase Juego?")
		p2.insert_Respuesta(false, "SI")
		p2.should_not == nil
	end

	it "Se deben mostrar por la consola formateada la pregunta y las opciones de respuesta" do
		p5 = Quiz::SimpleQuestion.new("¿Cuál es el tipo del objeto en el siguiente código Ruby?\nclass Objeto\nend")
		p5.insert_Respuesta(true, "Una instancia de la clase Class")
		p5.insert_Respuesta(false, "Una constante")
		p5.insert_Respuesta(false, "Un objeto")
		p5.insert_Respuesta(false, "Ninguna de las anteriores")

		(p5.respond_to? :to_s).should == true
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

end
