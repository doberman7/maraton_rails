class WelcomeController < ApplicationController
  def index
    @decks = Deck.all

    @scores = User.last.decks.last.score if User.last.decks.length != 0
  end
  # welcome GET    /welcome/:id(.:format)      welcome#show
  def show
    @mat_deck = Deck.find(1)
    @mat_items = @mat_deck.items
    last_user = User.last
    #determinar en que deck linck se ha clikeado
    case params[:id]
    when "Mate"
      #Crear join table de ultimo usuario y deck seleccionado
        UserDeck.create!(user_id: last_user.id, deck_id: @mat_deck.id)
        render "/welcome/mate"
      when "Español"
        render "/welcome/español"
      when "Cultura General"
        render "/welcome/cultura_general"
    end
  end
  def new
    #Los params aquis suceden antes de renderizar   root 'welcome#new'
  end

  def create
    #=> User(id: integer, mail: string, password: string, created_at: datetime, updated_at: datetime)
    @user = User.create(mail: params[:mail], password: params[:password])

    #This location is pulled from the HTTP_REFERER header which is not guaranteed to be set by the browser, so you must provide the fallback_location to use in this case.
    #redirect_to action: :index

    #dencadenar todos los decks en @decks para que el render funcione
    index
    render "/welcome/index"
  end

  def question_form

    #traer el ultimo usuario
    last_user = User.last
    #encontrar por id el deck de matematicas
    mat_deck = Deck.find(1)
    #asignar los items del deck de matematicas
    mat_items = mat_deck.items
    score = 0
    #iterar en parametros key es number_of_preg e input es value
    params.each do |number_of_preg ,input|
      #si el numero de la pregunta al convertirlo en entero es diferente 0 significa que es un numero, el numero de la pregunta y no una palabra
      if number_of_preg.to_i != 0
          #del ultimo usuario, de sus decks, el ultimo creado, actualizar score igual a cero
          last_user.decks.last.update(score: score)
          # Si del deck de matematicas, uno de sus items, aquel el id igual al numero de la pregunta, si su respuesta es igual al input del usuario, aumentar uno
          if mat_deck.items.find(number_of_preg.to_i).answer == input
            score += 1
          end
          #p "Pregunta #{number_of_preg} el score es #{score}"
      end
    end
    #actualizar el score
    index
    last_user.decks.last.update(score: score)
    render "/welcome/index"
  end

end
